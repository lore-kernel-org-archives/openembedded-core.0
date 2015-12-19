Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0137.outbound.protection.outlook.com [65.55.169.137])
	by mail.openembedded.org (Postfix) with ESMTP id A609F7316E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 18:08:03 +0000 (UTC)
Received: from BLUPR03MB1411.namprd03.prod.outlook.com (10.163.81.145) by
	DM2PR0301MB0734.namprd03.prod.outlook.com (10.160.97.142) with
	Microsoft SMTP
	Server (TLS) id 15.1.337.19; Sat, 19 Dec 2015 18:08:03 +0000
Received: from BLUPR03MB1411.namprd03.prod.outlook.com ([10.163.81.145]) by
	BLUPR03MB1411.namprd03.prod.outlook.com ([10.163.81.145]) with mapi id
	15.01.0361.006; Sat, 19 Dec 2015 18:08:02 +0000
From: Tom Hochstein <Tom.Hochstein@freescale.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [<OE-core][PATCH v2 1/4] weston-init: Handle Weston
	startup correctly.
Thread-Index: AQHRORb6Cxp3mSQlXUGgmN1EFcOkd57Q9h8AgABZUHCAAMW/gIAAa/ig
Date: Sat, 19 Dec 2015 18:08:01 +0000
Message-ID: <BLUPR03MB1411453A7700F557F173C5ABE8E20@BLUPR03MB1411.namprd03.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
	<BLUPR03MB1411A316AD75000948872FC9E8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
	<CAP9ODKpDTaDRndcdMYygHqO60fh5NU9uxyw-193rm=mtFdLyrw@mail.gmail.com>
In-Reply-To: <CAP9ODKpDTaDRndcdMYygHqO60fh5NU9uxyw-193rm=mtFdLyrw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Tom.Hochstein@freescale.com; 
x-originating-ip: [192.88.168.50]
x-microsoft-exchange-diagnostics: 1; DM2PR0301MB0734;
	5:fmVDkjCGD+iJS4w5dgMsK8IcdIbNi6Msv4WegmJsyHNZeDUICgyGVOQWiRPEdVY/kjcKb+HGrQaHwk2DqSNMG11K7mCYvo1DNPeO/spv/YhIZWYZ5+03pKn6NKAtvQQhLXH8nxLMoWKO2jIHdk2xwA==;
	24:yoJUS3AIWwQCxtcSrRDfLMOQGIAXGiyNTBLEc1v7OqtTge98JODDfmvVfRH+0IKR5L1to9CLXbtUeWQcOLil5tJnWmuibERSXttS1x9fCmA=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0734;
