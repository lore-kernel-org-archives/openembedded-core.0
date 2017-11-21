Return-Path: <saul.wold@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3D9D787AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 23:04:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 15:04:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; d="scan'208";a="10484283"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2017 15:04:11 -0800
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 21 Nov 2017 15:04:11 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.80]) by
	ORSMSX158.amr.corp.intel.com ([169.254.10.25]) with mapi id
	14.03.0319.002; Tue, 21 Nov 2017 15:04:10 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "Sullivan, California L" <california.l.sullivan@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 2/2] install*.sh: add short sleep after parted commands
Thread-Index: AQHTYxzLEdgsKpx7QEWEwqWSiXkjoaMf+fQA
Date: Tue, 21 Nov 2017 23:04:10 +0000
Message-ID: <1511305448.11515.4.camel@intel.com>
References: <20171121214703.11109-1-california.l.sullivan@intel.com>
	<20171121230209.4097-1-california.l.sullivan@intel.com>
In-Reply-To: <20171121230209.4097-1-california.l.sullivan@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.10.203]
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] install*.sh: add short sleep after parted commands
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
X-List-Received-Date: Tue, 21 Nov 2017 23:04:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <635D26241C66F2458C722C047DB7C7CE@intel.com>
Content-Transfer-Encoding: base64

