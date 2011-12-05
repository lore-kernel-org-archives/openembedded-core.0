Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RXbyP-0007mF-53
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 18:05:01 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2011 08:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,299,1320652800"; d="scan'208";a="98762392"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2011 08:58:14 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Mon, 5 Dec 2011 08:58:13 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2011 08:58:11 -0800
Thread-Topic: [OE-core] [PATCH 02/11] mdadm: fix CC definition in the Makefile
Thread-Index: Acyx5y4D3p5GSNIcS0SZMe2lobWYIgBh6ntQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3E5F18E@orsmsx504.amr.corp.intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
	<b224881df056580c35e265c2b3db311a1f366409.1322856805.git.nitin.a.kamble@intel.com>
	<1322935698.3532.21.camel@mattotaupa>
In-Reply-To: <1322935698.3532.21.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "H.J. Lu" <hjl.tools@gmail.com>
Subject: Re: [PATCH 02/11] mdadm: fix CC definition in the Makefile
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2011 17:05:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGF1bCwNCiAgVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLiBJIHdpbGwgdHJ5IHRvIGluY29ycG9y
YXRlIHlvdXIgZmVlZGJhY2sgaW4gdGhlIGNvbW1pdC4NCg0KVGhhbmtzLA0KTml0aW4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBQYXVsIE1lbnpl
bA0KPiBTZW50OiBTYXR1cmRheSwgRGVjZW1iZXIgMDMsIDIwMTEgMTA6MDggQU0NCj4gVG86IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0ggMDIvMTFdIG1kYWRtOiBmaXggQ0MgZGVmaW5pdGlvbiBpbiB0aGUNCj4g
TWFrZWZpbGUNCj4gDQo+IERlYXIgTml0aW4sDQo+IA0KPiANCj4gdGhhbmsgeW91IGZvciB5b3Vy
IHBhdGNoLg0KPiANCj4gQW0gRnJlaXRhZywgZGVuIDAyLjEyLjIwMTEsIDEyOjIwIC0wODAwIHNj
aHJpZWINCj4gbml0aW4uYS5rYW1ibGVAaW50ZWwuY29tOg0KPiA+IEZyb206IE5pdGluIEEgS2Ft
YmxlIDxuaXRpbi5hLmthbWJsZUBpbnRlbC5jb20+DQo+ID4NCj4gPiBCeSBoYXJkY29kaW5nIEND
J3MgZGVmaW5pdGlvbiBpbiB0aGUgTWFrZWZpbGUsIGFsbCB0aGUgZ2NjIHBhcmFtZXRlcnMNCj4g
PiBzZXQgYnkgdHVuZSBzZXR0aW5ncyBhcmUgbG9zdC4gQ2F1c2luZyBjb21waWxlIGZhaWx1cmUg
d2l0aCB4MzINCj4gPiB0b29sY2hhaW4NCj4gPg0KPiA+IEFzIHRoZSBiaXRiYWtlIGRlZmluZWQg
Q0MgaXMgZ29vZCwgdGhlcmUgaXMgbm8gbmVlZCB0byByZWRmaW5lIENDIGluDQo+ID4gdGhlDQo+
IA0KPiByZWQqZSpmaW5lDQo+IA0KPiA+IG1ha2UgZmlsZSwgaGVuY2UgcmVtb3ZlZCBpdCB0byBm
aXggdGhlIGlzc3VlLg0KPiA+DQo+ID4gVGhpcyBmaXhlcyBidWc6IFtZT0NUTyAjMTQxNF0NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5pdGluIEEgS2FtYmxlIDxuaXRpbi5hLmthbWJsZUBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9tZGFkbS9maWxlcy9tZGFkbV9maXhfZm9yX3gzMi5w
YXRjaCAgICAgICAgICAgIHwgICAyNA0KPiArKysrKysrKysrKysrKysrKysrKw0KPiA+ICBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbWRhZG0vbWRhZG1fMy4yLjIuYmIgICAgICAgICB8ICAgIDMgKy0N
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKSAg
Y3JlYXRlIG1vZGUNCj4gMTAwNjQ0DQo+ID4gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21kYWRtL2Zp
bGVzL21kYWRtX2ZpeF9mb3JfeDMyLnBhdGNoDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLQ0KPiBleHRlbmRlZC9tZGFkbS9maWxlcy9tZGFkbV9maXhfZm9yX3gzMi5wYXRjaA0K
PiA+IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21kYWRtL2ZpbGVzL21kYWRtX2ZpeF9mb3JfeDMy
LnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi44OThl
NzBiDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9t
ZGFkbS9maWxlcy9tZGFkbV9maXhfZm9yX3gzMi5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsMjQgQEAN
Cj4gPiArVXBzdHJlYW1TdGF0dXM6IHBlbmRpbmcNCj4gPiArDQo+ID4gK0J5IGhhcmRjb2Rpbmcg
Q0MncyBkZWZpbml0aW9uIGluIHRoZSBNYWtlZmlsZSwgYWxsIHRoZSBnY2MNCj4gcGFyYW1ldGVy
cw0KPiA+ICtzZXQgYnkgdHVuZSBzZXR0aW5ncyBhcmUgbG9zdC4gQ2F1c2luZyBjb21waWxlIGZh
aWx1cmUgd2l0aCB4MzINCj4gPiArdG9vbGNoYWluDQo+ID4gKw0KPiA+ICtBcyB0aGUgYml0YmFr
ZSBkZWZpbmVkIENDIGlzIGdvb2QsIHRoZXJlIGlzIG5vIG5lZWQgdG8gcmVkZmluZSBDQyBpbg0K
PiA+ICt0aGUgbWFrZSBmaWxlLCBoZW5jZSByZW1vdmVkIGl0IHRvIGZpeCB0aGUgaXNzdWUuDQo+
ID4gKw0KPiA+ICtTaWduZWQtT2ZmLUJ5OiBOaXRpbiBBIEthbWJsZSA8bml0aW4uYS5rYW1ibGVA
aW50ZWwuY29tPg0KPiA+ICsyMDExLzEyLzAxDQo+ID4gKw0KPiA+ICtJbmRleDogbWRhZG0tMy4y
LjIvTWFrZWZpbGUNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICstLS0gbWRhZG0tMy4yLjIub3JpZy9N
YWtlZmlsZQ0KPiA+ICsrKysgbWRhZG0tMy4yLjIvTWFrZWZpbGUNCj4gPiArQEAgLTQwLDcgKzQw
LDcgQEAgS0xJQkM9L2hvbWUvc3JjL2tsaWJjL2tsaWJjLTAuNzcNCj4gPiArDQo+ID4gKyBLTElC
Q19HQ0MgPSBnY2MgLW5vc3RkaW5jIC1pd2l0aHByZWZpeCBpbmNsdWRlDQo+ID4gKyAtSSQoS0xJ
QkMpL2tsaWJjL2luY2x1ZGUgLUkkKEtMSUJDKS9saW51eC9pbmNsdWRlDQo+ID4gKyAtSSQoS0xJ
QkMpL2tsaWJjL2FyY2gvaTM4Ni9pbmNsdWRlIC1JJChLTElCQykva2xpYmMvaW5jbHVkZS9iaXRz
MzINCj4gPiArDQo+ID4gKy1DQyA9ICQoQ1JPU1NfQ09NUElMRSlnY2MNCj4gPiArKyNDQyA9ICQo
Q1JPU1NfQ09NUElMRSlnY2MNCj4gDQo+IEkgd291bGQgcHJlZmVyIHRvIGZpeCB0aGlzIHRoZSB3
YXkgaXQgY2FuIGJlIGFwcGxpZWQgdXBzdHJlYW0uIEkgY291bGQNCj4gZXZlbiBhc2sgdGhlbSB0
byBhcHBseSBpdC4NCj4gDQo+ID4gKyBDWEZMQUdTID0gLWdnZGINCj4gPiArIENXRkxBR1MgPSAt
V2FsbCAtV2Vycm9yIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdleHRyYQ0KPiA+ICsgLVduby11bnVz
ZWQtcGFyYW1ldGVyIGlmZGVmIFdBUk5fVU5VU0VEDQo+IA0KPiBb4oCmXQ0KPiANCj4gDQo+IFRo
YW5rcywNCj4gDQo+IFBhdWwNCg==


