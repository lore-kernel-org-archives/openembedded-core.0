Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYhGD-00016w-Ci
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 17:55:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2011 08:49:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100126215"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 08:49:02 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 8 Dec 2011 08:49:02 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Thu, 8 Dec 2011 08:49:01 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 08:49:00 -0800
Thread-Topic: [OE-core] [PATCH 01/11] gst-fluendo.inc: remove unneccessary hack
Thread-Index: Acy1fDt79CTemaaiQiWcanwhzdo2NAATO2ww
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3F3D596@orsmsx504.amr.corp.intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<CAMKF1sre+EU+iSEY24+o9TNhrEpJpxq5iozVi=2oaFUBN+kxaw@mail.gmail.com>
In-Reply-To: <CAMKF1sre+EU+iSEY24+o9TNhrEpJpxq5iozVi=2oaFUBN+kxaw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "hjl.tools@gmail.com" <hjl.tools@gmail.com>
Subject: Re: [PATCH 01/11] gst-fluendo.inc: remove unneccessary	hack
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
X-List-Received-Date: Thu, 08 Dec 2011 16:55:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2hl
bSBSYWoNCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAwNywgMjAxMSAxMTozNyBQTQ0KPiBU
bzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gQ2M6
IGhqbC50b29sc0BnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMDEv
MTFdIGdzdC1mbHVlbmRvLmluYzogcmVtb3ZlDQo+IHVubmVjY2Vzc2FyeSBoYWNrDQo+IA0KPiBP
biBXZWQsIERlYyA3LCAyMDExIGF0IDk6NDggUE0sICA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29t
PiB3cm90ZToNCj4gPiBGcm9tOiBOaXRpbiBBIEthbWJsZSA8bml0aW4uYS5rYW1ibGVAaW50ZWwu
Y29tPg0KPiA+DQo+ID4gVGhpcyBmaXhlcyBidWc6IFtZT0NUTyAjMTQwM10NCj4gPg0KPiA+IHRo
ZSBjdXN0b20gZGVmaW5pdGlvbiBvZiBDQyB3YXMgY2F1c2luZyBidWlsZCBpc3VzZXMgd2l0aCB4
MzINCj4gdG9vbGNoYWluLg0KPiA+IEFuZCBhbHNvIEkgZm91bmQgb3V0IHRoYXQgdGhlIGhhY2sg
aXMgbm90IG5lY2Nlc3NhcnkgYW55bW9yZS4gdGhlDQo+ID4gYWZmZWN0ZWQgZ3N0LWZsdWVuZG8t
bXBlZ2RlbXV4IHJlY2lwZSBidWlsZHMgZmluZSB3aXRob3V0IHRoZSBDQw0KPiBoYWNrLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogTml0aW4gQSBLYW1ibGUgPG5pdGluLmEua2FtYmxlQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3QtZmx1ZW5kby5pbmMgfCDCoCDCoDQgLS0tLQ0KPiA+IMKgMSBmaWxlcyBjaGFuZ2VkLCAwIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1mbHVlbmRvLmluYw0KPiBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZmx1ZW5kby5pbmMNCj4gPiBpbmRleCAyMDNi
ZGJhLi44YjI0Y2Y3IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3QtZmx1ZW5kby5pbmMNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0LWZsdWVuZG8uaW5jDQo+ID4gQEAgLTEyLDcgKzEyLDMgQEAgRklMRVNf
JHtQTn0tZGJnICs9ICIke2xpYmRpcn0vZ3N0cmVhbWVyLQ0KPiAwLjEwLy5kZWJ1ZyINCj4gPiDC
oEZJTEVTXyR7UE59LWRldiArPSAiJHtsaWJkaXJ9L2dzdHJlYW1lci0wLjEwLyoubGENCj4gJHts
aWJkaXJ9L2dzdHJlYW1lci0wLjEwLyouYSINCj4gPg0KPiA+IMKgRVhUUkFfT0VDT05GID0gIi0t
ZGlzYWJsZS1kZWJ1ZyAtLWRpc2FibGUtdmFsZ3JpbmQiDQo+ID4gLQ0KPiA+IC0jIEhhY2sgdG8g
Z2V0IFNUQUdJTkdfTElCRElSIGludG8gdGhlIGxpbmtlciBwYXRoIHdoZW4gYnVpbGRpbmcNCj4g
PiAtQ0MgPSAiJHtDQ0FDSEV9ICR7SE9TVF9QUkVGSVh9Z2NjIC1MJHtTVEFHSU5HX0xJQkRJUn0i
DQo+ID4gLQ0KPiANCj4gdGhpcyBuZWVkcyBhIFBSIGJ1bXANCg0KSSBwdXJwb3NlbHkgZGlkIG5v
dCBidW1wIFBSIGhlcmUsIGJlY2F1c2UgaXQgZG9lcyBub3QgY2hhbmdlIG91dHB1dCBvZiB0aGUg
cmVjaXBlLg0KDQpOaXRpbg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IE9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLmxpbnV4
dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=


