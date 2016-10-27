Return-Path: <saul.wold@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F65471CE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 20:32:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 27 Oct 2016 13:32:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,553,1473145200"; d="scan'208";a="1060259641"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2016 13:32:11 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 27 Oct 2016 13:32:10 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.50]) by
	ORSMSX153.amr.corp.intel.com ([10.22.226.247]) with mapi id
	14.03.0248.002; Thu, 27 Oct 2016 13:32:10 -0700
From: "Wold, Saul" <saul.wold@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"akuster@mvista.com" <akuster@mvista.com>
Thread-Topic: [OE-core] [PATCH][master][krogoth] archiver: fix gcc-source
	handling
Thread-Index: AQHSMJEwyw97eaigEkW5IOwtutw5sA==
Date: Thu, 27 Oct 2016 20:32:09 +0000
Message-ID: <1477600328.2097.1.camel@intel.com>
References: <1476124325-6771-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1476124325-6771-1-git-send-email-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.80.248]
MIME-Version: 1.0
Subject: Re: [PATCH][master][krogoth] archiver: fix gcc-source handling
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
X-List-Received-Date: Thu, 27 Oct 2016 20:32:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3824CDA8049254E9836BE176A4973CA@intel.com>
Content-Transfer-Encoding: base64

VGhpcyBoYXMgYmVlbiBtZXJnZWQgdG8gbWFzdGVyIHBpbmcgZm9yIEtyb2dvdGgNCg0KU2F1IQ0K
DQpPbiBNb24sIDIwMTYtMTAtMTAgYXQgMTE6MzIgLTA3MDAsIFNhdWwgV29sZCB3cm90ZToNCj4g
DQo+IFRoZSBzb3VyY2UgYXJjaGl2ZXIgd2FzIG5vdCBoYW5kbGluZyB0aGUgZ2NjLXNvdXJjZSB0
YXJnZXQgY29ycmVjdGx5LA0KPiBzaW5jZSBpdCB1c2VzIHRoZQ0KPiB3b3JrLXNoYXJlZCBkaXJl
Y3RvcnksIHdlIGRvbid0IHdhbnQgdG8gdW5wYWNrIGFuZCBwYXRjaCBpdCB0d2ljZSwNCj4ganVz
dCBhcyB0aGUgY29tbWVudHMNCj4gc2F5LCBidXQgdGhlIGNvZGUgd2FzIG5vdCB0aGVyZSB0byBj
aGVjayBmb3IgdGhlIGdjYy1zb3VyY2UgdGFyZ2V0Lg0KPiANCj4gW1lPQ1RPICMxMDI2NV0NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFNhdWwgV29sZCA8c2d3QGxpbnV4LmludGVsLmNvbT4NCj4gLS0t
DQo+IA0KPiDCoG1ldGEvY2xhc3Nlcy9hcmNoaXZlci5iYmNsYXNzIHwgNSArKystLQ0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2FyY2hpdmVyLmJiY2xhc3MNCj4gYi9tZXRhL2NsYXNzZXMv
YXJjaGl2ZXIuYmJjbGFzcw0KPiBpbmRleCAxZDhlODYzLi45MjM5OTgzIDEwMDY0NA0KPiAtLS0g
YS9tZXRhL2NsYXNzZXMvYXJjaGl2ZXIuYmJjbGFzcw0KPiArKysgYi9tZXRhL2NsYXNzZXMvYXJj
aGl2ZXIuYmJjbGFzcw0KPiBAQCAtMzAzLDkgKzMwMywxMCBAQCBweXRob24gZG9fdW5wYWNrX2Fu
ZF9wYXRjaCgpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuDQo+IMKgwqDCoMKgwqBhcl9v
dXRkaXIgPSBkLmdldFZhcignQVJDSElWRVJfT1VURElSJywgVHJ1ZSkNCj4gwqDCoMKgwqDCoGFy
X3dvcmtkaXIgPSBkLmdldFZhcignQVJDSElWRVJfV09SS0RJUicsIFRydWUpDQo+ICvCoMKgwqDC
oHBuID0gZC5nZXRWYXIoJ1BOJywgVHJ1ZSkNCj4gwqANCj4gwqDCoMKgwqDCoCMgVGhlIGtlcm5l
bCBjbGFzcyBmdW5jdGlvbnMgcmVxdWlyZSBpdCB0byBiZSBvbiB3b3JrLXNoYXJlZCwgc28NCj4g
d2UgZG9udCBjaGFuZ2UgV09SS0RJUg0KPiAtwqDCoMKgwqBpZiBub3QgYmIuZGF0YS5pbmhlcml0
c19jbGFzcygna2VybmVsLXlvY3RvJywgZCk6DQo+ICvCoMKgwqDCoGlmIG5vdCAoYmIuZGF0YS5p
bmhlcml0c19jbGFzcygna2VybmVsLXlvY3RvJywgZCkgb3INCj4gcG4uc3RhcnRzd2l0aCgnZ2Nj
LXNvdXJjZScpKToNCj4gwqDCoMKgwqDCoMKgwqDCoMKgIyBDaGFuZ2UgdGhlIFdPUktESVIgdG8g
bWFrZSBkb191bnBhY2sgZG9fcGF0Y2ggcnVuIGluDQo+IGFub3RoZXIgZGlyLg0KPiDCoMKgwqDC
oMKgwqDCoMKgwqBkLnNldFZhcignV09SS0RJUicsIGFyX3dvcmtkaXIpDQo+IMKgDQo+IEBAIC0z
MjMsNyArMzI0LDcgQEAgcHl0aG9uIGRvX3VucGFja19hbmRfcGF0Y2goKSB7DQo+IMKgwqDCoMKg
wqDCoMKgwqDCoG9lLnBhdGguY29weXRyZWUoc3JjLCBzcmNfb3JpZykNCj4gwqANCj4gwqDCoMKg
wqDCoCMgTWFrZSBzdXJlIGdjYyBhbmQga2VybmVsIHNvdXJjZXMgYXJlIHBhdGNoZWQgb25seSBv
bmNlDQo+IC3CoMKgwqDCoGlmIG5vdCAoKGQuZ2V0VmFyKCdTUkNfVVJJJywgVHJ1ZSkgPT0gIiIg
b3INCj4gYmIuZGF0YS5pbmhlcml0c19jbGFzcygna2VybmVsLXlvY3RvJywgZCkpKToNCj4gK8Kg
wqDCoMKgaWYgbm90IChkLmdldFZhcignU1JDX1VSSScsIFRydWUpID09ICIiIG9yDQo+IChiYi5k
YXRhLmluaGVyaXRzX2NsYXNzKCdrZXJuZWwteW9jdG8nLCBkKSBvciBwbi5zdGFydHN3aXRoKCdn
Y2MtDQo+IHNvdXJjZScpKSk6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoGJiLmJ1aWxkLmV4ZWNfZnVu
YygnZG9fcGF0Y2gnLCBkKQ0KPiDCoA0KPiDCoMKgwqDCoMKgIyBDcmVhdGUgdGhlIHBhdGNoZXMN
Cj4gLS3CoA0KPiAyLjcuNA0KPiA=

