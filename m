Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RnZ2I-0005GS-UQ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 18:10:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2012 08:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113641474"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2012 08:52:06 -0800
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 Jan 2012 08:52:05 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.13]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.170]) with mapi id
	14.01.0355.002; Wed, 18 Jan 2012 08:52:05 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/5] bdwgc: new recipe for autogen
Thread-Index: AQHM1VcBUBzdc4w0406ji+Trwlz3apYRuTsA//+c71CAAAFYkIAAzPUAgAAzlpA=
Date: Wed, 18 Jan 2012 16:52:04 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0129FDF2@ORSMSX106.amr.corp.intel.com>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<CAMKF1sriceDbz_scyB-TthDOWEzK+t9i0wgEJ_No=v_NF18JjA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0128E66B@ORSMSX105.amr.corp.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0128F67C@ORSMSX105.amr.corp.intel.com>
	<CAMKF1sq4Q7VjNkbLTbqdsmne+NQz-vE4vY58uipsL+kqKxz+-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq4Q7VjNkbLTbqdsmne+NQz-vE4vY58uipsL+kqKxz+-Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] bdwgc: new recipe for autogen
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
X-List-Received-Date: Wed, 18 Jan 2012 17:10:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2hl
bSBSYWoNCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxNywgMjAxMiA5OjQ2IFBNDQo+IFRvOiBQ
YXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzVdIGJkd2djOiBuZXcgcmVjaXBlIGZvciBhdXRvZ2Vu
DQo+IA0KPiBPbiBUdWUsIEphbiAxNywgMjAxMiBhdCA1OjMzIFBNLCBLYW1ibGUsIE5pdGluIEEN
Cj4gPG5pdGluLmEua2FtYmxlQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZg0KPiBPZg0KPiA+PiBL
YW1ibGUsIE5pdGluIEENCj4gPj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxNywgMjAxMiA1OjI5
IFBNDQo+ID4+IFRvOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBs
YXllcg0KPiA+PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzVdIGJkd2djOiBuZXcg
cmVjaXBlIGZvciBhdXRvZ2VuDQo+ID4+DQo+ID4+IEtoZW0sDQo+ID4+IEhlcmUgd2FzIHRoZSBj
b25maWd1cmUgZXJyb3I6DQo+ID4+IHwgY29uZmlndXJlOiBlcnJvcjogUGFja2FnZSByZXF1aXJl
bWVudHMgKGJkdy1nYykgd2VyZSBub3QgbWV0Og0KPiA+PiB8DQo+ID4+IHwgTm8gcGFja2FnZSAn
YmR3LWdjJyBmb3VuZA0KPiA+PiB8DQo+ID4+IHwgQ29uc2lkZXIgYWRqdXN0aW5nIHRoZSBQS0df
Q09ORklHX1BBVEggZW52aXJvbm1lbnQgdmFyaWFibGUgaWYgeW91DQo+ID4+IHwgaW5zdGFsbGVk
IHNvZnR3YXJlIGluIGEgbm9uLXN0YW5kYXJkIHByZWZpeC4NCj4gPj4gfA0KPiA+PiB8IEFsdGVy
bmF0aXZlbHksIHlvdSBtYXkgc2V0IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMgQkRXX0dDX0NG
TEFHUw0KPiA+PiB8IGFuZCBCRFdfR0NfTElCUyB0byBhdm9pZCB0aGUgbmVlZCB0byBjYWxsIHBr
Zy1jb25maWcuDQo+ID4+IHwgU2VlIHRoZSBwa2ctY29uZmlnIG1hbiBwYWdlIGZvciBtb3JlIGRl
dGFpbHMuDQo+ID4+IHwgRVJST1I6IG9lX3J1bmNvbmYgZmFpbGVkDQo+IA0KPiB5ZWFoIEkgc2Vl
IGd1aWxlLTIgbmVlZHMgYSBnYXJiYWdlIGNvbGxlY3Rvci4gRGlkIHlvdSB0cnkgdGhlIG9yaWdp
bmFsDQo+IGxpYmdjID8NCj4gaHR0cDovL2Fub25zY20uZGViaWFuLm9yZy9naXR3ZWIvP3A9Y29s
bGFiLW1haW50L2xpYmdjLmdpdDthPXN1bW1hcnkNCj4gDQoNCktoZW0sDQogIEFzIHRoZSBiZHdn
YyB3YXMgd29ya2luZyBhcyBleHBlY3RlZCwgSSBkaWQgbm90IHRyeSB0byBmaW5kIGFueSBhbHRl
cm5hdGl2ZSB0aGVyZS4NCk5pdGluDQoNCj4gDQo+ID4+DQo+ID4+IE5pdGluDQo+ID4+DQo+ID4g
QW5kIGl0IGlzIGJlaW5nIHVzZWQgaW4gdGhpcyBjIGZpbGU6IGxpYmd1aWxlL3RocmVhZHMuYw0K
PiA+DQo+ID4gVGhhbmtzLA0KPiA+IE5pdGluDQo+ID4NCj4gPj4NCj4gPj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiA+IFttYWlsdG86b3BlbmVtYmVkZGVkLWNvcmUt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbg0KPiBCZWhhbGYNCj4gPj4gT2YNCj4g
Pj4gPiBLaGVtIFJhag0KPiA+PiA+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMTcsIDIwMTIgMzoy
MyBQTQ0KPiA+PiA+IFRvOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29y
ZSBsYXllcg0KPiA+PiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvNV0gYmR3Z2M6
IG5ldyByZWNpcGUgZm9yIGF1dG9nZW4NCj4gPj4gPg0KPiA+PiA+IE9uIFR1ZSwgSmFuIDE3LCAy
MDEyIGF0IDEyOjMwIFBNLCDCoDxuaXRpbi5hLmthbWJsZUBpbnRlbC5jb20+DQo+IHdyb3RlOg0K
PiA+PiA+ID4gVGhpcyByZWNpcGUgaXMgbmVlZGVkIGJ5IGd1aWxlLg0KPiA+PiA+ID4gQW5kIGd1
aWxlIGlzIG5lZWRlZCBmb3IgYXV0b2dlbi4NCj4gPj4gPg0KPiA+PiA+IGlzIHRoaXMgcmVhbGx5
IG5lZWRlZCBieSBndWlsZS4gaWYgeWVzIHdoYXQgcGFydCBvZiBndWlkZSBuZWVkIGl0DQo+ID8N
Cj4gPj4gPg0KPiA+PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+ID4+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4+ID4gT3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiA+IGh0dHA6Ly9saXN0
cy5saW51eHRvZ28ub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtDQo+
IGNvcmUNCj4gPj4NCj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gPj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4+IE9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gaHR0cDovL2xpc3RzLmxp
bnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC0NCj4gY29y
ZQ0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiBPcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5v
cmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+IA0KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRk
ZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlz
dGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==


