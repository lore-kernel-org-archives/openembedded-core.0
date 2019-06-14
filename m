Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDC97E8BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 00:57:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,370,1557158400"; d="scan'208";a="67354670"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Jun 2019 08:57:34 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B41C4CDD45B;
	Fri, 14 Jun 2019 08:57:33 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Fri, 14 Jun 2019 08:57:33 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] openssl: Fix a build bug on aarch64BE.
Thread-Index: AQHVIcnauwLbkyRTdkKl/Gzkh4RI9qaaU0eg
Date: Fri, 14 Jun 2019 00:57:31 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF12DE4F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1559434935-11842-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJTo0LYF08Tad=-RwO_7Bj5a58yeEgmR-XFCsSw2RbsDT=DAkQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYF08Tad=-RwO_7Bj5a58yeEgmR-XFCsSw2RbsDT=DAkQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8B41C4CDD45B.AD131
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Fri, 14 Jun 2019 00:57:35 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFJvc3MNCg0KVGhhbmsgeW91LiBJIGdvdCBpdC4gSSB3aWxsIHN1Ym1p
dCB2MiBwYXRjaC4NCg0KQmVzdCByZWdhcmRzIA0KTGVpDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBUaHVyc2Rh
eSwgSnVuZSAxMywgMjAxOSA1OjI0IFBNDQo+IFRvOiBMZWksIE1hb2h1aQ0K
PiBDYzogT0UtY29yZTsgSG9uZyBMaXUNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIG9wZW5zc2w6IEZpeCBhIGJ1aWxkIGJ1ZyBvbiBhYXJj
aDY0QkUuDQo+IA0KPiBPbiBUaHUsIDEzIEp1biAyMDE5IGF0IDA5OjQ4LCBM
ZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gRnJvbTogSG9uZyBMaXUgPGhvbmdsLmZuc3RAY24uZnVqaXRz
dS5jb20+DQo+ID4NCj4gPiBGaXggYnVnIGFzIGZvbGxvd2luZyBvbiBhYXJj
aDY0QkU6DQo+ID4NCj4gPiBFcnJvcjogb3BlcmFuZCAxIG11c3QgYmUgYW4g
aW50ZWdlciByZWdpc3RlciAtLSBgcmV2IHYzMS4xNmIsdjMxLjE2YicNCj4g
Pg0KPiA+IFVwc3RyZWFtLVN0YXR1czogUGVuZGluZyBbaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5zc2wvb3BlbnNzbC9wdWxsLzkxNTFdDQo+IA0KPiBUaGlz
IGxpbmUgXl5eDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkg
PGxlaW1hb2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4u
MDEtRml4LWJ1aWxkLWVycm9yLWZvci1hYXJjaDY0LWJpZy1lbmRpYW4ucGF0
Y2ggfCA0MQ0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFjLmJi
IHwgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMo
KykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtRml4LWJ1aWxkLQ0KPiBl
cnJvci1mb3ItYWFyY2g2NC1iaWctZW5kaWFuLnBhdGNoDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3Ns
L29wZW5zc2wvMDAwMS1GaXgtYnVpbGQtZXJyb3ItDQo+IGZvci1hYXJjaDY0
LWJpZy1lbmRpYW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2wvb3BlbnNzbC8wMDAxLQ0KPiBGaXgtYnVpbGQtZXJyb3ItZm9y
LWFhcmNoNjQtYmlnLWVuZGlhbi5wYXRjaA0KPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMC4uNjVjYTAyYw0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29wZW5zc2wvb3BlbnNzbC8wMDAxLUZpeC1idWlsZC1lcnJvci1mb3ItDQo+
IGFhcmNoNjQtYmlnLWVuZGlhbi5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsNDEg
QEANCj4gPiArRnJvbSAxZjhjMGYyZmVlYTVjZGNhZTBiY2Q5ZGZjNzgxOThk
OWUyYzRjZjA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiA+ICtGcm9t
OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+DQo+ID4g
K0RhdGU6IFRodSwgMTMgSnVuIDIwMTkgMTI6MTc6MzAgKzA5MDANCj4gPiAr
U3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgZXJyb3IgZm9yIGFhcmNoNjQg
YmlnIGVuZGlhbi4NCj4gPiArDQo+ID4gK01vZGlmaWVkIHJldiB0byByZXY2
NCwgYmVjYXVzZSByZXYgb25seSB0YWtlcyBpbnRlZ2VyIHJlZ2lzdGVycy4N
Cj4gPiAraHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5j
Z2k/aWQ9OTA4MjcNCj4gPiArT3RoZXJ3aXNlLCB0aGUgZm9sbG93aW5nIGVy
cm9yIHdpbGwgb2NjdXIuDQo+ID4gKw0KPiA+ICtFcnJvcjogb3BlcmFuZCAx
IG11c3QgYmUgYW4gaW50ZWdlciByZWdpc3RlciAtLSBgcmV2IHYzMS4xNmIs
djMxLjE2YicNCj4gPiArDQo+IA0KPiBeXiBnb2VzIGhlcmUuDQo+IA0KPiBU
aGUgdXBzdHJlYW0gc3RhdHVzIGlzIGEgcHJvcGVydHkgb2YgdGhlIHBhdGNo
IHlvdSdyZSBhZGRpbmcsIG5vdCB0aGUNCj4gY29tbWl0IG1lc3NhZ2UuDQo+
IA0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlA
Y24uZnVqaXRzdS5jb20+DQo+ID4gKy0tLQ0KPiA+ICsgY3J5cHRvL3NoYS9h
c20va2VjY2FrMTYwMC1hcm12OC5wbCB8IDQgKystLQ0KPiA+ICsgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
PiArDQo+ID4gK2RpZmYgLS1naXQgYS9jcnlwdG8vc2hhL2FzbS9rZWNjYWsx
NjAwLWFybXY4LnBsIGIvY3J5cHRvL3NoYS9hc20va2VjY2FrMTYwMC0NCj4g
YXJtdjgucGwNCj4gPiAraW5kZXggZGM3MmYxOC4uNjYyMDY5MCAxMDA3NTUN
Cj4gPiArLS0tIGEvY3J5cHRvL3NoYS9hc20va2VjY2FrMTYwMC1hcm12OC5w
bA0KPiA+ICsrKysgYi9jcnlwdG8vc2hhL2FzbS9rZWNjYWsxNjAwLWFybXY4
LnBsDQo+ID4gK0BAIC03MzEsNyArNzMxLDcgQEAgJGNvZGUuPTw8X19fOw0K
PiA+ICsgICAgICAgYmxvICAgICAuTHByb2Nlc3NfYmxvY2tfY2UNCj4gPiAr
ICAgICAgIGxkciAgICAgZDMxLFskaW5wXSwjOCAgICAgICAgICAgLy8gKmlu
cCsrDQo+ID4gKyAjaWZkZWYgICAgICAgIF9fQUFSQ0g2NEVCX18NCj4gPiAr
LSAgICAgIHJldiAgICAgdjMxLjE2Yix2MzEuMTZiDQo+ID4gKysgICAgICBy
ZXY2NCAgIHYzMS4xNmIsdjMxLjE2Yg0KPiA+ICsgI2VuZGlmDQo+ID4gKyAg
ICAgICBlb3IgICAgICRBWyRqLzVdWyRqJTVdLCRBWyRqLzVdWyRqJTVdLHYz
MS4xNmINCj4gPiArICAgICAgIGJlcSAgICAgLkxwcm9jZXNzX2Jsb2NrX2Nl
DQo+ID4gK0BAIC03NDAsNyArNzQwLDcgQEAgX19fDQo+ID4gKyAkY29kZS49
PDxfX187DQo+ID4gKyAgICAgICBsZHIgICAgIGQzMSxbJGlucF0sIzggICAg
ICAgICAgIC8vICppbnArKw0KPiA+ICsgI2lmZGVmICAgICAgICBfX0FBUkNI
NjRFQl9fDQo+ID4gKy0gICAgICByZXYgICAgIHYzMS4xNmIsdjMxLjE2Yg0K
PiA+ICsrICAgICAgcmV2NjQgICB2MzEuMTZiLHYzMS4xNmINCj4gPiArICNl
bmRpZg0KPiA+ICsgICAgICAgZW9yICAgICAkQVs0XVs0XSwkQVs0XVs0XSx2
MzEuMTZiDQo+ID4gKw0KPiA+ICstLQ0KPiA+ICsyLjcuNA0KPiA+ICsNCj4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NsL29wZW5zc2xfMS4xLjFjLmJiDQo+IGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMS4xLjFjLmJiDQo+ID4gaW5kZXgg
NjY5YjFhMS4uZWM4NWNjZCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8xLjEuMWMuYmINCj4g
PiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbF8xLjEuMWMuYmINCj4gPiBAQCAtMTYsNiArMTYsNyBAQCBTUkNfVVJJ
ID0gImh0dHA6Ly93d3cub3BlbnNzbC5vcmcvc291cmNlL29wZW5zc2wtDQo+
ICR7UFZ9LnRhci5neiBcDQo+ID4gICAgICAgICAgICAgZmlsZTovLzAwMDEt
c2tpcC10ZXN0X3N5bWJvbF9wcmVzZW5jZS5wYXRjaCBcDQo+ID4gICAgICAg
ICAgICAgZmlsZTovLzAwMDEtYnVpbGRpbmZvLXN0cmlwLXN5c3Jvb3QtYW5k
LWRlYnVnLXByZWZpeC1tYXAtZnJvbS0NCj4gY28ucGF0Y2ggXA0KPiA+ICAg
ICAgICAgICAgIGZpbGU6Ly9hZmFsZy5wYXRjaCBcDQo+ID4gKyAgICAgICAg
ICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkLWVycm9yLWZvci1hYXJjaDY0LWJp
Zy1lbmRpYW4ucGF0Y2ggXA0KPiA+ICAgICAgICAgICAgICINCj4gPg0KPiA+
ICBTUkNfVVJJX2FwcGVuZF9jbGFzcy1uYXRpdmVzZGsgPSAiIFwNCj4gPiAt
LQ0KPiA+IDIuNy40DQo+ID4NCj4gPg0KPiA+DQo+ID4gLS0NCj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5lbWJlZGRlZC1jb3JlDQo+IA0KDQoKCg==

