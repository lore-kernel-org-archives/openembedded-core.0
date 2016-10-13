Return-Path: <carol.zhu@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0043.outbound.protection.outlook.com [104.47.2.43])
	by mail.openembedded.org (Postfix) with ESMTP id 549046FFCE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 06:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lL3wPbj9DuN4F6j0yaJrvSEKL73G8vpzFd8fnFrEU8M=;
	b=R8ohC+XmURzA8PBWkaaOm6m52Ce8OiWvFlA4gNIEXvKSI/9cMpfAkzrBmYgVsukBvQN+O4KEQI+iTMVx4ViBEqmb5QwB04pScOZ0PxuO++1Y3ojJeRzYp/unwr3bP3Ne0ysyg6S1tf1zJSheNQu1I/+c7g6njNSgUG0OZn40VQI=
Received: from DB6PR0401MB2678.eurprd04.prod.outlook.com (10.169.225.151) by
	DB6PR0401MB2678.eurprd04.prod.outlook.com (10.169.225.151) with
	ShadowRedundancy id 15.1.659.8; Thu, 13 Oct 2016 23:23:17 +0000
Received: from HE1PR0401MB2684.eurprd04.prod.outlook.com (10.168.149.8) by
	DB6PR0401MB2678.eurprd04.prod.outlook.com (10.169.225.151) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.659.8;
	Thu, 13 Oct 2016 09:07:04 +0000
Received: from HE1PR0401MB2682.eurprd04.prod.outlook.com ([10.168.148.151]) by
	HE1PR0401MB2682.eurprd04.prod.outlook.com ([10.168.148.151]) with
	mapi id 15.01.0669.005; Thu, 13 Oct 2016 09:07:04 +0000
From: Carol Zhu <carol.zhu@nxp.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [poky][PATCH 0/4] Add patches for
	gstreamer1.0-plugins-bad V1.8.3
Thread-Index: AQHSI60fe6YL+qLnyEWqAhDz+Rh7DqCjLfKAgALqsDA=
Date: Thu, 13 Oct 2016 09:07:04 +0000
Message-ID: <HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LaiX-F+0ZPeTs8jJ2GxT61WFi1aPYZ76RgUMAKCMiWaeA@mail.gmail.com>
In-Reply-To: <CAJTo0LaiX-F+0ZPeTs8jJ2GxT61WFi1aPYZ76RgUMAKCMiWaeA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=carol.zhu@nxp.com; 
x-originating-ip: [199.59.230.102]
x-ms-office365-filtering-correlation-id: ad64480b-6146-4f47-638c-08d3f3484cee
x-microsoft-exchange-diagnostics: 1; DB6PR0401MB2678;
	7:ldbaE9gkJkO2Z7DZHI+CVf1rb3dsJmDE2uDAMeOVHI5pkfGz0lR5nTds9w9oLxr52N+yKyjMGFEpHu9oHVjLkyfoK05hL3ncJjX+fawn9f9utywAKe7Gye88zk8vUskw7MHPHL9TiORUszPbnP7Mtxako81ij/0uhGVTwSzutiPyKipD/HHFQWb6q18PcRWe3T+pSA5kHihEojEcktakUvNEWI5VoYQ5722T5o/ot3PuYdwG6Qdiuje6m7ifGoOVFvgIr/i58B+hIZ9YBN171tu7uDdKZ8zAqJh7o8KOVJiYNI37r+1jtNJf+lWwomQQMDkb36WbGWr4bGVQIu8jshRMavxQQYB5Qou+5zBE+Hg=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB6PR0401MB2678;
x-microsoft-antispam-prvs: <DB6PR0401MB267889CAD332078916B2C5D1E9DC0@DB6PR0401MB2678.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(21748063052155)(21532816269658)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:DB6PR0401MB2678; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0401MB2678; 
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(7916002)(24454002)(377454003)(189002)(199003)(230783001)(8936002)(87936001)(9686002)(76576001)(19609705001)(122556002)(105586002)(19580405001)(106356001)(106116001)(19580395003)(50986999)(33656002)(77096005)(76176999)(6116002)(790700001)(110136003)(102836003)(3846002)(2900100001)(19300405004)(3280700002)(189998001)(3660700001)(15975445007)(16236675004)(10400500002)(586003)(81156014)(2950100002)(4326007)(101416001)(7736002)(81166006)(66066001)(7846002)(54356999)(86362001)(97736004)(92566002)(7696004)(11100500001)(19625215002)(2906002)(5660300001)(6916009)(68736007)(8676002)(74316002)(9326002)(5002640100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0401MB2678;
	H:HE1PR0401MB2684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2016 09:07:04.0556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2678
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/4] Add patches for gstreamer1.0-plugins-bad V1.8.3
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
X-List-Received-Date: Fri, 14 Oct 2016 06:58:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0HE1PR0401MB2682_"

