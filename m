Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0065.outbound.protection.outlook.com [104.47.2.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED9E6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 20:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=B2sf+a9l1Z+dq4q1S1ylQ+BC1QWelL0RD0DYWMu0oEM=;
	b=NU9sRMUsGiDyybSaQ0Bo6iL/6mj+5X1NQkMcCRMrUnTtGl68RKvF9jviGpu4HwZdC/rQ19I9qeA8cO9AudOoD8N+RZYcf08gs9xO03DM/LtnpCAqPThkEaKvbP5SeebpVAT66pamV5z+PBKOWhnKCODCQ7c38VfkQnrgaIV91ow=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	AMSPR04MB312.eurprd04.prod.outlook.com (10.242.107.25) with Microsoft
	SMTP Server (TLS) id 15.1.539.6; Fri, 15 Jul 2016 19:54:39 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0539.019; Fri, 15 Jul 2016 19:54:39 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v2] weston-init: De-couple framebuffer console
	from Weston for systemd startup
Thread-Index: AQHR3rps/mvltjZmnUW//HqG9vv/PKAZ4vcg
Date: Fri, 15 Jul 2016 19:54:39 +0000
Message-ID: <AMSPR04MB3093A888B07DEE1AC76B226E2330@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1468600403-29471-1-git-send-email-tom.hochstein@nxp.com>
	<CAP9ODKoWJ9eBDPU5VJyCgYb0dg6mFXyqH=bf-PJtMfOK+OVxkg@mail.gmail.com>
In-Reply-To: <CAP9ODKoWJ9eBDPU5VJyCgYb0dg6mFXyqH=bf-PJtMfOK+OVxkg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.1]
x-ms-office365-filtering-correlation-id: 9f7982d8-e432-42a5-6213-08d3ace9db52
x-microsoft-exchange-diagnostics: 1; AMSPR04MB312;
	6:1NPzcRl4pQhV0Ck0oDN+b90lhQJyDqy6A6NqP2oRe0rpri68v9VhALqpdsh+BLDOIgaj4oEH0qlBtXJMRIGgQNkoKp+0kv8hNGC7ovCrDLxNyMpV15DhXaOexUryliBfQKjlkyQczdkH22gA0YcIOlWgXZSCxPVGKYzwfB1MVcm8RWKp3WPgJw3fw70Y4mdLwQs18ToBJRNfrkhLEEgX35SYL1GSkSLbxKOH1UFCGx7LYyoKLPfIcwWy3vyEvJlLDMGExz/veGocrAr/JkgztRoW81e++KjeZ44n5E+oUGC/jiGlWjWk9xO05P2yLrUWZyr+NbQ+KhufKwdKMMHNqA==;
	5:AmeRQG/pQyt7hJx7BLLyr4cu5uCcQA9Bd9bBnyTnZUU8FMSpke4gyT9gLffeD+T5x0Fboc7j4DkrTbjXFdjQOipWs/E/99qmP80UpZ3bvlEgj2O/MAiPjBiDspJK5C6JBMX8Z+xETgcaOkpGkp4fKw==;
	24:/h36/jgwvAstGN1/I2acnJcdfogHjvGbWh0Qd1cK2Iim2B+ufcP/2uLGKA4WR/ipLq/MueVdboWwMbqqvXZ6jEdDDDEbGOqbeNZ9dVG/nxQ=;
	7:Gi5viRNnQyYCy3RqTt76nE7IzK8Ks+smaovQhHcTrEHDR23b2RpCsrkfXfAI3d+WfNmb0yPZiSg/VhV66F7zv6ATkfxPo2MppU68oJBANAwR4PsM/rKL+IMOPFeelQsUbc1GVY4P/ZOxpatGeOxwVuS6odBLE/zBZw+23I8m1L+Q1NApjA3egRvNdc5KAWPImel2d3BVSgWCWDjLaRhzbgly/64g8XoFt2vFU/muWz7DcdearQjNm8QoAlLA5Qpb
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR04MB312;
x-microsoft-antispam-prvs: <AMSPR04MB31236EB7A3EA643FE1A8150E2330@AMSPR04MB312.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(166494164430575); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:AMSPR04MB312; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB312; 
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(199003)(24454002)(13464003)(377454003)(189002)(5003600100003)(33656002)(68736007)(19580405001)(106356001)(106116001)(101416001)(97736004)(92566002)(105586002)(189998001)(102836003)(86362001)(19580395003)(586003)(3846002)(122556002)(110136002)(7696003)(76576001)(7736002)(16601075003)(10400500002)(6116002)(5002640100001)(74316002)(7846002)(8676002)(9686002)(76176999)(50986999)(54356999)(4326007)(2950100001)(3280700002)(305945005)(2900100001)(15975445007)(11100500001)(77096005)(66066001)(3660700001)(87936001)(8936002)(81156014)(2906002)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB312;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2016 19:54:39.4558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB312
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston-init: De-couple framebuffer console from Weston for systemd startup
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
X-List-Received-Date: Fri, 15 Jul 2016 20:27:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnkgYWdhaW4sIHNlZW1zIHRoYXQgdGhlIHdlc3Rvbi1zdGFydCBwYXJzZXIgaXMgbm90IHBy
ZXBhcmVkIHRvIHRha2Ugbm8gb3BlbnZ0IGFyZ3VtZW50cy4gV2lsbCBuZWVkIHRvIGZpeCB0aGF0
IGFzIHdlbGwuDQoNClRvbQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogT3Rh
dmlvIFNhbHZhZG9yIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQG9zc3lzdGVtcy5jb20uYnJdIA0K
U2VudDogRnJpZGF5LCBKdWx5IDE1LCAyMDE2IDEyOjAxIFBNDQpUbzogVG9tIEhvY2hzdGVpbiA8
dG9tLmhvY2hzdGVpbkBueHAuY29tPg0KQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0
IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIHdlc3Rvbi1pbml0OiBEZS1j
b3VwbGUgZnJhbWVidWZmZXIgY29uc29sZSBmcm9tIFdlc3RvbiBmb3Igc3lzdGVtZCBzdGFydHVw
DQoNCk9uIEZyaSwgSnVsIDE1LCAyMDE2IGF0IDE6MzMgUE0sIFRvbSBIb2Noc3RlaW4gPHRvbS5o
b2Noc3RlaW5AbnhwLmNvbT4gd3JvdGU6DQo+IFRoZSBmcmFtZWJ1ZmZlciBjb25zb2xlIHdhcyB1
c2luZyB0aGUgc2FtZSBJL08gYXMgV2VzdG9uLiBXZSBmaXggdGhpcw0KPiBieSBoYXZpbmcgb3Bl
bnZ0IHN3aXRjaCB0byB0aGUgbmV3IFZUIHdoZW4gc3RhcnRpbmcgd2VzdG9uLWxhdW5jaCwgc2Ft
ZQ0KPiBhcyBpcyBhbHJlYWR5IGRvbmUgZm9yIHRoZSBzeXN2aW5pdCBjYXNlLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBUb20gSG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54cC5jb20+DQoNCkFja2Vk
LWJ5OiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPg0KDQotLSANCk90
YXZpbyBTYWx2YWRvciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTy5TLiBTeXN0ZW1zDQpo
dHRwOi8vd3d3Lm9zc3lzdGVtcy5jb20uYnIgICAgICAgIGh0dHA6Ly9jb2RlLm9zc3lzdGVtcy5j
b20uYnINCk1vYmlsZTogKzU1ICg1MykgOTk4MS03ODU0ICAgICAgICAgICAgTW9iaWxlOiArMSAo
MzQ3KSA5MDMtOTc1MA0K

