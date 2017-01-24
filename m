Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 9238 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Jan 2017 18:48:51 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0126.outbound.protection.outlook.com [104.47.1.126])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB0A731CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 18:48:51 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0118.GBRP123.PROD.OUTLOOK.COM (10.166.249.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Tue, 24 Jan 2017 17:14:28 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.021; Tue, 24 Jan 2017 17:14:27 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: configure error for glibc 2.25.2
Thread-Index: AdJ2St/27Lo07BMlSGusqMFehWa5EgADqQ+wAAKLfYAAADaKIA==
Date: Tue, 24 Jan 2017 17:14:27 +0000
Message-ID: <LOXP123MB01174F8944CFABF7E023B92585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485277371.30673.59.camel@linuxfoundation.org>
In-Reply-To: <1485277371.30673.59.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: e2492e67-7f45-440d-6036-08d4447c740a
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0118;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0118;
	7:scAy4g5L/uh4WgnabckhHq+4exUrj9bNuOveS+axkptw08EEcSzA9FbKm4lEM/Y8KmlXIsMTBo8xfOa7boofUYbqcAbknE8T3BulqHdeOWyJZTgBxGOQqONz66yn5beT05SjKYwrkLdcAyDW/fD4rPRO37uhicGhKlllsYU8RTKjnhAHz2IOzMxwtWup85MjM09wL+3lkQ4Kstlvu/QbG5FWhcrRdGr3seRg2g6CU41IcGLZc2n+GvLh3XR6ruGeQy8rac5Trze8+yiiP9TRQtLFsdf6qNHz3gVffjENtPf69d1HaX+N+4UvQOfDetdwOtXzIcp/5Nh+RRynb9rr+9QgVPMOEalEFW/pPGlmuP7guIeUQYd+Y/hdWpapvhKeseOUVtnkz6IikXFmXDG3kRALXD7P0buuPPUoTjwExRveR46o3A+lHFs4Jrr5BrXl4B8wq6q0wqYYlUkh13e9bg==
x-microsoft-antispam-prvs: <LOXP123MB01183F402DA7014CFA6975FB85750@LOXP123MB0118.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(2016111802025)(6072148)(6043046);
	SRVR:LOXP123MB0118; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0118; 
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(39830400002)(39410400002)(189002)(24454002)(199003)(377424004)(7736002)(2900100001)(101416001)(106356001)(5660300001)(305945005)(92566002)(105586002)(189998001)(86362001)(7696004)(54356999)(2950100002)(2501003)(74316002)(97736004)(76176999)(107886002)(66066001)(68736007)(5001770100001)(50986999)(3846002)(229853002)(122556002)(38730400001)(6116002)(33656002)(6436002)(3660700001)(102836003)(2906002)(3280700002)(77096006)(6506006)(81166006)(53936002)(81156014)(55016002)(8936002)(8676002)(9686003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0118;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2017 17:14:27.8161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0118
Subject: Re: configure error for glibc 2.25.2
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
X-List-Received-Date: Tue, 24 Jan 2017 18:48:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmddDQo+IE9uIFR1ZSwgMjAxNy0wMS0yNCBhdCAxNTo1OSArMDAwMCwgQW5kcmV3IEdv
b2Rib2R5IHdyb3RlOg0KPiA+IEZ1cnRoZXIgdG8gdGhpcyBJIHNlZSB0aGUgZm9sbG93aW5nIG1l
c3NhZ2UgaW4NCj4gPiBsb2cuZG9fcHJlcGFyZV9yZWNpcGVfc3lzcm9vdC4yMDUxMQ0KPiA+DQo+
ID4gV0FSTklORzogTWFuaWZlc3QgL2hvbWUvYW5kcmV3L3NyYy9jYW1vbDMvY2Ftb2wvYnVpbGQv
dG1wLWNhbW9sLQ0KPiA+IGdsaWJjL3NzdGF0ZS1jb250cm9sL21hbmlmZXN0LWFsbGFyY2gtbGlu
dXgtbGliYy0NCj4gPiBoZWFkZXJzLnBvcHVsYXRlX3N5c3Jvb3Qgbm90IGZvdW5kPw0KPiA+DQo+
ID4gV2hpY2ggaXMgcXVpdGUgY29ycmVjdCBhcyB0aGF0IGZpbGUgZG9lcyBub3QgZXhpc3QsIGhv
d2V2ZXIgdGhlDQo+ID4gZm9sbG93aW5nIGZpbGUgZG9lcyBleGlzdA0KPiA+DQo+ID4gL2hvbWUv
YW5kcmV3L3NyYy9jYW1vbDMvY2Ftb2wvYnVpbGQvdG1wLWNhbW9sLWdsaWJjL3NzdGF0ZS0NCj4g
PiBjb250cm9sL21hbmlmZXN0LWFybXY3YXQyaGYtbmVvbi1saW51eC1saWJjLWhlYWRlcnMucG9w
dWxhdGVfc3lzcm9vdA0KPiA+DQo+ID4gU28gaXQgbG9va3MgbGlrZSBsaW51eC1saWJjLWhlYWRl
cnMgaXMgbm90IGJlaW5nIGluc3RhbGxlZCBpbiB0aGUNCj4gPiByZWNpcGUgc3lzcm9vdCBiZWNh
dXNlIGl0IGlzIGxvb2tpbmcgZm9yIHRoZSBtYW5pZmVzdCB3aXRoIHRoZSB3cm9uZw0KPiA+IGFy
Y2guDQo+ID4NCj4gPiBBbnlvbmUga25vdyB3aGF0IGNvdWxkIGJlIGdvaW5nIHdyb25nIGhlcmU/
DQo+IA0KPiBTaG9ydCBhbnN3ZXIgaXMgeWVzLg0KPiANCj4gWW91ciBjb25maWd1cmF0aW9uIGlz
IG1peGluZyBkaWZmZXJlbnQgdHVuZS9wYWNrYWdlIGFyY2hpdGVjdHVyZXMgYW5kDQo+IGlzIGNv
bmZ1c2luZyByZWNpcGUgc3BlY2lmaWMgc3lzcm9vdHMgKGFybXY3YWhmLW5lb24gIT3CoGFybXY3
YXQyaGYtDQo+IG5lb24pLCBsb29rcyBsaWtlIHRodW1iIGFuZCBub24tdGh1bWIuDQoNClllcyB0
aGF0IHNvdW5kcyBhYm91dCByaWdodC4gVGhpcyBidWlsZCBzdGFydGVkIG9mZiBhcyBhIEJlYWds
ZUJvbmUgQmxhY2sgY2xvbmUgc29tZSB5ZWFycyBhZ28uIFRoZSBkaWZmZXJpbmcgdHVuZSBhcmNo
aXRlY3R1cmVzIEkgdGhpbmsgYXBwZWFyZWQgd2hlbiBJIG1vdmVkIGZyb20gc29mdC1mbG9hdCB0
byBoYXJkLWZsb2F0LiBJIGd1ZXNzIEkgc2hvdWxkIGhhdmUgbG9va2VkIGludG8gd2hhdCB3YXMg
Y2F1c2luZyB0aGF0IGF0IHRoZSB0aW1lLiBFdmVyeXRoaW5nIHNlZW1lZCB0byB3b3JrIE9LLCBz
byBJIGRpZCBub3Qgd29ycnkuDQoNCj4gSSBiZWxpZXZlIEkgaGF2ZSBhIHBhdGNoIHdoaWNoIEkn
bGwgc2VuZCBzaG9ydGx5IGFzIEkndmUgYmVlbiBjaGFzaW5nDQo+IHRoaXMgaW4gb3RoZXIgY2ly
Y3Vtc3RhbmNlcy4NCg0KVGhhdCB3b3VsZCBiZSBhd2Vzb21lLCB0aGFua3MuDQoNCkFuZHJldw0K
DQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg==

