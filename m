Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 7717 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Jan 2017 18:40:58 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0138.outbound.protection.outlook.com [104.47.1.138])
	by mail.openembedded.org (Postfix) with ESMTP id BCBB6605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 18:40:58 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0118.GBRP123.PROD.OUTLOOK.COM (10.166.249.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Tue, 24 Jan 2017 18:08:19 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.021; Tue, 24 Jan 2017 18:08:19 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: configure error for glibc 2.25.2
Thread-Index: AdJ2St/27Lo07BMlSGusqMFehWa5EgADqQ+wAAKLfYAAADaKIAABcYyAAABsx/A=
Date: Tue, 24 Jan 2017 18:08:18 +0000
Message-ID: <LOXP123MB011715CA6AFD7F2EA6C0964B85750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485277371.30673.59.camel@linuxfoundation.org>
	<LOXP123MB01174F8944CFABF7E023B92585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485280217.30673.61.camel@linuxfoundation.org>
In-Reply-To: <1485280217.30673.61.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: 9f32c561-d4d4-4951-b08c-08d44483f9eb
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0118;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0118;
	7:WX8c75kxoSCl5wiiytpz4Gud61YzVFsdJRMOKWsNPBSiNdz2b4iQn/+JmPbzkq6zRFGGaCSWh0YkFrYzy1Vv+VFLxsJpzB6hcqdROp48vsUp+WMxHNHhmlMiqZtbEwMF7ux06hnGtDKXPVMlgxuQKqmqSub5mp2mYpOi4kO2ksWXDRk7Sc7IU7E8TefAkCEZwtHqfHfPPOB9B8QIGw5PHdPQAXJO8iFBy8XiFEJFwhaiC2PLkszlh6ps1WElnBM+A+ekFaKfyk1hIxwHQfqozpXOkBK0h56ECp8dQhQTZN96FXAy0Vl6nf3dwZF5k3TXf2VQFlf3BzlgtZ4RgBK0lVkBfVQeKyMhAc7OKF68EZ0YAEv22OKEqsYOZyXXpZ0vzCmEU2eHh7S/9BJeuMY9/IgWqIUlEsACWAbqI2SkFldP/aW6cMOj51Ot3wPrIt6340mhgvTKEXTg2RfuxUxkMw==
x-microsoft-antispam-prvs: <LOXP123MB0118064080ADB68D7D5CE13E85750@LOXP123MB0118.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(2016111802025)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(6072148)(6043046);
	SRVR:LOXP123MB0118; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0118; 
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39830400002)(39450400003)(39410400002)(189002)(24454002)(199003)(377424004)(7736002)(2900100001)(106356001)(101416001)(5660300001)(305945005)(92566002)(105586002)(189998001)(86362001)(7696004)(54356999)(2501003)(2950100002)(74316002)(97736004)(93886004)(76176999)(107886002)(66066001)(68736007)(5001770100001)(50986999)(38730400001)(3846002)(229853002)(122556002)(6116002)(33656002)(6436002)(3660700001)(102836003)(2906002)(3280700002)(77096006)(6506006)(81166006)(6306002)(53936002)(81156014)(8936002)(55016002)(8676002)(9686003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0118;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2017 18:08:18.9739 (UTC)
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
X-List-Received-Date: Tue, 24 Jan 2017 18:41:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmddDQo+IE9uIFR1ZSwgMjAxNy0wMS0yNCBhdCAxNzoxNCArMDAwMCwgQW5kcmV3IEdv
b2Rib2R5IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86
cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10NCj4gPiA+IE9uIFR1ZSwgMjAxNy0w
MS0yNCBhdCAxNTo1OSArMDAwMCwgQW5kcmV3IEdvb2Rib2R5IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBGdXJ0aGVyIHRvIHRoaXMgSSBzZWUgdGhlIGZvbGxvd2luZyBtZXNzYWdlIGluDQo+ID4g
PiA+IGxvZy5kb19wcmVwYXJlX3JlY2lwZV9zeXNyb290LjIwNTExDQo+ID4gPiA+DQo+ID4gPiA+
IFdBUk5JTkc6IE1hbmlmZXN0IC9ob21lL2FuZHJldy9zcmMvY2Ftb2wzL2NhbW9sL2J1aWxkL3Rt
cC0NCj4gY2Ftb2wtDQo+ID4gPiA+IGdsaWJjL3NzdGF0ZS1jb250cm9sL21hbmlmZXN0LWFsbGFy
Y2gtbGludXgtbGliYy0NCj4gPiA+ID4gaGVhZGVycy5wb3B1bGF0ZV9zeXNyb290IG5vdCBmb3Vu
ZD8NCj4gPiA+ID4NCj4gPiA+ID4gV2hpY2ggaXMgcXVpdGUgY29ycmVjdCBhcyB0aGF0IGZpbGUg
ZG9lcyBub3QgZXhpc3QsIGhvd2V2ZXIgdGhlDQo+ID4gPiA+IGZvbGxvd2luZyBmaWxlIGRvZXMg
ZXhpc3QNCj4gPiA+ID4NCj4gPiA+ID4gL2hvbWUvYW5kcmV3L3NyYy9jYW1vbDMvY2Ftb2wvYnVp
bGQvdG1wLWNhbW9sLWdsaWJjL3NzdGF0ZS0NCj4gPiA+ID4gY29udHJvbC9tYW5pZmVzdC1hcm12
N2F0MmhmLW5lb24tbGludXgtbGliYy0NCj4gPiA+ID4gaGVhZGVycy5wb3B1bGF0ZV9zeXNyb290
DQo+ID4gPiA+DQo+ID4gPiA+IFNvIGl0IGxvb2tzIGxpa2UgbGludXgtbGliYy1oZWFkZXJzIGlz
IG5vdCBiZWluZyBpbnN0YWxsZWQgaW4gdGhlDQo+ID4gPiA+IHJlY2lwZSBzeXNyb290IGJlY2F1
c2UgaXQgaXMgbG9va2luZyBmb3IgdGhlIG1hbmlmZXN0IHdpdGggdGhlDQo+ID4gPiA+IHdyb25n
DQo+ID4gPiA+IGFyY2guDQo+ID4gPiA+DQo+ID4gPiA+IEFueW9uZSBrbm93IHdoYXQgY291bGQg
YmUgZ29pbmcgd3JvbmcgaGVyZT8NCj4gPiA+IFNob3J0IGFuc3dlciBpcyB5ZXMuDQo+ID4gPg0K
PiA+ID4gWW91ciBjb25maWd1cmF0aW9uIGlzIG1peGluZyBkaWZmZXJlbnQgdHVuZS9wYWNrYWdl
IGFyY2hpdGVjdHVyZXMNCj4gPiA+IGFuZA0KPiA+ID4gaXMgY29uZnVzaW5nIHJlY2lwZSBzcGVj
aWZpYyBzeXNyb290cyAoYXJtdjdhaGYtbmVvbiAhPcKgYXJtdjdhdDJoZi0NCj4gPiA+IG5lb24p
LCBsb29rcyBsaWtlIHRodW1iIGFuZCBub24tdGh1bWIuDQo+ID4gWWVzIHRoYXQgc291bmRzIGFi
b3V0IHJpZ2h0LiBUaGlzIGJ1aWxkIHN0YXJ0ZWQgb2ZmIGFzIGEgQmVhZ2xlQm9uZQ0KPiA+IEJs
YWNrIGNsb25lIHNvbWUgeWVhcnMgYWdvLiBUaGUgZGlmZmVyaW5nIHR1bmUgYXJjaGl0ZWN0dXJl
cyBJIHRoaW5rDQo+ID4gYXBwZWFyZWQgd2hlbiBJIG1vdmVkIGZyb20gc29mdC1mbG9hdCB0byBo
YXJkLWZsb2F0LiBJIGd1ZXNzIEkgc2hvdWxkDQo+ID4gaGF2ZSBsb29rZWQgaW50byB3aGF0IHdh
cyBjYXVzaW5nIHRoYXQgYXQgdGhlIHRpbWUuIEV2ZXJ5dGhpbmcgc2VlbWVkDQo+ID4gdG8gd29y
ayBPSywgc28gSSBkaWQgbm90IHdvcnJ5Lg0KPiA+DQo+ID4gPg0KPiA+ID4gSSBiZWxpZXZlIEkg
aGF2ZSBhIHBhdGNoIHdoaWNoIEknbGwgc2VuZCBzaG9ydGx5IGFzIEkndmUgYmVlbg0KPiA+ID4g
Y2hhc2luZw0KPiA+ID4gdGhpcyBpbiBvdGhlciBjaXJjdW1zdGFuY2VzLg0KPiA+IFRoYXQgd291
bGQgYmUgYXdlc29tZSwgdGhhbmtzLg0KPiANCj4gSSdtIHJ1bm5pbmcgb3V0IG9mIHRpbWUgdG8g
d3JpdGUgdGhpcyB1cCBhbmQgcG9zdCBwcm9wZXJseSBidXQgdGhlDQo+IHBhdGNoIEkgdGhpbmsg
c2hvdWxkIHdvcmsgaXMgdGhpczoNCj4gDQo+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9j
Z2l0LmNnaS9wb2t5LWNvbnRyaWIvY29tbWl0Lz9oPXJwdXJkaWUvd2lwLQ0KPiByc3MmaWQ9NDE0
YTc1NTIxZjVkNWRmYjUwMzg1YWJhYjA1MmY4N2RiYzg4ZjFjMQ0KPiANCj4gKCJzdGFnaW5nOiBS
ZW1vdmUgaGFyZGNvZGVkIFBBQ0tBR0VfQVJDSFMgZnJvbSB0aGUgY2xhc3MiIGluIGNhc2UgSQ0K
PiByZWJhc2UgaXQpDQo+IA0KPiBJIHdpbGwgZ2V0IHRoaXMgY2xlYW5lZCB1cCBhbmQgc2VudCBz
b29uLg0KDQpUaGFua3MgYnV0IHVuZm9ydHVuYXRlbHkgdGhhdCBkaWQgbm90IHdvcmsgZm9yIG1l
Lg0KDQpJIGRpZCBhIGNsZWFuYWxsIG9uIGdsaWJjIGJlZm9yZSB0cnlpbmcgdG8gYnVpbGQgaXQs
IGJ1dCB0aGUgcmVzdWx0IHdhcyB0aGUgc2FtZS4NCg0KQW5kcmV3DQo=