DQpNdWNoIGJldHRlciENCg0KU2F1IQ0KDQpPbiBUdWUsIDIwMTctMTEtMjEgYXQgMTU6MDIgLTA4
MDAsIENhbGlmb3JuaWEgU3VsbGl2YW4gd3JvdGU6DQo+IEkgd2Fzbid0IGFibGUgdG8gaW5zdGFs
bCB0byBteSBPcHRhbmUgU1NEIGR1ZSB0byB0aGUgZm9sbG93aW5nIGVycm9yOg0KPiANCj4gRm9y
bWF0dGluZyAvZGV2L252bWUwbjFwMSB0byB2ZmF0Li4uDQo+IG1rZnMuZmF0IDQuMSAoMjAxNy0w
MS0yNCkNCj4gbWtmcy52ZmF0OiB1bmFibGUgdG8gb3BlbiAvZGV2L252bWUwbjFwMTogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiBUYXJnZXQgaW5zdGFsbC1lZmkgZmFpbGVkDQo+IA0KPiBB
IGNvdXBsZSBsaW5lcyBsYXRlciBJIHNlZToNCj4gDQo+IFsgICAgMTAuMjY1NDAxXSAgbnZtZTBu
MTogcDEgcDIgcDMNCj4gDQo+IFRoZW4gbG9va2luZyBhdCB0aGUgZGV2aWNlIGl0c2VsZiBhZnRl
ciBib290aW5nIGZyb20gYSBVU0Igc3RpY2s6DQo+IA0KPiByb290QGludGVsLWNvcmVpNy02NDog
fiMgbHMgL2Rldi9udm1lMG4xKg0KPiAvZGV2L252bWUwbjEgL2Rldi9udm1lMG4xcDEgL2Rldi9u
dm1lMG4xcDIgL2Rldi9udm1lMG4xcDMNCj4gDQo+IFNvIGl0IGxvb2tzIGxpa2UgdGhlIHBhcnRl
ZCBjb21tYW5kcyByZXR1cm4gYmVmb3JlIHRoZSBkZXZpY2Ugbm9kZSBpcw0KPiBhY3R1YWxseSBj
cmVhdGVkLg0KPiANCj4gV29yayBhcm91bmQgdGhpcyBpc3N1ZSBieSB3YWl0aW5nIGZvciBkZXZp
Y2Ugbm9kZXMgZm9yIGEgc2hvcnQNCj4gZHVyYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBD
YWxpZm9ybmlhIFN1bGxpdmFuIDxjYWxpZm9ybmlhLmwuc3VsbGl2YW5AaW50ZWwuY29tPg0KPiAt
LS0NCj4gdjI6IHNsZWVwIGNvbmRpdGlvbmFsbHkgZm9yIHVwIHRvIHRocmVlIHNlY29uZHMgaW5z
dGVhZCBvZiBvbmUgc2Vjb25kDQo+IHVuY29uZGl0aW9uYWxseS4gVGhpcyBtYWtlcyBpdCBzbyBp
ZiB0aGUgZGV2aWNlIG5vZGVzIGFyZSBhdmFpbGFibGUNCj4gaW1tZWRpYXRlbHksIHBlb3BsZSBk
b24ndCBoYXZlIHRvIHdhaXQsIGJ1dCBhIHN5c3RlbSBoYXMgdXAgdG8gdGhyZWUNCj4gc2Vjb25k
cyB0byBjcmVhdGUgdGhlbSBiZWZvcmUgZmFpbGluZy4gDQo+IA0KPiAgbWV0YS9yZWNpcGVzLWNv
cmUvaW5pdHJkc2NyaXB0cy9maWxlcy9pbml0LWluc3RhbGwtZWZpLnNoIHwgNw0KPiArKysrKysr
DQo+ICBtZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2ZpbGVzL2luaXQtaW5zdGFsbC5z
aCAgICAgfCA3DQo+ICsrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2luaXRyZHNjcmlwdHMvZmls
ZXMvaW5pdC1pbnN0YWxsLQ0KPiBlZmkuc2ggYi9tZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3Jp
cHRzL2ZpbGVzL2luaXQtaW5zdGFsbC1lZmkuc2gNCj4gaW5kZXggNWFkM2E2MC4uNzA2NDE4ZiAx
MDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9maWxlcy9pbml0
LWluc3RhbGwtZWZpLnNoDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2luaXRyZHNjcmlwdHMv
ZmlsZXMvaW5pdC1pbnN0YWxsLWVmaS5zaA0KPiBAQCAtMTg2LDYgKzE4NiwxMyBAQCBwYXJ0ZWQg
JHtkZXZpY2V9IG1rcGFydCBzd2FwIGxpbnV4LXN3YXANCj4gJHN3YXBfc3RhcnQgMTAwJQ0KPiAg
DQo+ICBwYXJ0ZWQgJHtkZXZpY2V9IHByaW50DQo+ICANCj4gK2VjaG8gIldhaXRpbmcgZm9yIGRl
dmljZSBub2Rlcy4uLiINCj4gK0M9MA0KPiArd2hpbGUgWyAkQyAtbmUgMyBdICYmIFsgISAtZSAk
Ym9vdGZzICAtbyAhIC1lICRyb290ZnMgLW8gISAtZSAkc3dhcA0KPiBdOyBkbw0KPiArICAgIEM9
JCgoIEMgKyAxICkpDQo+ICsgICAgc2xlZXAgMQ0KPiArZG9uZQ0KPiArDQo+ICBlY2hvICJGb3Jt
YXR0aW5nICRib290ZnMgdG8gdmZhdC4uLiINCj4gIG1rZnMudmZhdCAkYm9vdGZzDQo+ICANCj4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2luaXRyZHNjcmlwdHMvZmlsZXMvaW5pdC1p
bnN0YWxsLnNoDQo+IGIvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9maWxlcy9pbml0
LWluc3RhbGwuc2gNCj4gaW5kZXggMWNhYzgwNi4uZGFkZTA1OSAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9maWxlcy9pbml0LWluc3RhbGwuc2gNCj4gKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9maWxlcy9pbml0LWluc3RhbGwuc2gN
Cj4gQEAgLTIxMSw2ICsyMTEsMTMgQEAgcGFydGVkICR7ZGV2aWNlfSBta3BhcnQgJHBuYW1lIGxp
bnV4LXN3YXANCj4gJHN3YXBfc3RhcnQgMTAwJQ0KPiAgDQo+ICBwYXJ0ZWQgJHtkZXZpY2V9IHBy
aW50DQo+ICANCj4gK2VjaG8gIldhaXRpbmcgZm9yIGRldmljZSBub2Rlcy4uLiINCj4gK0M9MA0K
PiArd2hpbGUgWyAkQyAtbmUgMyBdICYmIFsgISAtZSAkYm9vdGZzICAtbyAhIC1lICRyb290ZnMg
LW8gISAtZSAkc3dhcA0KPiBdOyBkbw0KPiArICAgIEM9JCgoIEMgKyAxICkpDQo+ICsgICAgc2xl
ZXAgMQ0KPiArZG9uZQ0KPiArDQo+ICBlY2hvICJGb3JtYXR0aW5nICRib290ZnMgdG8gZXh0My4u
LiINCj4gIG1rZnMuZXh0MyAkYm9vdGZzDQo+ICA=

