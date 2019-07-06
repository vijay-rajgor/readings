create database jointest;

create table country (country_id int,country_name varchar(40));

drop table country;
create table country (country_id int primary key,country_name varchar(40));
create table state (state_id int primary key,state_name varchar(40),country_id int references country(country_id));
create table city (city_id int primary key,city_name varchar(40),state_id int references country(state_id));



insert into country values(1,'INDIA');
insert into country values(2,'AUSTRALIA');
insert into country values(3,'AMERICA');

insert into state values(1,'GUJARAT',1);
insert into state values(2,'Aus_State_1',2);
insert into state values(3,'Ame_State_1',3);

insert into city values(1,'Ahmedabad',1);
insert into city values(2,'Jamnagar',1);
insert into city values(3,'Rajkot',1);

insert into city values(4,'Aus_State_1_City_1',2);
insert into city values(5,'Aus_State_1_City_2',2);
insert into city values(6,'Aus_State_1_City_3',2);

insert into city values(7,'Ame_State_1_City_1',3);
insert into city values(8,'Ame_State_1_City_2',3);
insert into city values(9,'Ame_State_1_City_3',3);



insert into state values(4,'MAHARASHTRA',1);
insert into state values(5,'Aus_State_2',2);
insert into state values(6,'Ame_State_2',3);

insert into state values(7,'RAJASTHAN',1);
insert into state values(8,'Aus_State_3',2);
insert into state values(9,'Ame_State_3',3);


select * from country;
select * from state;
select * from city;

select * from state inner join city on state.state_id = city.state_id;

drop table customer;
create table customer (id int primary key auto_increment, firstName varchar(50), lastName varchar(50),city varchar(40), country varchar(40), phone int);

insert into customer(firstName,lastName,city,country,phone) values('A','S1','Gujarat','India',0001);
insert into customer(firstName,lastName,city,country,phone) values('B','S2','Maharashtra','India',0001);
insert into customer(firstName,lastName,city,country,phone) values('C','S3','Gujarat','India',0001);
insert into customer(firstName,lastName,city,country,phone) values('D','S4','Maharashtra','India',0001);
insert into customer(firstName,lastName,city,country,phone) values('E','S5','Rajasthan','India',0001);
insert into customer(firstName,lastName,city,country,phone) values('F','S6','Gujarat','India',0001);
insert into customer(firstName,lastName,city,country,phone) values('G','S7','Maharashtra','India',0001);



select c1.firstName, c2.firstName,c1.city from customer c1, customer c2 where c1.city = c2.city and c1.id != c2.id;

CREATE TABLE customers (
    id INTEGER PRIMARY KEY auto_increment,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");    
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY auto_increment,
    customer_id INTEGER,
    item TEXT,
    price REAL);
    
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);    
    
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);    
    
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);    

select * from customers;
select * from orders;
select * from customers right join orders on customers.id = orders.customer_id;
    
    
select * from customers 
left join orders on customers.id = orders.customer_id 
join country on orders.customer_id = country.country_id 
where orders.price > 999
order by orders.price desc;

select customers.email,sum(orders.price),country.country_name from customers 
left join orders on customers.id = orders.customer_id 
left join country on customers.id = country.country_id 
where orders.price > 30
group by customers.name having customers.email = 'harry@potter.com'
order by orders.price desc;


select customers.name from customers 
left join orders on customers.id = orders.customer_id 
left join country on orders.customer_id = country.country_id 
where orders.price > 30
order by orders.price desc;

select customers.name,sum(orders.price) from customers 
left join orders on customers.id = orders.customer_id 
group by customers.id;



join country on orders.customer_id = country.country_id
where country.country_id = 1;     


//Hibernet Reading
create table STUDENT (
   id INT NOT NULL auto_increment PRIMARY KEY,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   section    VARCHAR(30) NOT NULL
);
