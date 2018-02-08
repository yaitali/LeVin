DROP TABLE Vin cascade;
DROP TABLE Users cascade;
DROP TABLE Casier cascade;
DROP TABLE Cave cascade;
DROP TABLE Bouteille cascade;
DROP TABLE Profil cascade;
DROP TABLE Pays cascade;
DROP TABLE Region cascade;
DROP TABLE TypeAppelation cascade;
DROP TABLE Appelation cascade;


create table Pays(
	id_pays INTEGER PRIMARY KEY,
	pays VARCHAR(100)
	);


create table Region(
	id_region INTEGER PRIMARY KEY,
	id_pays INTEGER,
	region VARCHAR(100),
	CONSTRAINT "FK_region_pays" FOREIGN KEY (id_pays) REFERENCES 	Pays (id_pays) ON UPDATE RESTRICT ON DELETE RESTRICT
);

create table TypeAppelation(
	id_typeapp INTEGER PRIMARY KEY,
	nomTypeAppe VARCHAR(100)
	);


create table Appelation(
	id_app INTEGER PRIMARY KEY,
	appelation VARCHAR(100),
	id_region INTEGER,
	id_typeapp INTEGER,
	CONSTRAINT "FK_region_appelation" FOREIGN KEY (id_region) 	REFERENCES Region (id_region) ON UPDATE RESTRICT ON DELETE 	RESTRICT,
	CONSTRAINT "FK_typeA_appelation" FOREIGN KEY (id_typeapp) 	REFERENCES TypeAppelation (id_typeapp) ON UPDATE RESTRICT ON    	DELETE RESTRICT


	);
	create table Vin(
 		vinId INTEGER PRIMARY KEY,
 		domaine VARCHAR(100),
 		couleur VARCHAR(100),
 		cuvee DATE,
 		cepage VARCHAR(100),
 		UNIQUE(cepage)

	);

create table Profil(
  mail VARCHAR(100),
  profil_u VARCHAR(100),
  CONSTRAINT PK_Profil PRIMARY KEY (mail)
  
);

create table Users(
 nom_u VARCHAR(100),
 prenom_u  VARCHAR(100),
 mail  VARCHAR(100),
 login  VARCHAR(100),
 mdpass  VARCHAR(100),
 tel  VARCHAR(100),
 CONSTRAINT PK_User PRIMARY KEY (mail),
CONSTRAINT "FK_user_profil" FOREIGN KEY (mail) REFERENCES Profil (mail) ON UPDATE RESTRICT ON DELETE RESTRICT
);


create table Cave(
 id_cave integer  primary key,
 mail  VARCHAR(100),
 nom_cave VARCHAR(100),
 CONSTRAINT "FK_cave_user" FOREIGN KEY (mail) REFERENCES Users (mail) ON UPDATE RESTRICT ON DELETE RESTRICT
);

create table Casier(
 id_casier integer primary key,
 id_cave integer,
 nom_casier VARCHAR(100),
 nb_ligne integer,
 nb_col integer,
 CONSTRAINT "FK_cave_casier" FOREIGN KEY (id_cave) REFERENCES Cave (id_cave) ON UPDATE RESTRICT ON DELETE RESTRICT
 );

create table Bouteille(
 id_bouteille INTEGER PRIMARY KEY,
 nom_bouteille VARCHAR(100),
 millesime DATE,
 degre_bouteille integer,
 quantite_bouteille integer,
 volume_bouteille float(1),
 dateEntree date,
 dateSortie date,
 id_casier integer,
 vinId integer,
 CONSTRAINT "FK_bouteille_casier" FOREIGN KEY (id_casier)   REFERENCES Casier (id_casier) ON UPDATE RESTRICT ON DELETE RESTRICT,

 CONSTRAINT "FK_bouteille_vin" FOREIGN KEY (vinId) REFERENCES Vin (vinId) ON UPDATE RESTRICT ON DELETE RESTRICT

 );

