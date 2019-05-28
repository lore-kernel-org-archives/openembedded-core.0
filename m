Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F20357E1EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 05:08:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,520,1549900800"; d="scan'208";a="64894387"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 May 2019 13:08:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3FCBA4C4BD33;
	Tue, 28 May 2019 13:08:13 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Tue, 28 May 2019 13:08:12 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHU8btdwcW6mVdAkUK2QKbtt/xhNaZCTQiAgAu3nCCAErXeEIAJnYbggBXq34A=
Date: Tue, 28 May 2019 05:08:20 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF123A0E@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1026BA@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF1026BA@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3FCBA4C4BD33.AC853
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
X-List-Received-Date: Tue, 28 May 2019 05:08:14 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3VuY2VzQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBMZWksIE1hb2h1
aQ0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTQsIDIwMTkgMjozMSBQTQ0KPiBU
bzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdG9vbGNoYWluLXNj
cmlwdHM6IG1ha2UgcnBtIHdvcmsgaW4gdG9vbGNoYWluDQo+IA0KPiBIaSwN
Cj4gDQo+IFRoaXMgcGF0Y2ggaGFzbid0IGJlZW4gbWVyZ2VkIHlldC4gQXJl
IHRoZXJlIGFueSBzdWdnZXN0aW9ucz8NCj4gDQo+IEJlc3QgcmVnYXJkcw0K
PiBMZWkNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgW21haWx0bzpvcGVuZW1iZWRkZWQtDQo+ID4gY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBM
ZWksIE1hb2h1aQ0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDA4LCAyMDE5
IDExOjM2IEFNDQo+ID4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSF0gdG9vbGNoYWluLXNjcmlwdHM6IG1ha2UgcnBtIHdvcmsgaW4gdG9v
bGNoYWluDQo+ID4NCj4gPiBQaW5nDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpv
cGVuZW1iZWRkZWQtDQo+ID4gPiBjb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mIExlaSwgTWFvaHVpDQo+ID4gPiBT
ZW50OiBGcmlkYXksIEFwcmlsIDI2LCAyMDE5IDE6NTYgUE0NCj4gPiA+IFRv
OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdG9vbGNoYWlu
LXNjcmlwdHM6IG1ha2UgcnBtIHdvcmsgaW4NCj4gdG9vbGNoYWluDQo+ID4g
Pg0KPiA+ID4gSGksDQo+ID4gPg0KPiA+ID4gSSBub3RpY2VkIHRoYXQgIiBk
bmY6IEVuYWJsZSBuYXRpdmVzZGsgIiBoYXMgYmVlbiBtZXJnZWQgaW50byBt
YXN0ZXItbmV4dC4NCj4gPiBUaGlzDQo+ID4gPiBwYXRjaCBpcyBuZWNlc3Nh
cnkgZm9yIGRuZi1uYXRpdmVzZGssIHNvIHBsZWFzZSBtZXJnZSB0b28uDQo+
ID4gPg0KPiA+ID4gQmVzdCByZWdhcmRzDQo+ID4gPiBMZWkNCj4gPiA+DQo+
ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC0NCj4g
PiA+ID4gY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9u
IEJlaGFsZiBPZiBaaGVuZywgUnVvcWluDQo+ID4gPiA+IFNlbnQ6IEZyaWRh
eSwgQXByaWwgMTksIDIwMTkgMTA6NTUgQU0NCj4gPiA+ID4gVG86IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+ID4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHRvb2xjaGFpbi1zY3Jp
cHRzOiBtYWtlIHJwbSB3b3JrIGluDQo+ID4gdG9vbGNoYWluDQo+ID4gPiA+
DQo+ID4gPiA+IHBpbmcNCj4gPiA+ID4NCj4gPiA+ID4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+
ID4gWmhlbmcgUnVvcWluDQo+ID4gPiA+IE5hbmppbmcgRnVqaXRzdSBOYW5k
YSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCj4gPiA+ID4gQURE
Ui46IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCj4gPiA+
ID4gICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gPiA+ID4gTUFJ
TCA6IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KPiA+ID4gPg0KPiA+
ID4gPg0KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+ID4gRnJvbTogWmhlbmcsIFJ1b3Fpbg0KPiA+ID4gPiA+IFNlbnQ6
IFNhdHVyZGF5LCBBcHJpbCAxMywgMjAxOSAxMDozNyBQTQ0KPiA+ID4gPiA+
IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4gPiA+ID4gQ2M6IFpoZW5nLCBSdW9xaW4gPHpoZW5ncnEuZm5zdEBj
bi5mdWppdHN1LmNvbT4NCj4gPiA+ID4gPiBTdWJqZWN0OiBbT0UtY29yZV1b
UEFUQ0hdIHRvb2xjaGFpbi1zY3JpcHRzOiBtYWtlIHJwbSB3b3JrIGluIHRv
b2xjaGFpbg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gUnBtIG5lZWQgdG8gcmVh
ZCB0aGUgYXJjaCBpbmZvLCBidXQgJHNjcmlwdCBkaWQgbm90IHByb3ZpZGUg
aXQsIHNvIGFkZA0KPiBpdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0
c3UuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICBtZXRhL2NsYXNz
ZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJjbGFzcyB8IDEgKw0KPiA+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWlu
LXNjcmlwdHMuYmJjbGFzcw0KPiA+ID4gYi9tZXRhL2NsYXNzZXMvdG9vbGNo
YWluLQ0KPiA+ID4gPiA+IHNjcmlwdHMuYmJjbGFzcw0KPiA+ID4gPiA+IGlu
ZGV4IDFhMmVjNGYuLmRlNTBiN2UgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEv
bWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MNCj4gPiA+
ID4gPiArKysgYi9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJj
bGFzcw0KPiA+ID4gPiA+IEBAIC0xMDEsNiArMTAxLDcgQEAgdG9vbGNoYWlu
X3NoYXJlZF9lbnZfc2NyaXB0ICgpIHsNCj4gPiA+ID4gPiAgCWVjaG8gJ2V4
cG9ydCBDUFBGTEFHUz0iJHtUQVJHRVRfQ1BQRkxBR1N9IicgPj4gJHNjcmlw
dA0KPiA+ID4gPiA+ICAJZWNobyAnZXhwb3J0IEtDRkxBR1M9Ii0tc3lzcm9v
dD0kU0RLVEFSR0VUU1lTUk9PVCInID4+ICRzY3JpcHQNCj4gPiA+ID4gPiAg
CWVjaG8gJ2V4cG9ydCBPRUNPUkVfRElTVFJPX1ZFUlNJT049IiR7RElTVFJP
X1ZFUlNJT059IicgPj4NCj4gPiA+ID4gPiAkc2NyaXB0DQo+ID4gPiA+ID4g
KwllY2hvICdleHBvcnQgTUFDSElORV9BUkNIPSR7TUFDSElORV9BUkNIfScg
Pj4gJHNjcmlwdA0KPiA+ID4gPiA+ICAJZWNobyAnZXhwb3J0IE9FQ09SRV9T
REtfVkVSU0lPTj0iJHtTREtfVkVSU0lPTn0iJyA+PiAkc2NyaXB0DQo+ID4g
PiA+ID4gIAllY2hvICdleHBvcnQgQVJDSD0ke0FSQ0h9JyA+PiAkc2NyaXB0
DQo+ID4gPiA+ID4gIAllY2hvICdleHBvcnQgQ1JPU1NfQ09NUElMRT0ke1RB
UkdFVF9QUkVGSVh9JyA+PiAkc2NyaXB0DQo+ID4gPiA+ID4gLS0NCj4gPiA+
ID4gPiAxLjguMy4xDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4g
PiA+IC0tDQo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+ID4gPiA+IE9wZW5lbWJlZGRlZC1jb3Jl
IG1haWxpbmcgbGlzdA0KPiA+ID4gPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA+IGh0dHA6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNv
cmUNCj4gPiA+DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gPiBP
cGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiA+IE9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bmVtYmVkZGVkLWNvcmUNCj4gPg0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+
IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5l
bWJlZGRlZC1jb3JlDQo+IA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVk
ZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K
Cgo=

