Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C3CC260125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 21:10:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 05 Nov 2015 13:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="594756752"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2015 13:10:55 -0800
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.225]) by
	ORSMSX108.amr.corp.intel.com ([169.254.4.161]) with mapi id
	14.03.0248.002; Thu, 5 Nov 2015 13:10:55 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
Thread-Index: AQHRCoMKmbfTF3/+JEurzOjY1MI62p6N0aOwgACL8ID//6kXEA==
Date: Thu, 5 Nov 2015 21:10:54 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B610D4A444@ORSMSX110.amr.corp.intel.com>
References: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
	<CAMKF1sqHRscyqe+OCLAB+BQxEe7zz3VAX0V3vFpt1aL7H_KcDg@mail.gmail.com>
In-Reply-To: <CAMKF1sqHRscyqe+OCLAB+BQxEe7zz3VAX0V3vFpt1aL7H_KcDg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
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
X-List-Received-Date: Thu, 05 Nov 2015 21:10:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TWF5YmUgdGhpcyBpcyBteSBtaXN1bmRlcnN0YW5kaW5nLCBJIGFzc3VtZSAiUGVuZGluZyIgbWVh
bnMNCmEgcGF0Y2ggaGFzIGJlZW4gYWxzbyBzZW50IHRvIGdjYyAgZGV2ZWxvcGVycyBpdCBpcyBn
b2luZyB0byBiZSB1cHN0cmVhbWVkDQphdCBzb21lIHBvaW50Lg0KKEkgYWxzbyBhc3N1bWUgcGF0
Y2ggZm9yIDQuOSBNYWtlZmlsZS5pbiBuZWVkcyB0byBiZSB1cHN0cmVhbWVkIHNlcGFyYXRlbHkg
ZnJvbSA1LjIpDQoNCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S2hlbSBSYWogW21haWx0bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBO
b3ZlbWJlciA1LCAyMDE1IDEwOjE4IEFNDQo+IFRvOiBCeXN0cmlja3ksIEp1cm8NCj4gQ2M6IEhh
dGxlLCBNYXJrIEcgKFdpbmQgUml2ZXIpOyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gRml4IEdDQyA1
LjIgIl9GT1JfQlVJTEQiIGFuZCByZWxhdGVkDQo+IHZhcmlhYmxlcw0KPiANCj4gT24gVGh1LCBO
b3YgNSwgMjAxNSBhdCAxMDoxMyBBTSwgQnlzdHJpY2t5LCBKdXJvIDxqdXJvLmJ5c3RyaWNreUBp
bnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBwYXRjaCB3b3JrcyB1bm1vZGlmaWVkICAoYW5k
IHNvbHZlcyBtaW5ndyBidWlsZCBwcm9ibGVtcykgZm9yIGdjYw0KPiA+IDQuOS4gYXMgd2VsbCwg
cHJvdmlkaW5nIGdjYy00LjkuaW5jIGlzICBwYXRjaGVkIHRoZSBzYW1lIHdheSBhcw0KPiA+IGdj
Yy01LjIuaW5jDQo+ID4NCj4gPiAoSG93ZXZlciwgdGhpcyBtYWtlcyAgdGhlIE1ha2VmaWxlLmlu
IHBhdGNoICBzdGF0dXM6DQo+ID4NCj4gPiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcNCj4gPg0K
PiA+IGluY29ycmVjdCBmb3IgY2FzZSBvZiBnY2MgNC45LikNCj4gDQo+IHdoeSBpdCBpdCBpbmNv
cnJlY3QuIGlzIGdjYyA0LjkgRU9MID8NCj4gDQo+ID4NCj4gPg0KPiA+IC0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nY2MvZ2NjLTQuOS5pbmMNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2NjL2djYy00LjkuaW5jDQo+ID4gQEAgLTgxLDYgKzgxLDcgQEAgU1JDX1VSSSA9ICJc
DQo+ID4gICAgICBmaWxlOi8vMDA2My1uYXRpdmVzZGstZ2NjLXN1cHBvcnQucGF0Y2ggXA0KPiA+
ICAgICAgZmlsZTovLzAwNjQtaGFuZGxlLXRhcmdldC1zeXNyb290LW11bHRpbGliLnBhdGNoIFwN
Cj4gPiAgICAgIGZpbGU6Ly8wMDY1LWdjYy00ODMtdW5pdmVyc2FsLWluaXRpYWxpemVyLW5vLXdh
cm5pbmcucGF0Y2ggXA0KPiA+ICsgICAgZmlsZTovLzAwNDItY3h4ZmxhZ3MtZm9yLWJ1aWxkLnBh
dGNoIFwNCj4gPiAgIg0KPiA+DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmddIE9uDQo+IEJlaGFsZg0KPiA+PiBPZiBNYXJrIEhhdGxlDQo+ID4+IFNl
bnQ6IE1vbmRheSwgT2N0b2JlciAxOSwgMjAxNSA4OjMwIEFNDQo+ID4+IFRvOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+IFN1YmplY3Q6IFtPRS1jb3JlXSBb
UEFUQ0hdIEZpeCBHQ0MgNS4yICJfRk9SX0JVSUxEIiBhbmQgcmVsYXRlZA0KPiA+PiB2YXJpYWJs
ZXMNCj4gPj4NCj4gPj4gV2l0aG91dCB0aGlzIHBhdGNoLCB0aGUgd3JvbmcgaGVhZGVyIGZyYWdt
ZW50cyBjYW4gYmUgdXNlZCB0bw0KPiA+PiBnZW5lcmF0ZSB0aGUgbmF0aXZlc2RrLCBjcm9zcy1j
YW5hZGlhbiwgYW5kIG90aGVyIHZhcmlhdGlvbnMuICBHZW5lcmFsbHkNCj4gdGhpcyB3b3JrcyBm
aW5lLg0KPiA+PiBIb3dldmVyLCB3aGVuIHRoZXJlIGlzIGVub3VnaCB2YXJpYXRpb24gZnJvbSB0
aGUgYnVpbGQgbWFjaGluZSB0byB0aGUNCj4gPj4gdGFyZ2V0IHJ1bnRpbWUgaXQgd2lsbCBicmVh
ay4uIChTdWNoIGFzIFNES01BQ0hJTkU9aTY4Ni1taW5ndzMyKQ0KPiA+Pg0KPiA+PiBUaGUgYnVn
cyBjYW4gYWxzbyBob3cgdXAgb24gYSBMaW51eCAtPiBMaW51eCBidWlsZCwgYnV0IGl0J3MNCj4g
Pj4gc2lnbmZpY2lhbnRseSBtb3JlIHJhcmUuICBJdCB3b3VsZCByZXF1aXJlIHNvbWUgc2V0IG9m
IG9wdGlvbnMgdGhhdA0KPiA+PiBtYWtlIHRoZSBob3N0IGhlYWRlcnMgYW5kIGZsYWdzIGluY29t
cGF0aWJsZSB3aXRoIHRoZSB0YXJnZXQuICAoU3VjaA0KPiA+PiBhcyB2YXJpb3VzIHByb2ZpbGlu
Zw0KPiA+PiBvcHRpb25zLikNCj4gPj4NCj4gPj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBh
IHNldCBvZiBtZXRhLW1pbmd3IHBhdGNoZXMgdGhhdCB3aWxsIGJlDQo+ID4+IHNlbnQgdG8gdGhl
IFlvY3RvIFByb2plY3QgbWFpbGluZyBsaXN0IHNvb24uDQo+ID4+DQo+ID4+IE1hcmsgSGF0bGUg
KDEpOg0KPiA+PiAgIGdjYy01LjI6IEZpeCB2YXJpb3VzIF9GT1JfQlVJTEQgYW5kIHJlbGF0ZWQg
dmFyaWFibGVzDQo+ID4+DQo+ID4+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy01LjIu
aW5jICAgICAgICAgICAgICB8ICAgMSArDQo+ID4+ICAuLi4vZ2NjL2djYy01LjIvMDA0Mi1jeHhm
bGFncy1mb3ItYnVpbGQucGF0Y2ggICAgICB8IDEyMw0KPiA+PiArKysrKysrKysrKysrKysrKysr
KysNCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKykNCj4gPj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiA+PiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy01LjIvMDA0
Mi1jeHhmbGFncy1mb3ItDQo+ID4+IGJ1aWxkLnBhdGNoDQo+ID4+DQo+ID4+IC0tDQo+ID4+IDEu
OS4zDQo+ID4+DQo+ID4+IC0tDQo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+ID4+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+
PiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+IGh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUN
Cj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

