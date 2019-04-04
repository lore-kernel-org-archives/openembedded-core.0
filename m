Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 712FC7C749
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 14:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A8629186C0;
	Thu,  4 Apr 2019 16:08:27 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iEEhPV5HptJx; Thu,  4 Apr 2019 16:08:26 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5EF8418348;
	Thu,  4 Apr 2019 16:08:26 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A2B81E077;
	Thu,  4 Apr 2019 16:08:26 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E72C1E05C;
	Thu,  4 Apr 2019 16:08:26 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu,  4 Apr 2019 16:08:26 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 321702656;
	Thu,  4 Apr 2019 16:08:26 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 4 Apr 2019 16:08:25 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 4 Apr 2019 16:08:25 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] useradd.bbclass: Make sure users/groups exist
	for package_write_* tasks
Thread-Index: AQHU6ht5rKnZdMrgykStWNHqqyp4A6YsCYBw
Date: Thu, 4 Apr 2019 14:08:25 +0000
Message-ID: <4788506b5c7f4fb4a369916b5500c373@XBOX04.axis.com>
References: <20190403122626.18451-1-pkj@axis.com>
	<866ba68abe94b19205b70f59a512c68ef65b79a1.camel@linuxfoundation.org>
In-Reply-To: <866ba68abe94b19205b70f59a512c68ef65b79a1.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] useradd.bbclass: Make sure users/groups exist for package_write_* tasks
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
X-List-Received-Date: Thu, 04 Apr 2019 14:08:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDMgYXByaWwgMjAx
OSAxNDo0OA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdXNlcmFkZC5iYmNsYXNzOiBNYWtlIHN1cmUg
dXNlcnMvZ3JvdXBzDQo+IGV4aXN0IGZvciBwYWNrYWdlX3dyaXRlXyogdGFza3MNCj4gDQo+IE9u
IFdlZCwgMjAxOS0wNC0wMyBhdCAxNDoyNiArMDIwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3Rl
Og0KPiA+IElmIHRoZSBwb3B1bGF0ZV9saWMgdGFzayBhbmQgYW55IG9mIHRoZSBwYWNrYWdlX3dy
aXRlXyogdGFza3MgbmVlZCB0bw0KPiA+IHJ1biwgYnV0IHRoZSBwYWNrYWdlIHRhc2sgY2FuIGJl
IHJlc3RvcmVkIGZyb20gdGhlIHNzdGF0ZSBjYWNoZSwgdGhlbg0KPiA+IHRoZSBmZXRjaCB0YXNr
LCB3aGljaCBpcyBhIGRlcGVuZGVuY3kgb2YgcG9wdWxhdGVfbGljLCB3aWxsIHdpcGUgb3V0DQo+
ID4gdGhlIFJTUyBpbmNsdWRpbmcgYW55IHVzZXJzL2dyb3VwcyB0aGF0IGhhdmUgYmVlbiBjcmVh
dGVkLiBUaGlzDQo+ID4gcmVzdWx0cyBpbiB0aGF0IHRoZSBwYWNrYWdlX3dyaXRlXyogdGFza3Mg
YXJlIHJ1biB3aXRob3V0IGFueQ0KPiA+IHVzZXIvZ3JvdXAgaW5mb3JtYXRpb24sIHdoaWNoIGNh
dXNlcyB0aGVtIHRvIGZhbGxiYWNrIHRvIGVpdGhlciB1c2UNCj4gPiB0aGUgcm9vdCB1c2VyIGZv
ciBhbnkgdW5rbm93biB1c2Vycy9ncm91cHMgKHJwbSkgb3IgdG8gdXNlIHRoZSBudW1lcmljDQo+
ID4gVUlEcy9HSURzIChkZWIvaXBrKS4gTmVpdGhlciBzb2x1dGlvbiB3aWxsIHlpZWxkIGNvcnJl
Y3QgcGFja2FnZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQg
PHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jbGFzc2Vz
L3VzZXJhZGQuYmJjbGFzcyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9tZXRhL2NsYXNzZXMvdXNlcmFkZC5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3VzZXJhZGQu
YmJjbGFzcw0KPiA+IGluZGV4IDEyNGJlY2QwODIuLmUzMjMxNWExYWYgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS9jbGFzc2VzL3VzZXJhZGQuYmJjbGFzcw0KPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy91
c2VyYWRkLmJiY2xhc3MNCj4gPiBAQCAtNCw3ICs0LDcgQEAgaW5oZXJpdCB1c2VyYWRkX2Jhc2UN
Cj4gPiAgIyB0YXJnZXQgc3lzcm9vdCwgYW5kIHNoYWRvdyAtbmF0aXZlIGFuZCAtc3lzcm9vdCBw
cm92aWRlIHRoZSB1dGlsaXRpZXMNCj4gPiAgIyBhbmQgc3VwcG9ydCBmaWxlcyBuZWVkZWQgdG8g
YWRkIGFuZCBtb2RpZnkgdXNlciBhbmQgZ3JvdXAgYWNjb3VudHMNCj4gPiAgREVQRU5EU19hcHBl
bmRfY2xhc3MtdGFyZ2V0ID0gIiBiYXNlLWZpbGVzIHNoYWRvdy1uYXRpdmUgc2hhZG93LXN5c3Jv
b3Qgc2hhZG93IGJhc2UtcGFzc3dkIg0KPiA+IC1QQUNLQUdFX1dSSVRFX0RFUFMgKz0gInNoYWRv
dy1uYXRpdmUiDQo+ID4gK1BBQ0tBR0VfV1JJVEVfREVQUyArPSAic2hhZG93LW5hdGl2ZSBzaGFk
b3ctc3lzcm9vdCBiYXNlLXBhc3N3ZCINCj4gPg0KPiA+ICAjIFRoaXMgcHJlaW5zdGFsbCBmdW5j
dGlvbiBjYW4gYmUgcnVuIGluIGZvdXIgZGlmZmVyZW50IGNvbnRleHRzOg0KPiA+ICAjDQo+ID4g
QEAgLTE0NCw3ICsxNDQsMTAgQEAgcHl0aG9uIHVzZXJhZGRfc3lzcm9vdF9zc3RhdGUgKCkgew0K
PiA+ICAgICAgdGFzayA9IGQuZ2V0VmFyKCJCQl9DVVJSRU5UVEFTSyIpDQo+ID4gICAgICBpZiB0
YXNrID09ICJwYWNrYWdlX3NldHNjZW5lIjoNCj4gPiAgICAgICAgICBiYi5idWlsZC5leGVjX2Z1
bmMoInVzZXJhZGRfc3lzcm9vdCIsIGQpDQo+ID4gLSAgICBlbGlmIHRhc2sgPT0gInByZXBhcmVf
cmVjaXBlX3N5c3Jvb3QiOg0KPiA+ICsgICAgZWxpZiAodGFzayA9PSAicHJlcGFyZV9yZWNpcGVf
c3lzcm9vdCIgb3INCj4gPiArICAgICAgICAgIHRhc2sgPT0gInBhY2thZ2Vfd3JpdGVfZGViIiBv
cg0KPiA+ICsgICAgICAgICAgdGFzayA9PSAicGFja2FnZV93cml0ZV9pcGsiIG9yDQo+ID4gKyAg
ICAgICAgICB0YXNrID09ICJwYWNrYWdlX3dyaXRlX3JwbSIpOg0KPiA+ICAgICAgICAgICMgVXNl
ZCB0byB1cGRhdGUgdGhpcyByZWNpcGUncyBvd24gc3lzcm9vdCBzbyB0aGUgdXNlci9ncm91cHMg
YXJlIGF2YWlsYWJsZSB0byBkb19pbnN0YWxsDQo+ID4gICAgICAgICAgc2NyaXB0ZmlsZSA9IGQu
ZXhwYW5kKCIke1JFQ0lQRV9TWVNST09UfSR7YmluZGlyfS9wb3N0aW5zdC11c2VyYWRkLSR7UE59
IikNCj4gPiAgICAgICAgICBiYi5idWlsZC5leGVjX2Z1bmMoInVzZXJhZGRfc3lzcm9vdCIsIGQp
DQo+ID4gQEAgLTE2MSwxMyArMTY0LDE2IEBAIHB5dGhvbiB1c2VyYWRkX3N5c3Jvb3Rfc3N0YXRl
ICgpIHsNCj4gPiAgICAgICAgICBvcy5jaG1vZChzY3JpcHRmaWxlLCAwbzc1NSkNCj4gPiAgfQ0K
PiA+DQo+ID4gLWRvX3ByZXBhcmVfcmVjaXBlX3N5c3Jvb3RbcG9zdGZ1bmNzXSArPSAiJHtTWVNS
T09URlVOQ30iDQo+ID4gLVNZU1JPT1RGVU5DX2NsYXNzLXRhcmdldCA9ICJ1c2VyYWRkX3N5c3Jv
b3Rfc3N0YXRlIg0KPiA+ICBTWVNST09URlVOQyA9ICIiDQo+ID4gK1NZU1JPT1RGVU5DX2NsYXNz
LXRhcmdldCA9ICJ1c2VyYWRkX3N5c3Jvb3Rfc3N0YXRlIg0KPiA+DQo+ID4gLVNZU1JPT1RfUFJF
UFJPQ0VTU19GVU5DUyArPSAiJHtTWVNST09URlVOQ30iDQo+ID4gK2RvX3ByZXBhcmVfcmVjaXBl
X3N5c3Jvb3RbcG9zdGZ1bmNzXSArPSAiJHtTWVNST09URlVOQ30iDQo+ID4gK2RvX3BhY2thZ2Vf
d3JpdGVfZGViW3ByZWZ1bmNzXSArPSAiJHtTWVNST09URlVOQ30iDQo+ID4gK2RvX3BhY2thZ2Vf
d3JpdGVfaXBrW3ByZWZ1bmNzXSArPSAiJHtTWVNST09URlVOQ30iDQo+ID4gK2RvX3BhY2thZ2Vf
d3JpdGVfcnBtW3ByZWZ1bmNzXSArPSAiJHtTWVNST09URlVOQ30iDQo+ID4NCj4gPiAtU1NUQVRF
UFJFSU5TVEZVTkNTX2FwcGVuZF9jbGFzcy10YXJnZXQgPSAiIHVzZXJhZGRfc3lzcm9vdF9zc3Rh
dGUiDQo+ID4gK1NZU1JPT1RfUFJFUFJPQ0VTU19GVU5DUyArPSAiJHtTWVNST09URlVOQ30iDQo+
ID4gK1NTVEFURVBSRUlOU1RGVU5DUyArPSAiJHtTWVNST09URlVOQ30iDQo+ID4NCj4gPiAgZG9f
cGFja2FnZV9zZXRzY2VuZVtkZXBlbmRzXSArPSAiJHtVU0VSQUREU0VUU0NFTkVERVBTfSINCj4g
PiAgZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZVtkZXBlbmRzXSArPSAiJHtVU0VSQUREU0VU
U0NFTkVERVBTfSINCj4gDQo+IFRoaXMgbWF5IGJlIGEgYmlnZ2VyIHByb2JsZW0gdGhhdCBqdXN0
IHBhY2thZ2Vfd3JpdGVfKi4NCj4gDQo+IFRoaXMgZmVlbHMgbGlrZSBhIGJhZCB0aGluZyB0byBk
byBzaW5jZSB0aGVyZSBtYXkgYmUgb3RoZXIgdGFza3Mgd2hpY2gNCj4gYWxzbyByZWx5IG9uIHRo
ZSB1c2VyIGluZm9ybWF0aW9uIGJlaW5nIHByZXNlbnQuIFRoaXMgcHJvYmFibHkgb25seQ0KPiBm
aXhlcyBvbmUgY29ybmVyIGNhc2UgYnV0IHRoZXJlIGFyZSBsaWtleSBvdGhlcnMgOiguDQo+IA0K
PiBQb3NzaWJsZSBzb2x1dGlvbnMgbWlnaHQgYmU6DQo+IA0KPiBhKSBUbyB3aXBlIG91dCBhbGwg
c3N0YXRlIHRhc2tzIGlmIHdlJ3JlIHJlcnVubmluZyBkb19mZXRjaA0KDQpIb3cgdG8gZG8gdGhh
dD8gV2l0aCBzb21lIHBvaW50ZXJzIEkgaG9wZSBJIGNhbiB3aGlwIHVwIGEgcGF0Y2ggDQp0byBk
byB0aGlzIGluc3RlYWQuDQoNCklzIHRoaXMgcmFyZSBvciBpcyBpdCBsaWtlbHkgdG8gY2F1c2Ug
YSBwZXJmb3JtYW5jZSBpbXBhY3Q/DQpJZiBpdCBvbmx5IGhhcHBlbnMgaW4gdGhlIGNhc2VzIHdo
ZXJlIHdlIGFyZSBzZWVpbmcgcHJvYmxlbXMgZHVlIHRvIA0KdGhlIHJlbW92ZWQgdXNlci9ncm91
cCBpbmZvLCB0aGVuIGl0IHNob3VsZCBiZSByZWFzb25hYmx5IHJhcmUuDQoNCj4gYikgUHJlc2Vy
dmUgdGhlIHVzZXIvZ3JvdXAgaW5mb3JtYXRpb24gYXJvdW5kIHRoZSBjbGVhbmluZyBvZiB0aGUN
Cj4gc3lzcm9vdA0KDQpUaGlzIHNvdW5kcyBlcnJvciBwcm9uZSBhdCBiZXN0Li4uDQoNCj4gSSB0
aGluayB3ZSBtYXkgbmVlZCB0byBmaXggdGhpcyBnZW5lcmljYWxseS4uLg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

