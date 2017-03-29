Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD05E77C07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 23:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1086618378;
	Thu, 30 Mar 2017 01:36:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id X69gZTG4Pgq7; Thu, 30 Mar 2017 01:36:24 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2500118226;
	Thu, 30 Mar 2017 01:36:23 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB9CD1E0A0;
	Thu, 30 Mar 2017 01:36:23 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6AEC1E09D;
	Thu, 30 Mar 2017 01:36:23 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 30 Mar 2017 01:36:23 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id AA96322B8;
	Thu, 30 Mar 2017 01:36:23 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 30 Mar 2017 01:36:23 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 30 Mar 2017 01:36:23 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>, Mikko Ylinen
	<mikko.ylinen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] systemd: check 'efi' in MACHINE_FEATURES
Thread-Index: AQHSqG6gnTSbDbjwDk2pu6BXrMUmhKGr2N+AgACezfA=
Date: Wed, 29 Mar 2017 23:36:23 +0000
Message-ID: <4cf87faa3852485a820c7526323ef2ab@XBOX02.axis.com>
References: <20170329092638.11677-1-mikko.ylinen@linux.intel.com>
	<CAJTo0LaLhSaC3bx09=qc+gL7YsPKD0YEtukZafUXcxZdW37dwQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaLhSaC3bx09=qc+gL7YsPKD0YEtukZafUXcxZdW37dwQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: check 'efi' in MACHINE_FEATURES
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
X-List-Received-Date: Wed, 29 Mar 2017 23:36:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4cf87faa3852485a820c7526323ef2abXBOX02axiscom_"

--_000_4cf87faa3852485a820c7526323ef2abXBOX02axiscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIHRoZSByZWNvcmQsIHRoaXMgaXMganVzdCBjb3JyZWN0aW5nIGEgcmVncmVzc2lvbiB0aGF0
IHdhcyBpbnRyb2R1Y2VkIHdpdGggbXkgY2hhbmdlIHRvIHVzZSBiYi51dGlscy5maWx0ZXIoKSB3
aGVyZSBJIGFwcGFyZW50bHkgbWlzc2VkIHRoYXQgbm90IGFsbCB0aGUgZmVhdHVyZXMgd2VyZSBE
SVNUUk9fRkVBVFVSRVPigKYNCg0KVGhhdCBzYWlkLCBJIGRvIGFncmVlIHRoYXQgaXQgd291bGQg
YmUgcHJlZmVyYWJsZSB0byBnZXQgcmlkIG9mIHRoZSBtYWNoaW5lIHNwZWNpZmljIGRlcGVuZGVu
Y3kgaWYgcG9zc2libGUuDQoNCi8vUGV0ZXINCg0KRnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91
bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86b3BlbmVtYmVkZGVkLWNvcmUtYm91
bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgQnVydG9uLCBSb3NzDQpT
ZW50OiBkZW4gMjkgbWFycyAyMDE3IDE4OjAxDQpUbzogTWlra28gWWxpbmVuDQpDYzogT0UtY29y
ZQ0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHN5c3RlbWQ6IGNoZWNrICdlZmknIGlu
IE1BQ0hJTkVfRkVBVFVSRVMNCg0KDQpPbiAyOSBNYXJjaCAyMDE3IGF0IDEwOjI2LCBNaWtrbyBZ
bGluZW4gPG1pa2tvLnlsaW5lbkBsaW51eC5pbnRlbC5jb208bWFpbHRvOm1pa2tvLnlsaW5lbkBs
aW51eC5pbnRlbC5jb20+PiB3cm90ZToNClRoZSByZWNpcGUgY2hlY2tzICdlZmknIGluIERJU1RS
T19GRUFUVVJFUyBidXQgaXQncyBhIG1hY2hpbmUgZmVhdHVyZS4NCg0KRml4IHRoZSBjaGVjayB0
byB1c2UgTUFDSElORV9GRUFUVVJFUyB0byBkZXRlcm1pbmUgd2hldGhlciB0bw0KZW5hYmxlL2Rp
c2FibGUgJ2VmaScgUEFDS0FHRUNPTkZJRy4NCg0KVGhpcyBtYWtlcyBzeXN0ZW1kIGEgTUFDSElO
RS1zcGVjaWZpYyByZWNpcGUsIGFuZCBhcyBpdCBjb250YWlucyBsaWJ1ZGV2IGNhdXNlcyByZWJ1
aWxkcyBmb3IgZXZlcnl0aGluZyBsaW5raW5nIHRvIHRoYXQuICBXaGF0J3MgdGhlIGFjdHVhbCBp
bXBhY3Qgb2YgZW5hYmxpbmcvZGlzYWJsaW5nIEVGST8NCg0KVGhlcmUgaXMgYSB3aGl0ZWxpc3Qg
Zm9yIHJlY2lwZXMgd2hpY2ggYXJlIG1hY2hpbmUtc3BlY2lmaWMgYnV0IHNob3VsZCBiZSB0cmVh
dGVkIGFzIHR1bmUsIGJ1dCB0aGUgYmFycmllciB0byBnZXQgb24gdGhhdCBsaXN0IGlzIGhpZ2gu
DQoNClJvc3MNCg==

