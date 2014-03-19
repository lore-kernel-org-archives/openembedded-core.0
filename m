Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD3FB6E938
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 12:23:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2014 05:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,685,1389772800"; d="scan'208";a="503005181"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2014 05:23:42 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.87]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.224]) with mapi id
	14.03.0123.003; Wed, 19 Mar 2014 12:23:38 +0000
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "sgw@linux.intel.com" <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] testimage: dont use DNS lookup for qemu
	based testimages
Thread-Index: AQHPQ24OkQsPKwtM8EqO90p1cx8Drw==
Date: Wed, 19 Mar 2014 12:23:37 +0000
Message-ID: <1395231830.31252.10.camel@firebird.rb.intel.com>
References: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.154]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] testimage: dont use DNS lookup for qemu based testimages
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
X-List-Received-Date: Wed, 19 Mar 2014 12:23:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EA3CCA19E4AEB45BF0BB872B25DFB17@intel.com>
Content-Transfer-Encoding: base64

DQoNCg0KT24gVHVlLCAyMDE0LTAzLTE4IGF0IDE3OjMxIC0wNzAwLCBTYXVsIFdvbGQgd3JvdGU6
DQo+IFNpZ25lZC1vZmYtYnk6IFNhdWwgV29sZCA8c2d3QGxpbnV4LmludGVsLmNvbT4NCj4gLS0t
DQo+ICBtZXRhL2NsYXNzZXMvdGVzdGltYWdlLmJiY2xhc3MgfCAxMCArKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEv
Y2xhc3Nlcy90ZXN0aW1hZ2UuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy90ZXN0aW1hZ2UuYmJjbGFz
cw0KPiBpbmRleCA2OTFjN2Y2Li5lZTAyOGUxIDEwMDY0NA0KPiAtLS0gYS9tZXRhL2NsYXNzZXMv
dGVzdGltYWdlLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzL3Rlc3RpbWFnZS5iYmNsYXNz
DQo+IEBAIC00NSw2ICs0NSwxNiBAQCBURVNUSU1BR0VERVBFTkRTX3FlbXVhbGwgPSAicWVtdS1u
YXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCBxZW11LWhlbHBlci1uYXRpdmU6ZA0KPiAgVEVTVElN
QUdFTE9DSyA9ICIke1RNUERJUn0vdGVzdGltYWdlLmxvY2siDQo+ICBURVNUSU1BR0VMT0NLX3Fl
bXVhbGwgPSAiIg0KPiAgDQo+ICtJTUFHRV9QT1NUUFJPQ0VTU19DT01NQU5EX3FlbXVhbGwgKz0g
ImZpeF9kbnNfbG9va3VwX2Zvcl9xZW11Ig0KPiArDQoNCkkgbWlnaHQgYmUgd3JvbmcsIGJ1dCB0
aGlzIHdvbid0IGhhdmUgYW55IGVmZmVjdCB3aXRoIHRoZSBkZWZhdWx0DQoobWFudWFsKSB3YXkg
d2UgdXNlIHRlc3RpbWFnZS4gVGhlIHRlc3RpbWFnZSBjbGFzcyBpc24ndCBpbiB0aGUgZ2xvYmFs
DQppbmhlcml0LCBzbyB0aGF0ICBJTUFHRV9QT1NUUFJPQ0VTU19DT01NQU5EIHdvbid0IHJ1biBh
cyB0aGUgaW1hZ2UgaXNuJ3QNCnJlY29uc3RydWN0ZWQuDQoNClRoZSBBQiBkb2VzOiBiaXRiYWtl
IGNvcmUtaW1hZ2Utc2F0byBvbiBvbmUgc3RlcCBhbmQgdGhlbiBhZGRzIElOSEVSSVQNCis9InRl
c3RpbWFnZSIgaW4gbG9jYWwuY29uZiBpbiB0aGUgbmV4dCBzdGVwIGFuZCBydW5zIGJpdGJha2UN
CmNvcmUtaW1hZ2Utc2F0byAtYyB0ZXN0aW1hZ2UsIG5vIG1vcmUgZG9fcm9vdGZzIGhlcmUuDQoN
CkFzIGl0IHRoaXMgaXQgd2lsbCBvbmx5IHdvcmsgd2l0aCB0ZXN0aW1hZ2UtYXV0byB3aGVuIHlv
dSBoYXZlDQpURVNUX0lNQUdFPSIxIiBpbiBsb2NhbC5jb25mIGluIHRoZSBmaXJzdCBidWlsZCBz
dGVwIHNvIHlvdSBvbmx5IG5lZWQgdG8NCmRvIGJpdGJha2UgY29yZS1pbWFnZS1zYXRvIGFuZCBk
b190ZXN0aW1hZ2UgZ2V0cyBydW4gYWZ0ZXIgZG9fcm9vdGZzLA0KYnV0IHdlIGRvbid0IHVzZSB0
aGlzLiBBbmQgdGhlIGZpeCBzaG91bGQgd29yayBmb3IgcnVubmluZyB0aGUgdGFzaw0KbWFudWFs
bHkgdG9vLg0KDQpJIGxpa2VkIHYxLCBJIGRvbid0IHJlYWxseSBzZWUgd2hhdCB0aGUgcHJvYmxl
bSB3YXMgdGhlcmUuIE5vIG1hdHR0ZXINCnRoZSB3YXkgeW91IHJ1biBvdXIgcWVtdSBpbWFnZXMs
IHlvdSBzdGlsbCBoYXZlIHRvIHNldCBhIHByb3BlciBETlMsIGFuZA0KaGF2ZSBuZXR3b3JrIGNv
bm5lY3Rpdml0eSBpbiB0aGUgaW1hZ2UgKHdoaWNoIHVzdWFsbHkgaW52b2x2ZXMgdGhlIGhvc3QN
CnRvbykgc28gZGVmYXVsdGluZyB0byBVc2VETlMgbm8gZm9yIHFlbXUgaW1hZ2VzIHNlZW1zIGEg
c2Vuc2libGUgZGVmYXVsdA0KdG8gbWUuDQoNCkNoZWVycywNClN0ZWZhbg0KDQo+ICtmaXhfZG5z
X2xvb2t1cF9mb3JfcWVtdSgpIHsNCj4gKwlpZiBbIC1lICR7SU1BR0VfUk9PVEZTfSR7c3lzY29u
ZmRpcn0vc3NoL3NzaGRfY29uZmlnIF07IHRoZW4NCj4gKwkJc2VkIC1pIC1lICdzOiNVc2VETlMg
eWVzOlVzZUROUyBubzonICR7SU1BR0VfUk9PVEZTfSR7c3lzY29uZmRpcn0vc3NoL3NzaGRfY29u
ZmlnDQo+ICsJZmkNCj4gK30NCj4gKw0KPiArRVhQT1JUX0ZVTkNUSU9OUyBmaXhfZG5zX2xvb2t1
cF9mb3JfcWVtdQ0KPiArDQo+ICBweXRob24gZG9fdGVzdGltYWdlKCkgew0KPiAgICAgIHRlc3Rp
bWFnZV9tYWluKGQpDQo+ICB9DQo+IC0tIA0KPiAxLjguMy4xDQo+IA0KDQo=

