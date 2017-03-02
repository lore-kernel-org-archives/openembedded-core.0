Return-Path: <saul.wold@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F293877636
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 23:37:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2017 15:37:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,234,1484035200"; d="scan'208";a="1137226251"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2017 15:37:44 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.30]) by
	ORSMSX103.amr.corp.intel.com ([169.254.5.78]) with mapi id
	14.03.0248.002; Thu, 2 Mar 2017 15:37:44 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v2] native.bbclass: populate native recipe
	with it's files
Thread-Index: AQHSk639GkZAvXwyJESbzVutHU17Fg==
Date: Thu, 2 Mar 2017 23:37:44 +0000
Message-ID: <1488497862.22952.145.camel@intel.com>
References: <1488497132-15876-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1488497132-15876-1-git-send-email-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.8.26]
MIME-Version: 1.0
Subject: Re: [PATCH v2] native.bbclass: populate native recipe with it's files
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
X-List-Received-Date: Thu, 02 Mar 2017 23:37:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFF010E0F5DF9C4EBDC1C29D4D113A9C@intel.com>
Content-Transfer-Encoding: base64

DQpEcm9wIHRoaXMsIGFwcGFyZW50bHkgUmljaGFyZCBhbHJlYWR5IGFwcGxpZWQgdGhpcyBhbmQg
SSB3YXMgbG9va2luZyBhdA0KYW4gb2xkZXIgbWFzdGVyIGJyYW5jaCB3aGVuIEkgc2VudCB0aGlz
Lg0KDQpTYXUhDQoNCk9uIFRodSwgMjAxNy0wMy0wMiBhdCAxNToyNSAtMDgwMCwgU2F1bCBXb2xk
IHdyb3RlOg0KPiBUaGlzIGFsbG93cyBhIG5hdGl2ZSBwYWNrYWdlJ3MgcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlIHRvIGJlIHBvcHVsYXRlZA0KPiB3aXRoDQo+IHRoYXQgcGFja2FnZXMgbmF0aXZlIGlt
YWdlIGZpbGVzLsKgwqBUaGlzIGluIHR1cm5zIGFsbG93cyBpdCB0byBiZSB1c2VkDQo+IGJ5DQo+
IHNjcmlwdHMgb3Igb3RoZXIgdG9vbHMgd2l0aG91dCBjcmVhdGluZyB1bi1uZWNlc3NhcnkgREVQ
RU5EUy4NCj4gDQo+IEFuIGV4YW1wbGUgb2YgdGhpcyBpcyBzeXN0ZW10YXAtbmF0aXZlIGFuZCB0
aGUgY3Jvc3N0YXAgc2NyaXB0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2F1bCBXb2xkIDxzZ3dA
bGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gdjI6IHJlbW92ZWQgdGhlICJiZWZvcmUgZG9fYnVp
bGQiDQo+IMKgbWV0YS9jbGFzc2VzL25hdGl2ZS5iYmNsYXNzIHwgNSArKysrKw0KPiDCoDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNz
ZXMvbmF0aXZlLmJiY2xhc3MNCj4gYi9tZXRhL2NsYXNzZXMvbmF0aXZlLmJiY2xhc3MNCj4gaW5k
ZXggZWM5MWZjMy4uNmJlY2Y4MiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzL25hdGl2ZS5i
YmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy9uYXRpdmUuYmJjbGFzcw0KPiBAQCAtMTc0LDYg
KzE3NCwxMSBAQCBweXRob24gbmF0aXZlX3ZpcnRjbGFzc19oYW5kbGVyICgpIHsNCj4gwqBhZGRo
YW5kbGVyIG5hdGl2ZV92aXJ0Y2xhc3NfaGFuZGxlcg0KPiDCoG5hdGl2ZV92aXJ0Y2xhc3NfaGFu
ZGxlcltldmVudG1hc2tdID0gImJiLmV2ZW50LlJlY2lwZVByZUZpbmFsaXNlIg0KPiDCoA0KPiAr
cHl0aG9uIGRvX2FkZHRvX3JlY2lwZV9zeXNyb290ICgpIHsNCj4gK8KgwqDCoMKgYmIuYnVpbGQu
ZXhlY19mdW5jKCJleHRlbmRfcmVjaXBlX3N5c3Jvb3QiLCBkKQ0KPiArfQ0KPiArYWRkdGFzayBh
ZGR0b19yZWNpcGVfc3lzcm9vdCBhZnRlciBkb19wb3B1bGF0ZV9zeXNyb290DQo+ICsNCj4gwqBp
bmhlcml0IG5vcGFja2FnZXMNCj4gwqANCj4gwqBkb19wYWNrYWdlZGF0YVtzdGFtcC1leHRyYS1p
bmZvXSA9ICIiDQo+IC0twqANCj4gMi43LjQNCj4g

