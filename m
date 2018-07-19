Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E5EDF7456F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:37:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42417268"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jul 2018 17:37:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 26ACA4B5CF63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:37:52 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0399.000; Thu, 19 Jul 2018 17:37:51 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Fix build error when enable archiver.
Thread-Index: AQHUB2v224ohvKxJWUWzcm4CoAkPLKSWeRXg
Date: Thu, 19 Jul 2018 09:37:57 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01945596C9@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527973443-39251-1-git-send-email-leimaohui@cn.fujitsu.com>
	<afabcbb9e34e435d8beba477ed3b51ba@XBOX02.axis.com>
	<1B56A49860EB2D45ADE3731B15C959FD0170F9CEB8@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD0170F9CEB8@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 26ACA4B5CF63.AAF96
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
X-List-Received-Date: Thu, 19 Jul 2018 09:37:55 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC0NCj4gY29yZS1ib3VuY2VzQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBMZWksIE1hb2h1
aQ0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDE5LCAyMDE4IDk6MjIgQU0NCj4g
VG86IFBldGVyIEtqZWxsZXJzdGVkdDsgb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gRml4IGJ1aWxkIGVycm9yIHdoZW4gZW5hYmxlIGFyY2hpdmVy
Lg0KPiANCj4gSGkgUGV0ZXINCj4gDQo+ID4gVGhpcyBjYW5ub3QgYmUgY29y
cmVjdC4gSWYgSSBhbSBub3QgbWlzdGFrZW4sIHRoZW4gdGhpcyB3b3VsZA0K
PiA+IGVmZmVjdGl2ZWx5IGRpc2FibGUgdGhlIGFyY2hpdmVyIGNsYXNzIGZy
b20gb3V0cHV0dGluZyBhbnl0aGluZyBmb3INCj4gPiBuYXRpdmUgcGFja2Fn
ZXMuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSBuZWNlc3Nh
cnkgdG8gY3JlYXRlIGFyY2hpdmVyIGZvciB4eC1uYXRpdmUgYXMgc2FtZQ0K
PiBhcyBubyBuZWVkIHRvIGNyZWF0ZSBwYWNrYWdlcyBmb3IgeHgtbmF0aXZl
Lg0KPiB4eC1uYXRpdmUgaXMgb25seSB1c2VmdWwgb24gYnVpbGQgc3lzdGVt
LCBpdCBpcyBub3Qgb3V0Y29tZSBvZiBidWlsZCBzeXN0ZW0uDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMNCj4gTGVpDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCBb
bWFpbHRvOnBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbV0NCj4gPiBTZW50
OiBUaHVyc2RheSwgSnVuZSAxNCwgMjAxOCA2OjU1IFBNDQo+ID4gVG86IExl
aSwgTWFvaHVpOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+ID4gU3ViamVjdDogUkU6IFtPRS1jb3JlXSBbUEFUQ0hdIEZp
eCBidWlsZCBlcnJvciB3aGVuIGVuYWJsZSBhcmNoaXZlci4NCj4gPg0KPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IG9w
ZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiA+ID4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiA+ID4gTGVp
IE1hb2h1aQ0KPiA+ID4gU2VudDogZGVuIDIganVuaSAyMDE4IDIzOjA0DQo+
ID4gPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+ID4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRDSF0gRml4IGJ1
aWxkIGVycm9yIHdoZW4gZW5hYmxlIGFyY2hpdmVyLg0KPiA+ID4NCj4gPiA+
IFRoZSBlcnJvciBpcyBhcyBmbGxvd2luZzoNCj4gPiA+IEVSUk9SOiBUYXNr
IGRvX2RlcGxveV9hcmNoaXZlcyBpbg0KPiA+ID4gdmlydHVhbDpuYXRpdmU6
L3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL25ld3QvbGlibmV3
dF8wLjUyLjIwLmJiDQo+ID4gZGVwZW5kcyB1cG9uIG5vbi1leGlzdGVudCB0
YXNrDQo+ID4gPiBkb19wYWNrYWdlX3dyaXRlX3JwbSBpbiB2aXJ0dWFsOm5h
dGl2ZToveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtDQo+ID4gZXh0ZW5kZWQv
bmV3dC9saWJuZXd0XzAuNTIuMjAuYmINCj4gPiA+IEVSUk9SOiBDb21tYW5k
IGV4ZWN1dGlvbiBmYWlsZWQ6IDENCj4gPiA+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+ICBtZXRhL2NsYXNzZXMvbm9wYWNrYWdlcy5iYmNs
YXNzIHwgMSArDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9u
b3BhY2thZ2VzLmJiY2xhc3MNCj4gPiBiL21ldGEvY2xhc3Nlcy9ub3BhY2th
Z2VzLmJiY2xhc3MNCj4gPiA+IGluZGV4IDU1OWY1MDcuLmQ5ZGRmYWMgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMvbm9wYWNrYWdlcy5iYmNs
YXNzDQo+ID4gPiArKysgYi9tZXRhL2NsYXNzZXMvbm9wYWNrYWdlcy5iYmNs
YXNzDQo+ID4gPiBAQCAtMTAsMyArMTAsNCBAQCBkZWx0YXNrIGRvX3BhY2th
Z2Vfd3JpdGVfaXBrX3NldHNjZW5lDQo+ID4gPiAgZGVsdGFzayBkb19wYWNr
YWdlX3dyaXRlX2RlYl9zZXRzY2VuZQ0KPiA+ID4gIGRlbHRhc2sgZG9fcGFj
a2FnZV9xYV9zZXRzY2VuZQ0KPiA+ID4gIGRlbHRhc2sgZG9fcGFja2FnZWRh
dGFfc2V0c2NlbmUNCj4gPiA+ICtkZWx0YXNrIGRvX2RlcGxveV9hcmNoaXZl
cw0KPiA+ID4gLS0NCj4gPiA+IDEuOS4xDQo+ID4NCj4gPiBUaGlzIGNhbm5v
dCBiZSBjb3JyZWN0LiBJZiBJIGFtIG5vdCBtaXN0YWtlbiwgdGhlbiB0aGlz
IHdvdWxkDQo+ID4gZWZmZWN0aXZlbHkgZGlzYWJsZSB0aGUgYXJjaGl2ZXIg
Y2xhc3MgZnJvbSBvdXRwdXR0aW5nIGFueXRoaW5nIGZvcg0KPiA+IG5hdGl2
ZSBwYWNrYWdlcy4NCj4gPg0KPiA+IC8vUGV0ZXINCj4gPg0KPiA+DQo+IA0K
PiANCj4gDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxp
bmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCgoK

