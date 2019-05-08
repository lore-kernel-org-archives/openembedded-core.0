Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D37FE7BE3C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 03:35:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,444,1549900800"; d="scan'208";a="62069972"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 May 2019 11:35:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D8E14CDB77C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 11:35:43 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Wed, 8 May 2019 11:35:43 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHU8btdwcW6mVdAkUK2QKbtt/xhNaZCTQiAgAu3nCCAErXeEA==
Date: Wed, 8 May 2019 03:35:51 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 4D8E14CDB77C.ADEA2
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
X-List-Received-Date: Wed, 08 May 2019 03:35:49 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

UGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3VuY2VzQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBMZWksIE1hb2h1
aQ0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDI2LCAyMDE5IDE6NTYgUE0NCj4g
VG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHRvb2xjaGFpbi1z
Y3JpcHRzOiBtYWtlIHJwbSB3b3JrIGluIHRvb2xjaGFpbg0KPiANCj4gSGks
DQo+IA0KPiBJIG5vdGljZWQgdGhhdCAiIGRuZjogRW5hYmxlIG5hdGl2ZXNk
ayAiIGhhcyBiZWVuIG1lcmdlZCBpbnRvIG1hc3Rlci1uZXh0LiBUaGlzDQo+
IHBhdGNoIGlzIG5lY2Vzc2FyeSBmb3IgZG5mLW5hdGl2ZXNkaywgc28gcGxl
YXNlIG1lcmdlIHRvby4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBMZWkNCj4g
DQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJv
bTogb3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIFttYWlsdG86b3BlbmVtYmVkZGVkLQ0KPiA+IGNvcmUtYm91bmNl
c0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgWmhlbmcs
IFJ1b3Fpbg0KPiA+IFNlbnQ6IEZyaWRheSwgQXByaWwgMTksIDIwMTkgMTA6
NTUgQU0NCj4gPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSB0b29sY2hhaW4tc2NyaXB0czogbWFrZSBycG0gd29yayBpbiB0b29sY2hh
aW4NCj4gPg0KPiA+IHBpbmcNCj4gPg0KPiA+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gWmhlbmcg
UnVvcWluDQo+ID4gTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRl
Y2guIENvLiwgTHRkLihGTlNUKQ0KPiA+IEFERFIuOiBOby42IFdlbnpodSBS
b2FkLCBTb2Z0d2FyZSBBdmVudWUsDQo+ID4gICAgICAgIE5hbmppbmcsIDIx
MDAxMiwgQ2hpbmENCj4gPiBNQUlMIDogemhlbmdycS5mbnN0QGNuLmZ1amlz
dHUuY29tDQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IFpoZW5nLCBSdW9xaW4NCj4gPiA+IFNlbnQ6
IFNhdHVyZGF5LCBBcHJpbCAxMywgMjAxOSAxMDozNyBQTQ0KPiA+ID4gVG86
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PiA+IENjOiBaaGVuZywgUnVvcWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRz
dS5jb20+DQo+ID4gPiBTdWJqZWN0OiBbT0UtY29yZV1bUEFUQ0hdIHRvb2xj
aGFpbi1zY3JpcHRzOiBtYWtlIHJwbSB3b3JrIGluIHRvb2xjaGFpbg0KPiA+
ID4NCj4gPiA+IFJwbSBuZWVkIHRvIHJlYWQgdGhlIGFyY2ggaW5mbywgYnV0
ICRzY3JpcHQgZGlkIG5vdCBwcm92aWRlIGl0LCBzbyBhZGQgaXQuDQo+ID4g
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3Jx
LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBtZXRh
L2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJjbGFzcyB8IDEgKw0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4NCj4g
PiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLXNjcmlw
dHMuYmJjbGFzcw0KPiBiL21ldGEvY2xhc3Nlcy90b29sY2hhaW4tDQo+ID4g
PiBzY3JpcHRzLmJiY2xhc3MNCj4gPiA+IGluZGV4IDFhMmVjNGYuLmRlNTBi
N2UgMTAwNjQ0DQo+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWlu
LXNjcmlwdHMuYmJjbGFzcw0KPiA+ID4gKysrIGIvbWV0YS9jbGFzc2VzL3Rv
b2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MNCj4gPiA+IEBAIC0xMDEsNiArMTAx
LDcgQEAgdG9vbGNoYWluX3NoYXJlZF9lbnZfc2NyaXB0ICgpIHsNCj4gPiA+
ICAJZWNobyAnZXhwb3J0IENQUEZMQUdTPSIke1RBUkdFVF9DUFBGTEFHU30i
JyA+PiAkc2NyaXB0DQo+ID4gPiAgCWVjaG8gJ2V4cG9ydCBLQ0ZMQUdTPSIt
LXN5c3Jvb3Q9JFNES1RBUkdFVFNZU1JPT1QiJyA+PiAkc2NyaXB0DQo+ID4g
PiAgCWVjaG8gJ2V4cG9ydCBPRUNPUkVfRElTVFJPX1ZFUlNJT049IiR7RElT
VFJPX1ZFUlNJT059IicgPj4NCj4gPiA+ICRzY3JpcHQNCj4gPiA+ICsJZWNo
byAnZXhwb3J0IE1BQ0hJTkVfQVJDSD0ke01BQ0hJTkVfQVJDSH0nID4+ICRz
Y3JpcHQNCj4gPiA+ICAJZWNobyAnZXhwb3J0IE9FQ09SRV9TREtfVkVSU0lP
Tj0iJHtTREtfVkVSU0lPTn0iJyA+PiAkc2NyaXB0DQo+ID4gPiAgCWVjaG8g
J2V4cG9ydCBBUkNIPSR7QVJDSH0nID4+ICRzY3JpcHQNCj4gPiA+ICAJZWNo
byAnZXhwb3J0IENST1NTX0NPTVBJTEU9JHtUQVJHRVRfUFJFRklYfScgPj4g
JHNjcmlwdA0KPiA+ID4gLS0NCj4gPiA+IDEuOC4zLjENCj4gPg0KPiA+DQo+
ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFp
bGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCj4gDQo+IA0K
PiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QN
Cj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5lbWJlZGRlZC1jb3JlDQoKCg==

