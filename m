Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1USUe9-0002Vz-FO
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 17:52:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Apr 2013 08:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,494,1363158000"; d="scan'208";a="228367299"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Apr 2013 08:32:52 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 17 Apr 2013 16:32:35 +0100
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.19]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.144]) with mapi id
	14.01.0355.002; Wed, 17 Apr 2013 16:32:35 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] postinst does not finish
Thread-Index: AQHOOzUP0+/I8vfcqkqYW+5OPMlXGJjZ5i8AgAAdzoCAAHZqAA==
Date: Wed, 17 Apr 2013 15:32:34 +0000
Message-ID: <1366212758.5008.2.camel@firebird.rb.intel.com>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<CE6CCFD7-CDBA-4669-9EA4-02BBA59EDE5E@gmail.com>
	<18219582.KT7bte5u1O@helios>
In-Reply-To: <18219582.KT7bte5u1O@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.149]
MIME-Version: 1.0
Subject: Re: postinst does not finish
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 15:52:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E5FA8026FE0E7478C5BD1262AC523B9@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFdlZCwgMjAxMy0wNC0xNyBhdCAwOToyOCArMDEwMCwgUGF1bCBFZ2dsZXRvbiB3cm90
ZToNCj4gT24gVHVlc2RheSAxNiBBcHJpbCAyMDEzIDIzOjQyOjA4IEtoZW0gUmFqIHdyb3RlOg0K
PiA+IE9uIEFwciAxNiwgMjAxMywgYXQgMTE6MjggUE0sIEFuZHJlYXMgTcO8bGxlciA8c2Nobml0
emVsdG9ueUBnb29nbGVtYWlsLmNvbT4NCj4gPiB3cm90ZToNCj4gPiA+IHNvcnJ5IGFnYWluIG1l
IHdpdGggYW5vdGhlciBpc3N1ZS4gSSB1cGRhdGVkIGFsbCBsYXllcnMgZnJvbSBtYXN0ZXINCj4g
PiA+IGZldyBob3VycyBhZ28gYW5kIGJ1aWx0IGZyb20gc2NyYXRjaC4gT24gZmlyc3QgYm9vdCB3
aXRoIHN5c3RlbWQNCj4gPiA+IHBvc3RpbnN0IG5ldmVyIGZpbmlzaGVzLiBJIHNlZSBvbmx5Og0K
PiA+ID4gDQo+ID4gPiBbKiogIH0gQSBzdGFydCBqb2IgaXMgcnVubmluZyBmb3IgUnVuIHBlbmRp
bmcgcG9zdGluc3RzDQo+ID4gPiANCj4gPiA+IGFuZCAqKiBhcmUgbW92aW5nIGFyb3VuZC4NCj4g
PiA+IA0KPiA+ID4gRG9lcyBhbnlib2R5IGVsc2UgZmFjZSB0aGlzIG9uZT8NCj4gPg0KPiA+IHJh
biBpbnRvIHNhbWUgaXNzdWUuIEkgZGlzYWJsZWQgcG9zdCBpbnN0YWxscyB0byBydW4gb24gYm9v
dA0KPiANCj4gQ291bGQgeW91IGd1eXMgcGxlYXNlIHRyeSB0byBkZWJ1ZyB0aGlzIGFuZCBmaW5k
IG91dCB3aGF0IGlzIGhhbmdpbmcgaGVyZSwgDQo+IGJlY2F1c2Ugd2l0aCBjb3JlLWltYWdlLW1p
bmltYWwgYW5kIHN5c3RlbWQgSSBkb24ndCBzZWUgdGhpcyBwcm9ibGVtLCB0aGUgcnVuLQ0KPiBw
b3N0aW5zdHMgc2NyaXB0IGZpbmlzaGVzIGFzIGV4cGVjdGVkLg0KPiANCg0KV29ya3MgZm9yIG1l
IHRvbzogY29yZS1pbWFnZS1zYXRvIGFuZCBzeXN0ZW1kLCBxZW11eDg2LCBQQUNLQUdFX0NMQVNT
RVMNCj0gInBhY2thZ2VfaXBrIi4gSSBkbyBzZWUgdGhhdCBtZXNzYWdlIGJ1dCBpdCBkb2Vzbid0
IGhhbmcsIGl0IGZpbmlzaGVzDQpwcmV0dHkgcXVpY2suDQoNCg0KPiBDaGVlcnMsDQo+IFBhdWwN
Cj4gDQoNCg==


