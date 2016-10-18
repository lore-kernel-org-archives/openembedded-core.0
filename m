Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C736871A38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 16:13:18 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP; 18 Oct 2016 09:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,362,1473145200"; d="scan'208";a="20882480"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga005.fm.intel.com with ESMTP; 18 Oct 2016 09:13:19 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.16]) by
	ORSMSX108.amr.corp.intel.com ([169.254.2.106]) with mapi id
	14.03.0248.002; Tue, 18 Oct 2016 09:13:19 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] kernel-arch.bbclass: Add xtensa and arc into
	valid_archs table
Thread-Index: AQHSI90PobTsoYsHZk2G13m9BhTfdqCtzReAgACVh+A=
Date: Tue, 18 Oct 2016 16:13:18 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61189B148@ORSMSX112.amr.corp.intel.com>
References: <1476203492-34253-1-git-send-email-juro.bystricky@intel.com>
	<F6C44CA5-B615-4B5E-9878-A3BE33E35822@gmail.com>
In-Reply-To: <F6C44CA5-B615-4B5E-9878-A3BE33E35822@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
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
X-List-Received-Date: Tue, 18 Oct 2016 16:13:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHNpbmdsZSBwdXJwb3NlIG9mICJtYXBfa2VybmVsX2FyY2giIGlzIHRvIHNldCANCg0KZXhw
b3J0IEFSQ0ggPSAiYXJjaF94eHgiDQoNClByZXNlbnRseSwgd2UgbXVzdCBzZXQgQVJDSCBldmVu
IHdoZW4gYnVpbGRpbmcgYmFyZW1ldGFsIHRvb2xjaGFpbnMgb25seSwgDQp3aXRob3V0IGFueSBu
ZWVkIHRvIGJ1aWxkIGtlcm5lbC4gSG93ZXZlciwgaW4gdGhpcyBjYXNlIHdlIG1heSANCmVuY291
bnRlciBhIGJvZ3VzIGVycm9yIHN1Y2ggYXMgImNhbm5vdCBtYXAgYXJjaF94eHggdG8gYSBsaW51
eCBrZXJuZWwgYXJjaGl0ZWN0dXJlIi4NClRoZSBzaW1wbGVzdCB3YXkgdG8gYXZvaWQgdGhpcyBp
cyB0byBwbGFjZSBhcmNoX3h4eCBpbnRvIHRoZSB0YWJsZQ0KInZhbGlkX2FyY2hzIi4gKFRoYXQg
d2FzIHRoZSBtYWluIHJlYXNvbiBmb3IgdGhlIHBhdGNoKS4NCg0KQSBiZXR0ZXIgYnV0IG1vcmUg
Y29tcGxleCB3YXkgd291bGQgYmUgdG8gbW9kaWZ5IHRoZSBjb2RlIHNvDQptYXBfa2VybmVsX2Fy
Y2ggaXMgbm90IGNhbGxlZCBhdCBhbGwgd2hlbiBOT1QgYnVpbGRpbmcga2VybmVsIG9yIGtlcm5l
bA0KbW9kdWxlcy4gVGhpcyB3b3VsZCBhbHNvIGFsbG93IGJ1aWxkaW5nIGJhcmVtZXRhbCBjcm9z
cy10b29sY2hhaW5zIGZvciBhcmNoZXMNCnRoYXQgZG9uJ3QgaGF2ZSBMaW51eCBrZXJuZWxzIGF0
IGFsbC4NCg0KQW5vdGhlciB3YXkgdG8gY29uc2lkZXIgaXMgcGVyaGFwcyBqdXN0IGdldHRpbmcg
cmlkIG9mIHRoZSB0YWJsZQ0KInZhbGlkX2FyY2hzIiBlbnRpcmVseS4NCg0KIm1hcF9rZXJuZWxf
YXJjaCIgbWFwcyBhcmNoX2FhYSAtPiBhcmNoX3h4eCBmb3Igc29tZSBjYXNlcy4NCklmIHRoZXJl
IGlzIG5vIGV4cGxpY2l0IG1hcHBpbmcsIHRoZW4gaXQgY291bGQgc2ltcGx5IG1hcCANCg0KYXJj
aF9hYWEtPmFyY2hfYWFhDQoNCnJlc3VsdGluZyBpbiBleHBvcnQgQVJDSD0iYXJjaF9hYWEiDQpU
aGVyZSB3b3VsZCBiZSBubyBlcnJvciBnZW5lcmF0ZWQuIElmIEFSQ0ggaXMgbm90IGEgdmFsaWQN
CmFyY2ggZm9yIGEgTGludXgga2VybmVsLCB3ZSB3b3VsZCBlbmNvdW50ZXIgYSBidWlsZCBlcnJv
ciBhdCBzb21lIHBvaW50Lg0KQnV0IHRoYXQsIEkgYmVsaWV2ZSBpcyB0aGUgc2FtZSBjYXNlIG5v
dyBpZiB3ZSB0cnkgdG8gYnVpbGQgYSBrZXJuZWwNCndpdGggYSB2YWxpZCBrZXJuZWwgQVJDSCBi
dXQgbm90IHN1cHBvcnRlZCBhY3RpdmVseSBpbiBPRSBvciBleHRlbmRlZCBPRSBlY29zeXN0ZW0u
DQoNCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWog
W21haWx0bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxNywg
MjAxNiA0OjQwIFBNDQo+IFRvOiBCeXN0cmlja3ksIEp1cm8gPGp1cm8uYnlzdHJpY2t5QGludGVs
LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IGp1
cm9ieXN0cmlja3lAaG90bWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hd
IGtlcm5lbC1hcmNoLmJiY2xhc3M6IEFkZCB4dGVuc2EgYW5kIGFyYyBpbnRvDQo+IHZhbGlkX2Fy
Y2hzIHRhYmxlDQo+IA0KPiANCj4gPiBPbiBPY3QgMTEsIDIwMTYsIGF0IDk6MzEgQU0sIEp1cm8g
QnlzdHJpY2t5IDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4g
Qm90aCAiYXJjIiBhbmQgInh0ZW5zYSIgYXJlIHZhbGlkIExpbnV4IGFyY2hpdGVjdHVyZXMsIGFk
ZA0KPiA+IHRoZW0gaW50byB2YWxpZF9hcmNocyB0YWJsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEp1cm8gQnlzdHJpY2t5IDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+
ID4gbWV0YS9jbGFzc2VzL2tlcm5lbC1hcmNoLmJiY2xhc3MgfCAyICstDQo+ID4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvbWV0YS9jbGFzc2VzL2tlcm5lbC1hcmNoLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMva2VybmVs
LQ0KPiBhcmNoLmJiY2xhc3MNCj4gPiBpbmRleCA4YTRiZWYxLi5lYTk3NmM2IDEwMDY0NA0KPiA+
IC0tLSBhL21ldGEvY2xhc3Nlcy9rZXJuZWwtYXJjaC5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9j
bGFzc2VzL2tlcm5lbC1hcmNoLmJiY2xhc3MNCj4gPiBAQCAtMTQsNyArMTQsNyBAQCB2YWxpZF9h
cmNocyA9ICJhbHBoYSBjcmlzIGlhNjQgXA0KPiA+ICAgICAgICAgICAgICAgIHBhcmlzYyBzMzkw
ICB2ODUwIFwNCj4gPiAgICAgICAgICAgICAgICBhdnIzMiBibGFja2ZpbiBcDQo+ID4gICAgICAg
ICAgICAgICAgbWljcm9ibGF6ZSBcDQo+ID4gLSAgICAgICAgICAgICAgIG5pb3MyIg0KPiA+ICsg
ICAgICAgICAgICAgICBuaW9zMiBhcmMgeHRlbnNh4oCdDQo+IA0KPiB0aGVyZSBwYXJpc2MgZXRj
IGFzIHdlbGwgc28gaW4gZXNzZW5jZSBwYXRjaCBpcyBvayBidXQgSSB3b25kZXIgaWYgd2UNCj4g
c2hvdWxkDQo+IHJlbW92ZSB0aGUgYXJjaGVzIHdlIGRvbnQgYWN0aXZlbHkgc3VwcG9ydCBpbiBP
RSBvciBleHRlbmRlZCBPRSBlY29zeXN0ZW0uDQo+IA0KPiA+DQo+ID4gZGVmIG1hcF9rZXJuZWxf
YXJjaChhLCBkKToNCj4gPiAgICAgaW1wb3J0IHJlDQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+
ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQoNCg==

