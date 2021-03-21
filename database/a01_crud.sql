-- 생성 : P_USER(사용자)
CREATE TABLE P_USER (
	u_no NUMBER CONSTRAINT p_user_no_pk PRIMARY KEY,
	u_id VARCHAR2(50) CONSTRAINT p_user_id_nn NOT NULL,
	u_pass VARCHAR2(50) CONSTRAINT p_user_pass_nn NOT NULL,
	u_name VARCHAR2(50) CONSTRAINT p_user_name_nn NOT NULL,
	u_mail VARCHAR2(150) CONSTRAINT p_user_mail_nn NOT NULL,
	u_date DATE CONSTRAINT p_user_date_nn NOT NULL
);
CREATE SEQUENCE P_USER_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_USER;
DROP SEQUENCE P_USER_NO_SEQ;

-- 데이터
INSERT INTO P_USER VALUES(P_USER_NO_SEQ.NEXTVAL, 'admin', 'admin', '관리자', 'admin@naver.com', sysdate);
INSERT INTO P_USER VALUES(P_USER_NO_SEQ.NEXTVAL, 'aaaaaa', 'aaaa', 'A맨', 'aaa@naver.com', sysdate);
INSERT INTO P_USER VALUES(P_USER_NO_SEQ.NEXTVAL, 'bbbbbb', 'bbbb', 'B맨', 'bbb@naver.com', sysdate);
INSERT INTO P_USER VALUES(P_USER_NO_SEQ.NEXTVAL, 'cccccc', 'cccc', 'C맨', 'ccc@naver.com', sysdate);
INSERT INTO P_USER VALUES(P_USER_NO_SEQ.NEXTVAL, 'dddddd', 'dddd', 'D맨', 'ddd@naver.com', sysdate);
INSERT INTO P_USER VALUES(P_USER_NO_SEQ.NEXTVAL, 'eeeeee', 'eeee', 'E맨', 'eee@naver.com', sysdate);

-- 조회
SELECT * FROM P_USER;
SELECT P_USER_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_USER';

----------------------------------------------------------------
-- 생성 : P_ARTIST(아티스트)
CREATE TABLE P_ARTIST (
	art_no NUMBER CONSTRAINT p_art_no_pk PRIMARY KEY,
	art_name VARCHAR2(50) CONSTRAINT p_art_name_nn NOT NULL,
	art_gender VARCHAR2(10) CONSTRAINT p_art_gender_nn NOT NULL,
	art_group VARCHAR2(10) CONSTRAINT p_art_group_nn NOT NULL,
	art_img VARCHAR2(100) CONSTRAINT p_art_img_nn NOT NULL
);
CREATE SEQUENCE P_ARTIST_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_ARTIST CASCADE constraints;
DROP SEQUENCE P_ARTIST_NO_SEQ;

-- 데이터
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '아이유', '여성', '솔로', '/img/artist/iu.png');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '브레이브걸스', '여성', '그룹', '/img/artist/브레이브걸스.png');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '10CM', '남성', '솔로', '/img/artist/10cm.png');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, '장범준', '남성', '솔로', '/img/artist/장범준.png');
INSERT INTO P_ARTIST VALUES(P_ARTIST_NO_SEQ.NEXTVAL, 'BLACKPINK', '여성', '그룹', '/img/artist/블랙핑크.png');

-- 조회
SELECT * FROM P_ARTIST;
SELECT P_ARTIST_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_ARTIST';
----------------------------------------------------------------
-- 생성 : P_ALBUM(앨범)
CREATE TABLE P_ALBUM (
	alb_no NUMBER CONSTRAINT p_alb_no_pk PRIMARY KEY,
	alb_name VARCHAR2(50) CONSTRAINT p_alb_name_nn NOT NULL,
	alb_shape VARCHAR2(20) CONSTRAINT p_alb_shape_nn NOT NULL,
	alb_date DATE CONSTRAINT p_alb_date_nn NOT NULL,
	alb_img VARCHAR2(100) CONSTRAINT p_alb_img_nn NOT NULL,
	alb_intro VARCHAR2(500) CONSTRAINT p_alb_intro_nn NOT NULL,
	art_no NUMBER CONSTRAINT p_alb_no_fk REFERENCES P_ARTIST(art_no) ON DELETE CASCADE
);
CREATE SEQUENCE P_ALBUM_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_ALBUM CASCADE constraints;
DROP SEQUENCE P_ALBUM_NO_SEQ;

-- 데이터
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, 'Celebrity', '싱글', to_date('2021.01.27','yyyy.mm.dd'),
	       '/img/album/celebrity.png', '아이유(iu) 정규5집 선공개 무려 4년 만에...',1);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, 'Rollin', '미니', to_date('2017.03.07','yyyy.mm.dd'),
	       '/img/album/rollin.png', '마이애미 기반의 변했어부터 락 댄스 기반의...',2);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, '이 밤을 빌려 말해요', 'OST', to_date('2021.01.24','yyyy.mm.dd'),
	       '/img/album/이 밤을 빌려 말해요.png', '남자 주인공 유연의 테마곡인 이 밤을 빌려 말해요...',3);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, '잠이 오질 않네요', '싱글', to_date('2020.10.24','yyyy.mm.dd'),
	       '/img/album/잠이 오질 않네요.png', '태어나서 제일 급하게 만든 노래입니다..',4);
INSERT INTO P_ALBUM 
	VALUES(P_ALBUM_NO_SEQ.NEXTVAL, 'THE ALBUM', '정규', to_date('2020.10.02','yyyy.mm.dd'),
	       '/img/album/THE ALBUM.png', 'lovesick girls외에도 전 세계적 파급력을 증명한 카리스마..',5);

-- 조회
SELECT * FROM P_ALBUM;
SELECT P_ALBUM_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_ALBUM';
----------------------------------------------------------------
-- 생성 : P_GENRE(장르)

CREATE TABLE P_GENRE (
	genre_code NUMBER CONSTRAINT genre_code_pk PRIMARY KEY,
	genre_name VARCHAR2(50) CONSTRAINT genre_name_nn NOT NULL
);

-- 삭제
DROP TABLE P_GENRE;

-- 데이터
INSERT INTO P_GENRE VALUES(1, '댄스 팝');
INSERT INTO P_GENRE VALUES(2, '댄스');
INSERT INTO P_GENRE VALUES(3, '힙합');
INSERT INTO P_GENRE VALUES(4, '트로트');
INSERT INTO P_GENRE VALUES(5, '발라드');
INSERT INTO P_GENRE VALUES(6, '인디');

-- 조회
SELECT * FROM P_GENRE;
----------------------------------------------------------------
-- 생성 : P_MUSIC(음원)
CREATE TABLE P_MUSIC ( 
	m_no NUMBER CONSTRAINT m_no_pk PRIMARY KEY,
	m_name VARCHAR2(50) CONSTRAINT m_name_nn NOT NULL,
	m_playnum NUMBER CONSTRAINT m_playnum_nn NOT NULL,
	m_path VARCHAR2(100) CONSTRAINT m_path_nn NOT NULL,
	m_lyrics VARCHAR2(3000) CONSTRAINT m_lyrics_nn NOT NULL,
	alb_no NUMBER CONSTRAINT m_alb_no_fk REFERENCES P_ALBUM(alb_no) ON DELETE CASCADE
);

CREATE SEQUENCE P_MUSIC_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_MUSIC CASCADE CONSTRAINTS;
DROP SEQUENCE P_MUSIC_NO_SEQ;

-- 데이터
INSERT INTO P_MUSIC
	VALUES(1, 'Celebrity', 110, '/img/music/celebrity.png',
		   '세상의 모서리 구부정하게 커버린 골칫거리..', 1);
INSERT INTO P_MUSIC
	VALUES(2, 'asdf', 2, '/img/music/celebrity.png',
		   'asdfasdffds..', 1);
		  
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, 'Celebrity', 110, '/img/music/celebrity.png',
		   '세상의 모서리 구부정하게 커버린 골칫거리..', 1);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, 'Rollin', 100, '/img/music/Rollin.png',
		   '그 날을 잊지 못해 babe 날 보며 환히 웃던 너의 미소에...', 2);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '이 밤을 빌려 말해요', 80, '/img/music/이 밤을 빌려 말해요.png',
		   '너의 두 눈에 제일 먼저 그대를 담고..', 3);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, '잠이 오질 않네요', 79, '/img/music/잠이 오질 않네요.png',
		   '당신은 날 설레게 만들어 조용한 내 마음..', 4);
INSERT INTO P_MUSIC
	VALUES(P_MUSIC_NO_SEQ.NEXTVAL, 'Lovesick Girls', 77, '/img/music/Lovesick Girls.png',
		   '영원한 밤 창문 없는 방에 우릴 가둔 love...', 5);

-- 조회
SELECT * FROM P_MUSIC;
SELECT P_MUSIC_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_MUSIC';
----------------------------------------------------------------
-- 생성 : P_MUSIC_GENRE(곡별 장르)
CREATE TABLE P_MUSIC_GENRE (
	m_no NUMBER,
	genre_code NUMBER,
	PRIMARY KEY (m_no, genre_code),
	FOREIGN KEY (m_no) REFERENCES P_MUSIC(m_no) ON DELETE CASCADE,
	FOREIGN KEY (genre_code) REFERENCES P_GENRE(genre_code) ON DELETE CASCADE
);

-- 삭제
DROP TABLE P_MUSIC_GENRE;

-- 데이터
INSERT INTO P_MUSIC_GENRE VALUES(1,1);
INSERT INTO P_MUSIC_GENRE VALUES(2,1);
INSERT INTO P_MUSIC_GENRE VALUES(3,4);
INSERT INTO P_MUSIC_GENRE VALUES(4,4);
INSERT INTO P_MUSIC_GENRE VALUES(5,2);
INSERT INTO P_MUSIC_GENRE VALUES(5,3);

-- 조회
SELECT * FROM P_MUSIC_GENRE;
----------------------------------------------------------------
-- 생성 : P_PLAYLOG(플레이로그)
CREATE TABLE P_PLAYLOG (
	log_no NUMBER CONSTRAINT log_no_pk PRIMARY KEY,
	log_date DATE CONSTRAINT log_date_nn NOT NULL,
	u_no NUMBER CONSTRAINT p_playlog_u_no_fk REFERENCES P_USER(u_no) ON DELETE CASCADE,
	m_no NUMBER CONSTRAINT p_playlog_m_no_fk REFERENCES P_MUSIC(m_no) ON DELETE CASCADE
);
CREATE SEQUENCE P_PLAYLOG_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_PLAYLOG;
DROP SEQUENCE P_PLAYLOG_NO_SEQ;

-- 데이터
INSERT INTO P_PLAYLOG VALUES(P_PLAYLOG_NO_SEQ.NEXTVAL, SYSDATE, 1, 1);
INSERT INTO P_PLAYLOG VALUES(P_PLAYLOG_NO_SEQ.NEXTVAL, SYSDATE, 1, 2);
INSERT INTO P_PLAYLOG VALUES(P_PLAYLOG_NO_SEQ.NEXTVAL, SYSDATE, 1, 3);
INSERT INTO P_PLAYLOG VALUES(P_PLAYLOG_NO_SEQ.NEXTVAL, SYSDATE, 2, 4);
INSERT INTO P_PLAYLOG VALUES(P_PLAYLOG_NO_SEQ.NEXTVAL, SYSDATE, 3, 5);

