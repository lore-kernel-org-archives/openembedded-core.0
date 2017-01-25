Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 116533 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Jan 2017 01:36:41 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0102.outbound.protection.outlook.com [104.47.0.102])
	by mail.openembedded.org (Postfix) with ESMTP id BAC34719BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 01:36:41 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Wed, 25 Jan 2017 11:00:21 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.021; Wed, 25 Jan 2017 11:00:21 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: configure error for glibc 2.25.2
Thread-Index: AdJ2St/27Lo07BMlSGusqMFehWa5EgADqQ+wAAKLfYAAADaKIAABcYyAAABsx/AABxkNgAAaKniQAABTpYAAAeGLEA==
Date: Wed, 25 Jan 2017 11:00:21 +0000
Message-ID: <LOXP123MB011715655FD8F10E18BFAEFA85740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485277371.30673.59.camel@linuxfoundation.org>
	<LOXP123MB01174F8944CFABF7E023B92585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485280217.30673.61.camel@linuxfoundation.org>
	<LOXP123MB011715CA6AFD7F2EA6C0964B85750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485293141.30673.63.camel@linuxfoundation.org>
	<LOXP123MB0117D15626B7BF2AFE400B8A85740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<1485338655.30673.73.camel@linuxfoundation.org>
In-Reply-To: <1485338655.30673.73.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: 8673dcd2-09c2-457a-404c-08d445115b2b
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0117;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0117;
	7:r5tz7DWeQh6/LLVo8/MrcNqQygauf47aeOMM2nA4a+nCUa4be8BncCSuOzi0I2mzgmqF1/gUeOXwyO2yfSbv0iMveo8WM7o/z5+U3sBxeqcJfgBhmTdV8FblJOcbpbRp+tYCiSvHZWTeWIevYeSThoMnUm1USQpSQwubzE4Vm7uzKGaYb0H5iMTDiUTTaxS7yeMcahh9qD09RpfGx3fgCpveF2SMY+vFMLePHVOjCurDSlwmlzHBCzWNGrkBBbYa6Vp/RkWPpfP0K8ooL3P1FEFv4dwl0diKxA3lgSgWJvw1OBcp/2uh/pTSCRa/PmpI2Wqz4iASOtQEOxPkBJKvh7i01xKcCkW2P1UD9UaZ+8sYPJYj4S40i9EP0JpkGVF5OSSHBVAR4WTppTlLa97xtcH/O8712xbX0mscedHcNiOsmaMvDwdd31D9NvLm14heaIX0KMS0pXgZJ+6GEjH4IQ==
