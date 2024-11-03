create database db_cardoso_faculdade;
use db_cardoso_faculdade;

/*cria uma tabela chamada aluno */
create table tbl_aluno(
   id_aluno int not null primary key auto_increment,
   nome varchar(100) not null,
   cpf varchar(11) not null,
   codigo_aluno INT not null,
   unique index(id_aluno)
);
INSERT INTO tbl_aluno(id_aluno, nome, cpf, codigo_aluno)
VALUES
(1, 'Gabriela Fagundes', '11111111111', 1),
(2, 'Jean Ribeiro', '77777777777', 2),
(3, 'Bruna Rafaela', '99999999999', 3),
(4, 'Larissa Gonçalves', '8888888888', 4),
(5, 'Antonio Oliveira', '66666666666', 5);

/*cria uma tabela chamada curso */
create table tbl_cursos(
   id_cursos int not null primary key auto_increment,
   nome_curso varchar(100) not null,
   duracao varchar(45) not null,
   codigo int not null,
   descricao varchar(300) not null,
   valor_curso decimal(10,2) not null,
   unique index(id_cursos)
);
INSERT INTO tbl_cursos(id_cursos, nome_curso, duracao, codigo,descricao,  valor_curso)
values
(1, 'Ciencias Contabeis', '4 anos', 12, 'Curso avançado,aprofunda-se em temas complexos como legislação tributária, gestão financeira e auditoria.', 7200),
(2, 'Analise e Desenvolvimento de Sistemas', '2,5 anos', 11, 'Aprofunda-se em técnicas de engenharia de software, arquitetura de sistemas e banco de dados',5000 ),
(3, 'Design Grafico', '2 anos', 10, 'Nosso curso avançado de Design Gráfico foca em técnicas de design digital, branding e tipografia.', 3000);

/*cria uma tabela chamada professor */
create table tbl_professor(
   id_professor int not null primary key auto_increment,
   nome varchar(100) not null,
   area_atuacao varchar(45) not null,
   cpf varchar(11) not null,
   unique index(id_professor)
);
INSERT INTO tbl_professor(id_professor, nome, area_atuacao, cpf)
values
(1, 'Pedro da Silva', 'Ciencias Contabeis', '11111111200'),
(2, 'Renato Cardoso', 'Design Grafico', '22222222222'),
(3, 'Rafaela Fernandes', 'Analise e Desenvolvimento de Sistemas', '33333333333');

/* cria uma tabela para endereço do aluno */
create table tbl_endereco_aluno (
  id_endereco_aluno int not null primary key AUTO_INCREMENT,
  logradouro varchar(60) not null,
  cep int not null,
  bairro varchar(45) not null,
  numero int not null,
  cidade varchar(45) not null,
  estado varchar(100) not null,
  id_aluno int not null,
  
  /* cria o relacionamento entre as tabelas */
  constraint FK_Aluno_Endereco_Aluno
  foreign key (id_aluno)
  references tbl_aluno(id_aluno),
  Unique index(id_endereco_aluno)
);

INSERT INTO tbl_endereco_aluno(id_endereco_aluno, logradouro, cep, bairro, numero, cidade,estado, id_aluno)
values
(1, 'rua das flores', 88010100, 'Lageado Baixo', 12, 'Blumenau', 'Santa Catarina', 1),
(2, 'rua Antonio Zendron', 88010278, 'Garcia', 129, 'Blumenau', 'Santa Catarina',2),
(3, 'rua Geronimo de Borba', 88060509, 'Gloria', 459, 'Gaspar', 'Santa Catarina',3),
(4, 'rua das Orquideas', 89023201, 'Vorstadt', 50, 'Balneario', 'Santa Catarina',4),
(5, 'rua Amazonas', 89023202, 'Centro', 11, 'Blumenau', 'Santa Catarina',5);

