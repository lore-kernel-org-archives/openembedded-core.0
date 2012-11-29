Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Te7X3-0002if-3H
	for Openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 18:04:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2012 08:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,185,1355126400"; d="scan'208";a="249303495"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2012 08:49:55 -0800
Received: from orsmsx108.amr.corp.intel.com (10.22.225.41) by
	ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Thu, 29 Nov 2012 08:49:55 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.234]) by
	ORSMSX108.amr.corp.intel.com ([169.254.9.188]) with mapi id
	14.01.0355.002; Thu, 29 Nov 2012 08:49:55 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Zanussi, Tom" <tom.zanussi@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [meta-intel patch 0/3] Fixes for rescent X breakages in
	meta-intel layer
Thread-Index: AQHNzZVV3zA+BlcKnUW3qmvOlJQyA5gAMvyAgAEBGYCAADCLgP//osFg
Date: Thu, 29 Nov 2012 16:49:54 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C2D930F56@ORSMSX106.amr.corp.intel.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
	<1354133261.28084.102.camel@empanada>
	<CAJTo0LbshbjjaDKaj63BABuF0mkLfgo7mnhEwwqiUOw2UHV7nQ@mail.gmail.com>
	<1354198897.1530.0.camel@empanada>
In-Reply-To: <1354198897.1530.0.camel@empanada>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>, "Hart,
	Darren" <darren.hart@intel.com>, "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [meta-intel patch 0/3] Fixes for rescent X breakages in meta-intel layer
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
X-List-Received-Date: Thu, 29 Nov 2012 17:04:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBaYW51c3NpLCBUb20NCj4gU2Vu
dDogVGh1cnNkYXksIE5vdmVtYmVyIDI5LCAyMDEyIDY6MjIgQU0NCj4gVG86IEJ1cnRvbiwgUm9z
cw0KPiBDYzogS2FtYmxlLCBOaXRpbiBBOyBtZXRhLWludGVsQHlvY3RvcHJvamVjdC5vcmc7IE9w
ZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBIYXJ0LCBEYXJyZW4N
Cj4gU3ViamVjdDogUmU6IFttZXRhLWludGVsIHBhdGNoIDAvM10gRml4ZXMgZm9yIHJlc2NlbnQg
WCBicmVha2FnZXMgaW4gbWV0YS0NCj4gaW50ZWwgbGF5ZXINCj4gDQo+IE9uIFRodSwgMjAxMi0x
MS0yOSBhdCAxMToyNyArMDAwMCwgQnVydG9uLCBSb3NzIHdyb3RlOg0KPiA+IE9uIDI4IE5vdmVt
YmVyIDIwMTIgMjA6MDcsIFRvbSBaYW51c3NpIDx0b20uemFudXNzaUBpbnRlbC5jb20+IHdyb3Rl
Og0KPiA+ID4gU28gZG9lcyB0aGlzIGNvbmZsaWN0IHdpdGggUm9zcydzIHBhdGNoLCB3aGljaCBz
ZWVtcyBzaW1wbGVyLi4uDQo+ID4NCj4gPiBJIGRvIHByZWZlciBteSBwYXRjaCBhcyB0aGUgc2Ft
ZSBicmVha2FnZSB3aWxsIG9jY3VyIGZvciBhbnlvbmUgZWxzZQ0KPiA+IHVzaW5nIG9lLWNvcmUg
bWFzdGVyIGJ1dCBhbHNvIGJ1aWxkaW5nIHRoZWlyIG93biBvbGRlciBYIHNlcnZlci4NCj4gPiBX
aGlsc3QgdGhlIGRlbHRhIGlzIHNvIG1pbmltYWwsIEkgZG9uJ3Qgc2VlIHRoZSBwcm9ibGVtIGlu
IHN1cHBvcnRpbmcNCj4gPiBib3RoIGluIG9lLWNvcmUuDQo+ID4NCj4gDQo+IEknbGwgc2Vjb25k
IHRoYXQuLi4NCj4gDQo+IFRvbQ0KPiANCj4gPiBSb3NzDQo+IA0KDQpJIGFtIGZpbmUgd2l0aCBl
aXRoZXIgYXBwcm9hY2ggZm9yIGZpeGluZyB0aGUgYnJlYWthZ2VzLiBJIHdpbGwgdGFrZSBSb3Nz
J3MgcGF0Y2ggYW5kIHNlZSBpZiBpdCBmaXhlcyB0aGUgaXNzdWUgSSBzYXcuDQoNCk5pdGluDQoN
Cg0K


