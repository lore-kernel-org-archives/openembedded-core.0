Return-Path: <saul.wold@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AC8A260079
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 22:02:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2017 15:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,475,1500966000"; d="scan'208";a="906388204"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Oct 2017 15:02:34 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.135]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.215]) with mapi id
	14.03.0319.002; Tue, 3 Oct 2017 15:02:34 -0700
From: "Wold, Saul" <saul.wold@intel.com>
To: "matt@madison.systems" <matt@madison.systems>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] go-runtime: prevent host leakage into target
	objects
Thread-Index: AQHTPJNQhxy2w254FEWIPU9JBKqs/A==
Date: Tue, 3 Oct 2017 22:02:33 +0000
Message-ID: <1507068152.7331.291.camel@intel.com>
References: <1506694551-4487-1-git-send-email-matt@madison.systems>
In-Reply-To: <1506694551-4487-1-git-send-email-matt@madison.systems>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.8.66]
MIME-Version: 1.0
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: [PATCH] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Tue, 03 Oct 2017 22:02:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <769E969351E05142A097580DE335077C@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE3LTA5LTI5IGF0IDE0OjE1ICswMDAwLCBNYXR0IE1hZGlzb24gd3JvdGU6DQo+
IFdoZW4gYnVpbGRpbmcgZm9yIGEgdGFyZ2V0IHdob3NlIGFyY2hpdGVjdHVyZSBtYXRjaGVzDQo+
IHRoZSBidWlsZCBob3N0J3MsIHRoZSBzZWNvbmQgcGFzcyB0aHJvdWdoIG1ha2UuYmFzaA0KPiB0
byBidWlsZCB0aGUgc2hhcmVhYmxlIHJ1bnRpbWUgd291bGQgYWxzbyBvdmVyd3JpdGUNCj4gdGhl
IHRhcmdldCdzIHN0YXRpYyBjZ28gbGlicmFyeSB3aXRoIGhvc3QtY29tcGF0aWJpbGUNCj4gYmlu
YXJpZXMuDQo+IA0KPiBGaXggdGhpcyBieSBydW5uaW5nIHRoZSBob3N0LXNpZGUgYnVpbGQgb25j
ZSBhbmQNCj4gdGFyZ2V0LW9ubHkgcGFzc2VzIG9mIG1ha2UuYmFzaCB0d2ljZSwgZm9yIHN0YXRp
Yw0KPiBhbmQgc2hhcmVhYmxlLiAgVGhpcyBlbnN1cmVzIHRoYXQgd2hhdCBnZXRzIGluc3RhbGxl
ZA0KPiBpcyB0YXJnZXQtY29tcGF0aWJsZS4NCj4gDQo+IFtZT0NUTyAjMTIxMzZdDQo+IA0KVGhp
cyBkb2VzIG5vdCBhcHBlYXIgdG8gYWN0dWFsbHkgZml4IHRoZSBidWcgbWVudGlvbmVkIGhlcmUs
IEkganVzdA0KZm91bmQgdGhlIGZhaWx1cmUgYWdhaW4gd2l0aCBpbnRlbC1jb3JlaTctNjQgKGZy
b20gbWV0YS1pbnRlbCkgYW5kIHRoZW4NCmNvbmZpcm1lZCB0aGF0IGl0IGZhaWxzIHdpdGggcWVt
dXg4Ni02NCBhbmQgZ2VuZXJpY3g4Ni02NCB3aGVuIHVzaW5nDQpUQ0xJQkMgPSAibXVzbCINCg0K
Q2FuIHlvdSBwbGVhc2UgdmVyaWZ5IGFuZCB0ZXN0IHdpdGggTVVTTC4NCg0KVGhhbmtzDQogICBT
YXUhDQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IE1hZGlzb24gPG1hdHRAbWFkaXNvbi5zeXN0
ZW1zPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby1ydW50aW1lLmluYyB8
IDExICsrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by1ydW50aW1lLmluYyBiL21ldGEvcmVjaXBlcy0NCj4gZGV2dG9vbHMvZ28vZ28tcnVudGltZS5p
bmMNCj4gaW5kZXggOTM0ZDFhYS4uYmQyNmUyZSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dvL2dvLXJ1bnRpbWUuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9nby9nby1ydW50aW1lLmluYw0KPiBAQCAtMjMsOSArMjMsMTMgQEAgZG9fY29tcGlsZSgpIHsN
Cj4gIAlybSAtcmYgJHtHT0JJTn0gJHtCfS9wa2cNCj4gIAlta2RpciAke0dPQklOfQ0KPiAgCWNk
IHNyYw0KPiAtCUdPX0ZMQUdTPSIiIC4vbWFrZS5iYXNoDQo+ICsJLi9tYWtlLmJhc2ggLS1ob3N0
LW9ubHkNCj4gKwljcCAke0J9L3BrZy90b29sLyR7QlVJTERfR09UVVBMRX0vZ29fYm9vdHN0cmFw
ICR7Qn0NCj4gKwlybSAtcmYgJHtCfS9wa2cvJHtUQVJHRVRfR09UVVBMRX0NCj4gKwkuL21ha2Uu
YmFzaCAtLXRhcmdldC1vbmx5DQo+ICAJaWYgWyAtbiAiJHtHT19EWU5MSU5LfSIgXTsgdGhlbg0K
PiAtCQlHT19GTEFHUz0iLWJ1aWxkbW9kZT1zaGFyZWQiIEdPX0xERkxBR1M9Ii1leHRsZGZsYWdz
IA0KPiBcIiR7TERGTEFHU31cIiIgLi9tYWtlLmJhc2gNCj4gKwkJY3AgJHtCfS9nb19ib290c3Ry
YXAgJHtCfS9wa2cvdG9vbC8ke0JVSUxEX0dPVFVQTEV9DQo+ICsJCUdPX0ZMQUdTPSItYnVpbGRt
b2RlPXNoYXJlZCIgR09fTERGTEFHUz0iLWV4dGxkZmxhZ3MgDQo+IFwiJHtMREZMQUdTfVwiIiAu
L21ha2UuYmFzaCAtLXRhcmdldC1vbmx5DQo+ICAJZmkNCj4gIAljZCAke0J9DQo+ICB9DQo+IEBA
IC00MSw4ICs0NSw5IEBAIGRvX2luc3RhbGwoKSB7DQo+ICAJcm0gLXJmICR7RH0ke2xpYmRpcn0v
Z28vcGtnL29iag0KPiAgCXJtIC1yZiAke0R9JHtsaWJkaXJ9L2dvL3BrZy9ib290c3RyYXANCj4g
IAlmaW5kIHNyYyAtbWluZGVwdGggMSAtbWF4ZGVwdGggMSAtdHlwZSBkIHwgd2hpbGUgcmVhZA0K
PiBzcmNkaXI7IGRvDQo+IC0JCVsgIiRzcmNkaXIiID0gIi4vY21kIiBdIHx8IGNwIC0tDQo+IHBy
ZXNlcnZlPW1vZGUsdGltZXN0YW1wcyAtUiAkc3JjZGlyICR7RH0ke2xpYmRpcn0vZ28vc3JjLw0K
PiArCQljcCAtLXByZXNlcnZlPW1vZGUsdGltZXN0YW1wcyAtUiAkc3JjZGlyDQo+ICR7RH0ke2xp
YmRpcn0vZ28vc3JjLw0KPiAgCWRvbmUNCj4gKwlybSAtZiAke0R9JHtsaWJkaXJ9L2dvL3NyYy9j
bWQvZGlzdC9kaXN0DQo+ICB9DQo+ICANCj4gICMgUmVtb3ZlIHRlc3QgYmluYXJpZXMgdGhhdCBj
YW5ub3QgYmUgcmVsb2NhdGVkDQo+IC0tIA0KPiAyLjcuNA0KPiA=