-- 조회
SELECT * FROM P_PLAYLOG;
SELECT P_PLAYLOG_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_PLAYLOG';
----------------------------------------------------------------
-- 생성 : P_MYLIST(내 리스트)
CREATE TABLE P_MYLIST (
	mylist_no NUMBER CONSTRAINT mylist_no_pk PRIMARY KEY,
	mylist_name VARCHAR2(50) CONSTRAINT mylist_name_nn NOT NULL,
	mylist_date DATE CONSTRAINT mylist_date_nn NOT NULL,
	u_no NUMBER CONSTRAINT p_mylist_u_no_fk REFERENCES P_USER(u_no) ON DELETE CASCADE
);
CREATE SEQUENCE P_MYLIST_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_MYLIST;
DROP SEQUENCE P_MYLIST_NO_SEQ;

-- 데이터
INSERT INTO P_MYLIST VALUES(P_MYLIST_NO_SEQ.NEXTVAL, '집중할때 듣는', SYSDATE, 1);
INSERT INTO P_MYLIST VALUES(P_MYLIST_NO_SEQ.NEXTVAL, '비올때 듣는', SYSDATE, 1);
INSERT INTO P_MYLIST VALUES(P_MYLIST_NO_SEQ.NEXTVAL, '팝송', SYSDATE, 1);
INSERT INTO P_MYLIST VALUES(P_MYLIST_NO_SEQ.NEXTVAL, '집중용', SYSDATE, 2);
INSERT INTO P_MYLIST VALUES(P_MYLIST_NO_SEQ.NEXTVAL, '공부용', SYSDATE, 3);
INSERT INTO P_MYLIST VALUES(P_MYLIST_NO_SEQ.NEXTVAL, '힐링 노래 모음', SYSDATE, 4);

-- 조회
SELECT * FROM P_MYLIST;
SELECT P_MYLIST_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_MYLIST';
----------------------------------------------------------------
-- 생성 : P_LIST_MUSIC(내 리스트에 담긴 곡)
CREATE TABLE P_LIST_MUSIC (
	mylist_no NUMBER,
	m_no NUMBER,
	PRIMARY KEY (mylist_no, m_no),
	FOREIGN KEY (mylist_no) REFERENCES P_MYLIST(mylist_no) ON DELETE CASCADE,
	FOREIGN KEY (m_no) REFERENCES P_MUSIC(m_no) ON DELETE CASCADE
);
-- 삭제
DROP TABLE P_LIST_MUSIC;

-- 데이터
INSERT INTO P_LIST_MUSIC VALUES(1,1);
INSERT INTO P_LIST_MUSIC VALUES(1,2);
INSERT INTO P_LIST_MUSIC VALUES(1,3);
INSERT INTO P_LIST_MUSIC VALUES(2,2);
INSERT INTO P_LIST_MUSIC VALUES(3,3);
INSERT INTO P_LIST_MUSIC VALUES(4,4);
INSERT INTO P_LIST_MUSIC VALUES(5,1);
INSERT INTO P_LIST_MUSIC VALUES(5,3);

-- 조회
SELECT * FROM P_LIST_MUSIC;
SELECT P_LIST_MUSIC_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_LIST_MUSIC';
----------------------------------------------------------------
-- 생성 : P_PLAYLIST(재생목록)
CREATE TABLE P_PLAYLIST (
	u_no NUMBER,
	m_no NUMBER,
	PRIMARY KEY (u_no, m_no),
	FOREIGN KEY (u_no) REFERENCES P_USER(u_no) ON DELETE CASCADE,
	FOREIGN KEY (m_no) REFERENCES P_MUSIC(m_no) ON DELETE CASCADE
);
-- 삭제
DROP TABLE P_PLAYLIST;

-- 데이터
INSERT INTO P_PLAYLIST VALUES(1,1);
INSERT INTO P_PLAYLIST VALUES(1,2);
INSERT INTO P_PLAYLIST VALUES(1,3);
INSERT INTO P_PLAYLIST VALUES(2,2);
INSERT INTO P_PLAYLIST VALUES(2,3);

