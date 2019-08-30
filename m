Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 408557CE21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:13:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2019 19:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="188737496"
Received: from kmsmsx152.gar.corp.intel.com ([172.21.73.87])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2019 19:13:24 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.232]) by
	KMSMSX152.gar.corp.intel.com ([169.254.11.13]) with mapi id
	14.03.0439.000; Fri, 30 Aug 2019 10:13:24 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/5] kernel-devsrc: tweak for v5.3+
Thread-Index: AQHVUrVw/zgdwcBqJ0WG3yKphxMuUqcRaYEAgAA1R4CAAOawgA==
Date: Fri, 30 Aug 2019 02:13:23 +0000
Message-ID: <96b460f57943b96b9a6f493a67322f1688665c00.camel@intel.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<3a3fd8a7128901ab5fff8de55b789ecd3b633cc6.1565796002.git.bruce.ashfield@gmail.com>
	<b132395fc39af7592af4a4d1c5d8bc25ccf7a31a.camel@intel.com>
	<CADkTA4PdkcioYX4Va7ohMapxBPpAr5nirUM+mg3Uno6JroW3Yg@mail.gmail.com>
In-Reply-To: <CADkTA4PdkcioYX4Va7ohMapxBPpAr5nirUM+mg3Uno6JroW3Yg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.199.133]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel-devsrc: tweak for v5.3+
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
X-List-Received-Date: Fri, 30 Aug 2019 02:13:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <26E7AAB4BAEE9342BBB06690FB126C6D@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE5LTA4LTI5IGF0IDA4OjI3IC0wNDAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgNToxNyBBTSBNaXR0YWwsIEFudWogPGFudWoubWl0
dGFsQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gV2VkLCAyMDE5LTA4LTE0IGF0IDExOjMx
IC0wNDAwLCBicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20gd3JvdGU6DQo+ID4gPiBGcm9tOiBCcnVj
ZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiA+ID4gDQo+ID4gPiBUaGUg
NS4zIGtlcm5lbCBoYXMgdHdvIGNoYW5nZXMgdGhhdCByZXF1aXJlIHR3ZWFrcyB0byB0aGUgbWlu
aW1hbA0KPiA+ID4ga2VybmVsLWRldnNyYyBwYWNrYWdlLg0KPiA+ID4gDQo+ID4gPiAtIDRjZTk3
MzE3ZiBbeDg2L3B1cmdhdG9yeTogRG8gbm90IHVzZSBfX2J1aWx0aW5fbWVtY3B5IGFuZA0KPiA+
ID4gX19idWlsdGluX21lbXNldF0NCj4gPiA+IA0KPiA+ID4gICBUaGlzIGNoYW5nZSByZW1vdmVz
IHRoZSBuZWVkIGZvciBhcmNoL3g4Ni9wdXJnYXRvcnkvc3RyaW5nLmMNCj4gPiA+IGFuZA0KPiA+
ID4gICBpbnN0ZWFkIHJldXNlcyBhIGNvcHkgaW4gYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkLywg
c28gd2UgY2FuJ3QNCj4gPiA+IGNvcHkNCj4gPiA+ICAgdGhlIGZpbGUgYW55bW9yZS4gVG8gc3Vw
cG9ydCBvbGRlciBrZXJuZWxzLCB3ZSBtYWtlIHRoZSBjb3B5DQo+ID4gPiBzdXJ2aXZlDQo+ID4g
PiAgIHRoZSBub24tZXhpc3RlbmNlIG9mIHRoZSBmaWxlLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhp
cyBjaGFuZ2Ugd2FzIG1lcmdlZCBpbiA0LjE5IHN0YWJsZSBrZXJuZWwgYXMgd2VsbC4gQ2FuIHRo
aXMgYmUNCj4gPiBtZXJnZWQgaW4gb3VyIHN0YWJsZSBicmFuY2hlcyBhcyB3ZWxsIHBsZWFzZT8N
Cj4gDQo+IEl0IGFscmVhZHkgaXMgKGp1c3Qgbm90IHB1c2hlZCksIEkganVzdCB3YXNuJ3QgZG9p
bmcgLXN0YWJsZSB1cGRhdGVzDQo+IGFsb25nIHdpdGggNS4yIGludHJvIC4uIHRoZXJlJ3Mgb25s
eSBzbyBtYW55IHRoaW5ncyBJIGNhbiBkZWJ1ZyBhbmQNCj4gcmVncmVzc2lvbiB0ZXN0IGF0IG9u
ZSB0aW1lLiBIb3BlZnVsbHkgSSdsbCBnZXQgdGhyb3VnaCB0aGUgNS4yIHdvcmsNCj4gc29vbiBh
bmQgZmluaXNoIHRoZSByZXN0IG9mIG15IHF1ZXVlLg0KDQpUaGFuayB5b3UgQnJ1Y2UuIEkgbWVh
bnQgdGhhdCB0aGlzIGtlcm5lbC1kZXZzcmMgZml4IHNob3VsZCBiZSBtZXJnZWQNCmluIHlvY3Rv
IHN0YWJsZSBicmFuY2gsIHdhcnJpb3IsIHJlZ2FyZGxlc3Mgb2YgdGhlIDQuMTkga2VybmVsIHZl
cnNpb24NCnRoZXJlLg0KDQpUaGFua3MsDQoNCkFudWoNCg==