--_000_HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0HE1PR0401MB2682_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KICAgICAgVGhlc2UgZ3N0cmVhbWVyIHBhdGNoZXMgYXJlIGJ1ZyBmaXhpbmcg
YW5kIGFsbCBiYWNrcG9ydGVkIGZyb20gaGlnaGVyIHZlcnNpb24sIHNvIHRoZSByaXNrIGlzIGxv
dy4NCiAgICAgIElzIHRoYXQgb2sgdG8gaW50ZWdyYXRlIHRoZW0gaW50byBtb3J0eT8NCg0KDQpC
LlIuDQpDYXJvbA0KDQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRl
bC5jb21dDQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDExLCAyMDE2IDg6MjYgUE0NClRvOiBDYXJv
bCBaaHUgPGNhcm9sLnpodUBueHAuY29tPg0KQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtwb2t5XVtQ
QVRDSCAwLzRdIEFkZCBwYXRjaGVzIGZvciBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQgVjEuOC4z
DQoNCg0KT24gMTEgT2N0b2JlciAyMDE2IGF0IDExOjQ5LCBZdXFpbmcgWmh1IDxjYXJvbC56aHVA
bnhwLmNvbTxtYWlsdG86Y2Fyb2wuemh1QG54cC5jb20+PiB3cm90ZToNCi1TdXBwb3J0IHZpZGVv
IHJvdGF0aW9uIGJ5IHVzaW5nIHRyYW5zZm9ybSBtYXRyaXgNCg0KLUZpeCB3cm9uZyBhdHRyaWJ1
dGUgbGlzdCB0eXBlIGZvciBFR0wgMS41DQoNCi1GaXggaG9yaXpvbnRhbC92ZXJ0aWNhbCBmbGlw
IG1hdHJpemVzDQoNCi1GaXggZ2xpbWFnZXNpbmsgY2Fubm90IHNob3cgZnJhbWUgd2hlbiBjb25u
ZWN0IHRvIHFtbGdsc3JjDQoNCldlJ3JlIGFib3V0IHRvIHJvbGwgUkMxIG9mIDIuMiwgc28gSSB0
aGluayB0aGVzZSB3aWxsIGhhdmUgdG8gd2FpdCB1bnRpbCAyLjMgb3BlbnMgZm9yIHBhdGNoZXMu
DQoNClJvc3MNCg==

--_000_HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0HE1PR0401MB2682_
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
5a6L5L2TOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOWui+S9kyI7DQoJ
cGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJUaW1lcyBOZXcgUm9tYW4iLHNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7
bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVu
ZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0
eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJs
aW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOiMxRjQ5N0Q7fQ0Kc3Bhbi5F
bWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZh
bWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBE
ZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxp
YnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBp
bjsNCgltYXJnaW46MS4waW4gMS4yNWluIDEuMGluIDEuMjVpbjt9DQpkaXYuV29yZFNlY3Rpb24x
DQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4
bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94
bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2
OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFw
ZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBs
aW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+SGkgUm9z
cyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6
JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBUaGVzZSBnc3RyZWFtZXIgcGF0Y2hlcyBhcmUgYnVnIGZpeGlu
ZyBhbmQgYWxsIGJhY2twb3J0ZWQgZnJvbSBoaWdoZXIgdmVyc2lvbiwgc28gdGhlIHJpc2sgaXMg
bG93Lg0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90Oyxz
YW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwO0lzIHRoYXQgb2sgdG8gaW50ZWdyYXRlIHRoZW0gaW50byBtb3J0eT88bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFG
NDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZx
dW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2Zv
bnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj5C
LlIuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5z
LXNlcmlmO2NvbG9yOiMxRjQ5N0QiPkNhcm9sPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6
JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJp
ZiI+RnJvbTo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFt
aWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+IEJ1cnRvbiwgUm9zcyBbbWFpbHRv
OnJvc3MuYnVydG9uQGludGVsLmNvbV0NCjxicj4NCjxiPlNlbnQ6PC9iPiBUdWVzZGF5LCBPY3Rv
YmVyIDExLCAyMDE2IDg6MjYgUE08YnI+DQo8Yj5Ubzo8L2I+IENhcm9sIFpodSAmbHQ7Y2Fyb2wu
emh1QG54cC5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBPRS1jb3JlICZsdDtvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTog
W09FLWNvcmVdIFtwb2t5XVtQQVRDSCAwLzRdIEFkZCBwYXRjaGVzIGZvciBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYWQgVjEuOC4zPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
Pk9uIDExIE9jdG9iZXIgMjAxNiBhdCAxMTo0OSwgWXVxaW5nIFpodSAmbHQ7PGEgaHJlZj0ibWFp
bHRvOmNhcm9sLnpodUBueHAuY29tIiB0YXJnZXQ9Il9ibGFuayI+Y2Fyb2wuemh1QG54cC5jb208
L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6
bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4g
Ni4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+DQo8ZGl2IGlkPSI6NXFt
Ij4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi1TdXBwb3J0IHZpZGVvIHJvdGF0aW9uIGJ5IHVzaW5n
IHRyYW5zZm9ybSBtYXRyaXg8YnI+DQo8YnI+DQotRml4IHdyb25nIGF0dHJpYnV0ZSBsaXN0IHR5
cGUgZm9yIEVHTCAxLjU8YnI+DQo8YnI+DQotRml4IGhvcml6b250YWwvdmVydGljYWwgZmxpcCBt
YXRyaXplczxicj4NCjxicj4NCi1GaXggZ2xpbWFnZXNpbmsgY2Fubm90IHNob3cgZnJhbWUgd2hl
biBjb25uZWN0IHRvIHFtbGdsc3JjPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYmxvY2txdW90
ZT4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGJyPg0KV2UncmUgYWJvdXQgdG8gcm9s
bCBSQzEgb2YgMi4yLCBzbyBJIHRoaW5rIHRoZXNlIHdpbGwgaGF2ZSB0byB3YWl0IHVudGlsIDIu
MyBvcGVucyBmb3IgcGF0Y2hlcy48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Um9zczxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0HE1PR0401MB2682_--