--_000_4cf87faa3852485a820c7526323ef2abXBOX02axiscom_
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
dXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjojOTQzNjM0Ow0KCWZvbnQtd2VpZ2h0Om5vcm1hbDsNCglmb250
LXN0eWxlOm5vcm1hbDsNCgl0ZXh0LWRlY29yYXRpb246bm9uZSBub25lO30NCi5Nc29DaHBEZWZh
dWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBw
dDsNCgltYXJnaW46NzIuMHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5Xb3JkU2VjdGlv
bjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+
PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8
L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0
IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNo
YXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMi
IGxpbms9ImJsdWUiIHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQt
ZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0Ij5Gb3Ig
dGhlIHJlY29yZCwgdGhpcyBpcyBqdXN0IGNvcnJlY3RpbmcgYSByZWdyZXNzaW9uIHRoYXQgd2Fz
IGludHJvZHVjZWQgd2l0aCBteSBjaGFuZ2UgdG8gdXNlIGJiLnV0aWxzLmZpbHRlcigpIHdoZXJl
IEkgYXBwYXJlbnRseSBtaXNzZWQgdGhhdCBub3QgYWxsIHRoZSBmZWF0dXJlcw0KIHdlcmUgRElT
VFJPX0ZFQVRVUkVT4oCmPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJy
aSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM5NDM2MzQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojOTQzNjM0
Ij5UaGF0IHNhaWQsIEkgZG8gYWdyZWUgdGhhdCBpdCB3b3VsZCBiZSBwcmVmZXJhYmxlIHRvIGdl
dCByaWQgb2YgdGhlIG1hY2hpbmUgc3BlY2lmaWMgZGVwZW5kZW5jeSBpZiBwb3NzaWJsZS48bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7
Y29sb3I6Izk0MzYzNCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM5NDM2MzQiPi8vUGV0ZXI8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6
Izk0MzYzNCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVy
Om5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBjbSAwY20gMGNtIDQu
MHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNF
MUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwY20gMGNtIDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYi
PiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgW21haWx0
bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddDQo8Yj5P
biBCZWhhbGYgT2YgPC9iPkJ1cnRvbiwgUm9zczxicj4NCjxiPlNlbnQ6PC9iPiBkZW4gMjkgbWFy
cyAyMDE3IDE4OjAxPGJyPg0KPGI+VG86PC9iPiBNaWtrbyBZbGluZW48YnI+DQo8Yj5DYzo8L2I+
IE9FLWNvcmU8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHN5c3Rl
bWQ6IGNoZWNrICdlZmknIGluIE1BQ0hJTkVfRkVBVFVSRVM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48
L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDI5IE1hcmNoIDIwMTcgYXQgMTA6
MjYsIE1pa2tvIFlsaW5lbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1pa2tvLnlsaW5lbkBsaW51eC5p
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5taWtrby55bGluZW5AbGludXguaW50ZWwuY29tPC9h
PiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVyOm5v
bmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBjbSAwY20gMGNtIDYu
MHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowY20iPg0KPGRpdiBpZD0iOjI1NyI+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGUgcmVjaXBlIGNoZWNrcyAnZWZpJyBpbiBESVNUUk9f
RkVBVFVSRVMgYnV0IGl0J3MgYSBtYWNoaW5lIGZlYXR1cmUuPGJyPg0KPGJyPg0KRml4IHRoZSBj
aGVjayB0byB1c2UgTUFDSElORV9GRUFUVVJFUyB0byBkZXRlcm1pbmUgd2hldGhlciB0bzxicj4N
CmVuYWJsZS9kaXNhYmxlICdlZmknIFBBQ0tBR0VDT05GSUcuPG86cD48L286cD48L3A+DQo8L2Rp
dj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KVGhp
cyBtYWtlcyBzeXN0ZW1kIGEgTUFDSElORS1zcGVjaWZpYyByZWNpcGUsIGFuZCBhcyBpdCBjb250
YWlucyBsaWJ1ZGV2IGNhdXNlcyByZWJ1aWxkcyBmb3IgZXZlcnl0aGluZyBsaW5raW5nIHRvIHRo
YXQuJm5ic3A7IFdoYXQncyB0aGUgYWN0dWFsIGltcGFjdCBvZiBlbmFibGluZy9kaXNhYmxpbmcg
RUZJPzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij5UaGVyZSBpcyBhIHdoaXRlbGlzdCBmb3IgcmVjaXBlcyB3aGljaCBhcmUgbWFjaGluZS1zcGVj
aWZpYyBidXQgc2hvdWxkIGJlIHRyZWF0ZWQgYXMgdHVuZSwgYnV0IHRoZSBiYXJyaWVyIHRvIGdl
dCBvbiB0aGF0IGxpc3QgaXMgaGlnaC48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Um9zczxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4cf87faa3852485a820c7526323ef2abXBOX02axiscom_--
