Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA03752F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 01:21:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41216394"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2018 09:21:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DCBF4B41E95;
	Tue, 19 Jun 2018 09:21:43 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0399.000; Tue, 19 Jun 2018 09:21:48 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] Fix build error when enable archiver.
Thread-Index: AQHUA84oae2KFu6+fkyEyFQqCqwCmaRmzkJA
Date: Tue, 19 Jun 2018 01:21:48 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD0170F9CEB8@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527973443-39251-1-git-send-email-leimaohui@cn.fujitsu.com>
	<afabcbb9e34e435d8beba477ed3b51ba@XBOX02.axis.com>
In-Reply-To: <afabcbb9e34e435d8beba477ed3b51ba@XBOX02.axis.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.27]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 6DCBF4B41E95.ABF3B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] Fix build error when enable archiver.
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
X-List-Received-Date: Tue, 19 Jun 2018 01:21:46 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgUGV0ZXINCg0KPiBUaGlzIGNhbm5vdCBiZSBjb3JyZWN0LiBJZiBJIGFt
IG5vdCBtaXN0YWtlbiwgdGhlbiB0aGlzIHdvdWxkDQo+IGVmZmVjdGl2ZWx5
IGRpc2FibGUgdGhlIGFyY2hpdmVyIGNsYXNzIGZyb20gb3V0cHV0dGluZyBh
bnl0aGluZyBmb3INCj4gbmF0aXZlIHBhY2thZ2VzLg0KDQpJIGRvbid0IHRo
aW5rIHRoZXJlIGlzIGFueSBuZWNlc3NhcnkgdG8gY3JlYXRlIGFyY2hpdmVy
IGZvciB4eC1uYXRpdmUgYXMgc2FtZSBhcyBubyBuZWVkIHRvIGNyZWF0ZSBw
YWNrYWdlcyBmb3IgeHgtbmF0aXZlLg0KeHgtbmF0aXZlIGlzIG9ubHkgdXNl
ZnVsIG9uIGJ1aWxkIHN5c3RlbSwgaXQgaXMgbm90IG91dGNvbWUgb2YgYnVp
bGQgc3lzdGVtLg0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgS2plbGxlcnN0
ZWR0IFttYWlsdG86cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tXQ0KPiBT
ZW50OiBUaHVyc2RheSwgSnVuZSAxNCwgMjAxOCA2OjU1IFBNDQo+IFRvOiBM
ZWksIE1hb2h1aTsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSRTogW09FLWNvcmVdIFtQQVRDSF0gRml4
IGJ1aWxkIGVycm9yIHdoZW4gZW5hYmxlIGFyY2hpdmVyLg0KPiANCj4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IG9wZW5lbWJl
ZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+
IFttYWlsdG86b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gPiBMZWkgTWFvaHVpDQo+
ID4gU2VudDogZGVuIDIganVuaSAyMDE4IDIzOjA0DQo+ID4gVG86IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJq
ZWN0OiBbT0UtY29yZV0gW1BBVENIXSBGaXggYnVpbGQgZXJyb3Igd2hlbiBl
bmFibGUgYXJjaGl2ZXIuDQo+ID4NCj4gPiBUaGUgZXJyb3IgaXMgYXMgZmxs
b3dpbmc6DQo+ID4gRVJST1I6IFRhc2sgZG9fZGVwbG95X2FyY2hpdmVzIGlu
DQo+ID4gdmlydHVhbDpuYXRpdmU6L3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL25ld3QvbGlibmV3dF8wLjUyLjIwLmJiDQo+IGRlcGVuZHMg
dXBvbiBub24tZXhpc3RlbnQgdGFzaw0KPiA+IGRvX3BhY2thZ2Vfd3JpdGVf
cnBtIGluIHZpcnR1YWw6bmF0aXZlOi95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy0NCj4gZXh0ZW5kZWQvbmV3dC9saWJuZXd0XzAuNTIuMjAuYmINCj4gPiBF
UlJPUjogQ29tbWFuZCBleGVjdXRpb24gZmFpbGVkOiAxDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRz
dS5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvY2xhc3Nlcy9ub3BhY2thZ2Vz
LmJiY2xhc3MgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL25v
cGFja2FnZXMuYmJjbGFzcw0KPiBiL21ldGEvY2xhc3Nlcy9ub3BhY2thZ2Vz
LmJiY2xhc3MNCj4gPiBpbmRleCA1NTlmNTA3Li5kOWRkZmFjIDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9ub3BhY2thZ2VzLmJiY2xhc3MNCj4g
PiArKysgYi9tZXRhL2NsYXNzZXMvbm9wYWNrYWdlcy5iYmNsYXNzDQo+ID4g
QEAgLTEwLDMgKzEwLDQgQEAgZGVsdGFzayBkb19wYWNrYWdlX3dyaXRlX2lw
a19zZXRzY2VuZQ0KPiA+ICBkZWx0YXNrIGRvX3BhY2thZ2Vfd3JpdGVfZGVi
X3NldHNjZW5lDQo+ID4gIGRlbHRhc2sgZG9fcGFja2FnZV9xYV9zZXRzY2Vu
ZQ0KPiA+ICBkZWx0YXNrIGRvX3BhY2thZ2VkYXRhX3NldHNjZW5lDQo+ID4g
K2RlbHRhc2sgZG9fZGVwbG95X2FyY2hpdmVzDQo+ID4gLS0NCj4gPiAxLjku
MQ0KPiANCj4gVGhpcyBjYW5ub3QgYmUgY29ycmVjdC4gSWYgSSBhbSBub3Qg
bWlzdGFrZW4sIHRoZW4gdGhpcyB3b3VsZA0KPiBlZmZlY3RpdmVseSBkaXNh
YmxlIHRoZSBhcmNoaXZlciBjbGFzcyBmcm9tIG91dHB1dHRpbmcgYW55dGhp
bmcgZm9yDQo+IG5hdGl2ZSBwYWNrYWdlcy4NCj4gDQo+IC8vUGV0ZXINCj4g
DQo+IA0KDQoKCg==

