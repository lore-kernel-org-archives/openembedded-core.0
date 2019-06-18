Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB277C37F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:03:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="67887156"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2019 16:03:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 87A2C4CDDD30;
	Tue, 18 Jun 2019 16:03:25 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Tue, 18 Jun 2019 16:03:24 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHU8btdwcW6mVdAkUK2QKbtt/xhNaZCTQiAgAu3nCCAErXeEIAJnYbggBXq34CACzc9gP//nDqAgAMi8ZCAEzu7kA==
Date: Tue, 18 Jun 2019 08:03:30 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF12F738@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1026BA@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF123A0E@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF128DDD@G08CNEXMBPEKD01.g08.fujitsu.local>
	<cedd7e708edfab28ec9db8046476313ea44a6022.camel@linuxfoundation.org>
	<1B56A49860EB2D45ADE3731B15C959FD01BF129787@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF129787@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 87A2C4CDDD30.AD058
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 18 Jun 2019 08:03:27 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3VuY2VzQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBMZWksIE1hb2h1
aQ0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAwNiwgMjAxOSAxMDozOSBBTQ0K
PiBUbzogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0KPiBD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdG9vbGNoYWluLXNj
cmlwdHM6IG1ha2UgcnBtIHdvcmsgaW4gdG9vbGNoYWluDQo+IA0KPiBIaSwg
UmljaGFyZA0KPiANCj4gPiBXaGlsc3QgSSBjYW4gZ3Vlc3Mgd2h5LCBpdHMg
bm90IG9idmlvdXMgYXQgYWxsIHRoZSBkbmYgbmVlZHMNCj4gPiBNQUNISU5F
X0FSQ0guIEknZCBwcm9iYWJseSBiZSBoYXBwaWVyIHdpdGggYSBiZXR0ZXIg
dmFyaWFibGUgbmFtZS4NCj4gPiBXaGljaCBjb2RlIGV4YWN0bHkgaXMgdXNp
bmcgaXQ/DQo+IA0KPiBBcmNoIGluZm9ybWF0aW9uIGlzIG5lY2Vzc2FyeSBm
b3IgcnBtLiBBcyB3aGF0IGRvIGZvciBkbmYtbmF0aXZlIGluDQo+IF9jb25m
aWd1cmVfcnBtIGZ1bmN0aW9uLCBuYXRpdmVzZGstZG5mIGhhcyB0byBkbyB0
aGUgc2FtZSB3b3JrLg0KPiBCdXQgdGhlIGVudmlyb25tZW50IGZvciBuYXRp
dmVzZGsgZG9lc24ndCBzdXBwbHkgYXJjaCBpbmZvcm1hdGlvbi4gSSB0aGlu
aw0KPiBNQUNISU5FX0FSQ0ggaXMgc3VpdGFibGUgdG8gc3VwcGx5IGFyY2gg
aW5mb3JtYXRpb24gZm9yIG5hdGl2ZXNkay4NCj4gSG93IGFib3V0IHlvdXIg
T3Bpbmlvbj8NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBMZWkNCj4gDQo+IA0K
PiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gPiBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+ID4g
U2VudDogVHVlc2RheSwgSnVuZSAwNCwgMjAxOSA2OjI2IFBNDQo+ID4gVG86
IExlaSwgTWFvaHVpDQo+ID4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gdG9vbGNoYWluLXNjcmlwdHM6IG1ha2UgcnBtIHdvcmsgaW4g
dG9vbGNoYWluDQo+ID4NCj4gPiBPbiBUdWUsIDIwMTktMDYtMDQgYXQgMDg6
MjkgKzAwMDAsIExlaSwgTWFvaHVpIHdyb3RlOg0KPiA+ID4gSGkgUmljaGFy
ZA0KPiA+ID4NCj4gPiA+IFRoaXMgcGF0Y2ggaXMgbmVjZXNzYXJ5IGZvciBk
bmYtbmF0aXZlc2RrIHdoaWNoIGhhcyBiZWVuIG1lcmdlZC4gQnV0DQo+ID4g
PiB0aGlzIHBhdGNoIGlzIHN0aWxsIGlnbm9yZWQuDQo+ID4gPiBEbyB5b3Ug
aGF2ZSBhbnkgY29tbWVudCBhYm91dCB0aGlzIHBhdGNoPw0KPiA+DQo+ID4g
QmFzaWNhbGx5IEkgcmVhbGx5IGRvbid0IGxpa2UgZXhwb3J0aW5nICJyYW5k
b20iIHZhcmlhYmxlcyBpbiB0aGUgU0RLLA0KPiA+IHBhcnRpY3VsYXJseSB3
aGVuIHRoZSBtZWFuaW5nL3VzZSBvZiB0aGVtIGlzbid0IGNsZWFyLg0KPiA+
DQo+ID4gV2hpbHN0IEkgY2FuIGd1ZXNzIHdoeSwgaXRzIG5vdCBvYnZpb3Vz
IGF0IGFsbCB0aGUgZG5mIG5lZWRzDQo+ID4gTUFDSElORV9BUkNILiBJJ2Qg
cHJvYmFibHkgYmUgaGFwcGllciB3aXRoIGEgYmV0dGVyIHZhcmlhYmxlIG5h
bWUuDQo+ID4gV2hpY2ggY29kZSBleGFjdGx5IGlzIHVzaW5nIGl0Pw0KPiA+
DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0KPiA+DQo+ID4NCj4g
DQo+IA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFp
bGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KCgo=