-- 조회
SELECT * FROM P_PLAYLIST;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_PLAYLIST';
----------------------------------------------------------------
-- 생성 : P_FAVOR_MUSIC(좋아요 곡)
CREATE TABLE P_FAVOR_MUSIC (
	u_no NUMBER,
	m_no NUMBER,
	PRIMARY KEY (u_no, m_no),
	FOREIGN KEY (u_no) REFERENCES P_USER(u_no) ON DELETE CASCADE,
	FOREIGN KEY (m_no) REFERENCES P_MUSIC(m_no) ON DELETE CASCADE
);
-- 삭제
DROP TABLE P_FAVOR_MUSIC;

-- 데이터
INSERT INTO P_FAVOR_MUSIC VALUES(1,1);
INSERT INTO P_FAVOR_MUSIC VALUES(1,2);
INSERT INTO P_FAVOR_MUSIC VALUES(1,3);
INSERT INTO P_FAVOR_MUSIC VALUES(2,2);
INSERT INTO P_FAVOR_MUSIC VALUES(2,3);

-- 조회
SELECT * FROM P_FAVOR_MUSIC;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_FAVOR_MUSIC';
----------------------------------------------------------------
-- 생성 : P_FAVOR_ALBUM(좋아요 앨범)
CREATE TABLE P_FAVOR_ALBUM (
	u_no NUMBER,
	alb_no NUMBER,
	PRIMARY KEY (u_no, alb_no),
	FOREIGN KEY (u_no) REFERENCES P_USER(u_no) ON DELETE CASCADE,
	FOREIGN KEY (alb_no) REFERENCES P_ALBUM(alb_no) ON DELETE CASCADE
);
-- 삭제
DROP TABLE P_FAVOR_ALBUM;

-- 데이터
INSERT INTO P_FAVOR_ALBUM VALUES(1,1);
INSERT INTO P_FAVOR_ALBUM VALUES(1,2);
INSERT INTO P_FAVOR_ALBUM VALUES(1,3);
INSERT INTO P_FAVOR_ALBUM VALUES(2,2);
INSERT INTO P_FAVOR_ALBUM VALUES(2,3);

-- 조회
SELECT * FROM P_FAVOR_ALBUM;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_FAVOR_ALBUM';
----------------------------------------------------------------
-- 생성 : P_FAVOR_ARTIST(좋아요 아티스트)
CREATE TABLE P_FAVOR_ARTIST (
	u_no NUMBER,
	art_no NUMBER,
	PRIMARY KEY (u_no, art_no),
	FOREIGN KEY (u_no) REFERENCES P_USER(u_no) ON DELETE CASCADE,
	FOREIGN KEY (art_no) REFERENCES P_ARTIST(art_no) ON DELETE CASCADE
);
-- 삭제
DROP TABLE P_FAVOR_ARTIST;

-- 데이터
INSERT INTO P_FAVOR_ARTIST VALUES(1,5);
INSERT INTO P_FAVOR_ARTIST VALUES(1,4);
INSERT INTO P_FAVOR_ARTIST VALUES(2,1);
INSERT INTO P_FAVOR_ARTIST VALUES(3,4);
INSERT INTO P_FAVOR_ARTIST VALUES(4,5);
INSERT INTO P_FAVOR_ARTIST VALUES(5,1);
INSERT INTO P_FAVOR_ARTIST VALUES(5,2);

-- 조회
SELECT * FROM P_FAVOR_ARTIST;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_FAVOR_ARTIST';
----------------------------------------------------------------
-- 생성 : P_NOTICE(공지사항)
CREATE TABLE P_NOTICE (
	n_no NUMBER CONSTRAINT n_no_pk PRIMARY KEY,
	n_title VARCHAR2(100) CONSTRAINT n_title_nn NOT NULL,
	n_content VARCHAR2(500) CONSTRAINT n_content_nn NOT NULL,
	n_date DATE CONSTRAINT n_date_nn NOT NULL,
	n_pub NUMBER CONSTRAINT n_pub_nn NOT NULL
);
CREATE SEQUENCE P_NOTICE_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_NOTICE;
DROP SEQUENCE P_NOTICE_NO_SEQ;

-- 데이터
INSERT INTO P_NOTICE 
	VALUES(P_NOTICE_NO_SEQ.NEXTVAL, '[서비스 점검] 각 은행...',
		  '안녕하세요. PLO입니다..', to_date('2021.01.02','YYYY.MM.DD'), 1);
