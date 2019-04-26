Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBBF7CA4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 05:55:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,396,1549900800"; d="scan'208";a="60666736"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2019 13:55:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B0314CD9DA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:55:52 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Fri, 26 Apr 2019 13:55:53 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHU8btdwcW6mVdAkUK2QKbtt/xhNaZCTQiAgAu3nCA=
Date: Fri, 26 Apr 2019 05:55:52 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 7B0314CD9DA3.AA327
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
X-List-Received-Date: Fri, 26 Apr 2019 05:55:55 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCkkgbm90aWNlZCB0aGF0ICIgZG5mOiBFbmFibGUgbmF0aXZlc2Rr
ICIgaGFzIGJlZW4gbWVyZ2VkIGludG8gbWFzdGVyLW5leHQuIFRoaXMgcGF0
Y2ggaXMgbmVjZXNzYXJ5IGZvciBkbmYtbmF0aXZlc2RrLCBzbyBwbGVhc2Ug
bWVyZ2UgdG9vLg0KDQpCZXN0IHJlZ2FyZHMNCkxlaSANCg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1j
b3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9w
ZW5lbWJlZGRlZC0NCj4gY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmddIE9uIEJlaGFsZiBPZiBaaGVuZywgUnVvcWluDQo+IFNlbnQ6IEZy
aWRheSwgQXByaWwgMTksIDIwMTkgMTA6NTUgQU0NCj4gVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHRvb2xjaGFpbi1zY3JpcHRzOiBtYWtl
IHJwbSB3b3JrIGluIHRvb2xjaGFpbg0KPiANCj4gcGluZw0KPiANCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gWmhlbmcgUnVvcWluDQo+IE5hbmppbmcgRnVqaXRzdSBOYW5kYSBT
b2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCj4gQUREUi46IE5vLjYg
V2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCj4gICAgICAgIE5hbmpp
bmcsIDIxMDAxMiwgQ2hpbmENCj4gTUFJTCA6IHpoZW5ncnEuZm5zdEBjbi5m
dWppc3R1LmNvbQ0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiBGcm9tOiBaaGVuZywgUnVvcWluDQo+ID4gU2VudDogU2F0
dXJkYXksIEFwcmlsIDEzLCAyMDE5IDEwOjM3IFBNDQo+ID4gVG86IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBDYzog
WmhlbmcsIFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0K
PiA+IFN1YmplY3Q6IFtPRS1jb3JlXVtQQVRDSF0gdG9vbGNoYWluLXNjcmlw
dHM6IG1ha2UgcnBtIHdvcmsgaW4gdG9vbGNoYWluDQo+ID4NCj4gPiBScG0g
bmVlZCB0byByZWFkIHRoZSBhcmNoIGluZm8sIGJ1dCAkc2NyaXB0IGRpZCBu
b3QgcHJvdmlkZSBpdCwgc28gYWRkIGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5j
b20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvY2xhc3Nlcy90b29sY2hhaW4tc2Ny
aXB0cy5iYmNsYXNzIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nl
cy90b29sY2hhaW4tc2NyaXB0cy5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3Rv
b2xjaGFpbi0NCj4gPiBzY3JpcHRzLmJiY2xhc3MNCj4gPiBpbmRleCAxYTJl
YzRmLi5kZTUwYjdlIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy90
b29sY2hhaW4tc2NyaXB0cy5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFz
c2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MNCj4gPiBAQCAtMTAxLDYg
KzEwMSw3IEBAIHRvb2xjaGFpbl9zaGFyZWRfZW52X3NjcmlwdCAoKSB7DQo+
ID4gIAllY2hvICdleHBvcnQgQ1BQRkxBR1M9IiR7VEFSR0VUX0NQUEZMQUdT
fSInID4+ICRzY3JpcHQNCj4gPiAgCWVjaG8gJ2V4cG9ydCBLQ0ZMQUdTPSIt
LXN5c3Jvb3Q9JFNES1RBUkdFVFNZU1JPT1QiJyA+PiAkc2NyaXB0DQo+ID4g
IAllY2hvICdleHBvcnQgT0VDT1JFX0RJU1RST19WRVJTSU9OPSIke0RJU1RS
T19WRVJTSU9OfSInID4+DQo+ID4gJHNjcmlwdA0KPiA+ICsJZWNobyAnZXhw
b3J0IE1BQ0hJTkVfQVJDSD0ke01BQ0hJTkVfQVJDSH0nID4+ICRzY3JpcHQN
Cj4gPiAgCWVjaG8gJ2V4cG9ydCBPRUNPUkVfU0RLX1ZFUlNJT049IiR7U0RL
X1ZFUlNJT059IicgPj4gJHNjcmlwdA0KPiA+ICAJZWNobyAnZXhwb3J0IEFS
Q0g9JHtBUkNIfScgPj4gJHNjcmlwdA0KPiA+ICAJZWNobyAnZXhwb3J0IENS
T1NTX0NPTVBJTEU9JHtUQVJHRVRfUFJFRklYfScgPj4gJHNjcmlwdA0KPiA+
IC0tDQo+ID4gMS44LjMuMQ0KPiANCj4gDQo+IA0KPiAtLQ0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBP
cGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRl
ZC1jb3JlDQoKCg==

