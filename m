Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 34DDD6ABDA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jun 2014 19:19:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jun 2014 12:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,999,1392192000"; d="scan'208";a="442986094"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2014 12:19:04 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Sun, 8 Jun 2014 20:19:03 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.58]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.152]) with mapi id
	14.03.0123.003; Sun, 8 Jun 2014 20:19:03 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Stefan Stanacar <sstncr@gmail.com>
Thread-Topic: [OE-core] [PATCH V2 1/7] targetcontrol.py: make possible
	dynamical determination of rootfs type
Thread-Index: AQHPgapGc5wvXtPxekSzC68wp8f6nptldeiAgAIhmaA=
Date: Sun, 8 Jun 2014 19:19:02 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A27ACD2@IRSMSX103.ger.corp.intel.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
	<1402082078-10826-2-git-send-email-corneliux.stoicescu@intel.com>
	<CANr+NRuOHL7MBQZ3LgkjE3TLZ+62DCOgoO7bAyeV6aeQkK3-HQ@mail.gmail.com>
In-Reply-To: <CANr+NRuOHL7MBQZ3LgkjE3TLZ+62DCOgoO7bAyeV6aeQkK3-HQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/7] targetcontrol.py: make possible dynamical determination of rootfs type
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
X-List-Received-Date: Sun, 08 Jun 2014 19:19:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFuIFN0YW5hY2Fy
IFttYWlsdG86c3N0bmNyQGdtYWlsLmNvbV0NCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMDcsIDIw
MTQgMjozOCBQTQ0KPiBUbzogU3RvaWNlc2N1LCBDb3JuZWxpdVgNCj4gQ2M6IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0ggVjIgMS83XSB0YXJnZXRjb250cm9sLnB5OiBtYWtlIHBvc3NpYmxlDQo+IGR5bmFtaWNh
bCBkZXRlcm1pbmF0aW9uIG9mIHJvb3RmcyB0eXBlDQo+IA0KPiBIaSBDb3JuZWxpdSwNCj4gDQo+
IE9uIEZyaSwgSnVuIDYsIDIwMTQgYXQgMTA6MTQgUE0sIENvcm5lbGl1IFN0b2ljZXNjdQ0KPiA8
Y29ybmVsaXV4LnN0b2ljZXNjdUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IFlCOiAjNjM3NQ0KPiA+
DQo+ID4gQWRkZWQgYSBuZXcgbWV0aG9kIGdldF9pbWFnZV9mc3R5cGUoKSB0aGF0IGF1dG9kZXRl
cm1pbmVzIHdoYXQgZnN0eXBlDQo+IHRvIHVzZSBmb3IgdGhlIHJvb3RmcyBmaWxlLg0KPiA+IFRo
aXMgbWV0aG9kIHVzZXMgYSBuZXcgbGlzdCB2YXJpYWJsZSAnc3VwcG9ydGVkX2ltYWdlX2ZzdHlw
ZXMnIHRoYXQNCj4gY29udGFpbnMgaW1hZ2UgZnN0eXBlcyBzdXBwb3J0ZWQgYnkgdGhlIHRhcmdl
dCBjb250cm9sbGVyLg0KPiA+DQo+ID4gVGhpcyBtZXRob2QgaXMgYWxzbyBhIGNsYXNzbWV0aG9k
IHdoaWNoIG1lYW5zIG91dHNpZGUgc2NyaXB0cyBjYW4gZ2V0IHRoZQ0KPiBpbWFnZSBmc3R5cGUu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb3JuZWxpdSBTdG9pY2VzY3UgPGNvcm5lbGl1eC5z
dG9pY2VzY3VAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL2xpYi9vZXFhL3RhcmdldGNv
bnRyb2wucHkgfCAxOSArKysrKysrKysrKysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEvbGliL29lcWEvdGFyZ2V0Y29udHJvbC5weQ0KPiA+IGIvbWV0YS9saWIvb2VxYS90YXJnZXRj
b250cm9sLnB5IGluZGV4IGZmMWJiODkuLjg2NmM0MTQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9s
aWIvb2VxYS90YXJnZXRjb250cm9sLnB5DQo+ID4gKysrIGIvbWV0YS9saWIvb2VxYS90YXJnZXRj
b250cm9sLnB5DQo+ID4gQEAgLTQ0LDYgKzQ0LDggQEAgY2xhc3MgQmFzZVRhcmdldChvYmplY3Qp
Og0KPiA+DQo+ID4gICAgICBfX21ldGFjbGFzc19fID0gQUJDTWV0YQ0KPiA+DQo+ID4gKyAgICBz
dXBwb3J0ZWRfaW1hZ2VfZnN0eXBlcyA9IFtdDQo+ID4gKw0KPiA+ICAgICAgZGVmIF9faW5pdF9f
KHNlbGYsIGQpOg0KPiA+ICAgICAgICAgIHNlbGYuY29ubmVjdGlvbiA9IE5vbmUNCj4gPiAgICAg
ICAgICBzZWxmLmlwID0gTm9uZQ0KPiA+IEBAIC03MCw2ICs3MiwxNiBAQCBjbGFzcyBCYXNlVGFy
Z2V0KG9iamVjdCk6DQo+ID4gICAgICBkZWYgc3RvcChzZWxmKToNCj4gPiAgICAgICAgICBwYXNz
DQo+ID4NCj4gPiArICAgIEBjbGFzc21ldGhvZA0KPiA+ICsgICAgZGVmIGdldF9pbWFnZV9mc3R5
cGUoc2VsZiwgZCwgaW1hZ2VfZnN0eXBlcz1Ob25lKToNCj4gDQo+IFlvdSBtYWRlIHRoaXMgYSBz
dGF0aWMgbWV0aG9kIHNvIHlvdSBjYW4gY2FsbCBpdCBmcm9tIGFuIGV4dGVybmFsIHNjcmlwdD8N
Cj4gSG1tLi4gQnV0IHRoZW4geW91IHdvdWxkbid0IGJlIGFibGUgdG8gcGFzcyBkLCBzbyB3aGF0
J3MgdGhlIHBvaW50PyBBZGRpbmcNCj4gc3VwcG9ydCBmb3IgbW9yZSBmcyBpcyBuaWNlLCBidXQg
eW91IHNob3VsZCBkbyB0aGF0IGZvciB0ZXN0aW1hZ2UsIGllIG1ha2UgaXQNCj4gY29uZmlndXJh
YmxlIGFuZCBsZXQgdGhlIHVzZSBjaG9vc2UgZnJvbSBsb2NhbC5jb25mICh3aXRoIGEgcmVhc29u
YWJsZQ0KPiBkZWZhdWx0KS4gUmlnaHQgbm93IHlvdSBhcmUgY29uZmlndXJpbmcgdGhlIHRlc3Qg
Yml0cyBmcm9tIG91dHNpZGUuLi4NCj4gDQo+IENoZWVycywNCj4gU3RlZmFuDQoNClRoaXMgbWV0
aG9kIGNhbiB1c2UgZCB0byBnZXQgdGhlIElNQUdFX0ZTVFlQRVMgdmFsdWUgb3IgaXQgY2FuIGJl
IGRpcmVjdGx5IGdpdmVuIHRoYXQgdmFsdWUgYW5kIGJ5cGFzcyBkLiBTZWUgaW4gdGhlIHRlc3Qt
cmVtb3RlLWltYWdlIHNjcmlwdCBob3cgd2UgdXNlZCBpdC4NCkFnYWluLCB0aGVzZSBwYXRjaGVz
IGFyZSBtYWRlIHdpdGggdGhlIHBvc3NpYmlsaXR5IG9mIHVzaW5nIHRoZSB0YXJnZXQgY29udHJv
bGxlcnMgdG8gZ2V0IGFzIG11Y2ggaW5mb3JtYXRpb24sIGJvdGggaW50ZXJuYWxseSBhbmQgZXh0
ZXJuYWxseSwgaW4gbWluZC4gV2UgdHJ5IHRvIHByb2Nlc3MgdGhlIGluZm9ybWF0aW9uIChsaWtl
IGltYWdlIGZzdHlwZSB1c2VkKSBpbiBvbmUgcGxhY2UgYW5kIGdldCBpZiByb20gdGhlcmUgd2hl
cmV2ZXIgd2UgbmVlZCBpdC4NCkFsc28gd2Ugd291bGQgbGlrZSB0byBrZWVwIHRoZSB1c2VyIGNv
bmZpZ3VyYWJsZSB2YXJpYWJsZXMgdG8gYSBtaW5pbXVtIGFuZCBhdXRvbWF0aWNhbGx5IGRldGVy
bWluZSBhcyBtdWNoIGFzIHdlIGNhbihJIHNob3VsZCBoYXZlIGluY2x1ZGVkIHRoaXMgaW4gdGhl
IGNvdmVyIGxldHRlcikuIEFuZCB3aGVyZSBjYW4gd2UgZG8gdGhpcyBiZXR0ZXIgdGhhbiBpbiB0
aGUgdGFyZ2V0IGNvbnRyb2xsZXJzIHRoZW1zZWx2ZXM/DQoNCkkgaG9wZSBJIHRoaXMgaXMgYSBs
aXR0bGUgbW9yZSBjbGVhciBub3cuIA0KDQpSZWdhcmRzLA0KQ29ybmVsaXUNCg==

