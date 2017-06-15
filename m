Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 212737837E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 49F372E34E;
	Thu, 15 Jun 2017 16:12:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id F8jXmpiNAf10; Thu, 15 Jun 2017 16:12:31 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E1FE02E5E5;
	Thu, 15 Jun 2017 16:12:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE76A1A07B;
	Thu, 15 Jun 2017 16:12:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B80091A075;
	Thu, 15 Jun 2017 16:12:31 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 15 Jun 2017 16:12:31 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id ABB8C555;
	Thu, 15 Jun 2017 16:12:31 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 16:12:32 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 16:12:31 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 16:12:31 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 07/11] git: Do not install git cvsserver and
	git svn
Thread-Index: AQHS5d+u3IkOlN4WCEm6oKNdPqvnVaIl0meAgAAkn+A=
Date: Thu, 15 Jun 2017 14:12:31 +0000
Message-ID: <a2d8c5d01ab343249c55e1b41dc144ba@XBOX02.axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<c889d79e52d9a86ad4c7a5de5555aa4e49e0610d.1497534748.git.pkj@axis.com>
	<CAJTo0LZY+R=kiwGO87T3_Z451Piwi7H2H5GK3K-hGLKfuniAUQ@mail.gmail.com>
	<CAJTo0LY0wYSwGKGe7VjkArwz7pFq0xNBN2j6+h2vZXmt-D3q+w@mail.gmail.com>
In-Reply-To: <CAJTo0LY0wYSwGKGe7VjkArwz7pFq0xNBN2j6+h2vZXmt-D3q+w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/11] git: Do not install git cvsserver and git svn
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
X-List-Received-Date: Thu, 15 Jun 2017 14:12:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_a2d8c5d01ab343249c55e1b41dc144baXBOX02axiscom_"

--_000_a2d8c5d01ab343249c55e1b41dc144baXBOX02axiscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2VsbCwgSSBndWVzcyBJIGNhbiBkbyB0aGF04oCmDQoNCi8vUGV0ZXINCg0KRnJvbTogQnVydG9u
LCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KU2VudDogZGVuIDE1IGp1bmkg
MjAxNyAxNjowMQ0KVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4
aXMuY29tPg0KQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAwNy8xMV0gZ2l0OiBEbyBub3Qg
aW5zdGFsbCBnaXQgY3Zzc2VydmVyIGFuZCBnaXQgc3ZuDQoNCg0KT24gMTUgSnVuZSAyMDE3IGF0
IDE0OjU5LCBCdXJ0b24sIFJvc3MgPHJvc3MuYnVydG9uQGludGVsLmNvbTxtYWlsdG86cm9zcy5i
dXJ0b25AaW50ZWwuY29tPj4gd3JvdGU6DQpJcyB0aGlzIGEgZ29vZCByZWFzb24gdG8gcmVtb3Zl
IHRoZSBiaW5hcmllcyB0aG91Z2g/ICBXaGF0IGlmIHNvbWVvbmUgYWRkZWQgdGhlIG1vZHVsZXMg
YW5kIHdhbnRlZCB0byB1c2UgdGhlc2UgYmluYXJpZXM/DQoNCk9oLCB0aGUgbmV3IGZpbGVkZXBz
IGxvZ2ljIHdpbGwgYWRkIG1vZHVsZS1sZXZlbCBkZXBlbmRlbmNpZXMuDQoNCk1heWJlIFBBQ0tB
R0VDT05GSUcgdGhlc2U/DQoNClJvc3MNCg0K

--_000_a2d8c5d01ab343249c55e1b41dc144baXBOX02axiscom_
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
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpw
dXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpwLm1zb25vcm1hbDAsIGxpLm1z
b25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCglt
c28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6MGNtOw0KCW1zby1tYXJnaW4t
Ym90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBjbTsNCglmb250LXNpemU6MTIuMHB0Ow0K
CWZvbnQtZmFtaWx5OiJUaW1lcyBOZXcgUm9tYW4iLHNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE4
DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmOw0KCWNvbG9yOiM5NDM2MzQ7DQoJZm9udC13ZWlnaHQ6bm9ybWFsOw0KCWZv
bnQtc3R5bGU6bm9ybWFsOw0KCXRleHQtZGVjb3JhdGlvbjpub25lIG5vbmU7fQ0KLk1zb0NocERl
ZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7DQoJbXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVM7fQ0KQHBhZ2UgV29y
ZFNlY3Rpb24xDQoJe3NpemU6NjEyLjBwdCA3OTIuMHB0Ow0KCW1hcmdpbjo3Mi4wcHQgNzIuMHB0
IDcyLjBwdCA3Mi4wcHQ7fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9
DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2
OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYg
Z3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAg
djpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZd
LS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJTViIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+
DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
bGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0Nh
bGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0O21zby1mYXJlYXN0LWxhbmd1YWdl
OkVOLVVTIj5XZWxsLCBJIGd1ZXNzIEkgY2FuIGRvIHRoYXTigKY8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2Nv
bG9yOiM5NDM2MzQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+Ly9QZXRlcjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVO
LVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1
b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9y
ZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBjbSAwY20gMGNtIDQuMHB0Ij4NCjxk
aXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNFMUUxRTEgMS4w
cHQ7cGFkZGluZzozLjBwdCAwY20gMGNtIDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48
c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1
b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gbGFuZz0i
RU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkm
cXVvdDssc2Fucy1zZXJpZiI+IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVs
LmNvbV0NCjxicj4NCjxiPlNlbnQ6PC9iPiBkZW4gMTUganVuaSAyMDE3IDE2OjAxPGJyPg0KPGI+
VG86PC9iPiBQZXRlciBLamVsbGVyc3RlZHQgJmx0O3BldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bSZndDs8YnI+DQo8Yj5DYzo8L2I+IE9FLWNvcmUgJmx0O29wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBbT0UtY29yZV0g
W1BBVENIIDA3LzExXSBnaXQ6IERvIG5vdCBpbnN0YWxsIGdpdCBjdnNzZXJ2ZXIgYW5kIGdpdCBz
dm48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
Pk9uIDE1IEp1bmUgMjAxNyBhdCAxNDo1OSwgQnVydG9uLCBSb3NzICZsdDs8YSBocmVmPSJtYWls
dG86cm9zcy5idXJ0b25AaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+cm9zcy5idXJ0b25AaW50
ZWwuY29tPC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8YmxvY2txdW90ZSBzdHlsZT0i
Ym9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBjbSAw
Y20gMGNtIDYuMHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowY20iPg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPklzIHRoaXMgYSBnb29kIHJlYXNvbiB0byByZW1vdmUgdGhl
IGJpbmFyaWVzIHRob3VnaD8mbmJzcDsgV2hhdCBpZiBzb21lb25lIGFkZGVkIHRoZSBtb2R1bGVz
IGFuZCB3YW50ZWQgdG8gdXNlIHRoZXNlIGJpbmFyaWVzPzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8
L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PaCwgdGhlIG5l
dyBmaWxlZGVwcyBsb2dpYyB3aWxsIGFkZCBtb2R1bGUtbGV2ZWwgZGVwZW5kZW5jaWVzLjxvOnA+
PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJz
cDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5NYXliZSBQ
QUNLQUdFQ09ORklHIHRoZXNlPzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5Sb3NzJm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_a2d8c5d01ab343249c55e1b41dc144baXBOX02axiscom_--
