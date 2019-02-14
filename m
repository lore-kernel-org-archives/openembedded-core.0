Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 011957C603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 19:53:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 11:53:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,369,1544515200"; d="scan'208";a="115003751"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by orsmga007.jf.intel.com with ESMTP; 14 Feb 2019 11:53:12 -0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.205]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.192]) with mapi id
	14.03.0415.000; Fri, 15 Feb 2019 03:53:11 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 3/4] pixman: upgrade 0.34.0 -> 0.38.0
Thread-Index: AQHUxCkfiNvf9bPW906w7EzfR6+h/KXe7dmAgABBiwA=
Date: Thu, 14 Feb 2019 19:53:11 +0000
Message-ID: <9475d743dd65589d56dbb2f55a582144f11b6ecb.camel@intel.com>
References: <20190214054857.18876-1-anuj.mittal@intel.com>
	<20190214054857.18876-3-anuj.mittal@intel.com>
	<CAMKF1sqiTB5-pPBQw8xSdg0h=_GTQ4MTtdqATM8_HvWJmWd+-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqiTB5-pPBQw8xSdg0h=_GTQ4MTtdqATM8_HvWJmWd+-Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.150.227]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] pixman: upgrade 0.34.0 -> 0.38.0
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
X-List-Received-Date: Thu, 14 Feb 2019 19:53:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8F8F5186FB52C43BB626838C648023D@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE5LTAyLTE0IGF0IDA3OjU4IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
V2VkLCBGZWIgMTMsIDIwMTkgYXQgOTo0OSBQTSBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50
ZWwuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBGb3IgY2hhbmdlcywgc2VlOg0KPiA+IA0KPiA+
IA0KaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9waXhtYW4vbG9nLz9xdD1yYW5nZSZxPXBp
eG1hbi0wLjM4LjAuLi5waXhtYW4tMC4zNC4wDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQW51
aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3hvcmct
bGliL3BpeG1hbi9hc21faW5jbHVkZS5wYXRjaCAgICAgICAgIHwgMjkgLS0tLS0tLS0tLS0tLQ0K
PiA+IC0tLS0tLQ0KPiA+ICAuLi4ve3BpeG1hbl8wLjM0LjAuYmIgPT4gcGl4bWFuXzAuMzguMC5i
Yn0gICAgfCAgNSArKy0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
MiBkZWxldGlvbnMoLSkNCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLQ0KPiA+IGxpYi9waXhtYW4vYXNtX2luY2x1ZGUucGF0Y2gNCj4gPiAgcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97cGl4bWFuXzAuMzQuMC5iYiA9Pg0KPiA+
IHBpeG1hbl8wLjM4LjAuYmJ9ICg4OSUpDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLQ0KPiA+IGxpYi9waXhtYW4vYXNtX2luY2x1ZGUucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy0NCj4gPiBsaWIvcGl4bWFuL2FzbV9pbmNsdWRlLnBh
dGNoDQo+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggYjUyYTU3MDdkNi4u
MDAwMDAwMDAwMA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9waXht
YW4vYXNtX2luY2x1ZGUucGF0Y2gNCj4gPiArKysgL2Rldi9udWxsDQo+ID4gQEAgLTEsMjkgKzAs
MCBAQA0KPiA+IC1GaXhlcyBlcnJvcnMgbGlrZQ0KPiA+IC0NCj4gPiAtQXNzZW1ibGVyIG1lc3Nh
Z2VzOg0KPiA+IC1GYXRhbCBlcnJvcjogY2FuJ3QgY3JlYXRlIC5saWJzL3BpeG1hbi1taXBzLWRz
cHIyLWFzbS5vOiBObyBzdWNoDQo+ID4gZmlsZSBvciBkaXJlY3RvcnkNCj4gPiAtDQo+ID4gLWl0
IHdvcmtzIHdpdGggZ2xpYmMgYmVjYXVzZSBpdCB1c2VzIGdjYyBmaXhlZC1oZWFkZXJzIGJ1dCB0
aGF0cw0KPiA+IG5vdCByaWdodC4NCj4gPiAtDQo+ID4gLVdlIG1vdmUgdGhlIGluY2x1ZGUgdW5k
ZXIgQyBibG9jaw0KPiA+IC0NCj4gPiAtU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4NCj4gPiAtVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+ID4gLUluZGV4OiBw
aXhtYW4tMC4zMi42L3BpeG1hbi9waXhtYW4tcHJpdmF0ZS5oDQo+ID4gLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+
ID0NCj4gPiAtLS0tIHBpeG1hbi0wLjMyLjYub3JpZy9waXhtYW4vcGl4bWFuLXByaXZhdGUuaA0K
PiA+IC0rKysgcGl4bWFuLTAuMzIuNi9waXhtYW4vcGl4bWFuLXByaXZhdGUuaA0KPiA+IC1AQCAt
MSw0ICsxLDMgQEANCj4gPiAtLSNpbmNsdWRlIDxmbG9hdC5oPg0KPiA+IC0NCj4gPiAtICNpZm5k
ZWYgUElYTUFOX1BSSVZBVEVfSA0KPiA+IC0gI2RlZmluZSBQSVhNQU5fUFJJVkFURV9IDQo+ID4g
LUBAIC0xNyw2ICsxNiw4IEBADQo+ID4gLQ0KPiA+IC0gI2lmbmRlZiBfX0FTU0VNQkxFUl9fDQo+
ID4gLQ0KPiA+IC0rI2luY2x1ZGUgPGZsb2F0Lmg+DQo+ID4gLSsNCj4gPiAtICNpZm5kZWYgUEFD
S0FHRQ0KPiA+IC0gIyAgZXJyb3IgY29uZmlnLmggbXVzdCBiZSBpbmNsdWRlZCBiZWZvcmUgcGl4
bWFuLXByaXZhdGUuaA0KPiA+IC0gI2VuZGlmDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9waXhtYW5fMC4zNC4wLmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1saWIvcGl4bWFuXzAuMzguMC5iYg0KPiA+IHNpbWlsYXJpdHkgaW5kZXgg
ODklDQo+ID4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3BpeG1h
bl8wLjM0LjAuYmINCj4gPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGli
L3BpeG1hbl8wLjM4LjAuYmINCj4gPiBpbmRleCBjMjkwZmE0NjE0Li40OWMzZDYyMzQyIDEwMDY0
NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9waXhtYW5fMC4zNC4w
LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3BpeG1hbl8wLjM4
LjAuYmINCj4gPiBAQCAtMzEsMTEgKzMxLDEwIEBAIEVYVFJBX09FQ09ORl9jbGFzcy1uYXRpdmVz
ZGsgPSAiLS1kaXNhYmxlLWd0ayINCj4gPiANCj4gPiAgU1JDX1VSSSArPSAiXA0KPiA+ICAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1BUk0tcWVtdS1yZWxhdGVkLXdvcmthcm91bmRzLWluLWNwdS0N
Cj4gPiBmZWF0dXJlcy1kZXRlY3RpLnBhdGNoIFwNCj4gPiAtICAgICAgICAgICBmaWxlOi8vYXNt
X2luY2x1ZGUucGF0Y2ggXA0KPiANCj4gY2FuIHlvdSBjb25maXJtIHlvdSB0ZXN0ZWQgYSBidWls
ZCB3aXRoIG11c2wvbWlwcyA/DQoNCkkgdGVzdGVkIHdpdGggbXVzbC4gVGhlIGNoYW5nZSBpcyBh
bHNvIHByZXNlbnQgdXBzdHJlYW0gbm93Og0KDQoNCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5v
cmcvcGl4bWFuL2NvbW1pdC8/aWQ9N2M2MDY2YjcwMGM3Y2RkNGFlYjhiZTQyNmIxNGIzYTVmMGRl
NGI2Yw0K

