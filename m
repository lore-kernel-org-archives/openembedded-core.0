Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0119.outbound.protection.outlook.com [157.56.111.119])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5FC6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 22:36:51 +0000 (UTC)
Received: from BLUPR03MB1411.namprd03.prod.outlook.com (10.163.81.145) by
	BN1PR0301MB0721.namprd03.prod.outlook.com (10.160.78.140) with
	Microsoft SMTP
	Server (TLS) id 15.1.355.16; Fri, 18 Dec 2015 22:36:51 +0000
Received: from BLUPR03MB1411.namprd03.prod.outlook.com ([10.163.81.145]) by
	BLUPR03MB1411.namprd03.prod.outlook.com ([10.163.81.145]) with mapi id
	15.01.0361.006; Fri, 18 Dec 2015 22:36:50 +0000
From: Tom Hochstein <Tom.Hochstein@freescale.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Sundararaj Prabhu
	<Prabhu.Sundararaj@freescale.com>
Thread-Topic: [OE-core] [<OE-core][PATCH v2 1/4] weston-init: Handle Weston
	startup correctly.
Thread-Index: AQHRORb6Cxp3mSQlXUGgmN1EFcOkd57Q9h8AgABZUHA=
Date: Fri, 18 Dec 2015 22:36:50 +0000
Message-ID: <BLUPR03MB1411A316AD75000948872FC9E8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
In-Reply-To: <CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Tom.Hochstein@freescale.com; 
x-originating-ip: [192.88.168.50]
x-microsoft-exchange-diagnostics: 1; BN1PR0301MB0721;
	5:Y4NIxGLlze6vKCLzAo/kge9y1NgzAXFlqHjtyNDhNG6X28g7hyiqpQeL1ajG/pdGmdnRWC2PTtugMEg3qwyPD3393DyIZOXgLtTjDlRJ/a4GGb5v5VsWXkXalLpiMBcFg1mkZMWgOj8RbyyeHyNHDQ==;
	24:paNEd6fhYK+mpz2p39V6RE/3bcCyuWO5d3OfMVS6fQ3FSzMc6BwZSgiaE2LszxuHDNAFnYeypwEtVdQn6enP4vYDpKNZcy5Ppgq+WBVaT1Y=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR0301MB0721;
x-microsoft-antispam-prvs: <BN1PR0301MB0721C105E320F300992D405EE8E10@BN1PR0301MB0721.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(101931422205132);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BN1PR0301MB0721; BCL:0; PCL:0; RULEID:;
	SRVR:BN1PR0301MB0721; 
