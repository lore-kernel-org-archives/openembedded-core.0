Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0143.outbound.protection.outlook.com [65.55.169.143])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC9560034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 07:34:16 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB442.namprd03.prod.outlook.com (10.141.141.145) with Microsoft
	SMTP Server (TLS) id 15.1.125.14; Tue, 24 Mar 2015 07:34:16 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0125.002; Tue, 24 Mar 2015 07:34:16 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v4] u-boot.inc: fix rename image error
Thread-Index: AQHQZdm/G3IT2Dz9bU+upDVCfyd1aJ0rEVjQ
Date: Tue, 24 Mar 2015 07:34:15 +0000
Message-ID: <BY2PR03MB441043B1B2A76B4CA483B3B840A0@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1426066820-19627-1-git-send-email-B40290@freescale.com>
	<CAP9ODKp=O30ACKGr8niGVg-ER6VxLwc32b5q6X5pa7eqP0F7iw@mail.gmail.com>
In-Reply-To: <CAP9ODKp=O30ACKGr8niGVg-ER6VxLwc32b5q6X5pa7eqP0F7iw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.158.241.86]
authentication-results: ossystems.com.br; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB442;
x-microsoft-antispam-prvs: <BY2PR03MB442F0A1B8A2D77E5CCCACAB840A0@BY2PR03MB442.namprd03.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(377454003)(24454002)(51704005)(40100003)(33656002)(86362001)(46102003)(99286002)(122556002)(110136001)(76576001)(66066001)(74316001)(77156002)(2950100001)(2900100001)(2656002)(50986999)(76176999)(15975445007)(102836002)(77096005)(106116001)(92566002)(87936001)(62966003)(54356999)(16601075003)(19580395003)(19580405001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB442;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BY2PR03MB442; BCL:0;
	PCL:0; RULEID:; SRVR:BY2PR03MB442; 
x-forefront-prvs: 0525BB0ADF
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2015 07:34:15.3424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB442
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] u-boot.inc: fix rename image error
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
X-List-Received-Date: Tue, 24 Mar 2015 07:34:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gT3RhdmlvLA0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLg0KDQpCdXQgSSBkbyBu
b3QgdW5kZXJzdGFuZCB3aGF0ICJvbGQgb25lIiBpcy4NCg0KVGhhbmtzDQpDaHVucm9uZw0KDQoN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG90YXZpby5zYWx2YWRvckBnbWFp
bC5jb20gW21haWx0bzpvdGF2aW8uc2FsdmFkb3JAZ21haWwuY29tXSBPbiBCZWhhbGYgT2YgT3Rh
dmlvIFNhbHZhZG9yDQpTZW50OiBUdWVzZGF5LCBNYXJjaCAyNCwgMjAxNSAxMDoyNSBBTQ0KVG86
IEd1byBDaHVucm9uZy1CNDAyOTANCkNjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0
aGUgb2UtY29yZSBsYXllcjsgQnVydG9uLCBSb3NzDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCB2NF0gdS1ib290LmluYzogZml4IHJlbmFtZSBpbWFnZSBlcnJvcg0KDQpIZWxsbyBDaHVu
cm9uZywNCg0KT24gV2VkLCBNYXIgMTEsIDIwMTUgYXQgNjo0MCBBTSwgQ2h1bnJvbmcgR3VvIDxC
NDAyOTBAZnJlZXNjYWxlLmNvbT4gd3JvdGU6DQo+ICAgUmVzb2x2ZSBtaXNtYXRjaCBiZXR3ZWVu
IFUtQm9vdCBjb25maWdzIGFuZCB1Ym9vdCBpbWFnZSBuYW1lLg0KPiAgIFRoZSAke1N9LyR7Y29u
ZmlnfS91LWJvb3QtJHt0eXBlfS4ke1VCT09UX1NVRkZJWH0gbWF5IGFsd2F5IGJlIGZhbHNlDQo+
ICAgYW5kIHJlcGVhdCBjb21waWxlIG9yIGluc3RhbGwgc28gd2UgbmVlZCB0byBjaGVjayBpZiAk
e3R5cGV9IG1hdGNoICR7Y29uZmlnfSAuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENodW5yb25nIEd1
byA8QjQwMjkwQGZyZWVzY2FsZS5jb20+DQoNCkZpcnN0IEknZCBsaWtlIHRvIGFwb2xvZ2l6ZSBm
b3IgdGhlIGRlbGF5IGluIHRlc3RpbmcgaXQuIFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZS4gSSBn
b3Qgc29tZSBmcmVlIHRpbWUgKHdhaXRpbmcgYmV0d2VlbiBidWlsZHMpIGFuZCBkZWNpZGVkIHRv
IGNoZWNrIHRoaXMgLi4uDQoNClNvIGJ1aWxkIGlzIHdvcmtpbmcgZmluZSAuLiBob3dldmVyIHdl
IG1pc3NlZCB0aGUgdmVyc2lvbiBpbiB0aGUgZmlsZS4NClRoaXMgaXMgdW5mb3J0dW5hdGUgYmVj
YXVzZSBpZiB5b3UgZW5kIGJ1aWxkaW5nIHR3byB2ZXJzaW9ucyBpbiBhIHJvbGwgaW4gc2FtZSBk
ZXBsb3kgZGlyZWN0b3J5IHlvdSBjYW5ub3QgcmVmZXIgdGhlIG9sZCBvbmUsIGZvciBleGFtcGxl
Og0KDQpbSSBkbyBub3QgdW5kZXJzdGFuZCB3aGF0ICJvbGQgb25lIiBpcyBdIA0KDQoNCm90YXZp
b0BjZW50cml1bSB+L3NyYy9vc3N5c3RlbXMveW9jdG8vYnVpbGQgJSBscw0KdG1wL2RlcGxveS9p
bWFnZXMvaW14NnFzYWJyZXNkL3UtYm9vdCogLWwNCmxyd3hyd3hyd3ggMSBvdGF2aW8gb3Rhdmlv
ICAgICAxOCBNYXIgMjMgMjM6MTcNCnRtcC9kZXBsb3kvaW1hZ2VzL2lteDZxc2FicmVzZC91LWJv
b3QuaW14IC0+IHUtYm9vdC1tZmd0b29sLmlteCoNCmxyd3hyd3hyd3ggMSBvdGF2aW8gb3Rhdmlv
ICAgICAxOCBNYXIgMjMgMjM6MTcNCnRtcC9kZXBsb3kvaW1hZ2VzL2lteDZxc2FicmVzZC91LWJv
b3QtaW14NnFzYWJyZXNkLmlteCAtPg0KdS1ib290LW1mZ3Rvb2wuaW14Kg0KLXJ3eHIteHIteCAy
IG90YXZpbyBvdGF2aW8gMzc5OTA0IE1hciAyMyAyMzoxNw0KdG1wL2RlcGxveS9pbWFnZXMvaW14
NnFzYWJyZXNkL3UtYm9vdC1tZmd0b29sLmlteCoNCi1yd3hyLXhyLXggMiBvdGF2aW8gb3Rhdmlv
IDM3OTkwNCBNYXIgMjMgMjM6MTcNCnRtcC9kZXBsb3kvaW1hZ2VzL2lteDZxc2FicmVzZC91LWJv
b3Qtc2QuaW14Kg0KDQotLSANCk90YXZpbyBTYWx2YWRvciAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTy5TLiBTeXN0ZW1zDQpodHRwOi8vd3d3Lm9zc3lzdGVtcy5jb20uYnIgICAgICAgIGh0
dHA6Ly9jb2RlLm9zc3lzdGVtcy5jb20uYnINCk1vYmlsZTogKzU1ICg1MykgOTk4MS03ODU0ICAg
ICAgICAgICAgTW9iaWxlOiArMSAoMzQ3KSA5MDMtOTc1MA0K

