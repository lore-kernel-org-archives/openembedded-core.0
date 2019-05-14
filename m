Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 505127DEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 06:31:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,467,1549900800"; d="scan'208";a="62929058"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 May 2019 14:31:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A2D114CDCCAB;
	Tue, 14 May 2019 14:31:20 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Tue, 14 May 2019 14:31:19 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHU8btdwcW6mVdAkUK2QKbtt/xhNaZCTQiAgAu3nCCAErXeEIAJnYbg
Date: Tue, 14 May 2019 06:31:24 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF1026BA@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A2D114CDCCAB.AF184
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] toolchain-scripts: make rpm work in toolchain
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
X-List-Received-Date: Tue, 14 May 2019 06:31:23 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNClRoaXMgcGF0Y2ggaGFzbid0IGJlZW4gbWVyZ2VkIHlldC4gQXJl
IHRoZXJlIGFueSBzdWdnZXN0aW9ucz8NCg0KQmVzdCByZWdhcmRzDQpMZWkN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
W21haWx0bzpvcGVuZW1iZWRkZWQtDQo+IGNvcmUtYm91bmNlc0BsaXN0cy5v
cGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgTGVpLCBNYW9odWkNCj4g
U2VudDogV2VkbmVzZGF5LCBNYXkgMDgsIDIwMTkgMTE6MzYgQU0NCj4gVG86
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHRvb2xjaGFpbi1zY3Jp
cHRzOiBtYWtlIHJwbSB3b3JrIGluIHRvb2xjaGFpbg0KPiANCj4gUGluZw0K
PiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC0NCj4gPiBjb3JlLWJvdW5jZXNA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mIExlaSwgTWFv
aHVpDQo+ID4gU2VudDogRnJpZGF5LCBBcHJpbCAyNiwgMjAxOSAxOjU2IFBN
DQo+ID4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdG9v
bGNoYWluLXNjcmlwdHM6IG1ha2UgcnBtIHdvcmsgaW4gdG9vbGNoYWluDQo+
ID4NCj4gPiBIaSwNCj4gPg0KPiA+IEkgbm90aWNlZCB0aGF0ICIgZG5mOiBF
bmFibGUgbmF0aXZlc2RrICIgaGFzIGJlZW4gbWVyZ2VkIGludG8gbWFzdGVy
LW5leHQuDQo+IFRoaXMNCj4gPiBwYXRjaCBpcyBuZWNlc3NhcnkgZm9yIGRu
Zi1uYXRpdmVzZGssIHNvIHBsZWFzZSBtZXJnZSB0b28uDQo+ID4NCj4gPiBC
ZXN0IHJlZ2FyZHMNCj4gPiBMZWkNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogb3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWls
dG86b3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZS1ib3VuY2VzQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBaaGVuZywgUnVvcWluDQo+
ID4gPiBTZW50OiBGcmlkYXksIEFwcmlsIDE5LCAyMDE5IDEwOjU1IEFNDQo+
ID4gPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHRv
b2xjaGFpbi1zY3JpcHRzOiBtYWtlIHJwbSB3b3JrIGluDQo+IHRvb2xjaGFp
bg0KPiA+ID4NCj4gPiA+IHBpbmcNCj4gPiA+DQo+ID4gPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
ID4gWmhlbmcgUnVvcWluDQo+ID4gPiBOYW5qaW5nIEZ1aml0c3UgTmFuZGEg
U29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQo+ID4gPiBBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KPiA+ID4gICAg
ICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gPiA+IE1BSUwgOiB6aGVu
Z3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCj4gPiA+DQo+ID4gPg0KPiA+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBa
aGVuZywgUnVvcWluDQo+ID4gPiA+IFNlbnQ6IFNhdHVyZGF5LCBBcHJpbCAx
MywgMjAxOSAxMDozNyBQTQ0KPiA+ID4gPiBUbzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPiBDYzogWmhlbmcs
IFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+ID4g
PiBTdWJqZWN0OiBbT0UtY29yZV1bUEFUQ0hdIHRvb2xjaGFpbi1zY3JpcHRz
OiBtYWtlIHJwbSB3b3JrIGluIHRvb2xjaGFpbg0KPiA+ID4gPg0KPiA+ID4g
PiBScG0gbmVlZCB0byByZWFkIHRoZSBhcmNoIGluZm8sIGJ1dCAkc2NyaXB0
IGRpZCBub3QgcHJvdmlkZSBpdCwgc28gYWRkIGl0Lg0KPiA+ID4gPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5z
dEBjbi5mdWppdHN1LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBtZXRh
L2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJjbGFzcyB8IDEgKw0KPiA+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gPiA+
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWlu
LXNjcmlwdHMuYmJjbGFzcw0KPiA+IGIvbWV0YS9jbGFzc2VzL3Rvb2xjaGFp
bi0NCj4gPiA+ID4gc2NyaXB0cy5iYmNsYXNzDQo+ID4gPiA+IGluZGV4IDFh
MmVjNGYuLmRlNTBiN2UgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL21ldGEvY2xh
c3Nlcy90b29sY2hhaW4tc2NyaXB0cy5iYmNsYXNzDQo+ID4gPiA+ICsrKyBi
L21ldGEvY2xhc3Nlcy90b29sY2hhaW4tc2NyaXB0cy5iYmNsYXNzDQo+ID4g
PiA+IEBAIC0xMDEsNiArMTAxLDcgQEAgdG9vbGNoYWluX3NoYXJlZF9lbnZf
c2NyaXB0ICgpIHsNCj4gPiA+ID4gIAllY2hvICdleHBvcnQgQ1BQRkxBR1M9
IiR7VEFSR0VUX0NQUEZMQUdTfSInID4+ICRzY3JpcHQNCj4gPiA+ID4gIAll
Y2hvICdleHBvcnQgS0NGTEFHUz0iLS1zeXNyb290PSRTREtUQVJHRVRTWVNS
T09UIicgPj4gJHNjcmlwdA0KPiA+ID4gPiAgCWVjaG8gJ2V4cG9ydCBPRUNP
UkVfRElTVFJPX1ZFUlNJT049IiR7RElTVFJPX1ZFUlNJT059IicgPj4NCj4g
PiA+ID4gJHNjcmlwdA0KPiA+ID4gPiArCWVjaG8gJ2V4cG9ydCBNQUNISU5F
X0FSQ0g9JHtNQUNISU5FX0FSQ0h9JyA+PiAkc2NyaXB0DQo+ID4gPiA+ICAJ
ZWNobyAnZXhwb3J0IE9FQ09SRV9TREtfVkVSU0lPTj0iJHtTREtfVkVSU0lP
Tn0iJyA+PiAkc2NyaXB0DQo+ID4gPiA+ICAJZWNobyAnZXhwb3J0IEFSQ0g9
JHtBUkNIfScgPj4gJHNjcmlwdA0KPiA+ID4gPiAgCWVjaG8gJ2V4cG9ydCBD
Uk9TU19DT01QSUxFPSR7VEFSR0VUX1BSRUZJWH0nID4+ICRzY3JpcHQNCj4g
PiA+ID4gLS0NCj4gPiA+ID4gMS44LjMuMQ0KPiA+ID4NCj4gPiA+DQo+ID4g
Pg0KPiA+ID4gLS0NCj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+ID4gPiBPcGVuZW1iZWRkZWQtY29y
ZSBtYWlsaW5nIGxpc3QNCj4gPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUN
Cj4gPg0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1j
b3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+
IA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGlu
ZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KCgo=