x-microsoft-antispam-prvs: <DM2PR0301MB0734E966CF4876788E7E9F3CE8E20@DM2PR0301MB0734.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(101931422205132);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:DM2PR0301MB0734; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0734; 
x-forefront-prvs: 07954CC105
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(377454003)(13464003)(199003)(24454002)(189002)(106116001)(561944003)(1220700001)(66066001)(92566002)(19580405001)(99286002)(19580395003)(106356001)(101416001)(33656002)(77096005)(5004730100002)(87936001)(54356999)(122556002)(40100003)(105586002)(5002640100001)(15975445007)(1096002)(76176999)(5003600100002)(50986999)(93886004)(110136002)(5008740100001)(5001960100002)(74316001)(2950100001)(586003)(86362001)(16601075003)(76576001)(189998001)(102836003)(10400500002)(2900100001)(81156007)(97736004)(3846002)(6116002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0734;
	H:BLUPR03MB1411.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2015 18:08:01.9654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0734
Cc: Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 1/4] weston-init: Handle Weston startup correctly.
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
X-List-Received-Date: Sat, 19 Dec 2015 18:08:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLA0KDQpDYW4geW91IGJlIG1vcmUgZXhwbGljaXQgYWJvdXQgd2hhdCB5b3UgbWVh
biBieSB3ZXN0b24tbGF1bmNoIHdyYXBwZXI/IERvIHlvdSB3YW50IHRvIGhpZGUgdGhlIGN1cnJl
bnQgd2VzdG9uLWxhdW5jaCBiaW5hcnkgYW5kIHJlcGxhY2UgaXQgYnkgYSBuZXcgd2VzdG9uLWxh
dW5jaCB3cmFwcGVyPyBXaGF0IGhhcHBlbnMgdG8gbXkgcHJvcG9zZWQgd2VzdG9uLXN0YXJ0LCB3
aGljaCBpcyBpdHNlbGYgYSB3cmFwcGVyPyBEb2VzIGl0cyBmdW5jdGlvbmFsaXR5IG1vdmUgaW50
byB3ZXN0b24tbGF1bmNoPw0KICAgICAgIA0KQ2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQgdGhl
IHJhdGlvbmFsZSBmb3IgdGhlIGV4dHJhIFhXYXlsYW5kIHNjcmlwdD8gVGhlIGV4aXN0aW5nIHdl
c3RvbiByZWNpcGUgaW5zdGFsbHMgeHdheWxhbmQuc28gd2hlbiB0aGUgWFdheWxhbmQgcGFja2Fn
ZSBpcyBzcGVjaWZpZWQuIEluIHlvdXIgcHJvcG9zYWwsIHRoZSB3ZXN0b24gcmVjaXBlIHdvdWxk
IGFsc28gaW5zdGFsbCB0aGUgZXh0cmEgc2NyaXB0IHdoZW4gdGhlIFhXYXlsYW5kIHBhY2thZ2Ug
aXMgc3BlY2lmaWVkLiBTaW5jZSB0aGUgc2FtZSBYV2F5bGFuZCBwYWNrYWdlIG1lY2hhbmlzbSBp
cyB1c2VkIGluIGJvdGggY2FzZXMsIHRoZSBiZW5lZml0IG9mIHRoZSBleHRyYSBzY3JpcHQgaXNu
J3QgY2xlYXIgdG8gbWUuDQoJDQpUb20NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IE90YXZpbyBTYWx2YWRvciBbbWFpbHRvOm90YXZpby5zYWx2YWRvckBvc3N5c3RlbXMuY29t
LmJyXSANClNlbnQ6IFNhdHVyZGF5LCBEZWNlbWJlciAxOSwgMjAxNSAzOjU4IEFNDQpUbzogSG9j
aHN0ZWluIFRvbS1SNjA4NzQgPFRvbS5Ib2Noc3RlaW5AZnJlZXNjYWxlLmNvbT4NCkNjOiBTdW5k
YXJhcmFqIFByYWJodS1CMzY4NzYgPFByYWJodS5TdW5kYXJhcmFqQGZyZWVzY2FsZS5jb20+OyBQ
YXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
WzxPRS1jb3JlXVtQQVRDSCB2MiAxLzRdIHdlc3Rvbi1pbml0OiBIYW5kbGUgV2VzdG9uIHN0YXJ0
dXAgY29ycmVjdGx5Lg0KDQpPbiBGcmksIERlYyAxOCwgMjAxNSBhdCA4OjM2IFBNLCBUb20gSG9j
aHN0ZWluIDxUb20uSG9jaHN0ZWluQGZyZWVzY2FsZS5jb20+IHdyb3RlOg0KPiBIaSBPdGF2aW8s
DQo+DQo+IERvZXMgdGhlIGV4aXN0ZW5jZSBvZiAvdXNyL2xpYi93ZXN0b24veHdheWxhbmQuc28g
Z2l2ZSB1cyB3aGF0IHdlIHdhbnQ/DQo+DQo+ICAgICAgICAgaWYgWyAtZiAvdXNyL2xpYi93ZXN0
b24veHdheWxhbmQuc28gXTsgdGhlbg0KPiAgICAgICAgICAgICBta2RpciAtcCAvdG1wLy5YMTEt
dW5peA0KPiAgICAgICAgICAgICBPUFRBUkdTPSItLW1vZHVsZXM9eHdheWxhbmQuc28gJE9QVEFS
R1MiDQo+ICAgICAgICAgZmkNCj4gICAgICAgICBvcGVudnQgJE9QRU5WVF9BUkdTIC0tIHNoIC1j
ICJ3ZXN0b24tbGF1bmNoIC0tICRPUFRBUkdTID4gL3Zhci9sb2cvd2VzdG9uLmxvZyAyPiYxIg0K
DQpOby4NCg0KSSB0aGluayBJIGNhbWUgdXAgd2l0aCBhIHBsYW46DQoNCiAtIG1ha2Ugd2VzdG9u
LWxhdW5jaCB0byBiZSBhIHdyYXBwZXINCiAtIG1ha2UgaXQgc291cmNlICR7ZGF0YWRpcn0vd2Vz
dG9uL3dlc3Rvbi1sYXVuY2guZC88c2NyaXB0cz4NCiAtICBYV2F5bGFuZCBwYWNrYWdlLCB5b3Ug
aW5zdGFsbCBhICR7ZGF0YWRpcn0vd2VzdG9uL3dlc3Rvbi1sYXVuY2guZC9YV2F5bGFuZA0KDQpY
V2F5bGFuZCBmaWxlOg0KDQpta2RpciAtcCAvdG1wLy5YMTEtdW5peA0KT1BUQVJHUz0iLS1tb2R1
bGVzPXh3YXlsYW5kLnNvICRPUFRBUkdTIg0KDQpEb25lLiBJdCBiZWNhbWUgYSBnZW5lcmljIG9u
ZSA7LSkNCg0KLS0gDQpPdGF2aW8gU2FsdmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE8uUy4gU3lzdGVtcw0KaHR0cDovL3d3dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8v
Y29kZS5vc3N5c3RlbXMuY29tLmJyDQpNb2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAg
ICAgIE1vYmlsZTogKzEgKDM0NykgOTAzLTk3NTANCg==

