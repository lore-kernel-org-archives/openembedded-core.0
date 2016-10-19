Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A344865C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:48:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2016 13:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,367,1473145200"; d="scan'208";a="21496206"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga005.jf.intel.com with ESMTP; 19 Oct 2016 13:48:14 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.58]) by
	ORSMSX106.amr.corp.intel.com ([10.22.225.133]) with mapi id
	14.03.0248.002; Wed, 19 Oct 2016 13:48:14 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] kernel-arch.bbclass: Add xtensa and arc into
	valid_archs table
Thread-Index: AQHSI90PobTsoYsHZk2G13m9BhTfdqCtzReAgACVh+CAAJwIgIABTZ/g
Date: Wed, 19 Oct 2016 20:48:14 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6118A3259@ORSMSX112.amr.corp.intel.com>
References: <1476203492-34253-1-git-send-email-juro.bystricky@intel.com>
	<F6C44CA5-B615-4B5E-9878-A3BE33E35822@gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61189B148@ORSMSX112.amr.corp.intel.com>
	<C5BBB3EA-468F-456B-ABBA-E692E204FBAC@gmail.com>
In-Reply-To: <C5BBB3EA-468F-456B-ABBA-E692E204FBAC@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch.bbclass: Add xtensa and arc into valid_archs table
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
X-List-Received-Date: Wed, 19 Oct 2016 20:48:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLiBJIHdpbGwgYWRkIHRoZSB0ZXN0IGZvciBUQVJHRVRfT1MgaW4gYSBzZXBhcmF0ZSBw
YXRjaC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiBb
bWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbV0NCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxOCwg
MjAxNiAxMDo1MyBBTQ0KPiBUbzogQnlzdHJpY2t5LCBKdXJvIDxqdXJvLmJ5c3RyaWNreUBpbnRl
bC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBq
dXJvYnlzdHJpY2t5QGhvdG1haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBrZXJuZWwtYXJjaC5iYmNsYXNzOiBBZGQgeHRlbnNhIGFuZCBhcmMgaW50bw0KPiB2YWxpZF9h
cmNocyB0YWJsZQ0KPiANCj4gDQo+ID4gT24gT2N0IDE4LCAyMDE2LCBhdCA5OjEzIEFNLCBCeXN0
cmlja3ksIEp1cm8gPGp1cm8uYnlzdHJpY2t5QGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4g
PiBUaGUgc2luZ2xlIHB1cnBvc2Ugb2YgIm1hcF9rZXJuZWxfYXJjaCIgaXMgdG8gc2V0DQo+ID4N
Cj4gPiBleHBvcnQgQVJDSCA9ICJhcmNoX3h4eCINCj4gPg0KPiA+IFByZXNlbnRseSwgd2UgbXVz
dCBzZXQgQVJDSCBldmVuIHdoZW4gYnVpbGRpbmcgYmFyZW1ldGFsIHRvb2xjaGFpbnMgb25seSwN
Cj4gPiB3aXRob3V0IGFueSBuZWVkIHRvIGJ1aWxkIGtlcm5lbC4gSG93ZXZlciwgaW4gdGhpcyBj
YXNlIHdlIG1heQ0KPiA+IGVuY291bnRlciBhIGJvZ3VzIGVycm9yIHN1Y2ggYXMgImNhbm5vdCBt
YXAgYXJjaF94eHggdG8gYSBsaW51eCBrZXJuZWwNCj4gYXJjaGl0ZWN0dXJlIi4NCj4gPiBUaGUg
c2ltcGxlc3Qgd2F5IHRvIGF2b2lkIHRoaXMgaXMgdG8gcGxhY2UgYXJjaF94eHggaW50byB0aGUg
dGFibGUNCj4gPiAidmFsaWRfYXJjaHMiLiAoVGhhdCB3YXMgdGhlIG1haW4gcmVhc29uIGZvciB0
aGUgcGF0Y2gpLg0KPiA+DQo+ID4gQSBiZXR0ZXIgYnV0IG1vcmUgY29tcGxleCB3YXkgd291bGQg
YmUgdG8gbW9kaWZ5IHRoZSBjb2RlIHNvDQo+ID4gbWFwX2tlcm5lbF9hcmNoIGlzIG5vdCBjYWxs
ZWQgYXQgYWxsIHdoZW4gTk9UIGJ1aWxkaW5nIGtlcm5lbCBvciBrZXJuZWwNCj4gPiBtb2R1bGVz
LiBUaGlzIHdvdWxkIGFsc28gYWxsb3cgYnVpbGRpbmcgYmFyZW1ldGFsIGNyb3NzLXRvb2xjaGFp
bnMgZm9yDQo+IGFyY2hlcw0KPiA+IHRoYXQgZG9uJ3QgaGF2ZSBMaW51eCBrZXJuZWxzIGF0IGFs
bC4NCj4gPg0KPiA+IEFub3RoZXIgd2F5IHRvIGNvbnNpZGVyIGlzIHBlcmhhcHMganVzdCBnZXR0
aW5nIHJpZCBvZiB0aGUgdGFibGUNCj4gPiAidmFsaWRfYXJjaHMiIGVudGlyZWx5Lg0KPiA+DQo+
ID4gIm1hcF9rZXJuZWxfYXJjaCIgbWFwcyBhcmNoX2FhYSAtPiBhcmNoX3h4eCBmb3Igc29tZSBj
YXNlcy4NCj4gPiBJZiB0aGVyZSBpcyBubyBleHBsaWNpdCBtYXBwaW5nLCB0aGVuIGl0IGNvdWxk
IHNpbXBseSBtYXANCj4gPg0KPiA+IGFyY2hfYWFhLT5hcmNoX2FhYQ0KPiA+DQo+ID4gcmVzdWx0
aW5nIGluIGV4cG9ydCBBUkNIPSJhcmNoX2FhYSINCj4gPiBUaGVyZSB3b3VsZCBiZSBubyBlcnJv
ciBnZW5lcmF0ZWQuIElmIEFSQ0ggaXMgbm90IGEgdmFsaWQNCj4gPiBhcmNoIGZvciBhIExpbnV4
IGtlcm5lbCwgd2Ugd291bGQgZW5jb3VudGVyIGEgYnVpbGQgZXJyb3IgYXQgc29tZSBwb2ludC4N
Cj4gPiBCdXQgdGhhdCwgSSBiZWxpZXZlIGlzIHRoZSBzYW1lIGNhc2Ugbm93IGlmIHdlIHRyeSB0
byBidWlsZCBhIGtlcm5lbA0KPiA+IHdpdGggYSB2YWxpZCBrZXJuZWwgQVJDSCBidXQgbm90IHN1
cHBvcnRlZCBhY3RpdmVseSBpbiBPRSBvciBleHRlbmRlZCBPRQ0KPiBlY29zeXN0ZW0uDQo+IA0K
PiBJIHRoaW5rIHlvdSBzaG91bGQgYWRkIGEgY2hlY2sgZm9yIHRlc3RpbmcgVEFSR0VUX09TIGFu
ZCBpZiBpdHMgbm90IGxpbnV4DQo+IHRoZW4NCj4gaWdub3JlIHRoZSB2YWxpZCBrZXJuZWwgYXJj
aGVzIGNoZWNrLg0KPiANCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdtYWlsLmNv
bV0NCj4gPj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE3LCAyMDE2IDQ6NDAgUE0NCj4gPj4gVG86
IEJ5c3RyaWNreSwgSnVybyA8anVyby5ieXN0cmlja3lAaW50ZWwuY29tPg0KPiA+PiBDYzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsganVyb2J5c3RyaWNreUBob3Rt
YWlsLmNvbQ0KPiA+PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0ga2VybmVsLWFyY2gu
YmJjbGFzczogQWRkIHh0ZW5zYSBhbmQgYXJjDQo+IGludG8NCj4gPj4gdmFsaWRfYXJjaHMgdGFi
bGUNCj4gPj4NCj4gPj4NCj4gPj4+IE9uIE9jdCAxMSwgMjAxNiwgYXQgOTozMSBBTSwgSnVybyBC
eXN0cmlja3kgPGp1cm8uYnlzdHJpY2t5QGludGVsLmNvbT4NCj4gPj4gd3JvdGU6DQo+ID4+Pg0K
PiA+Pj4gQm90aCAiYXJjIiBhbmQgInh0ZW5zYSIgYXJlIHZhbGlkIExpbnV4IGFyY2hpdGVjdHVy
ZXMsIGFkZA0KPiA+Pj4gdGhlbSBpbnRvIHZhbGlkX2FyY2hzIHRhYmxlLg0KPiA+Pj4NCj4gPj4+
IFNpZ25lZC1vZmYtYnk6IEp1cm8gQnlzdHJpY2t5IDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+
DQo+ID4+PiAtLS0NCj4gPj4+IG1ldGEvY2xhc3Nlcy9rZXJuZWwtYXJjaC5iYmNsYXNzIHwgMiAr
LQ0KPiA+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9rZXJuZWwtYXJjaC5iYmNsYXNz
IGIvbWV0YS9jbGFzc2VzL2tlcm5lbC0NCj4gPj4gYXJjaC5iYmNsYXNzDQo+ID4+PiBpbmRleCA4
YTRiZWYxLi5lYTk3NmM2IDEwMDY0NA0KPiA+Pj4gLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC1h
cmNoLmJiY2xhc3MNCj4gPj4+ICsrKyBiL21ldGEvY2xhc3Nlcy9rZXJuZWwtYXJjaC5iYmNsYXNz
DQo+ID4+PiBAQCAtMTQsNyArMTQsNyBAQCB2YWxpZF9hcmNocyA9ICJhbHBoYSBjcmlzIGlhNjQg
XA0KPiA+Pj4gICAgICAgICAgICAgICBwYXJpc2MgczM5MCAgdjg1MCBcDQo+ID4+PiAgICAgICAg
ICAgICAgIGF2cjMyIGJsYWNrZmluIFwNCj4gPj4+ICAgICAgICAgICAgICAgbWljcm9ibGF6ZSBc
DQo+ID4+PiAtICAgICAgICAgICAgICAgbmlvczIiDQo+ID4+PiArICAgICAgICAgICAgICAgbmlv
czIgYXJjIHh0ZW5zYeKAnQ0KPiA+Pg0KPiA+PiB0aGVyZSBwYXJpc2MgZXRjIGFzIHdlbGwgc28g
aW4gZXNzZW5jZSBwYXRjaCBpcyBvayBidXQgSSB3b25kZXIgaWYgd2UNCj4gPj4gc2hvdWxkDQo+
ID4+IHJlbW92ZSB0aGUgYXJjaGVzIHdlIGRvbnQgYWN0aXZlbHkgc3VwcG9ydCBpbiBPRSBvciBl
eHRlbmRlZCBPRQ0KPiBlY29zeXN0ZW0uDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gZGVmIG1hcF9rZXJu
ZWxfYXJjaChhLCBkKToNCj4gPj4+ICAgIGltcG9ydCByZQ0KPiA+Pj4gLS0NCj4gPj4+IDIuNy40
DQo+ID4+Pg0KPiA+Pj4gLS0NCj4gPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+ID4+PiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4g
Pj4+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4+IGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNv
cmUNCj4gPg0KDQo=

