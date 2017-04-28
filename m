Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8533377EDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id D55B011A906;
	Fri, 28 Apr 2017 22:24:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 5Xs9adWmMWYH; Fri, 28 Apr 2017 22:24:59 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 011102E5F2;
	Fri, 28 Apr 2017 22:24:59 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2EA61E0AD;
	Fri, 28 Apr 2017 22:24:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDA971E0A7;
	Fri, 28 Apr 2017 22:24:58 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 28 Apr 2017 22:24:58 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id C18A921A4;
	Fri, 28 Apr 2017 22:24:58 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 28 Apr 2017 22:24:58 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 28 Apr 2017 22:24:58 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 28 Apr 2017 22:24:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] sstate.bbclass, staging.bbclass: Handle
	HOSTTOOLS_DIR when restoring state
Thread-Index: AQHSwDEHmSXS27+hxEuW7o6nriC/aaHbOC4w
Date: Fri, 28 Apr 2017 20:24:58 +0000
Message-ID: <7664f0c8e3b14a01b2c0bb748011133a@XBOX02.axis.com>
References: <cover.1493391620.git.pkj@axis.com>
	<8a430c9f93f00eed399175287be30cfcd0326cab.1493391620.git.pkj@axis.com>
	<CAJTo0LbdLc2OUFxY4N_sgVMVObiUzQFHaj6BD4idGsEiy7-2NQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbdLc2OUFxY4N_sgVMVObiUzQFHaj6BD4idGsEiy7-2NQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sstate.bbclass, staging.bbclass: Handle HOSTTOOLS_DIR when restoring state
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
X-List-Received-Date: Fri, 28 Apr 2017 20:25:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7664f0c8e3b14a01b2c0bb748011133aXBOX02axiscom_"

--_000_7664f0c8e3b14a01b2c0bb748011133aXBOX02axiscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U28sIHNob3VsZCBJIGNoYW5nZSBpdCB0bzoNCg0KU1RBR0lOR19GSVhNRVMgPSAiSE9TVFRPT0xT
X0RJUiAke0VYVFJBX1NUQUdJTkdfRklYTUVTfSINCkVYVFJBX1NUQUdJTkdfRklYTUVTID89ICIi
DQoNCkFuZCB1c2UgJHtTVEFHSU5HX0ZJWE1FU30gaW5zdGVhZCBvZiAke0VYVFJBX1NUQUdJTkdf
RklYTUVTfSBsYXRlciBvbj8NCg0KLy9QZXRlcg0KDQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQpTZW50OiBkZW4gMjggYXByaWwgMjAxNyAxNzowNg0K
VG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KQ2M6
IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzJdIHNzdGF0ZS5iYmNsYXNzLCBzdGFnaW5nLmJi
Y2xhc3M6IEhhbmRsZSBIT1NUVE9PTFNfRElSIHdoZW4gcmVzdG9yaW5nIHN0YXRlDQoNCg0KT24g
MjggQXByaWwgMjAxNyBhdCAxNjowMSwgUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb208bWFpbHRvOnBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4+IHdyb3Rl
Og0KLUVYVFJBX1NUQUdJTkdfRklYTUVTID89ICIiDQorRVhUUkFfU1RBR0lOR19GSVhNRVMgPz0g
IkhPU1RUT09MU19ESVIiDQoNCkVYVFJBIGFuZCA/PSBzdWdnZXN0cyB0aGF0IHRoaXMgc2hvdWxk
IHJlbWFpbiAiIiBhbmQgdGhlIEhPU1RUT09MU19ESVIgcmVsb2NhdGlvbiBpcyBoYW5kbGVkIGlu
IGFub3RoZXIgd2F5LCBhcyBvdGhlciBjbGFzc2VzIHRoYXQgaGF2ZSBkb25lID0iRk9PRElSIiB3
b3VsZCBvdmVycmlkZSBIT1NUVE9PTFNfRElSLg0KDQpSb3NzDQo=

