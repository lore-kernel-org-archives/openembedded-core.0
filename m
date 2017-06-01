Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA8C6E660
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 08:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 409E72E444;
	Thu,  1 Jun 2017 10:04:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6gDKKrEj6sAw; Thu,  1 Jun 2017 10:04:06 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 43B452E4E4;
	Thu,  1 Jun 2017 10:04:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07CAF1A096;
	Thu,  1 Jun 2017 10:04:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4FA91A094;
	Thu,  1 Jun 2017 10:04:05 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  1 Jun 2017 10:04:05 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id D924D23F7;
	Thu,  1 Jun 2017 10:04:05 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 1 Jun 2017 10:04:05 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 1 Jun 2017 10:04:05 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] kconfig-frontends: fix another build race
Thread-Index: AQHS1j0GP6yLqs36vkGljzv0u2/GRaIPrniw
Date: Thu, 1 Jun 2017 08:04:05 +0000
Message-ID: <f4c88ff5bed14ee2af6fa69d318179c3@XBOX02.axis.com>
References: <1495815229-10309-1-git-send-email-ross.burton@intel.com>
	<CAMKF1sqWjyXxv8dgtooat_BByt3-Sbf2HTjKCQA8Syu-6JQZKA@mail.gmail.com>
	<CAJTo0LZ7kgZO9U3wNkJ1R3EGv5eStotU67Poi1zOK-pyyw-B6w@mail.gmail.com>
In-Reply-To: <CAJTo0LZ7kgZO9U3wNkJ1R3EGv5eStotU67Poi1zOK-pyyw-B6w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kconfig-frontends: fix another build race
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
X-List-Received-Date: Thu, 01 Jun 2017 08:04:08 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f4c88ff5bed14ee2af6fa69d318179c3XBOX02axiscom_"

--_000_f4c88ff5bed14ee2af6fa69d318179c3XBOX02axiscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2UgdXNlIGl0LCBzbyBpZiB5b3Ugd2FudCB0byByZW1vdmUgaXQgZnJvbSBPRS1jb3JlLCB0aGVu
IHBsZWFzZSBtb3ZlIGl0IHRvIG1ldGEtb2UuDQoNCi8vUGV0ZXINCg0KRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86b3BlbmVtYmVk
ZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgQnVy
dG9uLCBSb3NzDQpTZW50OiBkZW4gMjYgbWFqIDIwMTcgMTg6MjcNClRvOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPg0KQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBv
ZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGtjb25maWctZnJvbnRlbmRzOiBmaXggYW5v
dGhlciBidWlsZCByYWNlDQoNCg0KT24gMjYgTWF5IDIwMTcgYXQgMTc6MjUsIEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb208bWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbT4+IHdyb3RlOg0KdGhp
cyBwYWNrYWdlIHNob3VsZCBwcm9iYWJseSBiZSByZXRpcmVkIGZyb20gb2UtY29yZS4gSSBhZGRl
ZCBpdCBhcw0KcGFydCBvZiBlZ2xpYmMNCmtjb25maWcgc3VwcG9ydCB3aGljaCB3ZSBoYXZlIGRy
b3BwZWQgZmV3IHJlbGVhc2VzIGJhY2suDQoNCklmIHlvdSBhZGRlZCBpdCwgYW5kIG5vYm9keSBl
bHNlIHJlYWxseSB3YW50cyBpdCwgZmVlbCBmcmVlIHRvIHN1Ym1pdCBhIHJlbW92YWwgcGF0Y2gu
DQoNClJvc3MNCg0K

--_000_f4c88ff5bed14ee2af6fa69d318179c3XBOX02axiscom_
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
OkVOLVVTIj5XZSB1c2UgaXQsIHNvIGlmIHlvdSB3YW50IHRvIHJlbW92ZSBpdCBmcm9tIE9FLWNv
cmUsIHRoZW4gcGxlYXNlIG1vdmUgaXQgdG8gbWV0YS1vZS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9y
OiM5NDM2MzQ7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2Vy
aWY7Y29sb3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+Ly9QZXRlcjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVT
IiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7
LHNhbnMtc2VyaWY7Y29sb3I6Izk0MzYzNDttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVy
LWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBjbSAwY20gMGNtIDQuMHB0Ij4NCjxkaXY+
DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7
cGFkZGluZzozLjBwdCAwY20gMGNtIDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3Bh
biBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gbGFuZz0iRU4t
VVMiIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVv
dDssc2Fucy1zZXJpZiI+IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZ10NCjxiPk9uIEJlaGFsZiBPZiA8L2I+QnVydG9uLCBSb3NzPGJyPg0KPGI+U2VudDo8
L2I+IGRlbiAyNiBtYWogMjAxNyAxODoyNzxicj4NCjxiPlRvOjwvYj4gS2hlbSBSYWogJmx0O3Jh
ai5raGVtQGdtYWlsLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IFBhdGNoZXMgYW5kIGRpc2N1c3Np
b25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyICZsdDtvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW09FLWNvcmVdIFtQ
QVRDSF0ga2NvbmZpZy1mcm9udGVuZHM6IGZpeCBhbm90aGVyIGJ1aWxkIHJhY2U8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDI2IE1heSAy
MDE3IGF0IDE3OjI1LCBLaGVtIFJhaiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJhai5raGVtQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxv
OnA+PC9vOnA+PC9wPg0KPGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci1sZWZ0
OnNvbGlkICNDQ0NDQ0MgMS4wcHQ7cGFkZGluZzowY20gMGNtIDBjbSA2LjBwdDttYXJnaW4tbGVm
dDo0LjhwdDttYXJnaW4tcmlnaHQ6MGNtIj4NCjxkaXYgaWQ9IjozYm8iPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+dGhpcyBwYWNrYWdlIHNob3VsZCBwcm9iYWJseSBiZSByZXRpcmVkIGZyb20gb2Ut
Y29yZS4gSSBhZGRlZCBpdCBhczxicj4NCnBhcnQgb2YgZWdsaWJjPGJyPg0Ka2NvbmZpZyBzdXBw
b3J0IHdoaWNoIHdlIGhhdmUgZHJvcHBlZCBmZXcgcmVsZWFzZXMgYmFjay48bzpwPjwvbzpwPjwv
cD4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
SWYgeW91IGFkZGVkIGl0LCBhbmQgbm9ib2R5IGVsc2UgcmVhbGx5IHdhbnRzIGl0LCBmZWVsIGZy
ZWUgdG8gc3VibWl0IGEgcmVtb3ZhbCBwYXRjaC48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Um9zcyZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9k
aXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_f4c88ff5bed14ee2af6fa69d318179c3XBOX02axiscom_--
