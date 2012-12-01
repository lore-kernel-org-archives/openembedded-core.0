Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TecwH-0008OO-DW
	for Openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 03:36:23 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2012 18:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,195,1355126400"; d="scan'208";a="257439492"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2012 18:22:01 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.234]) by
	ORSMSX103.amr.corp.intel.com ([169.254.2.132]) with mapi id
	14.01.0355.002; Fri, 30 Nov 2012 18:22:01 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Zanussi, Tom" <tom.zanussi@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [meta-intel patch 0/3] Fixes for rescent X breakages in
	meta-intel layer
Thread-Index: AQHNzZVV3zA+BlcKnUW3qmvOlJQyA5gAMvyAgAEBGYCAADCLgP//osFggAINKfCAACUU0A==
Date: Sat, 1 Dec 2012 02:22:01 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C2D931870@ORSMSX106.amr.corp.intel.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
	<1354133261.28084.102.camel@empanada>
	<CAJTo0LbshbjjaDKaj63BABuF0mkLfgo7mnhEwwqiUOw2UHV7nQ@mail.gmail.com>
	<1354198897.1530.0.camel@empanada>
	<ADD6A3980E8C39419A432FF422031B4C2D930F56@ORSMSX106.amr.corp.intel.com>
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
X-List-Received-Date: Sat, 01 Dec 2012 02:36:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBmaW5hbGx5IGdvdCB0aGUgUm9zcydzIHBhdGNoIHdvcmtpbmcgaW4gbXkgZW52LiBJIG5lZWQg
dG8gYWRkIG9uZSBtb3JlIHBhdGNoIGluIG1ldGEtaW50ZWwgdG8gZ2V0IGl0IGZ1bGx5IHdvcmtp
bmcuIA0KDQpTbyBJIEFjayBmb3IgUm9zcydzIHBhdGNoIGluIG9lY29yZSwgYW5kIEkgd2lsbCBz
ZW5kIGEgc21hbGwgcGF0Y2ggZm9yIG1ldGEtaW50ZWwuDQoNClRoYW5rcywNCk5pdGluDQoNCg0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEthbWJsZSwgTml0aW4gQQ0K
PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDMwLCAyMDEyIDQ6MDkgUE0NCj4gVG86IFphbnVzc2ks
IFRvbTsgQnVydG9uLCBSb3NzDQo+IENjOiAnbWV0YS1pbnRlbEB5b2N0b3Byb2plY3Qub3JnJzsg
J09wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnJzsgSGFydCwgRGFy
cmVuDQo+IFN1YmplY3Q6IFJFOiBbbWV0YS1pbnRlbCBwYXRjaCAwLzNdIEZpeGVzIGZvciByZXNj
ZW50IFggYnJlYWthZ2VzIGluIG1ldGEtDQo+IGludGVsIGxheWVyDQo+IA0KPiBSb3NzLA0KPiAg
IEkgdHJpZWQgYXBwbHlpbmcgeW91ciBwYXRjaCBmcm9tIGhlcmUgd2l0aCBnaXQgYW0sIGFuZCBp
dCBpcyBmYWlsaW5nLg0KPiBodHRwOi8vcGF0Y2hlcy5vcGVuZW1iZWRkZWQub3JnL3BhdGNoLzM5
ODAxLw0KPiBDYW4geW91IHNlbmQgbWUgbGluayB0byB5b3VyIGNvbnRyaWIgYnJhbmNoIGZvciB0
aGUgcGF0Y2g/DQo+IA0KPiBUaGFua3MsDQo+IE5pdGluDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEthbWJsZSwgTml0aW4gQQ0KPiA+IFNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciAyOSwgMjAxMiA4OjUwIEFNDQo+ID4gVG86IFphbnVzc2ksIFRvbTsg
QnVydG9uLCBSb3NzDQo+ID4gQ2M6IG1ldGEtaW50ZWxAeW9jdG9wcm9qZWN0Lm9yZzsgT3BlbmVt
YmVkZGVkLQ0KPiA+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgSGFydCwgRGFycmVuDQo+
ID4gU3ViamVjdDogUkU6IFttZXRhLWludGVsIHBhdGNoIDAvM10gRml4ZXMgZm9yIHJlc2NlbnQg
WCBicmVha2FnZXMgaW4NCj4gPiBtZXRhLSBpbnRlbCBsYXllcg0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogWmFudXNzaSwgVG9tDQo+ID4gPiBTZW50
OiBUaHVyc2RheSwgTm92ZW1iZXIgMjksIDIwMTIgNjoyMiBBTQ0KPiA+ID4gVG86IEJ1cnRvbiwg
Um9zcw0KPiA+ID4gQ2M6IEthbWJsZSwgTml0aW4gQTsgbWV0YS1pbnRlbEB5b2N0b3Byb2plY3Qu
b3JnOyBPcGVuZW1iZWRkZWQtDQo+ID4gPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IEhh
cnQsIERhcnJlbg0KPiA+ID4gU3ViamVjdDogUmU6IFttZXRhLWludGVsIHBhdGNoIDAvM10gRml4
ZXMgZm9yIHJlc2NlbnQgWCBicmVha2FnZXMgaW4NCj4gPiA+IG1ldGEtIGludGVsIGxheWVyDQo+
ID4gPg0KPiA+ID4gT24gVGh1LCAyMDEyLTExLTI5IGF0IDExOjI3ICswMDAwLCBCdXJ0b24sIFJv
c3Mgd3JvdGU6DQo+ID4gPiA+IE9uIDI4IE5vdmVtYmVyIDIwMTIgMjA6MDcsIFRvbSBaYW51c3Np
IDx0b20uemFudXNzaUBpbnRlbC5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiA+ID4gU28gZG9lcyB0
aGlzIGNvbmZsaWN0IHdpdGggUm9zcydzIHBhdGNoLCB3aGljaCBzZWVtcyBzaW1wbGVyLi4uDQo+
ID4gPiA+DQo+ID4gPiA+IEkgZG8gcHJlZmVyIG15IHBhdGNoIGFzIHRoZSBzYW1lIGJyZWFrYWdl
IHdpbGwgb2NjdXIgZm9yIGFueW9uZQ0KPiA+ID4gPiBlbHNlIHVzaW5nIG9lLWNvcmUgbWFzdGVy
IGJ1dCBhbHNvIGJ1aWxkaW5nIHRoZWlyIG93biBvbGRlciBYIHNlcnZlci4NCj4gPiA+ID4gV2hp
bHN0IHRoZSBkZWx0YSBpcyBzbyBtaW5pbWFsLCBJIGRvbid0IHNlZSB0aGUgcHJvYmxlbSBpbg0K
PiA+ID4gPiBzdXBwb3J0aW5nIGJvdGggaW4gb2UtY29yZS4NCj4gPiA+ID4NCj4gPiA+DQo+ID4g
PiBJJ2xsIHNlY29uZCB0aGF0Li4uDQo+ID4gPg0KPiA+ID4gVG9tDQo+ID4gPg0KPiA+ID4gPiBS
b3NzDQo+ID4gPg0KPiA+DQo+ID4gSSBhbSBmaW5lIHdpdGggZWl0aGVyIGFwcHJvYWNoIGZvciBm
aXhpbmcgdGhlIGJyZWFrYWdlcy4gSSB3aWxsIHRha2UNCj4gPiBSb3NzJ3MgcGF0Y2ggYW5kIHNl
ZSBpZiBpdCBmaXhlcyB0aGUgaXNzdWUgSSBzYXcuDQo+ID4NCj4gPiBOaXRpbg0KPiA+DQoNCg==


