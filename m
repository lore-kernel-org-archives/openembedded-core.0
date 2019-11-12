Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Nov 2019 04:19:01 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 37ABB7D3CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:19:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Nov 2019 20:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,295,1569308400"; d="scan'208";a="405452551"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
	by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2019 20:11:54 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.88]) by
	pgsmsx113.gar.corp.intel.com ([10.108.55.202]) with mapi id
	14.03.0439.000; Tue, 12 Nov 2019 12:11:29 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jpewhacker@gmail.com"
	<jpewhacker@gmail.com>
Thread-Topic: [OE-core] [PATCH] oeqa: Fix subTest result reporting
Thread-Index: AQHVlmngeqKC7gGa40iX3l7UOSChtKeGa5SA
Date: Tue, 12 Nov 2019 04:11:29 +0000
Message-ID: <00a261e971ccf1fec69b0c517a1b17d25536911b.camel@intel.com>
References: <20191108192153.2133662-1-JPEWhacker@gmail.com>
In-Reply-To: <20191108192153.2133662-1-JPEWhacker@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.16.52]
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa: Fix subTest result reporting
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
X-List-Received-Date: Tue, 12 Nov 2019 04:19:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBED4A77B2148441B83B37406B5065E8@intel.com>
Content-Transfer-Encoding: base64

SGkgSm9zaHVhDQoNCk9uIEZyaSwgMjAxOS0xMS0wOCBhdCAxMzoyMSAtMDYwMCwgSm9zaHVhIFdh
dHQgd3JvdGU6DQo+IEZpeGVzIHRoZSB3YXkgdGhhdCBzdWJUZXN0IHJlc3VsdHMgYXJlIHJlcG9y
dGVkIHNvIHRoYXQgZWFjaCBzdWJUZXN0DQo+IGlzDQo+IHJlcG9ydGVkIGluZGVwZW5kZW50bHks
IHdpdGggaXQncyBvd24gc3RhdHVzLiBUaGUgYmFzZSB0ZXN0IGNhc2UgaXMNCj4gYWxzbw0KPiBy
ZXBvcnRlZCwgYnV0IG9ubHkgaWYgaXQgYWN0dWFsbHkgaGFkIGEgc3RhdHVzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPg0KPiAtLS0NCj4g
IG1ldGEvbGliL29lcWEvY29yZS9ydW5uZXIucHkgICAgICAgICAgICAgICAgfCA0NCArKysrKysr
KysrKysrKysrKw0KPiAtLS0tDQo+ICBtZXRhL2xpYi9vZXFhL2NvcmUvdXRpbHMvY29uY3VycmVu
Y3l0ZXN0LnB5IHwgIDMgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkNCj4gDQoNClRoaXMgaXMgY2F1c2luZyBlcnJvcnM6DQoNCmh0dHBzOi8v
YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNzkvYnVpbGRz
LzQ3Ng0KaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy8yNzU2
NjgvDQoNClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCiAgRmlsZSAiL2hvbWUv
cG9reWJ1aWxkL3lvY3RvLXdvcmtlci9vZS1zZWxmdGVzdC0NCmNlbnRvcy9idWlsZC9tZXRhL2xp
Yi9vZXFhL2NvcmUvdXRpbHMvY29uY3VycmVuY3l0ZXN0LnB5IiwgbGluZSAyOTksIGluDQpmb3Jr
X2Zvcl90ZXN0cw0KICAgIHByb2Nlc3Nfc3VpdGUucnVuKEV4dHJhUmVzdWx0c0VuY29kZXJUZXN0
UmVzdWx0KHN1YnVuaXRfcmVzdWx0KSkNCiAgRmlsZSAiL3Vzci9saWI2NC9weXRob24zLjYvdW5p
dHRlc3Qvc3VpdGUucHkiLCBsaW5lIDEyMiwgaW4gcnVuDQogICAgdGVzdChyZXN1bHQpDQogIEZp
bGUgIi91c3IvbGliNjQvcHl0aG9uMy42L3VuaXR0ZXN0L2Nhc2UucHkiLCBsaW5lIDY3MCwgaW4g
X19jYWxsX18NCiAgICByZXR1cm4gc2VsZi5ydW4oKmFyZ3MsICoqa3dkcykNCiAgRmlsZSAiL3Vz
ci9saWI2NC9weXRob24zLjYvdW5pdHRlc3QvY2FzZS5weSIsIGxpbmUgNjMwLCBpbiBydW4NCiAg
ICBzZWxmLl9mZWVkRXJyb3JzVG9SZXN1bHQocmVzdWx0LCBvdXRjb21lLmVycm9ycykNCiAgRmls
ZSAiL3Vzci9saWI2NC9weXRob24zLjYvdW5pdHRlc3QvY2FzZS5weSIsIGxpbmUgNTU1LCBpbg0K
X2ZlZWRFcnJvcnNUb1Jlc3VsdA0KICAgIHJlc3VsdC5hZGRTdWJUZXN0KHRlc3QudGVzdF9jYXNl
LCB0ZXN0LCBleGNfaW5mbykNCiAgRmlsZSAiL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9v
ZS1zZWxmdGVzdC0NCmNlbnRvcy9idWlsZC9tZXRhL2xpYi9vZXFhL2NvcmUvdXRpbHMvY29uY3Vy
cmVuY3l0ZXN0LnB5IiwgbGluZSA4NSwgaW4NCmFkZFN1YlRlc3QNCiAgICBzZWxmLl9hZGRSZXN1
bHQoc2VsZi5yZXN1bHQuYWRkU3ViVGVzdCwgdGVzdCwgc3VidGVzdCwgb3V0Y29tZSwNCmV4Y2Vw
dGlvbiA9IChvdXRjb21lIGlzIG5vdCBOb25lKSwgKiprd2FyZ3MpDQpBdHRyaWJ1dGVFcnJvcjog
J0F1dG9UaW1pbmdUZXN0UmVzdWx0RGVjb3JhdG9yJyBvYmplY3QgaGFzIG5vIGF0dHJpYnV0ZQ0K
J2FkZFN1YlRlc3QnDQoyMDE5LTExLTExIDE5OjE0OjQzLDkyOCAtIG9lLXNlbGZ0ZXN0IC0gSU5G
TyAtDQpydW50aW1lX3Rlc3QuUG9zdGluc3QudGVzdF9mYWlsaW5nX3Bvc3RpbnN0IChzdWJ1bml0
LlJlbW90ZWRUZXN0Q2FzDQoNClRoYW5rcywNCg0KQW51ag0K

