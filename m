Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0053.outbound.protection.outlook.com [104.47.2.53])
	by mail.openembedded.org (Postfix) with ESMTP id C931F76B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 11:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=o/wIYWjO5Uv/nxTA0zh9U1GAHYSphRmXIVH3dxumbkI=;
	b=R68du8eEu2mntEL5ETL9vXqQ35BKLeZEzrQWPRsbNCnCheKYjbFyF71ThyB4H8StaSE6Lrv60lNETlJ1okcf5tPBzVkyNQBy3LYqH9bqAWv5GpHnE/5v5Nye9r077Uw6IKI8FqcbzK0YsFugUvbXm7mdDbLNU6Fns50nv4KFebo=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.557.8; Tue, 9 Aug 2016 11:43:38 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0557.009; Tue, 9 Aug 2016 11:43:38 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [krogoth][PATCH] mesa-demos: Fix OpenGL ES
	configurability
Thread-Index: AQHR8iY4Nc88u+b9nke/toYlCYefQ6BAf0KQ
Date: Tue, 9 Aug 2016 11:43:38 +0000
Message-ID: <AMSPR04MB309A834D90712D16444EDE5E21C0@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
	<CAJTo0LaWyLEPg5S3=B=H_Gb4XNuhgiAqYMMgOBdf3JRHuE0FMQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaWyLEPg5S3=B=H_Gb4XNuhgiAqYMMgOBdf3JRHuE0FMQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.49]
x-ms-office365-filtering-correlation-id: 82a0f4a5-09b9-44f5-ceeb-08d3c04a67b6
x-microsoft-exchange-diagnostics: 1; AMSPR04MB309;
	6:+kyfp/OfKzZDw5P9BYnpMwsBJMOC0UAcIycrwnSUhYn3slDKlHrtxoNNKaJiFLmTLm44ZJaDjMdtWH6kxnT4MDCHqxZOA1KffRVhpQSY04lWXhVDotYtH9Eqzo8AqsQq70iypuE9JT9evG72pBWrMCN96agd7oGf1850d7sif5wE51Ch5ZlZqSgDceiCffrpV8L8cWUJdYVs+a6DrFOMiYE1k6I3lJHV8AZp8+47mTHuftE3kB0/qIaO3Zu9PUhS/UVWLVaRo+ff6vN8T8DTVtMzII1GF7SPFrsKH0W0dg8qZAVMxHo/pGzV+hHb34zOHhoxXLFtYxdGzXVu9WuOtQ==;
	5:9BTcuId1lVxAjgLZfX2j5bwVST5V9MMQVI53g7mkyHPNVyhnsdB/UMBcan6Jqj2A9nVzDSzISq5hxRo716zpqH2NlkjA+5kzBpKB4rmhBD4zYyGpQLD2WDECKfQf1ctG3WojgznxA6w4KfufrMcilA==;
	24:q/UWYiJzHva0eNPG5sNOea6mIX/7NT7nctgV5SIeMoWcwezOTixCSu9GrZ2MGi7rUxxtZg8VyAHqcRX5ZviycwXQbVzYQI6AYGZ9Tjzyx0M=;
	7:Hh5VsLPfoDfT0OqVwW2wDklPxCIUolivXV3Hdsit3/jrIP5tfZ6tZ804II+hrCZHNGpQnP/IrxMs3pHDlDUCOcFvpW2x/tkQttxUX0kYONgO9LFZP7sMqG/6jkJDdgcRUPpILMmYbXxD3qNTcgS6SoTAPpXbB1SPJ+FiAiGDoBu2JlkaD0f4gAkZhQlEdQPPGnA3afzf1Bnvu2IALnI88DQ4tX02YEJACiJyVCfeZeHZClK5MlNkfy7VrCl4q3gR
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR04MB309;
x-nips-smtp-inbound: xFSL-EDGE
x-microsoft-antispam-prvs: <AMSPR04MB309CED1E634AC3CEB10AB6FE21C0@AMSPR04MB309.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(21748063052155)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AMSPR04MB309; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB309; 
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(7916002)(189002)(24454002)(199003)(377454003)(11100500001)(189998001)(10400500002)(110136002)(66066001)(8676002)(81166006)(74316002)(8936002)(7736002)(7846002)(81156014)(7696003)(9686002)(3280700002)(3660700001)(68736007)(122556002)(86362001)(87936001)(5002640100001)(105586002)(101416001)(19580405001)(19580395003)(54356999)(76176999)(50986999)(19625215002)(19609705001)(97736004)(16236675004)(76576001)(19300405004)(106116001)(106356001)(15975445007)(92566002)(2900100001)(586003)(102836003)(6116002)(790700001)(2950100001)(3846002)(77096005)(4326007)(2906002)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB309;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2016 11:43:38.7476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB309
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] mesa-demos: Fix OpenGL ES configurability
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
X-List-Received-Date: Tue, 09 Aug 2016 11:43:41 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AMSPR04MB309A834D90712D16444EDE5E21C0AMSPR04MB309eurprd_"

