Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E620F77313
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 17:12:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jan 2017 09:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="928236559"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga003.jf.intel.com with ESMTP; 30 Jan 2017 09:12:14 -0800
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 30 Jan 2017 09:12:13 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.23]) by
	ORSMSX154.amr.corp.intel.com ([169.254.11.240]) with mapi id
	14.03.0248.002; Mon, 30 Jan 2017 09:12:13 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Ohly, Patrick" <patrick.ohly@intel.com>
Thread-Topic: [OE-core] [PATCH v5 09/12] runqemu: also accept -image suffix
	for	rootfs parameter
Thread-Index: AQHSeLKXLhB2RPlHFUewFmBs07llZaFMiaR8gACwdoCABAbvYA==
Date: Mon, 30 Jan 2017 17:12:13 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6118F884B@ORSMSX112.amr.corp.intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	,
	<707323fc8105d9a1cf77fe340ebff387862c8e8e.1485530988.git-series.patrick.ohly@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B6118F7EEC@ORSMSX112.amr.corp.intel.com>
	<1485544947.20333.119.camel@intel.com>
In-Reply-To: <1485544947.20333.119.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 09/12] runqemu: also accept -image suffix for	rootfs parameter
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
X-List-Received-Date: Mon, 30 Jan 2017 17:12:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBhdHJpY2sgT2hseSBbbWFp
bHRvOnBhdHJpY2sub2hseUBpbnRlbC5jb21dDQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyNywg
MjAxNyAxMToyMiBBTQ0KPiBUbzogQnlzdHJpY2t5LCBKdXJvIDxqdXJvLmJ5c3RyaWNreUBpbnRl
bC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHY1IDA5LzEyXSBydW5xZW11OiBhbHNvIGFj
Y2VwdCAtaW1hZ2Ugc3VmZml4DQo+IGZvciByb290ZnMgcGFyYW1ldGVyDQo+IA0KPiBPbiBGcmks
IDIwMTctMDEtMjcgYXQgMTY6NTQgKzAwMDAsIEJ5c3RyaWNreSwgSnVybyB3cm90ZToNCj4gPiBK
dXN0IGN1cmlvdXM6IGlzIHRoaXMgdGVzdCBmb3IgImltYWdlIiBpbiBmaWxlIG5hbWUgcmVhbGx5
IG5lY2Vzc2FyeT8NCj4gPiBXaXRoIHFlbXVib290LmNvbmYgdGhlIHJlbGV2YW50IGZpbGVzIGFy
ZSBhbHJlYWR5IHNwZWxsZWQgb3V0Lg0KPiA+IEkgZG9uJ3Qgc2VlIGEgbmVlZCB0byBmb3JjZSAi
Y29tcHVsc29yeSIgbmFtZXMgZm9yIGltYWdlcy4NCj4gPiBJZiBJIGNvbW1lbnQgb3V0IHRoaXMg
dGVzdCwgZXZlcnl0aGluZyB3b3JrcyBqdXN0IGZpbmUuIEFtIEkgbWlzc2luZw0KPiBzb21ldGhp
bmc/DQo+IA0KPiBTb21lIG9mIHRoZSB1c2FnZXMgd2hlbiBjaGVja2luZyBmb3IgcGF0aHMgbWln
aHQgaGF2ZSBiZWNvbWUgb2Jzb2xldGUsDQo+IGJ1dCBhdCBsZWFzdCBmb3IgZGlzdGluZ3Vpc2hp
bmcgYmV0d2VlbiBtYWNoaW5lIGFuZCBpbWFnZSBiYXNlIG5hbWUNCj4gcGFyYW1ldGVycyBpdCBp
cyBzdGlsbCByZWxldmFudDoNCj4gDQo+ICAgICBkZWYgY2hlY2tfYXJncyhzZWxmKToNCj4gLi4u
DQo+ICAgICAgICAgICAgIGVsaWYgcmUuc2VhcmNoKHInLWltYWdlLXwtaW1hZ2UkJywgYXJnKToN
Cj4gICAgICAgICAgICAgICAgICMgTGF6eSByb290ZnMNCj4gICAgICAgICAgICAgICAgIHNlbGYu
cm9vdGZzID0gYXJnDQo+ICAgICAgICAgICAgIGVsaWYgYXJnLnN0YXJ0c3dpdGgoJ292bWYnKToN
Cj4gICAgICAgICAgICAgICAgIHNlbGYub3ZtZl9iaW9zLmFwcGVuZChhcmcpDQo+ICAgICAgICAg
ICAgIGVsc2U6DQo+ICAgICAgICAgICAgICAgICAjIEF0IGxhc3QsIGFzc3VtZSBpcyBpdCB0aGUg
TUFDSElORQ0KPiAgICAgICAgICAgICAgICAgaWYgKG5vdCB1bmtub3duX2FyZykgb3IgdW5rbm93
bl9hcmcgPT0gYXJnOg0KPiAgICAgICAgICAgICAgICAgICAgIHVua25vd25fYXJnID0gYXJnDQo+
ICAgICAgICAgICAgICAgICBlbHNlOg0KPiAgICAgICAgICAgICAgICAgICAgIHJhaXNlIEV4Y2Vw
dGlvbigiQ2FuJ3QgaGFuZGxlIHR3byB1bmtub3duIGFyZ3M6ICVzICUNCj4gcyIgJSAodW5rbm93
bl9hcmcsIGFyZykpDQo+IA0KPiBXaGVuIHJlbW92aW5nIHRoZSAiaWYgcmUuc2VhcmNoKHInLWlt
YWdlLXwtaW1hZ2UkJywgYXJnKSIgY2xhdXNlIG9uZQ0KPiBnZXRzIGFuIGVycm9yIGZvcjoNCj4g
DQo+ICQgcnVucWVtdSBjb3JlLWltYWdlLW1pbmltYWwgZXh0NCBxZW11eDg2DQo+IHJ1bnFlbXUg
LSBFUlJPUiAtIENhbid0IGhhbmRsZSB0d28gdW5rbm93biBhcmdzOiBjb3JlLWltYWdlLW1pbmlt
YWwgcWVtdXg4Ng0KPiBydW5xZW11IC0gRVJST1IgLSBUcnkgJ3J1bnFlbXUgaGVscCcgb24gaG93
IHRvIHVzZSBpdA0KPiANCg0KSSBzZWUsIHRoZSBwdXJwb3NlIG9mIHRoaXMgdGVzdCBpcyBkZXRl
cm1pbmUgd2hpY2ggYXJndW1lbnQgaXMgd2hpY2gsDQphcyB0aGV5IGNhbiBiZSBpbiBhbnkgb3Jk
ZXIuIElNSE8gdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIE1BQ0hJTkUgYW5kIGltYWdlIGl0IHdv
dWxkIA0KbWFrZSBtb3JlIHNlbnNlIHRvIHNlYXJjaCBmb3IgInFlbXUiIGluc3RlYWQgb2YgIi1p
bWFnZS0iIG9yICItaW1hZ2UiIC4gDQooQlRXIGRvIHdlIG5lZWQgYm90aCAtaW1hZ2UtIGFuZCAt
aW1hZ2UkPykNCg0KVGhlcmUgaXMgYWxzbyBBTk9USEVSIHRlc3QgZm9yICctaW1hZ2UtJywgaW4g
ImlzX2RlcGxveV9kaXJfaW1hZ2UiLiANClRoaXMgaXMgdGhlIG9uZSBJIGNvbnNpZGVyZWQgcmVk
dW5kYW50IChvciBub3QgbmVlZGVkIGluIGNhc2Ugd2UgaGF2ZSBxZW11Ym9vdC5jb25mKS4gDQoN
Cg0KPiAtLQ0KPiBCZXN0IFJlZ2FyZHMsIFBhdHJpY2sgT2hseQ0KPiANCj4gVGhlIGNvbnRlbnQg
b2YgdGhpcyBtZXNzYWdlIGlzIG15IHBlcnNvbmFsIG9waW5pb24gb25seSBhbmQgYWx0aG91Z2gN
Cj4gSSBhbSBhbiBlbXBsb3llZSBvZiBJbnRlbCwgdGhlIHN0YXRlbWVudHMgSSBtYWtlIGhlcmUg
aW4gbm8gd2F5DQo+IHJlcHJlc2VudCBJbnRlbCdzIHBvc2l0aW9uIG9uIHRoZSBpc3N1ZSwgbm9y
IGFtIEkgYXV0aG9yaXplZCB0byBzcGVhaw0KPiBvbiBiZWhhbGYgb2YgSW50ZWwgb24gdGhpcyBt
YXR0ZXIuDQo+IA0KPiANCg0K