/* cria uma tabela para o telefone do aluno */
create table tbl_telefone_aluno (
  id_telefone_aluno int not null primary key AUTO_INCREMENT,
  contato varchar(20) not null,
  id_aluno int not null,
  
  /* cria o relacionamento entre as tabelas */
  constraint FK_Aluno_Telefone_Aluno
  foreign key (id_aluno)
  references tbl_aluno(id_aluno),
  Unique index(id_telefone_aluno)
);
INSERT INTO tbl_telefone_aluno(id_telefone_aluno, contato, id_aluno)
VALUES
(1, '47988557744', 1),
(2, '47991918899',1),
(3, '47991775649',1),
(4, '479928956473',1),
(6, '47988454578',1);


/* cria uma tabela para e-mail do aluno */
create table tbl_email_aluno (
  id_email_aluno int not null primary key AUTO_INCREMENT,
  email varchar(255) not null,
  id_aluno int not null,
  

  /* cria o relacionamento entre as tabelas */
  constraint FK_Aluno_email_Aluno
  foreign key (id_aluno)
  references tbl_aluno(id_aluno),
  Unique index(id_email_aluno)
  
);
INSERT INTO tbl_email_aluno(id_email_aluno, email, id_aluno)
VALUES
(1, 'Gabrielafagundes01@gmail.com',1),
(2, 'Jeanribeiro02@gmail.com',2),
(3, 'Brunarafaela03@gmail.com',3),
(4, 'Larissagonçalves04@gmail.com',4),
(5, 'Antoniooliveira05@gmail.com',5);

/* cria uma tabela para as turmas */
create table tbl_turmas (
  id_turmas int not null primary key AUTO_INCREMENT,
  quant_alunos int not null,
  descricao varchar(150) not null,
  numero int not null,
  nome_turma varchar(45) not null,
  id_aluno int not null,
  
  /* cria o relacionamento entre as tabelas */
  constraint FK_Aluno_Turmas
  foreign key (id_aluno)
  references tbl_aluno(id_aluno),
  Unique index(id_turmas)
);
INSERT INTO tbl_turmas(id_turmas, quant_alunos, descricao, numero, nome_turma, id_aluno)
VALUES
(1, 30, 'Turma da area de Ciencias Contabeis', 04, 'Contabilidade Tributaria',1),
(2, 35, 'Turma da area de Ciencias Contabeis', 07, 'Design Grafico',2),
(3, 20, 'Turma da area de Ciencias Contabeis', 09, 'Analise e Desenvolvimento de Sistemas',3);

/* cria uma tabela para telefone dos prodfessores */
create table tbl_telefone_prof (
  id_telefone_prof int not null primary key AUTO_INCREMENT,
  contato varchar(20) not null,
  id_professor int not null,
  
  /* cria o relacionamento entre as tabelas */
  constraint FK_Professor_Telefone_prof
  foreign key (id_professor)
  references tbl_professor(id_professor),
  Unique index(id_telefone_prof)
);

INSERT INTO tbl_telefone_prof(id_telefone_prof, contato, id_professor)
VALUES
(1, '4792886633',1),
(2, '4792876631',2),
(3, '4792186634',3);

/* cria uma tabela para o endereço do professor */
create table tbl_endereco_prof(
  id_endereco int not null primary key AUTO_INCREMENT,
  logradouro varchar(100) not null,
  numero int not null,
  cep int  not null,
  bairro varchar(45) not null,
  cidade varchar(60) not null,
  pais varchar(45) not null,
  id_professor int not null,
  
  constraint FK_Professor_Endereco_prof
  foreign key (id_professor)
  references tbl_professor(id_professor),
  Unique index(id_endereco)
);
INSERT INTO tbl_endereco_prof(id_endereco, logradouro, numero, cep, bairro, cidade, pais,id_professor)
VALUES
(1, 'rua das Oliveiras', 30, 89023204, 'Garcia', 'Blumenau', 'Brasil',1 ),
(2, 'rua Veiga ', 155, 8902104, 'Fortaleza', 'Blumenau', 'Brasil',2 ),
(3, 'rua Geronimo', 200, 8903107, 'Itoupava', 'Blumenau', 'Brasil',3 );

