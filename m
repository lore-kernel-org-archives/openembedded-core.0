Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qiyuy-0003hE-NS
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 03:16:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jul 2011 18:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,225,1309762800"; d="scan'208";a="31844052"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2011 18:05:50 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 19 Jul 2011 09:05:45 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 19 Jul 2011 09:05:43 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2011 09:05:43 +0800
Thread-Topic: [OE-core] [PATCH 1/1] alsa-tools: Fix recipe build error.
Thread-Index: AcxFreJsAJC0XrQ1Rzi2i6maJ5kPSQAAccqA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6DF8A64@shsmsx501.ccr.corp.intel.com>
References: <cover.1311035762.git.dongxiao.xu@intel.com>
	<aeaf3f15ab9f47906c77fa591982c0e35510507a.1311035762.git.dongxiao.xu@intel.com>
	<CAMKF1soE1bcoCseq-dDyh1sSqpwBa+6e1113_Or2Z2Xhp1U9oA@mail.gmail.com>
In-Reply-To: <CAMKF1soE1bcoCseq-dDyh1sSqpwBa+6e1113_Or2Z2Xhp1U9oA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] alsa-tools: Fix recipe build error.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 01:16:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1i
ZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVu
ZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBP
Zg0KPiBLaGVtIFJhag0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDE5LCAyMDExIDg6NDcgQU0NCj4g
VG86IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gYWxzYS10b29sczogRml4IHJlY2lwZSBi
dWlsZCBlcnJvci4NCj4gDQo+IE9uIE1vbiwgSnVsIDE4LCAyMDExIGF0IDU6MzcgUE0sIERvbmd4
aWFvIFh1IDxkb25neGlhby54dUBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+IFJlbW92ZSBzb21l
IGVsZW1lbnRzIGluIGFsc2EtdG9vbHMgdG8gYXZvaWQgYnVpbGQgZXJyb3IgYW5kIGZ1cnRoZXIN
Cj4gPiBkZXBlbmRlbmN5IG9uIG5ldyByZWNpcGVzLg0KPiA+DQo+ID4gW1lPQ1RPICMxMDM4XQ0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRG9uZ3hpYW8gWHUgPGRvbmd4aWFvLnh1QGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9hbHNhL2Fsc2EtdG9vbHMtMS4wLjI0LjEvYXV0b3Rvb2xz
LnBhdGNoIMKgIMKgIMKgIHwgwqAgMzQNCj4gPiArKysrKysrKysrKysrKysrKysrKw0KPiA+IMKg
Li4uL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdG9vbHNfMS4wLjI0LjEuYmIgfCDCoCDC
oDcgKysrLQ0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvYWxzYS9hbHNhLXRvb2xzLTEuMC4yNC4xL2F1dG90b29scy5wYXRjaA0KPiA+DQo+ID4g
ZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXRvb2xz
LTEuMC4yNC4xL2F1dG90b29scy5wYXRjaA0KPiA+IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
YWxzYS9hbHNhLXRvb2xzLTEuMC4yNC4xL2F1dG90b29scy5wYXRjaA0KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMC4uYzdiYzJkNg0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdG9vbHMtMS4wLjI0
LjEvYXV0b3Rvb2xzLnBhdGNoDQo+ID4gQEAgLTAsMCArMSwzNCBAQA0KPiA+ICtBZGQgcGFyYW1l
dGVycyB0byBhdXRvcmVjb25mIHRvIHN1cHBvcnQgY3Jvc3MgY29tcGlsZS4NCj4gPiArUmVtb3Zl
IHNvbWUgc3ViLWNvbXBvbmVudHMgd2hpY2ggbmVlZHMgZnVydGhlciByZWNpcGUgc3VwcG9ydC4N
Cj4gPiArDQo+ID4gK1NpZ25lZC1vZmYtYnk6IERvbmd4aWFvIFh1IDxkb25neGlhby54dUBpbnRl
bC5jb20+DQo+ID4gKw0KPiA+ICtVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZp
Z3VyYXRpb25dDQo+ID4gKw0KPiA+ICtkaWZmIC1ydU4gYWxzYS10b29scy0xLjAuMjQuMS1vcmln
Ly9sZDEwazEvZ2l0Y29tcGlsZQ0KPiA+ICthbHNhLXRvb2xzLTEuMC4yNC4xL2xkMTBrMS9naXRj
b21waWxlDQo+ID4gKy0tLSBhbHNhLXRvb2xzLTEuMC4yNC4xLW9yaWcvL2xkMTBrMS9naXRjb21w
aWxlIMKgIMKgIMKgIMKgMjAxMS0wNy0wNg0KPiA+ICsxMToyNzo0MC4yMjc2NjUwMDIgKzA4MDAN
Cj4gPiArKysrIGFsc2EtdG9vbHMtMS4wLjI0LjEvbGQxMGsxL2dpdGNvbXBpbGUgwqAgwqAgwqAy
MDExLTA3LTE0DQo+ID4gKysrKyAxMzoyNjoxOC4wMTc2NjUwMDQgKzA4MDANCj4gPiArQEAgLTEs
NiArMSw2IEBADQo+ID4gKyAjIS9iaW4vYmFzaA0KPiA+ICsNCj4gPiArLWF1dG9yZWNvbmYgLWZp
IHx8IGV4aXQgMQ0KPiA+ICsrYXV0b3JlY29uZiAkQUNMT0NBTF9GTEFHUyAtZmkgfHwgZXhpdCAx
DQo+ID4gKyBleHBvcnQgQ0ZMQUdTPSctTzIgLVdhbGwgLXBpcGUgLWcnDQo+ID4gKyBlY2hvICJD
RkxBR1M9JENGTEFHUyINCj4gPiArIGVjaG8gIi4vY29uZmlndXJlICRAIg0KPiA+ICtkaWZmIC1y
dU4gYWxzYS10b29scy0xLjAuMjQuMS1vcmlnLy9NYWtlZmlsZQ0KPiA+ICthbHNhLXRvb2xzLTEu
MC4yNC4xL01ha2VmaWxlDQo+ID4gKy0tLSBhbHNhLXRvb2xzLTEuMC4yNC4xLW9yaWcvL01ha2Vm
aWxlIDIwMTEtMDctMDYgMTE6Mjc6NDAuMjA3NjY1MDAwDQo+ID4gKyswODAwDQo+ID4gKysrKyBh
bHNhLXRvb2xzLTEuMC4yNC4xL01ha2VmaWxlIMKgIMKgIMKgIDIwMTEtMDctMTQgMTU6MDg6MDgu
ODc3NjY1MDA5DQo+ID4gKysrKyArMDgwMA0KPiA+ICtAQCAtMSw5ICsxLDggQEANCj4gPiArIFZF
UlNJT04gPSAxLjAuMjQuMQ0KPiA+ICsgVE9QID0gLg0KPiA+ICstU1VCRElSUyA9IGFjM2RlYyBh
czEwazEgZW52eTI0Y29udHJvbCBoZHNwbG9hZGVyIGhkc3Bjb25mIGhkc3BtaXhlcg0KPiA+ICtc
DQo+ID4gKy0gwqAgwqAgwqAgwqBtaXhhcnRsb2FkZXIgcGN4aHJsb2FkZXIgcm1lZGlnaWNvbnRy
b2wgc2IxNl9jc3Agc2VxDQo+ID4gK3NzY2FwZV9jdGwgXA0KPiA+ICstIMKgIMKgIMKgIMKgdXM0
Mjhjb250cm9sIHVzeDJ5bG9hZGVyIHZ4bG9hZGVyIGVjaG9taXhlciBsZDEwazEgcWxvMTBrMSBc
DQo+ID4gKy0gwqAgwqAgwqAgwqBod21peHZvbHVtZQ0KPiA+ICsrU1VCRElSUyA9IGFjM2RlYyBh
czEwazEgaGRzcGxvYWRlciBtaXhhcnRsb2FkZXIgcGN4aHJsb2FkZXIgc2IxNl9jc3ANCj4gPiAr
K1wNCj4gPiArKyDCoCDCoCDCoCDCoCDCoHNlcSBzc2NhcGVfY3RsIHVzNDI4Y29udHJvbCB1c3gy
eWxvYWRlciB2eGxvYWRlciBsZDEwazEgXA0KPiA+ICsrIMKgIMKgIMKgIMKgIMKgaHdtaXh2b2x1
bWUNCj4gDQo+IGRvZXMgLS1kaXNhYmxlLWVudnkyNGNvbnRyb2wgZXRjLiB3b3JrID8NCg0KVGhl
IGFib3ZlIGFwcHJvYWNoIGRvZXNuJ3Qgd29yayBzaW5jZSB0aGUgYWxzYS10b29scyBwcm9qZWN0
IG9ubHkgaGFzIGEgZ2xvYmFsIE1ha2VmaWxlIHdoaWxlIG5vIGNvbmZpZ3VyZSBmaWxlcy4NCg0K
VGhhbmtzLA0KRG9uZ3hpYW8NCg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IE9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLmxp
bnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=


