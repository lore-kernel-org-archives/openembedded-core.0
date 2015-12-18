Return-Path: <Tom.Hochstein@freescale.com>
X-Greylist: delayed 86021 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Dec 2015 21:58:43 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0137.outbound.protection.outlook.com [157.56.111.137])
	by mail.openembedded.org (Postfix) with ESMTP id 40EA46AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 21:58:43 +0000 (UTC)
Received: from BLUPR03MB1411.namprd03.prod.outlook.com (10.163.81.145) by
	BLUPR03MB1411.namprd03.prod.outlook.com (10.163.81.145) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 18 Dec 2015 21:58:42 +0000
Received: from BLUPR03MB1411.namprd03.prod.outlook.com ([10.163.81.145]) by
	BLUPR03MB1411.namprd03.prod.outlook.com ([10.163.81.145]) with mapi id
	15.01.0361.006; Fri, 18 Dec 2015 21:58:42 +0000
From: Tom Hochstein <Tom.Hochstein@freescale.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [<OE-core][PATCH v2 2/4] weston: Include weston-launch
	if Wayland is configured.
Thread-Index: AQHRORb6fKXh0jp6REKygNhOgRJT8Z7Q9rSAgABHpiA=
Date: Fri, 18 Dec 2015 21:58:42 +0000
Message-ID: <BLUPR03MB1411555504B87423056408ECE8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<1450389888-24760-2-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKrdjBD=RXJ_hPgQCqO0C7hK3=dECXg_JKT11xVVYOEMwA@mail.gmail.com>
In-Reply-To: <CAP9ODKrdjBD=RXJ_hPgQCqO0C7hK3=dECXg_JKT11xVVYOEMwA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Tom.Hochstein@freescale.com; 
x-originating-ip: [192.88.168.50]
x-microsoft-exchange-diagnostics: 1; BLUPR03MB1411;
	5:Ds3EI48nK0z3nY1SLGmQSD8AMjnMu2n6MAaI2OgRm6xZR9dsG5juBHyZ/ALn9DnkqEtpEl2m+cFE2CwWMxGve+HzEzHzoYLqfPO/m6393wbu0l582TJaBcvYMtMLntwMoDfYLPRvy8haF+L0yUHsDA==;
	24:hlkhP90UVBzBtwnFb9W42ggHaSYGxnOU0ezqdSsrD1Nzjl6oW5pNpreCPcML5umXnJ9saiA6fzLHAOuxu22+x/SPU9VUVlgoGo+vXHCYohY=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB1411;
x-microsoft-antispam-prvs: <BLUPR03MB1411EA826DB7B3D4A2A7C63EE8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(101931422205132);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR03MB1411; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB1411; 
x-forefront-prvs: 07943272E1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(199003)(24454002)(13464003)(377454003)(189002)(77096005)(66066001)(5001960100002)(189998001)(2950100001)(97736004)(102836003)(2900100001)(5008740100001)(586003)(40100003)(6116002)(33656002)(106356001)(10400500002)(110136002)(1220700001)(92566002)(122556002)(16601075003)(11100500001)(76576001)(101416001)(1096002)(5004730100002)(15975445007)(105586002)(106116001)(76176999)(50986999)(19580395003)(99286002)(5002640100001)(3846002)(81156007)(86362001)(87936001)(74316001)(54356999)(5003600100002)(19580405001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1411;
	H:BLUPR03MB1411.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2015 21:58:42.7194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1411
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 2/4] weston: Include weston-launch if Wayland is configured.
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
X-List-Received-Date: Fri, 18 Dec 2015 21:58:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLCBPdGF2aW8uIFNoYWxsIEkgc2ltcGx5IHF1b3RlIHRoZSB3ZXN0b24gbWFuIHBhZ2U6
DQoNCldoZW4gd2VzdG9uIGlzIHN0YXJ0ZWQgYXMgdGhlIGZpcnN0IHdpbmRvd2luZyBzeXN0ZW0g
KGkuZS4gbm90IHVuZGVyIFgNCm5vciB1bmRlciBhbm90aGVyIFdheWxhbmQgc2VydmVyKSwgaXQg
c2hvdWxkIGJlIGRvbmUgd2l0aCB0aGUgY29tbWFuZA0Kd2VzdG9uLWxhdW5jaCB0byBzZXQgdXAg
cHJvcGVyIHByaXZpbGVnZWQgYWNjZXNzIHRvIGRldmljZXMuDQoNClRvbQ0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogT3RhdmlvIFNhbHZhZG9yIFttYWlsdG86b3RhdmlvLnNh
bHZhZG9yQG9zc3lzdGVtcy5jb20uYnJdIA0KU2VudDogRnJpZGF5LCBEZWNlbWJlciAxOCwgMjAx
NSAxMDo1MiBBTQ0KVG86IEhvY2hzdGVpbiBUb20tUjYwODc0IDxUb20uSG9jaHN0ZWluQGZyZWVz
Y2FsZS5jb20+DQpDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUg
bGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFs8T0UtY29yZV1bUEFUQ0ggdjIgMi80XSB3ZXN0b246IEluY2x1ZGUg
d2VzdG9uLWxhdW5jaCBpZiBXYXlsYW5kIGlzIGNvbmZpZ3VyZWQuDQoNCk9uIFRodSwgRGVjIDE3
LCAyMDE1IGF0IDg6MDQgUE0sIFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AZnJlZXNjYWxl
LmNvbT4gd3JvdGU6DQo+IFRoZSB3ZXN0b24tbGF1bmNoIGFwcCBpcyByZXF1aXJlZCBmb3IgV2F5
bGFuZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogVG9tIEhvY2hzdGVpbiA8dG9tLmhvY2hzdGVpbkBm
cmVlc2NhbGUuY29tPg0KDQpUaGUgY29tbWl0IGxvZyBuZWVkcyBhIGdvb2QgcmV3b3JrOyB0aGlz
IGlzIGV4cGxhaW5pbmcgdGhlIHNvdXJjZSBjb2RlIGFuZCBub3Qgd2h5IGl0IGhhcyBiZWVuIGNo
YW5nZS4gUGxlYXNlIHJld29yayBpdC4NCg0KLS0gDQpPdGF2aW8gU2FsdmFkb3IgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE8uUy4gU3lzdGVtcw0KaHR0cDovL3d3dy5vc3N5c3RlbXMuY29t
LmJyICAgICAgICBodHRwOi8vY29kZS5vc3N5c3RlbXMuY29tLmJyDQpNb2JpbGU6ICs1NSAoNTMp
IDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0NykgOTAzLTk3NTANCg==