x-microsoft-antispam-prvs: <LOXP123MB0117BE24A61088ADAC00AAD085740@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(102415395)(6040375)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(2016111802025)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(6072148)(6043046);
	SRVR:LOXP123MB0117; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0117; 
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(39830400002)(39410400002)(189002)(199003)(24454002)(377424004)(3280700002)(106356001)(2900100001)(5660300001)(54356999)(76176999)(2950100002)(101416001)(99936001)(7696004)(50986999)(86362001)(66066001)(92566002)(8676002)(81156014)(105586002)(33656002)(8936002)(81166006)(38730400001)(102836003)(2906002)(6116002)(305945005)(53936002)(93886004)(3846002)(74316002)(7736002)(122556002)(6436002)(6506006)(5001770100001)(189998001)(3660700001)(77096006)(68736007)(97736004)(107886002)(229853002)(2501003)(5890100001)(55016002)(9686003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0117;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2017 11:00:21.1143 (UTC)
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
X-List-Received-Date: Thu, 26 Jan 2017 01:36:43 -0000
X-Groupsio-MsgNum: 92402
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_LOXP123MB011715655FD8F10E18BFAEFA85740LOXP123MB0117GBRP_"

--_002_LOXP123MB011715655FD8F10E18BFAEFA85740LOXP123MB0117GBRP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmddDQo+IE9uIFdlZCwgMjAxNy0wMS0yNSBhdCAwOTo1NiArMDAwMCwgQW5kcmV3IEdv
b2Rib2R5IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86
cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10NCj4gPiA+IE9uIFR1ZSwgMjAxNy0w
MS0yNCBhdCAxODowOCArMDAwMCwgQW5kcmV3IEdvb2Rib2R5IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBUaGFua3MgYnV0IHVuZm9ydHVuYXRlbHkgdGhhdCBkaWQgbm90IHdvcmsgZm9yIG1lLg0K
PiA+ID4gPg0KPiA+ID4gPiBJIGRpZCBhIGNsZWFuYWxsIG9uIGdsaWJjIGJlZm9yZSB0cnlpbmcg
dG8gYnVpbGQgaXQsIGJ1dCB0aGUNCj4gPiA+ID4gcmVzdWx0DQo+ID4gPiA+IHdhcyB0aGUgc2Ft
ZS4NCj4gPiA+IFRyeSBhICJiaXRiYWtlIGdsaWJjLWluaXRpYWwgLWMgY2xlYW4iPw0KPiA+IFNv
cnJ5LCBpdCB3YXMgZ2xpYmMtaW5pdGlhbCB0aGF0IEkgcmFuIHRoZSBjbGVhbmFsbCBvbiwgc28g
anVzdCBjbGVhbg0KPiA+IG1ha2VzIG5vIGRpZmZlcmVuY2UuDQo+IA0KPiBPaywgd2hhdCBkb2Vz
IGJpdGJha2UgLWUgc2hvdyBhcyB0aGUgdmFsdWUgb2bCoFBBQ0tBR0VfRVhUUkFfQVJDSFM/DQo+
IA0KPiBZb3UgY291bGQgdHJ5IHB1dHRpbmcgc29tZXRoaW5nIGxpa2U6DQo+IA0KPiBiYi53YXJu
KGQuZXhwYW5kKCIke1NTVEFURV9NQU5JRkVTVFN9L21hbmlmZXN0LSVzLQ0KPiAqLnBvcHVsYXRl
X3N5c3Jvb3QiICUgcGtnYXJjaCkpDQo+IA0KPiBpbnRvIHRoYXQgJ2ZvciBwa2dhcmNoIGluIHBr
Z2FyY2hzJyBsb29wIGFuZCBzZWUgd2hhdCBpdHMgbG9va2luZyBmb3IuDQo+IFRoZXJlIGlzIHNv
bWUgZGV0YWlsIEknbSBtaXNzaW5nIHdpdGggdGhlIHByb2JsZW0gcmlnaHQgbm93Li4uIDovDQoN
CkFuZCB0aGUgZGV0YWlsIGlzIHRoYXQgdGhhdCBiaXQgb2YgY29kZSBpcyBub3QgY2FsbGVkIGlu
IHRoaXMgc2l0dWF0aW9uLiBJIHRoaW5rIGl0IGlzIG9ubHkgdXNlZCB3aGVuIG5vIGRlcGVuZGVu
Y2llcyBhcmUgZGVjbGFyZWQuIFRoZSBhdHRhY2hlZCBwYXRjaCBmaXhlcyBpdCBmb3IgbWUuDQoN
CkFuZHJldw0K

--_002_LOXP123MB011715655FD8F10E18BFAEFA85740LOXP123MB0117GBRP_
Content-Type: application/octet-stream; name="tunearch.patch"
Content-Description: tunearch.patch
Content-Disposition: attachment; filename="tunearch.patch"; size=1592;
	creation-date="Wed, 25 Jan 2017 10:59:41 GMT";
	modification-date="Wed, 25 Jan 2017 10:54:56 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9zdGFnaW5nLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMv
c3RhZ2luZy5iYmNsYXNzCmluZGV4IGZjMzg3ZWEuLmJmMjMzZDYgMTAwNjQ0Ci0tLSBhL21ldGEv
Y2xhc3Nlcy9zdGFnaW5nLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL3N0YWdpbmcuYmJjbGFz
cwpAQCAtMzA0LDcgKzMwNCw5IEBAIGRlZiBzdGFnaW5nX3BvcHVsYXRlX3N5c3Jvb3RfZGlyKHRh
cmdldHN5c3Jvb3QsIG5hdGl2ZXN5c3Jvb3QsIG5hdGl2ZSwgZCk6CiAgICAgICAgIHBrZ2FyY2hz
ID0gWycke0JVSUxEX0FSQ0h9JywgJyR7QlVJTERfQVJDSH1fKiddCiAgICAgICAgIHRhcmdldGRp
ciA9IG5hdGl2ZXN5c3Jvb3QKICAgICBlbHNlOgotICAgICAgICBwa2dhcmNocyA9IFsnJHtNQUNI
SU5FX0FSQ0h9JywgJyR7VFVORV9QS0dBUkNIfScsICdhbGxhcmNoJ10KKyAgICAgICAgcGtnYXJj
aHMgPSBbJyR7TUFDSElORV9BUkNIfSddCisgICAgICAgIHBrZ2FyY2hzID0gcGtnYXJjaHMgKyBs
aXN0KHJldmVyc2VkKGQuZ2V0VmFyKCJQQUNLQUdFX0VYVFJBX0FSQ0hTIikuc3BsaXQoKSkpCisg
ICAgICAgIHBrZ2FyY2hzLmFwcGVuZCgnYWxsYXJjaCcpCiAgICAgICAgIHRhcmdldGRpciA9IHRh
cmdldHN5c3Jvb3QKIAogICAgIGJiLnV0aWxzLm1rZGlyaGllcih0YXJnZXRkaXIpCkBAIC01MzAs
NyArNTMyLDExIEBAIHB5dGhvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QoKSB7CiAgICAgICAgIGVs
c2U6CiAgICAgICAgICAgICBtYW5pZmVzdCA9IGQyLmV4cGFuZCgiJHtTU1RBVEVfTUFOSUZFU1RT
fS9tYW5pZmVzdC0ke01BQ0hJTkVfQVJDSH0tJXMucG9wdWxhdGVfc3lzcm9vdCIgJSBjKQogICAg
ICAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKG1hbmlmZXN0KToKLSAgICAgICAgICAgICAg
ICBtYW5pZmVzdCA9IGQyLmV4cGFuZCgiJHtTU1RBVEVfTUFOSUZFU1RTfS9tYW5pZmVzdC0ke1RV
TkVfUEtHQVJDSH0tJXMucG9wdWxhdGVfc3lzcm9vdCIgJSBjKQorICAgICAgICAgICAgICAgICNt
YW5pZmVzdCA9IGQyLmV4cGFuZCgiJHtTU1RBVEVfTUFOSUZFU1RTfS9tYW5pZmVzdC0ke1RVTkVf
UEtHQVJDSH0tJXMucG9wdWxhdGVfc3lzcm9vdCIgJSBjKQorICAgICAgICAgICAgICAgIGZvciB0
dW5lYXJjaCBpbiBsaXN0KHJldmVyc2VkKGQuZ2V0VmFyKCJQQUNLQUdFX0VYVFJBX0FSQ0hTIiku
c3BsaXQoKSkpOgorICAgICAgICAgICAgICAgICAgICBtYW5pZmVzdCA9IGQyLmV4cGFuZCgiJHtT
U1RBVEVfTUFOSUZFU1RTfS9tYW5pZmVzdC0lcy0lcy5wb3B1bGF0ZV9zeXNyb290IiAlICh0dW5l
YXJjaCwgYykpCisgICAgICAgICAgICAgICAgICAgIGlmIG9zLnBhdGguZXhpc3RzKG1hbmlmZXN0
KToKKyAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgICBpZiBub3Qgb3Mu
cGF0aC5leGlzdHMobWFuaWZlc3QpOgogICAgICAgICAgICAgICAgIG1hbmlmZXN0ID0gZDIuZXhw
YW5kKCIke1NTVEFURV9NQU5JRkVTVFN9L21hbmlmZXN0LWFsbGFyY2gtJXMucG9wdWxhdGVfc3lz
cm9vdCIgJSBjKQogICAgICAgICBpZiBub3Qgb3MucGF0aC5leGlzdHMobWFuaWZlc3QpOgo=

--_002_LOXP123MB011715655FD8F10E18BFAEFA85740LOXP123MB0117GBRP_--