x-forefront-prvs: 07943272E1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(199003)(13464003)(189002)(24454002)(40100003)(5003600100002)(86362001)(54356999)(76176999)(50986999)(15975445007)(77096005)(122556002)(87936001)(4001450100002)(81156007)(2950100001)(10400500002)(92566002)(5002640100001)(2900100001)(189998001)(33656002)(5001960100002)(5001770100001)(97736004)(5008740100001)(76576001)(101416001)(5004730100002)(105586002)(1096002)(106116001)(1220700001)(66066001)(19580395003)(106356001)(102836003)(99286002)(19580405001)(6116002)(3846002)(16601075003)(586003)(74316001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0721;
	H:BLUPR03MB1411.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2015 22:36:50.3124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0301MB0721
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 18 Dec 2015 22:36:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLA0KDQpEb2VzIHRoZSBleGlzdGVuY2Ugb2YgL3Vzci9saWIvd2VzdG9uL3h3YXls
YW5kLnNvIGdpdmUgdXMgd2hhdCB3ZSB3YW50Pw0KDQogICAgICAgIGlmIFsgLWYgL3Vzci9saWIv
d2VzdG9uL3h3YXlsYW5kLnNvIF07IHRoZW4NCiAgICAgICAgICAgIG1rZGlyIC1wIC90bXAvLlgx
MS11bml4DQogICAgICAgICAgICBPUFRBUkdTPSItLW1vZHVsZXM9eHdheWxhbmQuc28gJE9QVEFS
R1MiDQogICAgICAgIGZpDQogICAgICAgIG9wZW52dCAkT1BFTlZUX0FSR1MgLS0gc2ggLWMgIndl
c3Rvbi1sYXVuY2ggLS0gJE9QVEFSR1MgPiAvdmFyL2xvZy93ZXN0b24ubG9nIDI+JjEiDQoNClRv
bQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogT3RhdmlvIFNhbHZhZG9yIFtt
YWlsdG86b3RhdmlvLnNhbHZhZG9yQG9zc3lzdGVtcy5jb20uYnJdIA0KU2VudDogRnJpZGF5LCBE
ZWNlbWJlciAxOCwgMjAxNSAxMDo1MCBBTQ0KVG86IEhvY2hzdGVpbiBUb20tUjYwODc0IDxUb20u
SG9jaHN0ZWluQGZyZWVzY2FsZS5jb20+DQpDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJv
dXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFs8T0UtY29yZV1bUEFUQ0ggdjIgMS80XSB3
ZXN0b24taW5pdDogSGFuZGxlIFdlc3RvbiBzdGFydHVwIGNvcnJlY3RseS4NCg0KSGVsbG8gVG9t
LA0KDQpPbiBUaHUsIERlYyAxNywgMjAxNSBhdCA4OjA0IFBNLCBUb20gSG9jaHN0ZWluIDx0b20u
aG9jaHN0ZWluQGZyZWVzY2FsZS5jb20+IHdyb3RlOg0KPiBXZXN0b24gaXMgc3RhcnRlZCBpbiBk
aWZmZXJlbnQgd2F5cyBkZXBlbmRpbmcgb24gdGhlIGltYWdlIA0KPiBjb25maWd1cmF0aW9uIGFu
ZCB0aGUgcnVudGltZSBzY2VuYXJpby4gUmVmZXIgdG8gdGhlIHdlc3RvbiBtYW4gcGFnZSANCj4g
Zm9yIG1vcmUgaW5mb3JtYXRpb24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRvbSBIb2Noc3RlaW4g
PHRvbS5ob2Noc3RlaW5AZnJlZXNjYWxlLmNvbT4NCg0KSSB0aGluayB3ZSBhcmUgcXVpdGUgY2xv
c2UgdG8gc29tZXRoaW5nIHdoaWNoIHdvcmtzIGZvciBhbGwgc3VwcG9ydGVkIHVzZS1jYXNlcy4g
TW9yZSBiZWxvdy4uLg0KDQouLi4NCj4gQEAgLTEzLDYgKzE0LDE4IEBAIGRvX2luc3RhbGwoKSB7
DQo+DQo+ICAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXN0ZW1kX3N5c3RlbV91bml0ZGlyfQ0K
PiAgICAgICAgIGluc3RhbGwgLW0wNjQ0ICR7V09SS0RJUn0vd2VzdG9uLnNlcnZpY2UgDQo+ICR7
RH0ke3N5c3RlbWRfc3lzdGVtX3VuaXRkaXJ9DQo+ICsNCj4gKyAgICAgICBpbnN0YWxsIC1kICR7
RH0vJHtiaW5kaXJ9DQo+ICsgICAgICAgaW5zdGFsbCAtbTc1NSAke1dPUktESVJ9L3dlc3Rvbi1z
dGFydCAke0R9LyR7YmluZGlyfQ0KPiArICAgICAgIGlmIFsgIiR7QGJiLnV0aWxzLmNvbnRhaW5z
KCdESVNUUk9fRkVBVFVSRVMnLCAneDExIHdheWxhbmQnLCAneHdheWxhbmQnLCAnJywgZCl9IiA9
ICJ4d2F5bGFuZCIgXTsgdGhlbg0KPiArICAgICAgICAgICAgICAgd2VzdG9uX2xhdW5jaF9zZXR1
cD0ibWtkaXIgLXAgL3RtcC8uWDExLXVuaXgiDQo+ICsgICAgICAgICAgICAgICB3ZXN0b25fbGF1
bmNoX2FyZ3M9Ii0tbW9kdWxlcz14d2F5bGFuZC5zbyINCj4gKyAgICAgICBlbHNlDQo+ICsgICAg
ICAgICAgICAgICB3ZXN0b25fbGF1bmNoX3NldHVwPSIiDQo+ICsgICAgICAgICAgICAgICB3ZXN0
b25fbGF1bmNoX2FyZ3M9IiINCj4gKyAgICAgICBmaQ0KPiArICAgICAgIHNlZCAtaSAicyNXRVNU
T05fTEFVTkNIX1NFVFVQIyR7d2VzdG9uX2xhdW5jaF9zZXR1cH0jIiAke0R9LyR7YmluZGlyfS93
ZXN0b24tc3RhcnQNCj4gKyAgICAgICBzZWQgLWkgInMjV0VTVE9OX0xBVU5DSF9BUkdTIyR7d2Vz
dG9uX2xhdW5jaF9hcmdzfSMiIA0KPiArICR7RH0vJHtiaW5kaXJ9L3dlc3Rvbi1zdGFydA0KDQpX
ZSBjYW4gZG8gaXQgYXQgcnVudGltZSBhbmQgYXZvaWQgdXNpbmcgdGhpcyBoYXJkY29kZWQgb3B0
aW9ucz8NCg0KT25lIHBvc3NpYmlsaXR5IGlzIHRvIGNoZWNrIGlmIFhXYXlsYW5kIGlzIGF2YWls
YWJsZS4gSWYgaXQgaXMsIGl0IGNhbiBlbmFibGUgdGhvc2Ugb3B0aW9ucy4NCg0KLS0gDQpPdGF2
aW8gU2FsdmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE8uUy4gU3lzdGVtcw0KaHR0
cDovL3d3dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8vY29kZS5vc3N5c3RlbXMuY29t
LmJyDQpNb2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0
NykgOTAzLTk3NTANCg==

