Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 200B67E555
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 00:18:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2019 17:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="356285789"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by orsmga005.jf.intel.com with ESMTP; 28 Aug 2019 17:18:53 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.232]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.22]) with mapi id
	14.03.0439.000; Thu, 29 Aug 2019 08:18:52 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH 5/8] perf: change dependencies on python to
	python3
Thread-Index: AQHVXdb8tO+oFskNrkaWxrxT2D6PyKcQt+gAgAADkQCAAAFmAA==
Date: Thu, 29 Aug 2019 00:18:51 +0000
Message-ID: <390a239da98f0f9013f9d32726354958620baf68.camel@intel.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<c1bffa0ef4621c96d200e8ed14fd818d97b41677.1567019771.git.bruce.ashfield@gmail.com>
	<8664f9ff7f4a8463b16d3d17d213ad3375798ea8.camel@intel.com>
	<CADkTA4O_39fPJYD1DmiVVUL4GguyjqYG6VUct330GtzDnSezow@mail.gmail.com>
In-Reply-To: <CADkTA4O_39fPJYD1DmiVVUL4GguyjqYG6VUct330GtzDnSezow@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.199.133]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] perf: change dependencies on python to python3
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
X-List-Received-Date: Thu, 29 Aug 2019 00:18:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4458A9ECB773E245ACA87D37A6473194@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTA4LTI4IGF0IDIwOjEzIC0wNDAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4gPiBPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCA4OjAxIFBNIE1pdHRhbCwgQW51aiA8YW51ai5t
aXR0YWxAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gVGhpcyBpcyBjYXVzaW5nIGZhaWx1cmUgZm9y
IDUuMCBrZXJuZWxzIHByb2JhYmx5IGJlY2F1c2UgdGhlIGF0dHIucHkNCj4gPiBweXRob24gLT4g
cHl0aG9uMyBjaGFuZ2VzIGFyZSBub3QgdGhlcmUgLi4uDQo+ID4gDQo+ID4gRVJST1I6IHBlcmYt
MS4wLXI5IGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOiAvdXNyL2xpYmV4ZWMvcGVyZi0NCj4gPiBj
b3JlL3Rlc3RzL2F0dHIucHkgY29udGFpbmVkIGluIHBhY2thZ2UgcGVyZi10ZXN0cyByZXF1aXJl
cw0KPiA+IC91c3IvYmluL3B5dGhvbiwgYnV0IG5vIHByb3ZpZGVycyBmb3VuZCBpbiBSREVQRU5E
U19wZXJmLXRlc3RzPw0KPiA+IFtmaWxlLQ0KPiA+IHJkZXBzXQ0KPiA+IEVSUk9SOiBwZXJmLTEu
MC1yOSBkb19wYWNrYWdlX3FhOiBRQSBydW4gZm91bmQgZmF0YWwgZXJyb3JzLiBQbGVhc2UNCj4g
PiBjb25zaWRlciBmaXhpbmcgdGhlbS4NCj4gPiBFUlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0
b3JlZCBpbjogL2hvbWUvcG9reWJ1aWxkL3lvY3RvLQ0KPiA+IHdvcmtlci9nZW5lcmljeDg2L2J1
aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWN4ODYtcG9reS0NCj4gPiBsaW51eC9wZXJmLzEuMC0N
Cj4gPiByOS90ZW1wL2xvZy5kb19wYWNrYWdlX3FhLjM2Mjg0DQo+ID4gTk9URTogcmVjaXBlIHBl
cmYtMS4wLXI5OiB0YXNrIGRvX3BhY2thZ2VfcWE6IEZhaWxlZA0KPiA+IA0KPiA+IGh0dHBzOi8v
YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNDgvYnVpbGRz
Lzk3NS9zdGVwcy84L2xvZ3Mvc3RlcDFiDQo+IG90ZToNCnVuZm9ydHVuYXRlbHksIEkgY2FuIG9u
bHkgY292ZXIgdGhlIGFjdGl2ZSBrZXJuZWxzIGluIG1hc3RlciB3aXRoIGFueQ0KY2VydGFpbnR5
LCBhbmQgSSBhbHJlYWR5IGhhdmUgYSBwYXRjaCB0byBkcm9wIDUuMCwgc28gSSBkaWRuJ3QNCj4g
dHJpZ2dlcg0KdGhpcy4NCkkgY2FuIHNwaW4gYSBwYXRjaCBmb3IgNS4wIGFuZCBtYWtlIHN1cmUg
aXQgaXMgdmVyc2lvbiBwcm9vZmVkIGEgaWJ0LA0KYnV0IGlmIGFueW9uZSBlbHNlIGhhcyBpc3N1
ZXMgd2l0aCA8aW5zZXJ0IHZlcnNpb24gaGVyZT4sIHRoZXknbGwNCj4gbmVlZA0KPiA+IA0KPiB1
bmZvcnR1bmF0ZWx5LCBJIGNhbiBvbmx5IGNvdmVyIHRoZSBhY3RpdmUga2VybmVscyBpbiBtYXN0
ZXIgd2l0aCBhbnkNCg0KQ2FuIHdlIGNvdmVyIGF0IGxlYXN0IHRoZSBrZXJuZWxzIGluIE9FLUNv
cmUgbWFzdGVyIHJpZ2h0IG5vdyBhZmZlY3RlZA0KYnkgdGhpcyBjaGFuZ2U/IFNvIDQuMTkgYXMg
d2VsbCAuLi4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

