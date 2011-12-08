Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYmmZ-0006jV-B4
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 23:49:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Dec 2011 14:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="84480193"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 08 Dec 2011 14:42:48 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi; Thu, 8 Dec 2011
	14:42:47 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 14:42:46 -0800
Thread-Topic: [OE-core] [PATCH 05/11] findutils: Fix compilation for x32
	toolchain
Thread-Index: Acy16mRKlE5ggGI3T42jdFfLIsS2ZwAEEFrw
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3FA7EAA@orsmsx504.amr.corp.intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<7e5d0671426509d061abbe8b320f65f2cfb3a8a0.1323323130.git.nitin.a.kamble@intel.com>
	<CAMKF1spqOpuz-M7e-F5Cwgx_ufQ4m7MTfBv05StCCXE3e5zV4w@mail.gmail.com>
	<1323335282.971.11.camel@ted>
	<9DA5872FEF993D41B7173F58FCF6BE94E3FA7B5E@orsmsx504.amr.corp.intel.com>
	<CAMKF1sobk3Yu2RjRLDBP58bQj+5nZjva9LQMicDLC+2xfQsC_g@mail.gmail.com>
In-Reply-To: <CAMKF1sobk3Yu2RjRLDBP58bQj+5nZjva9LQMicDLC+2xfQsC_g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "hjl.tools@gmail.com" <hjl.tools@gmail.com>
Subject: Re: [PATCH 05/11] findutils: Fix compilation for x32	toolchain
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
X-List-Received-Date: Thu, 08 Dec 2011 22:49:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2hl
bSBSYWoNCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDA4LCAyMDExIDEyOjQ1IFBNDQo+IFRv
OiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBDYzog
aGpsLnRvb2xzQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAwNS8x
MV0gZmluZHV0aWxzOiBGaXggY29tcGlsYXRpb24gZm9yIHgzMg0KPiB0b29sY2hhaW4NCj4gDQo+
IE9uIFRodSwgRGVjIDgsIDIwMTEgYXQgMTA6MzcgQU0sIEthbWJsZSwgTml0aW4gQQ0KPiA8bml0
aW4uYS5rYW1ibGVAaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmDQo+IE9mDQo+ID4+IFJpY2hhcmQg
UHVyZGllDQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAwOCwgMjAxMSAxOjA4IEFNDQo+
ID4+IFRvOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0K
PiA+PiBDYzogaGpsLnRvb2xzQGdtYWlsLmNvbQ0KPiA+PiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSCAwNS8xMV0gZmluZHV0aWxzOiBGaXggY29tcGlsYXRpb24gZm9yDQo+IHgzMg0KPiA+
PiB0b29sY2hhaW4NCj4gPj4NCj4gPj4gT24gV2VkLCAyMDExLTEyLTA3IGF0IDIzOjE0IC0wODAw
LCBLaGVtIFJhaiB3cm90ZToNCj4gPj4gPiBPbiBXZWQsIERlYyA3LCAyMDExIGF0IDk6NDggUE0s
IMKgPG5pdGluLmEua2FtYmxlQGludGVsLmNvbT4gd3JvdGU6DQo+ID4+ID4gPiBGcm9tOiBOaXRp
biBBIEthbWJsZSA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPg0KPiA+PiA+ID4NCj4gPj4gPiA+
IFdvcmsgYXJvdW5kIGdudWxpYiB0aW1lX3QgYXNzdW1wdGlvbiBpbiBmaW5kdXRpbHMgZm9yIHgz
Mg0KPiA+PiA+DQo+ID4+ID4gaWYgaXRzIGEgd29ya2Fyb3VuZCBjYW4gaXQgYmUgYXBwbGllZCBv
bmx5IHRvIHgzMiB3aXRoIGhlbHAgb2YNCj4gPj4gb3ZlcnJpZGVzIHBsZWFzZQ0KPiA+Pg0KPiA+
PiBJdHMgbm90IGEgd29ya2Fyb3VuZCwgdGhlIHBhdGNoIGxvb2tzIGxpa2UgYSBnZW5lcmljIHJl
YXNvbmFibGUgZml4DQo+IHRvDQo+ID4+IGNvcnJlY3QgYXNzdW1wdGlvbnMgbWFkZSBieSB0aGUg
cHJvZ3JhbSB0aGF0IGFyZW4ndCB0cnVlPw0KPiA+DQo+ID4NCj4gPiBFdmVuIHRob3VnaCB4MzIg
Y2F1Z2h0IHRoZSBpc3N1ZSwgdGhlIGlzc3VlIGlzIG5vdCB4MzIgc3BlY2lmaWMuIEFuZA0KPiBh
bHNvDQo+ID4gb3RoZXIgYXJjaGVzIGFyZSBidWlsZGluZyBmaW5lIHdpdGggdGhlIGNoYW5nZS4g
U28gSSB0aGluayBpdCBpcw0KPiBiZXR0ZXINCj4gPiB0byBrZWVwIHRoaXMgcGF0Y2ggaW4gb2Vj
b3JlLg0KPiANCj4gT0sgdGhlbiBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlIGl0cyBjb25mdXNp
bmcuDQoNCk9rLCBJIGNoYW5nZWQgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZSBjb250cmliLiBi
cmFuY2ggbml0aW4veDMyLg0KTml0aW4NCg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0
DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xp
c3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1j
b3JlDQo=