INSERT INTO P_NOTICE 
	VALUES(P_NOTICE_NO_SEQ.NEXTVAL, '[업데이트 안내] 다크모드가 반영된...',
		  '디바이스의 디스플레이 설정 변경을...', to_date('2021.01.05','YYYY.MM.DD'), 2);
INSERT INTO P_NOTICE 
	VALUES(P_NOTICE_NO_SEQ.NEXTVAL, '[이벤트] 최애가 고른 노래...',
		  'aaaaaaaaaaaa', to_date('2021.01.11','YYYY.MM.DD'), 3);
INSERT INTO P_NOTICE 
	VALUES(P_NOTICE_NO_SEQ.NEXTVAL, '[서비스 점검] 각 은행...',
		  'bbbbbbbbbbbbbb', to_date('2021.02.20','YYYY.MM.DD'), 4);
INSERT INTO P_NOTICE 
	VALUES(P_NOTICE_NO_SEQ.NEXTVAL, '[서비스 점검] 각 은행...',
		  'ccccccccccccc', to_date('2021.02.06','YYYY.MM.DD'), 5);

-- 조회
SELECT * FROM P_NOTICE;
SELECT P_NOTICE_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_NOTICE';
----------------------------------------------------------------
-- 생성 : P_FAQ_CODE(FAQ구분)
CREATE TABLE P_FAQ_CODE (
	fc_no NUMBER CONSTRAINT fc_no_pk PRIMARY KEY,
	fc_name VARCHAR2(30) CONSTRAINT fc_name_nn NOT NULL
);

-- 삭제
DROP TABLE P_FAQ_CODE;

-- 데이터
INSERT INTO P_FAQ_CODE VALUES(1, '사용 TIP');
INSERT INTO P_FAQ_CODE VALUES(2, '회원정보/로그인');
INSERT INTO P_FAQ_CODE VALUES(3, '플레이어/재생목록');
INSERT INTO P_FAQ_CODE VALUES(4, '서비스문의/오류');

-- 조회
SELECT * FROM P_FAQ_CODE;
----------------------------------------------------------------
-- 생성 : P_FAQ(FAQ)
CREATE TABLE P_FAQ (
	f_no NUMBER CONSTRAINT f_no_pk PRIMARY KEY,
	f_title VARCHAR2(100) CONSTRAINT f_title_nn NOT NULL,
	f_content VARCHAR2(500) CONSTRAINT f_content_nn NOT NULL,
	f_pub NUMBER CONSTRAINT f_pub_nn NOT NULL,
	fc_no NUMBER CONSTRAINT fc_no_fk REFERENCES P_FAQ_CODE(fc_no) ON DELETE CASCADE
);
CREATE SEQUENCE P_FAQ_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 삭제
DROP TABLE P_FAQ;
DROP SEQUENCE P_FAQ_NO_SEQ;

-- 데이터
INSERT INTO P_FAQ VALUES(P_FAQ_NO_SEQ.NEXTVAL, '다크 모드는 어떻게 사용하나요', '이제 PLO에서도 ....', 1, 1);
INSERT INTO P_FAQ VALUES(P_FAQ_NO_SEQ.NEXTVAL, '소셜 로그인은 무엇인가요?', '네이버나 카카오 계정을 통해..', 1, 2);
INSERT INTO P_FAQ VALUES(P_FAQ_NO_SEQ.NEXTVAL, '재생목록은 최대 몇 ...', '최대 3,000곡까지 들을 수 있으며..', 0, 3);
INSERT INTO P_FAQ VALUES(P_FAQ_NO_SEQ.NEXTVAL, 'FLO는 어떤 서비스 인가요?', '원하는 음악을...', 1, 4);

-- 조회
SELECT * FROM P_FAQ;
SELECT P_FAQ_NO_SEQ.CURRVAL FROM DUAL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'P_FAQ';
----------------------------------------------------------------