/* cria uma tabela para e-mail do professor */
create table tbl_email_prof (
  id_email int not null primary key AUTO_INCREMENT,
  email varchar(255) not null,
  id_professor int not null,
  

  /* cria o relacionamento entre as tabelas */
  constraint FK_Professor_email_prof
  foreign key (id_professor)
  references tbl_professor(id_professor),
  Unique index(id_email)
  
);
INSERT INTO tbl_email_prof(id_email, email,id_professor)
VALUES
(1, 'Pedrodasilva01@gmail.com',1),
(2, 'Renatocardoso02@gmail.com', 2),
(3, 'Rafaelafernandes03@gmail.com',3);

/* cria uma tabela para as disciplinas */
create table tbl_disciplina(
  id_disciplina int not null primary key AUTO_INCREMENT,
  nome varchar(45) not null,
  prof_responsavel varchar(45) not null,
  codigo int  not null,
  descricao varchar(1000) not null,
  carga_horaria varchar(45) not null,
  id_professor int not null,
  id_cursos int not null,
  
  constraint FK_Professor_Disciplina
  foreign key (id_professor)
  references tbl_professor(id_professor),
  
  constraint FK_Cursos_Disciplina
  foreign key (id_cursos)
  references tbl_cursos(id_cursos),
  Unique index(id_disciplina)
);
INSERT INTO tbl_disciplina(id_disciplina, nome, prof_responsavel, codigo, descricao, carga_horaria, id_professor, id_cursos)
VALUES
(1, 'Logica de Programação e Algoritmos', 'Rafaela Fernandes', 21,'Você irá aprender princípios básicos da construção de algoritmos eficientes e bem estruturados. 
Os nossos alunos aprendem a pensar logicamente e a resolver problemas através de técnicas como pseudocódigo e fluxogramas. 
Além disso, são introduzidos aos conceitos fundamentais de estruturas de controle como loops e condicionais e estruturas de dados como arrays e listas. 
É uma base crucial para qualquer programador!', '63 horas mensais',2,3),
(2, 'Programação Orientada a Objetos', 'Rafaela Fernandes', 22,'A disciplina ensina a estruturar programas usando "objetos" que representam tanto dados quanto métodos. 
Os principais conceitos incluem classes, herança, polimorfismo e encapsulamento. 
Os alunos aprendem a criar código modular e reutilizável, tornando o desenvolvimento de software mais eficiente e organizado. 
Além disso, essa abordagem permite modelar programas de forma que sejam mais próximos da realidade, facilitando a manutenção e evolução do código. 
Pronto para virar um mestre em POO', '63 horas mensais',2,3),
(3, 'Analise de Sistemas', 'Rafaela Fernandes', 23, 'Os alunos aprendem a identificar necessidades e problemas em processos organizacionais
 e a propor soluções eficientes por meio de sistemas informatizados. 
 Eles exploram técnicas de modelagem de dados e processos, como diagramas UML (Unified Modeling Language), além de aprender sobre metodologias de desenvolvimento de sistemas como Agile e Scrum.
 A disciplina abrange também a definição de requisitos, análise de viabilidade e a criação de especificações funcionais e técnicas. 
 Em suma, é sobre transformar necessidades em soluções tecnológicas claras e bem estruturadas.', '63 horas mensais',2,3),
 (4, 'Fundamentos do Design', 'Renato Cardoso', 24, 'Na disciplina de Fundamentos do Design, os alunos aprendem os princípios básicos que guiam o design eficaz. Isso inclui:
Composição: A organização dos elementos visuais em uma peça de design.
Teoria das Cores: Como as cores funcionam juntas e como afetam as emoções e percepções.
Tipografia: O uso de fontes e a importância da legibilidade e estilo.
Estética e Forma: A compreensão de como diferentes formas e linhas criam significado e impacto.
História do Design: A evolução do design e os movimentos influentes.
Esses conceitos formam a base essencial para qualquer trabalho de design bem-sucedido.', '63 horas mensais',3,2),
(5, 'Historia do Design', 'Renato Cardoso', 25, 'A disciplina de História do Design explora a evolução do design gráfico e seus principais movimentos e influências ao longo do tempo. 
Os alunos estudam desde os primórdios do design, passando pela Bauhaus, o modernismo, o pós-modernismo, até as tendências contemporâneas. 
Isso inclui a análise de obras de designers icônicos e o impacto cultural e social do design em diferentes períodos. 
Entender essas influências ajuda a contextualizar o design atual e a inspirar a criação de novos conceitos.', '63 horas mensais',3,2),
(6,'Software de Design', 'Renato Cardoso', 26, 'Na disciplina de Software de Design, os alunos aprendem a dominar ferramentas essenciais para a criação gráfica. 
Isso inclui programas como Adobe Photoshop, Illustrator e InDesign. Eles exploram desde conceitos básicos, como edição de imagens e vetorização, 
até técnicas avançadas como manipulação de camadas, criação de layouts e preparação de arquivos para impressão ou web. 
O objetivo é capacitar os alunos a utilizarem essas ferramentas de forma eficaz para materializar suas ideias criativas.', '63 horas mensais',3,2),
(7,'Design Digital', 'Renato Cardoso', 27, 'A disciplina de Design Digital ensina os alunos a criar e desenvolver conteúdos para plataformas digitais, como websites, aplicativos e redes sociais.
 Ela abrange técnicas de design responsivo, UX/UI (experiência do usuário e interface do usuário), animações e multimídia interativa. 
 Os alunos também aprendem a usar ferramentas específicas, como Adobe XD, Figma e Sketch, para prototipagem e design de interfaces. 
 É sobre transformar conceitos criativos em experiências digitais funcionais e atraentes.', '63 horas mensais',3,2),
 (8,'Contabilidade de Custos', 'Pedro da Silva', 28,'Os alunos aprendem a identificar, medir e gerenciar os custos associados à produção e operação de uma empresa. 
 Inclui conceitos como:
Custeio por Absorção: Alocação de todos os custos de produção aos produtos.
Custeio Variável: Custos que variam diretamente com o nível de produção.
Custeio Baseado em Atividades (ABC): Identificação de atividades e atribuição de custos com base no uso de recursos.
Análise de Ponto de Equilíbrio: Determinação do ponto onde receitas igualam os custos totais.
Margem de Contribuição: Lucro gerado por unidade de produto, após deduzir os custos variáveis.', '63 horas mensais',1,1),
(9, 'Legislação Tributaria', 'Pedro da Silva', 29,'Na disciplina de Legislação Tributária, você aprende sobre as normas fiscais que regulam a tributação de empresas e indivíduos. 
Isso inclui temas como cálculo de tributos, compliance fiscal, planejamento tributário e regulamentações específicas para diferentes tipos de impostos (como ICMS, ISS, IPI e IR).
Além disso, estuda-se a aplicação prática dessas leis no contexto empresarial, garantindo que as operações financeiras estejam em conformidade com a legislação vigente. 
Tudo isso prepara os alunos para gerenciar e otimizar a carga tributária das organizações.', '63 horas mensais',1,1),
(10, 'Finanças Corporativas', 'Pedro da Silva', 30, 'Na disciplina de Finanças Corporativas, você aprende a gerenciar os recursos financeiros de uma empresa para maximizar seu valor. 
Isso inclui:
Avaliação de Investimentos: Como avaliar e escolher projetos de investimento.
Gestão de Capital de Giro: Manejo do capital de curto prazo para garantir liquidez e eficiência operacional.
Financiamento: Estratégias para captação de recursos através de dívida e capital próprio.
Análise de Risco e Retorno: Ferramentas para identificar, avaliar e mitigar riscos financeiros.
Planejamento Financeiro: Elaboração de orçamentos e previsões financeiras.
Esses conhecimentos são essenciais para tomada de decisões estratégicas que impactam o futuro financeiro da empresa.', '63 horas mensais',1,1);
SELECT * FROM tbl_cursos WHERE id_cursos IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);