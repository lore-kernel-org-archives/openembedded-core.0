Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 1929 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Jan 2017 11:59:56 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0137.outbound.protection.outlook.com [104.47.2.137])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDE971E5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:59:56 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Wed, 25 Jan 2017 11:27:46 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.021; Wed, 25 Jan 2017 11:27:46 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: configure error for glibc 2.25.2
Thread-Index: AdJ2St/27Lo07BMlSGusqMFehWa5EgADqQ+wAAKLfYAAADaKIAABcYyAAABsx/AABxkNgAAaKniQAABTpYAAAeGLEAAAMrqAAADIqCA=
Date: Wed, 25 Jan 2017 11:27:46 +0000
Message-ID: <LOXP123MB0117187D38373218EA94D92185740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485277371.30673.59.camel@linuxfoundation.org>
	<LOXP123MB01174F8944CFABF7E023B92585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485280217.30673.61.camel@linuxfoundation.org>
	<LOXP123MB011715CA6AFD7F2EA6C0964B85750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485293141.30673.63.camel@linuxfoundation.org>
	<LOXP123MB0117D15626B7BF2AFE400B8A85740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485338655.30673.73.camel@linuxfoundation.org>
	<LOXP123MB011715655FD8F10E18BFAEFA85740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485342227.30673.75.camel@linuxfoundation.org>
In-Reply-To: <1485342227.30673.75.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: 405bb564-d784-467b-7252-08d445152fcd
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0117;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0117;
	7:B1izAxVeezYo+9JqjkIX/r+lUq3B/Lk75TlsyKjUQtpjIU3Zi/bvjDTQtB/rDJBDBk7I279z5+NvahHdlNVMMfztBVaWoEhXPDJIYhVBqa5ro6tahivkREqvFFsQiuYOqfdx8AzryAiWLaavt3lVme1Hl6y68IPrw5c3IOqiu+JbUSp02+df+LvG+JQMuu1psWB8L7bdAuBea8pTBmdicADBXJBeGbC22AOMk3Hu4PG2Z0RVI8ykKfAtauakR52jrfXKFmHylGw4f5dL3jmAa0tYdxrv7ZU/BgeL2xQbP1v1EDBBDCtOUW/CruKNy2xu3vV9WQELTgakcU1T3wbVyEhC/Ly7dnLFDPcBeG+091thueE9zcUgUCSw/6PDnnGo54UsOzoC0nfgEoUQDXBYea/54vfwcMa5fw9czsAAd/nxhHgX5ibDai58VArDLwISAuG8R5MTCLKF5v5MS03LHQ==
x-microsoft-antispam-prvs: <LOXP123MB01179000B318FF0C0E4F0AA385740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(2016111802025)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(6072148)(6043046);
	SRVR:LOXP123MB0117; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0117; 
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(39830400002)(39410400002)(189002)(199003)(3280700002)(106356001)(2900100001)(5660300001)(54356999)(76176999)(2950100002)(101416001)(7696004)(86362001)(50986999)(66066001)(92566002)(8676002)(81156014)(105586002)(8936002)(81166006)(33656002)(38730400001)(102836003)(2906002)(6116002)(305945005)(53936002)(93886004)(3846002)(74316002)(7736002)(122556002)(6436002)(5001770100001)(6506006)(189998001)(3660700001)(77096006)(68736007)(97736004)(107886002)(229853002)(2501003)(55016002)(9686003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0117;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2017 11:27:46.2123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0117
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
X-List-Received-Date: Wed, 25 Jan 2017 11:59:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmddDQo+IFNvcnJ5LCB5ZXMsIHlvdSdyZSB0b3RhbGx5IHJpZ2h0LiBJIGhhZG4ndCBy
ZW1lbWJlcmVkIHRoZXJlIHdlcmUgdHdvDQo+IHBsYWNlcyB3ZSB3ZXJlIG1ha2luZyB0aGlzIGFz
c3VtcHRpb24hIFRoYXQgZG9lcyBsb29rIGxpa2UgdGhlIHJpZ2h0DQo+IGZpeCBhbHRob3VnaCBJ
IG1pZ2h0IHJld29yayB0aGF0IGNvZGUgc2xpZ2h0bHkuDQoNCkZlZWwgZnJlZS4gSSdtIG9mZiB0
byBmaXggYWxsIHRoZSBvdGhlciBmYWxsb3V0IGluIG15IHJlY2lwZXMgZnJvbSByZWNpcGUgc3Bl
Y2lmaWMgc3lzcm9vdHMuDQoNCkFuZHJldw0K

