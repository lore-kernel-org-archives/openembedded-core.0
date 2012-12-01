Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TeatM-0004bJ-NO
	for Openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 01:25:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Nov 2012 16:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,194,1355126400"; d="scan'208";a="224995859"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2012 16:09:31 -0800
Received: from orsmsx107.amr.corp.intel.com (10.22.225.80) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 30 Nov 2012 16:09:30 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.234]) by
	ORSMSX107.amr.corp.intel.com ([169.254.10.163]) with mapi id
	14.01.0355.002; Fri, 30 Nov 2012 16:09:30 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Zanussi, Tom" <tom.zanussi@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [meta-intel patch 0/3] Fixes for rescent X breakages in
	meta-intel layer
Thread-Index: AQHNzZVV3zA+BlcKnUW3qmvOlJQyA5gAMvyAgAEBGYCAADCLgP//osFggAINKfA=
Date: Sat, 1 Dec 2012 00:09:29 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C2D931846@ORSMSX106.amr.corp.intel.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
	<1354133261.28084.102.camel@empanada>
	<CAJTo0LbshbjjaDKaj63BABuF0mkLfgo7mnhEwwqiUOw2UHV7nQ@mail.gmail.com>
	<1354198897.1530.0.camel@empanada>
	<ADD6A3980E8C39419A432FF422031B4C2D930F56@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C2D930F56@ORSMSX106.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "'meta-intel@yoctoproject.org'" <meta-intel@yoctoproject.org>, "Hart,
	Darren" <darren.hart@intel.com>,
	"'Openembedded-core@lists.openembedded.org'"
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
X-List-Received-Date: Sat, 01 Dec 2012 00:25:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Um9zcywNCiAgSSB0cmllZCBhcHBseWluZyB5b3VyIHBhdGNoIGZyb20gaGVyZSB3aXRoIGdpdCBh
bSwgYW5kIGl0IGlzIGZhaWxpbmcuIGh0dHA6Ly9wYXRjaGVzLm9wZW5lbWJlZGRlZC5vcmcvcGF0
Y2gvMzk4MDEvDQpDYW4geW91IHNlbmQgbWUgbGluayB0byB5b3VyIGNvbnRyaWIgYnJhbmNoIGZv
ciB0aGUgcGF0Y2g/DQoNClRoYW5rcywNCk5pdGluDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBLYW1ibGUsIE5pdGluIEENCj4gU2VudDogVGh1cnNkYXksIE5vdmVt
YmVyIDI5LCAyMDEyIDg6NTAgQU0NCj4gVG86IFphbnVzc2ksIFRvbTsgQnVydG9uLCBSb3NzDQo+
IENjOiBtZXRhLWludGVsQHlvY3RvcHJvamVjdC5vcmc7IE9wZW5lbWJlZGRlZC0NCj4gY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnOyBIYXJ0LCBEYXJyZW4NCj4gU3ViamVjdDogUkU6IFttZXRh
LWludGVsIHBhdGNoIDAvM10gRml4ZXMgZm9yIHJlc2NlbnQgWCBicmVha2FnZXMgaW4gbWV0YS0N
Cj4gaW50ZWwgbGF5ZXINCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBG
cm9tOiBaYW51c3NpLCBUb20NCj4gPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjksIDIwMTIg
NjoyMiBBTQ0KPiA+IFRvOiBCdXJ0b24sIFJvc3MNCj4gPiBDYzogS2FtYmxlLCBOaXRpbiBBOyBt
ZXRhLWludGVsQHlvY3RvcHJvamVjdC5vcmc7IE9wZW5lbWJlZGRlZC0NCj4gPiBjb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc7IEhhcnQsIERhcnJlbg0KPiA+IFN1YmplY3Q6IFJlOiBbbWV0YS1p
bnRlbCBwYXRjaCAwLzNdIEZpeGVzIGZvciByZXNjZW50IFggYnJlYWthZ2VzIGluDQo+ID4gbWV0
YS0gaW50ZWwgbGF5ZXINCj4gPg0KPiA+IE9uIFRodSwgMjAxMi0xMS0yOSBhdCAxMToyNyArMDAw
MCwgQnVydG9uLCBSb3NzIHdyb3RlOg0KPiA+ID4gT24gMjggTm92ZW1iZXIgMjAxMiAyMDowNywg
VG9tIFphbnVzc2kgPHRvbS56YW51c3NpQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+IFNv
IGRvZXMgdGhpcyBjb25mbGljdCB3aXRoIFJvc3MncyBwYXRjaCwgd2hpY2ggc2VlbXMgc2ltcGxl
ci4uLg0KPiA+ID4NCj4gPiA+IEkgZG8gcHJlZmVyIG15IHBhdGNoIGFzIHRoZSBzYW1lIGJyZWFr
YWdlIHdpbGwgb2NjdXIgZm9yIGFueW9uZSBlbHNlDQo+ID4gPiB1c2luZyBvZS1jb3JlIG1hc3Rl
ciBidXQgYWxzbyBidWlsZGluZyB0aGVpciBvd24gb2xkZXIgWCBzZXJ2ZXIuDQo+ID4gPiBXaGls
c3QgdGhlIGRlbHRhIGlzIHNvIG1pbmltYWwsIEkgZG9uJ3Qgc2VlIHRoZSBwcm9ibGVtIGluDQo+
ID4gPiBzdXBwb3J0aW5nIGJvdGggaW4gb2UtY29yZS4NCj4gPiA+DQo+ID4NCj4gPiBJJ2xsIHNl
Y29uZCB0aGF0Li4uDQo+ID4NCj4gPiBUb20NCj4gPg0KPiA+ID4gUm9zcw0KPiA+DQo+IA0KPiBJ
IGFtIGZpbmUgd2l0aCBlaXRoZXIgYXBwcm9hY2ggZm9yIGZpeGluZyB0aGUgYnJlYWthZ2VzLiBJ
IHdpbGwgdGFrZSBSb3NzJ3MNCj4gcGF0Y2ggYW5kIHNlZSBpZiBpdCBmaXhlcyB0aGUgaXNzdWUg
SSBzYXcuDQo+IA0KPiBOaXRpbg0KPiANCg0K


