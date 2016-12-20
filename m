Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A863471DCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 09:06:04 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-06.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cJGN2-0005ls-T3 from Noor_Ahsan@mentor.com ;
	Tue, 20 Dec 2016 01:06:05 -0800
Received: from svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) by
	svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Tue, 20 Dec 2016 09:06:01 +0000
Received: from svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce]) by
	svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce%22]) with
	mapi id 15.00.1210.000; Tue, 20 Dec 2016 09:06:01 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 2/3] libxml2: fix CVE-2016-4658 Disallow
	namespace nodes in XPointer points and ranges
Thread-Index: AQHSWqBJvZeQlRgpJEuAvDs+/8Vzuw==
Date: Tue, 20 Dec 2016 09:06:01 +0000
Message-ID: <0e43b6ba2a2f48a4aac664939ffd027a@svr-ies-mbx-01.mgc.mentorg.com>
References: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
	<1481548821-15878-2-git-send-email-andrej.valek@siemens.com>
	<c5a2e55512d944e0855c7dd2658ad256@svr-ies-mbx-01.mgc.mentorg.com>
	<CAJTo0LbAgwJbNpiONVMP_udObfJMBhCs5SPS7so+073MjtYKTA@mail.gmail.com>
In-Reply-To: <CAJTo0LbAgwJbNpiONVMP_udObfJMBhCs5SPS7so+073MjtYKTA@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Cc: Andrej Valek <andrej.valek@siemens.com>, "Larson,
	Chris" <Chris_Larson@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libxml2: fix CVE-2016-4658 Disallow namespace nodes in XPointer points and ranges
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2016 09:06:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0e43b6ba2a2f48a4aac664939ffd027asvriesmbx01mgcmentorgco_"

--_000_0e43b6ba2a2f48a4aac664939ffd027asvriesmbx01mgcmentorgco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXJtaW4gS3VzdGVyLA0KDQpDYW4geW91IG1lcmdlIHRoaXMgb24gbW9ydHkgYnJhbmNoPw0KDQpO
b29yDQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQpT
ZW50OiBGcmlkYXksIERlY2VtYmVyIDE2LCAyMDE2IDEyOjMzIEFNDQpUbzogQWhzYW4sIE5vb3Ig
PE5vb3JfQWhzYW5AbWVudG9yLmNvbT4NCkNjOiBBbmRyZWogVmFsZWsgPGFuZHJlai52YWxla0Bz
aWVtZW5zLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvM10gbGlieG1sMjogZml4IENWRS0yMDE2LTQ2
NTggRGlzYWxsb3cgbmFtZXNwYWNlIG5vZGVzIGluIFhQb2ludGVyIHBvaW50cyBhbmQgcmFuZ2Vz
DQoNCg0KT24gMTUgRGVjZW1iZXIgMjAxNiBhdCAxOTowNSwgQWhzYW4sIE5vb3IgPE5vb3JfQWhz
YW5AbWVudG9yLmNvbTxtYWlsdG86Tm9vcl9BaHNhbkBtZW50b3IuY29tPj4gd3JvdGU6DQpDYW4g
d2UgbWVyZ2UgdGhpcyBvbiBtb3J0eSBicmFuY2ggYXMgd2VsbD8NCg0KWWVzLCBpZiB5b3UgcGlu
ZyB0aGUgbW9ydHkgbWFpbnRhaW5lci4NCg0KUm9zcw0K

--_000_0e43b6ba2a2f48a4aac664939ffd027asvriesmbx01mgcmentorgco_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpw
dXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4g
MS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9u
MTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0
cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1b
aWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRt
YXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5k
aWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1
cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo5LjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90
OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrO2JhY2tncm91bmQ6I0Y5RjlGOSI+QXJtaW4gS3VzdGVy
LDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6OS41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJp
Zjtjb2xvcjpibGFjaztiYWNrZ3JvdW5kOiNGOUY5RjkiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6OS41cHQ7
Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjaztiYWNr
Z3JvdW5kOiNGOUY5RjkiPkNhbiB5b3UgbWVyZ2UgdGhpcyBvbiBtb3J0eSBicmFuY2g/PG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGEgbmFtZT0iX01haWxFbmRD
b21wb3NlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48
L3NwYW4+PC9hPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6OS41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpi
bGFjaztiYWNrZ3JvdW5kOiNGOUY5RjkiPk5vb3I8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7
LHNhbnMtc2VyaWYiPiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21d
DQo8YnI+DQo8Yj5TZW50OjwvYj4gRnJpZGF5LCBEZWNlbWJlciAxNiwgMjAxNiAxMjozMyBBTTxi
cj4NCjxiPlRvOjwvYj4gQWhzYW4sIE5vb3IgJmx0O05vb3JfQWhzYW5AbWVudG9yLmNvbSZndDs8
YnI+DQo8Yj5DYzo8L2I+IEFuZHJlaiBWYWxlayAmbHQ7YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29t
Jmd0Ozsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxicj4NCjxiPlN1
YmplY3Q6PC9iPiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzNdIGxpYnhtbDI6IGZpeCBDVkUtMjAx
Ni00NjU4IERpc2FsbG93IG5hbWVzcGFjZSBub2RlcyBpbiBYUG9pbnRlciBwb2ludHMgYW5kIHJh
bmdlczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZu
YnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiAxNSBEZWNlbWJl
ciAyMDE2IGF0IDE5OjA1LCBBaHNhbiwgTm9vciAmbHQ7PGEgaHJlZj0ibWFpbHRvOk5vb3JfQWhz
YW5AbWVudG9yLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPk5vb3JfQWhzYW5AbWVudG9yLmNvbTwvYT4m
Z3Q7IHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRlcjpub25l
O2JvcmRlci1sZWZ0OnNvbGlkICNDQ0NDQ0MgMS4wcHQ7cGFkZGluZzowaW4gMGluIDBpbiA2LjBw
dDttYXJnaW4tbGVmdDo0LjhwdDttYXJnaW4tcmlnaHQ6MGluIj4NCjxkaXYgaWQ9Ijo4Z3YiPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Q2FuIHdlIG1lcmdlIHRoaXMgb24gbW9ydHkgYnJhbmNoIGFz
IHdlbGw/PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KWWVzLCBpZiB5b3UgcGluZyB0aGUgbW9ydHkgbWFpbnRh
aW5lci48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+Um9zczxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0K
PC9odG1sPg0K

--_000_0e43b6ba2a2f48a4aac664939ffd027asvriesmbx01mgcmentorgco_--