--_000_AMSPR04MB309A834D90712D16444EDE5E21C0AMSPR04MB309eurprd_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8sIG1hc3RlciBkb2VzIG5vdCBuZWVkIHRoaXMgZml4LiBUaGUgcHJvYmxlbWF0aWMgcGF0Y2gg
MDAxMS1kcm9wLWRlbW9zLWRlcGVuZGFudC1vbi1vYnNvbGV0ZS1NRVNBX3NjcmVlbl9zdXJmYWNl
LnBhdGNoIGRvZXMgbm90IGV4aXN0IG9uIG1hc3RlciBiZWNhdXNlIHRoZSB1bmRlcmx5aW5nIGlz
c3VlIHdhcyBhZGRyZXNzZWQgdXBzdHJlYW0gKHdpdGhvdXQgaW50cm9kdWNpbmcgdGhpcyBidWcp
Lg0KDQpUb20NCg0KRnJvbTogQnVydG9uLCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwu
Y29tXQ0KU2VudDogVHVlc2RheSwgQXVndXN0IDA5LCAyMDE2IDU6MTAgQU0NClRvOiBUb20gSG9j
aHN0ZWluIDx0b20uaG9jaHN0ZWluQG54cC5jb20+DQpDYzogT0UtY29yZSA8b3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW2ty
b2dvdGhdW1BBVENIXSBtZXNhLWRlbW9zOiBGaXggT3BlbkdMIEVTIGNvbmZpZ3VyYWJpbGl0eQ0K
DQoNCk9uIDggQXVndXN0IDIwMTYgYXQgMTY6NDUsIFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3Rl
aW5AbnhwLmNvbTxtYWlsdG86dG9tLmhvY2hzdGVpbkBueHAuY29tPj4gd3JvdGU6DQpUaGUgbW9z
dCByZWNlbnQgcGF0Y2ggMDAxMS1kcm9wLWRlbW9zLWRlcGVuZGFudC1vbi1vYnNvbGV0ZS1NRVNB
X3NjcmVlbl9zdXJmYWNlLnBhdGNoDQppbmNvcnJlY3RseSByZW1vdmVkIHRoZSBjb25maWd1cmF0
aW9uIGNvbnN0cnVjdHMgdGhhdCBhbGxvd2VkIHRoZQ0KcGFja2FnZSB0byBiZSBjb25maWd1cmVk
IHdpdGhvdXQgT3BlbkdMIEVTIHN1cHBvcnQuDQoNCkRvZXMgdGhpcyBhbHNvIG5lZWQgdG8gYmUg
YXBwbGllZCB0byBtYXN0ZXI/DQoNClJvc3MNCg==

--_000_AMSPR04MB309A834D90712D16444EDE5E21C0AMSPR04MB309eurprd_
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
ZS10eXBlOmV4cG9ydC1vbmx5O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDEx
LjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9u
MQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48
eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwv
eG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQg
djpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hh
cGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIg
bGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPk5vLCBt
YXN0ZXIgZG9lcyBub3QgbmVlZCB0aGlzIGZpeC4gVGhlIHByb2JsZW1hdGljIHBhdGNoIDAwMTEt
ZHJvcC1kZW1vcy1kZXBlbmRhbnQtb24tb2Jzb2xldGUtTUVTQV9zY3JlZW5fc3VyZmFjZS5wYXRj
aCBkb2VzIG5vdCBleGlzdCBvbiBtYXN0ZXIgYmVjYXVzZSB0aGUNCiB1bmRlcmx5aW5nIGlzc3Vl
IHdhcyBhZGRyZXNzZWQgdXBzdHJlYW0gKHdpdGhvdXQgaW50cm9kdWNpbmcgdGhpcyBidWcpLjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJp
Zjtjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVv
dDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+VG9tPG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMx
RjQ5N0QiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGli
cmkmcXVvdDssc2Fucy1zZXJpZiI+RnJvbTo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+IEJ1
cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0NCjxicj4NCjxiPlNlbnQ6
PC9iPiBUdWVzZGF5LCBBdWd1c3QgMDksIDIwMTYgNToxMCBBTTxicj4NCjxiPlRvOjwvYj4gVG9t
IEhvY2hzdGVpbiAmbHQ7dG9tLmhvY2hzdGVpbkBueHAuY29tJmd0Ozxicj4NCjxiPkNjOjwvYj4g
T0UtY29yZSAmbHQ7b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZndDs8
YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBba3JvZ290aF1bUEFUQ0hdIG1lc2Et
ZGVtb3M6IEZpeCBPcGVuR0wgRVMgY29uZmlndXJhYmlsaXR5PG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPk9uIDggQXVndXN0IDIwMTYgYXQgMTY6NDUsIFRvbSBIb2Noc3Rl
aW4gJmx0OzxhIGhyZWY9Im1haWx0bzp0b20uaG9jaHN0ZWluQG54cC5jb20iIHRhcmdldD0iX2Js
YW5rIj50b20uaG9jaHN0ZWluQG54cC5jb208L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4N
CjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0ND
IDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2lu
LXJpZ2h0OjBpbiI+DQo8ZGl2IGlkPSI6MXBpIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoZSBt
b3N0IHJlY2VudCBwYXRjaCAwMDExLWRyb3AtZGVtb3MtZGVwZW5kYW50LW9uLW9ic29sZXRlLU1F
U0Ffc2NyZWVuX3N1cmZhY2UucGF0Y2g8YnI+DQppbmNvcnJlY3RseSByZW1vdmVkIHRoZSBjb25m
aWd1cmF0aW9uIGNvbnN0cnVjdHMgdGhhdCBhbGxvd2VkIHRoZTxicj4NCnBhY2thZ2UgdG8gYmUg
Y29uZmlndXJlZCB3aXRob3V0IE9wZW5HTCBFUyBzdXBwb3J0LjxvOnA+PC9vOnA+PC9wPg0KPC9k
aXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxicj4NCkRv
ZXMgdGhpcyBhbHNvIG5lZWQgdG8gYmUgYXBwbGllZCB0byBtYXN0ZXI/PG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlJvc3M8bzpwPjwvbzpwPjwv
cD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_AMSPR04MB309A834D90712D16444EDE5E21C0AMSPR04MB309eurprd_--
