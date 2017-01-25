Return-Path: <andrew.goodbody@cambrionix.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0134.outbound.protection.outlook.com [104.47.2.134])
	by mail.openembedded.org (Postfix) with ESMTP id 3429C71CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 19:30:14 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0119.GBRP123.PROD.OUTLOOK.COM (10.166.249.146) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Wed, 25 Jan 2017 09:56:23 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.021; Wed, 25 Jan 2017 09:56:23 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: configure error for glibc 2.25.2
Thread-Index: AdJ2St/27Lo07BMlSGusqMFehWa5EgADqQ+wAAKLfYAAADaKIAABcYyAAABsx/AABxkNgAAaKniQ
Date: Wed, 25 Jan 2017 09:56:23 +0000
Message-ID: <LOXP123MB0117D15626B7BF2AFE400B8A85740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485277371.30673.59.camel@linuxfoundation.org>
	<LOXP123MB01174F8944CFABF7E023B92585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485280217.30673.61.camel@linuxfoundation.org>
	<LOXP123MB011715CA6AFD7F2EA6C0964B85750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485293141.30673.63.camel@linuxfoundation.org>
In-Reply-To: <1485293141.30673.63.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: b103e550-f2ef-41f8-d2b9-08d445086bec
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0119;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0119;
	7:3St3r+PodSqSzD3KSXRdIxmSXVbdpG7mJXTnoah/m6xqfIf1ve51Xu+X9IPA/aJ7M+yV/4Yx1gpB8ZH+tAWmzTay6cOFtH8v6mN8kATUPpZzIUIOTyIhl2r1JCyjqrQ6n4sxyWTX5sQCmbo+SOsZf5bs/946idHkgr0+2NLNpdHnO6ZZy0m77Np2+cqcldUJQgX1LwyV6wXX2VejTnbN83lU25EeTmKvpWpqGa9IGBnfDZvpcQ1IUR34/GIC8/avTkqczLwxc0Yi7HFxkvXk4yEGViFaa5HxgXiobYNGM7GOLtmN8/NUOx4oU93WaEbT5bGHXxozQZr+YezATomZkwARQ+hyhnQBJuBS0fia5U3b7nc9FfTLUPtpNshEU252+dBPnUT9278qOjWFJCKQvuGYFFy1UmBij7de/nChOhcIxe7OfoVYyqskc80DDV9bm0m54DNimVcg70BnlNt+uQ==
x-microsoft-antispam-prvs: <LOXP123MB0119559B36D27F0174BBB27985740@LOXP123MB0119.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(2016111802025)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(6072148)(6043046);
	SRVR:LOXP123MB0119; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0119; 
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39830400002)(39450400003)(39410400002)(199003)(24454002)(189002)(377424004)(81166006)(3280700002)(2906002)(8676002)(305945005)(81156014)(66066001)(2950100002)(7736002)(97736004)(8936002)(5001770100001)(6116002)(68736007)(107886002)(74316002)(2900100001)(7696004)(92566002)(3660700001)(102836003)(5660300001)(3846002)(189998001)(2501003)(93886004)(86362001)(106356001)(122556002)(53936002)(6506006)(55016002)(101416001)(6306002)(76176999)(33656002)(54356999)(105586002)(229853002)(9686003)(50986999)(38730400001)(6436002)(77096006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0119;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2017 09:56:23.7659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0119
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
X-List-Received-Date: Wed, 25 Jan 2017 19:30:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmddDQo+IE9uIFR1ZSwgMjAxNy0wMS0yNCBhdCAxODowOCArMDAwMCwgQW5kcmV3IEdv
b2Rib2R5IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86
cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10NCj4gPiA+IEknbSBydW5uaW5nIG91
dCBvZiB0aW1lIHRvIHdyaXRlIHRoaXMgdXAgYW5kIHBvc3QgcHJvcGVybHkgYnV0IHRoZQ0KPiA+
ID4gcGF0Y2ggSSB0aGluayBzaG91bGQgd29yayBpcyB0aGlzOg0KPiA+ID4NCj4gPiA+IGh0dHA6
Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9wb2t5LWNvbnRyaWIvY29tbWl0Lz9oPXJw
dXJkaWUNCj4gPiA+IC93aXAtDQo+ID4gPiByc3MmaWQ9NDE0YTc1NTIxZjVkNWRmYjUwMzg1YWJh
YjA1MmY4N2RiYzg4ZjFjMQ0KPiA+ID4NCj4gPiA+ICgic3RhZ2luZzogUmVtb3ZlIGhhcmRjb2Rl
ZCBQQUNLQUdFX0FSQ0hTIGZyb20gdGhlIGNsYXNzIiBpbiBjYXNlIEkNCj4gPiA+IHJlYmFzZSBp
dCkNCj4gPiA+DQo+ID4gPiBJIHdpbGwgZ2V0IHRoaXMgY2xlYW5lZCB1cCBhbmQgc2VudCBzb29u
Lg0KPiA+IFRoYW5rcyBidXQgdW5mb3J0dW5hdGVseSB0aGF0IGRpZCBub3Qgd29yayBmb3IgbWUu
DQo+ID4NCj4gPiBJIGRpZCBhIGNsZWFuYWxsIG9uIGdsaWJjIGJlZm9yZSB0cnlpbmcgdG8gYnVp
bGQgaXQsIGJ1dCB0aGUgcmVzdWx0DQo+ID4gd2FzIHRoZSBzYW1lLg0KPiANCj4gVHJ5IGEgImJp
dGJha2UgZ2xpYmMtaW5pdGlhbCAtYyBjbGVhbiI/DQoNClNvcnJ5LCBpdCB3YXMgZ2xpYmMtaW5p
dGlhbCB0aGF0IEkgcmFuIHRoZSBjbGVhbmFsbCBvbiwgc28ganVzdCBjbGVhbiBtYWtlcyBubyBk
aWZmZXJlbmNlLg0KDQpBbmRyZXcNCg==

