Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 4719 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Oct 2014 15:55:48 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0143.outbound.protection.outlook.com [157.56.110.143])
	by mail.openembedded.org (Postfix) with ESMTP id 35CB560DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 15:55:48 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB040.namprd05.prod.outlook.com (10.255.210.156) with Microsoft
	SMTP Server (TLS) id 15.0.1049.19; Wed, 15 Oct 2014 14:22:12 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.242]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.242]) with mapi id
	15.00.1049.012; Wed, 15 Oct 2014 14:22:12 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Burton, Ross" <ross.burton@intel.com>, Sona Sarmadi
	<sona.sarmadi@enea.com>
Thread-Topic: [OE-core] Truly scary SSL 3.0 vuln to be revealed soon:
Thread-Index: Ac/oO1a66AZx1WfuSiqPuqDXwzOnfwAJHviAAATKbpA=
Date: Wed, 15 Oct 2014 14:22:11 +0000
Message-ID: <93f9b7532eb648119a368bf707bd2f6b@BLUPR05MB037.namprd05.prod.outlook.com>
References: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>
	<CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>
In-Reply-To: <CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 008BF8F1008498008BFA3E
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB040;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0365C0E14B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(51704005)(377454003)(13464003)(24454002)(199003)(108616004)(85306004)(33646002)(85852003)(40100003)(15202345003)(101416001)(4396001)(2656002)(87936001)(122556002)(97736003)(120916001)(77096002)(50986999)(76176999)(107046002)(54356999)(76576001)(76482002)(95666004)(99286002)(105586002)(106356001)(20776003)(19580405001)(66066001)(19580395003)(64706001)(92566001)(86362001)(15975445006)(46102003)(80022003)(74316001)(21056001)(31966008)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB040;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Truly scary SSL 3.0 vuln to be revealed soon:
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
X-List-Received-Date: Wed, 15 Oct 2014 15:55:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Um9zcywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRk
ZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1i
ZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZg0KPiBP
ZiBCdXJ0b24sIFJvc3MNCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE1LCAyMDE0IDY6MDcg
QU0NCj4gVG86IFNvbmEgU2FybWFkaQ0KPiBDYzogeW9jdG9AeW9jdG9wcm9qZWN0Lm9yZzsgb3Bl
bmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBUcnVseSBzY2FyeSBTU0wgMy4wIHZ1bG4gdG8gYmUgcmV2ZWFsZWQgc29vbjoN
Cj4gDQo+IE9uIDE1IE9jdG9iZXIgMjAxNCAwNzo0OCwgU29uYSBTYXJtYWRpIDxzb25hLnNhcm1h
ZGlAZW5lYS5jb20+IHdyb3RlOg0KPiA+IFRoZSBhZHZpY2UgaXM6IERpc2FibGUgU1NMdjMuDQo+
ID4NCj4gPiBJIGNyZWF0ZWQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3df
YnVnLmNnaT9pZD02ODQzICBzbyB3ZQ0KPiBjYW4gc3RhcnQgdG8gd29yayB3aXRoIHRoaXMgaW1t
ZWRpYXRlbHkuDQo+IA0KPiBQcmVzdW1hYmx5IHRoZSBsaXN0IG9mIGFmZmVjdGVkIHBhY2thZ2Vz
IGlzOg0KPiAtIGdudXRscw0KPiAtIG9wZW5zc2wNCj4gLSBuc3MNCj4gDQo+IEFyZSB0aGVyZSBt
b3JlPyAgV2lsbCBFTkVBIGJlIGFibGUgdG8gc2VuZCBwYXRjaGVzIHRvIHRoZXNlIHBhY2thZ2Vz
Pw0KPg0KDQpJIGRpZCBhIGZldyBxdWljayBzZWFyY2hlcyBvZiByZWNpcGUgbmFtZXMgYW5kIGRl
c2NyaXB0aW9ucyBvbiB0aGUgbWV0YS1vcGVuZW1iZWRkZWQgYW5kIHBva3kgKHdoaWNoIGluY2x1
ZGVzIG9lLWNvcmUpIGxheWVycyBmb3IgU1NMIGFuZCBUTFMgcmVsYXRpb24uICBUaGUgc2VhcmNo
ZXMgSSB1c2VkIGZyb20gdGhlIHBva3kgZGlyZWN0b3J5IHdlcmU6DQoNCmZpbmQgbWV0YSogLW5h
bWUgIipzc2wqLmJiIg0KZmluZCBtZXRhKiAtbmFtZSAiKnRscyouYmIiDQpncmVwIC1uckUgJyhz
c2x8U1NMfHRsc3xUTFMpJyBtZXRhKiB8IGdyZXAgLXZFICcoRFNTU0x8ZHNzc2x8W0xsXW9zc2xl
c3MpJyB8IGdyZXAgJ1wuYmI6Jw0KDQpUaGVuIGlnbm9yaW5nIHBhY2thZ2VzIHRoYXQgZXhwcmVz
c2x5IGRpc2FibGUgU1NMLCBoZXJlJ3Mgd2hhdCBJIGZvdW5kIGZvciBvdGhlciBwYWNrYWdlcyB0
byBldmFsdWF0ZToNCnB5dGhvbi1weW9wZW5zc2wNCnNvY2F0DQpjdXJsDQpsaWJzb3VwDQpwYWNr
YWdlZ3JvdXAtdG9vbHNldC1uYXRpdmUNCnBhY2thZ2Vncm91cC1jb3JlLWJhc2ljDQpwYWNrYWdl
Z3JvdXAtY29yZS1sc2INCmx0cA0KbWFpbHgNCmxpYmFyY2hpdmUNCmlwdXRpbHMNCm1zbXRwDQp3
ZWJraXQtZ3RrDQpwYWNrYWdlZ3JvdXAtc2VsZi1ob3N0ZWQNCmVnbGliYw0KZ2xpYi1uZXR3b3Jr
aW5nDQp4MTF2bmMNCmJpbmQNCnRlbGVwYXRoeS1pZGxlDQpvcGVuc3NoDQp2YWxncmluZA0KdGNm
LWFnZW50DQpweXRob24tbmF0aXZlDQpweXRob24NCnJwbQ0KbmVvbg0Kbm9zdHJvbW8NCmNoZXJv
a2VlDQphcGFjaGUyDQphamVudGkNCm5ldC1zbm1wDQpjbGF3cy1tYWlsDQpzeWxwaGVlZA0KbGli
aW1vYmlsZWRldmljZQ0KbG91ZG1vdXRoDQpob3N0YXAtZGFlbW9uDQpnYXRlb25lDQpsaWJ0b3Jy
ZW50DQprcmI1DQpuZXR3b3JrbWFuYWdlcg0Kbm9kZWpzNA0Kbm9kZWpzDQpsaWJjLWNsaWVudA0K
cHl0aG9uLXR3aXN0ZWQNCnB5dGhvbi1tMmNyeXB0bw0KbGlua3MNCmxpbmtzLXgxMQ0Kb3Blbmxk
YXANCmdzb2FwDQptYnVmZmVyDQpjcnlwdHNldHVwDQppa3NlbWVsDQpzdHJvbmdzd2FuDQpjYS1j
ZXJ0aWZpY2F0ZXMNCmxpYmV0cGFuDQpjeXJ1cy1zYXNsDQp2c2Z0cGQNCmFjY2VsLXBwcA0Kb3Bl
bnZwbg0Kem5jDQphenkNCm1pZG9yaQ0Kb3NjYW0NCnR2aGVhZGVuZA0KDQpBbG1vc3QgYWxsIHRo
ZSBwYWNrYWdlcyByZXF1aXJlIG9wZW5zc2wgb3IgZ251dGxzLCBzbyBwYXRjaGluZyBvcGVuc3Ns
IGFuZCBnbnV0bHMgbWF5IGJlIHN1ZmZpY2llbnQgZm9yIG1vc3Qgb2YgdGhlc2UgcGFja2FnZXMu
ICBJJ20gc3RpbGwgd29ya2luZyB3aXRoIHRoZSBkeWxhbiBicmFuY2guIElmIGFueSBuZXcgcGFj
a2FnZXMgaGF2ZSBiZWVuIGFkZGVkIHNpbmNlIHRoZW4gSSBtYXkgaGF2ZSBtaXNzZWQgdGhlbS4g
IEknbSBub3Qgc3VyZSBob3cgZHJvcGJlYXIgZG9lcyBpdHMgZW5jcnlwdGlvbiwgc28gdGhhdCBt
YXkgYmUgb25lIHRvIGxvb2sgYXQgYWxzby4NCg0KUmVnYXJkcywNCkJyeWFuIEV2ZW5zb24NCg0K
PiBSb3NzDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