--_000_7664f0c8e3b14a01b2c0bb748011133aXBOX02axiscom_
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
ZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJbXNvLWZhcmVhc3QtbGFuZ3Vh
Z2U6RU4tVVM7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6NjEyLjBwdCA3OTIuMHB0Ow0K
CW1hcmdpbjo3Mi4wcHQgNzIuMHB0IDcyLjBwdCA3Mi4wcHQ7fQ0KZGl2LldvcmRTZWN0aW9uMQ0K
CXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1s
Pg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1s
PjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpl
eHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVs
YXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJTViIgbGluaz0i
Ymx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0
O21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj5Tbywgc2hvdWxkIEkgY2hhbmdlIGl0IHRvOjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVO
LVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1
b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
bGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0Nh
bGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0O21zby1mYXJlYXN0LWxhbmd1YWdl
OkVOLVVTIj5TVEFHSU5HX0ZJWE1FUyA9ICZxdW90O0hPU1RUT09MU19ESVIgJHtFWFRSQV9TVEFH
SU5HX0ZJWE1FU30mcXVvdDs8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1p
bHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM5NDM2MzQ7bXNvLWZhcmVh
c3QtbGFuZ3VhZ2U6RU4tVVMiPkVYVFJBX1NUQUdJTkdfRklYTUVTID89ICZxdW90OyZxdW90Ozxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVO
LVVTIiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1
b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
bGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0Nh
bGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0O21zby1mYXJlYXN0LWxhbmd1YWdl
OkVOLVVTIj5BbmQgdXNlICR7U1RBR0lOR19GSVhNRVN9IGluc3RlYWQgb2YgJHtFWFRSQV9TVEFH
SU5HX0ZJWE1FU30gbGF0ZXIgb24/PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQt
ZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0O21zby1m
YXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM5NDM2
MzQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPi8vUGV0ZXI8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2Nv
bG9yOiM5NDM2MzQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9zcGFuPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci1sZWZ0OnNvbGlkIGJs
dWUgMS41cHQ7cGFkZGluZzowY20gMGNtIDBjbSA0LjBwdCI+DQo8ZGl2Pg0KPGRpdiBzdHlsZT0i
Ym9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjRTFFMUUxIDEuMHB0O3BhZGRpbmc6My4wcHQg
MGNtIDBjbSAwY20iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gbGFuZz0iRU4tVVMi
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDss
c2Fucy1zZXJpZiI+RnJvbTo8L3NwYW4+PC9iPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYi
PiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo8YnI+DQo8Yj5T
ZW50OjwvYj4gZGVuIDI4IGFwcmlsIDIwMTcgMTc6MDY8YnI+DQo8Yj5Ubzo8L2I+IFBldGVyIEtq
ZWxsZXJzdGVkdCAmbHQ7cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tJmd0Ozxicj4NCjxiPkNj
OjwvYj4gT0UtY29yZSAmbHQ7b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSBzc3Rh
dGUuYmJjbGFzcywgc3RhZ2luZy5iYmNsYXNzOiBIYW5kbGUgSE9TVFRPT0xTX0RJUiB3aGVuIHJl
c3RvcmluZyBzdGF0ZTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+T24gMjggQXByaWwgMjAxNyBhdCAxNjowMSwgUGV0ZXIgS2plbGxlcnN0ZWR0
ICZsdDs8YSBocmVmPSJtYWlsdG86cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tIiB0YXJnZXQ9
Il9ibGFuayI+cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPC9hPiZndDsgd3JvdGU6PG86cD48
L286cD48L3A+DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29s
aWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBjbSAwY20gMGNtIDYuMHB0O21hcmdpbi1sZWZ0OjQu
OHB0O21hcmdpbi1yaWdodDowY20iPg0KPGRpdiBpZD0iOjQydCI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4tRVhUUkFfU1RBR0lOR19GSVhNRVMgPz0gJnF1b3Q7JnF1b3Q7PGJyPg0KJiM0MztFWFRS
QV9TVEFHSU5HX0ZJWE1FUyA/PSAmcXVvdDtIT1NUVE9PTFNfRElSJnF1b3Q7PG86cD48L286cD48
L3A+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PGJyPg0KRVhUUkEgYW5kID89IHN1Z2dlc3RzIHRoYXQgdGhpcyBzaG91bGQgcmVtYWluICZxdW90
OyZxdW90OyBhbmQgdGhlIEhPU1RUT09MU19ESVIgcmVsb2NhdGlvbiBpcyBoYW5kbGVkIGluIGFu
b3RoZXIgd2F5LCBhcyBvdGhlciBjbGFzc2VzIHRoYXQgaGF2ZSBkb25lID0mcXVvdDtGT09ESVIm
cXVvdDsgd291bGQgb3ZlcnJpZGUgSE9TVFRPT0xTX0RJUi48bzpwPjwvbzpwPjwvcD4NCjwvZGl2
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9k
aXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Um9zczxvOnA+PC9vOnA+PC9wPg0KPC9k
aXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_7664f0c8e3b14a01b2c0bb748011133aXBOX02axiscom_--
