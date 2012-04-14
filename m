Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIv0u-00018l-1N
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 06:55:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Apr 2012 21:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88956985"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Apr 2012 21:45:44 -0700
Received: from fmsmsx106.amr.corp.intel.com (10.19.9.37) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 13 Apr 2012 21:45:44 -0700
Received: from fmsmsx152.amr.corp.intel.com ([169.254.7.134]) by
	FMSMSX106.amr.corp.intel.com ([169.254.6.145]) with mapi id
	14.01.0355.002; Fri, 13 Apr 2012 21:45:43 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] grub 1.99: fix build for gcc 4.7
Thread-Index: AQHNGVmrbeIxRq32M0yDQJHCMFvFQ5aZqIAA///CGFCAALMdAP//oetw
Date: Sat, 14 Apr 2012 04:45:36 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030600B6@fmsmsx152.amr.corp.intel.com>
References: <cover.1334308316.git.liezhi.yang@windriver.com>
	<638c4f827223820ee30ff0820df4179d41acfb60.1334308316.git.liezhi.yang@windriver.com>
	<CAMKF1soUx3Ov3Z1jZJpn3=hj_u79j5VaTVEG-S27SMQ8icsUWg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C03060012@fmsmsx152.amr.corp.intel.com>
	<CAMKF1spMNCc3dUkp-SyOMvWhc3diKY3nbiFUxQuDb1PjBsPKiA@mail.gmail.com>
In-Reply-To: <CAMKF1spMNCc3dUkp-SyOMvWhc3diKY3nbiFUxQuDb1PjBsPKiA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] grub 1.99: fix build for gcc 4.7
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
X-List-Received-Date: Sat, 14 Apr 2012 04:55:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2hl
bSBSYWoNCj4gU2VudDogRnJpZGF5LCBBcHJpbCAxMywgMjAxMiA4OjIwIFBNDQo+IFRvOiBQYXRj
aGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAxLzFdIGdydWIgMS45OTogZml4IGJ1aWxkIGZvciBnY2MgNC43
DQo+IA0KPiBPbiBGcmksIEFwciAxMywgMjAxMiBhdCA0OjQzIFBNLCBLYW1ibGUsIE5pdGluIEEN
Cj4gPG5pdGluLmEua2FtYmxlQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZg0KPiA+PiBPZiBLaGVt
IFJhag0KPiA+PiBTZW50OiBGcmlkYXksIEFwcmlsIDEzLCAyMDEyIDE6MjEgUE0NCj4gPj4gVG86
IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+ID4+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gZ3J1YiAxLjk5OiBmaXggYnVpbGQgZm9y
IGdjYyA0LjcNCj4gPj4NCj4gPj4gT24gRnJpLCBBcHIgMTMsIDIwMTIgYXQgMjo0MSBBTSwgUm9i
ZXJ0IFlhbmcNCj4gPj4gPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+PiA+
IFRoZXJlIHdhcyBhbiBlcnJvciB3aGVuIGJ1aWxkIHdpdGggZ2NjIDQuNyAoRkMgMTcgNjRiaXQp
Og0KPiA+PiA+IHwgZnMvemZzL3pmcy5jOiBJbiBmdW5jdGlvbiAnZ2V0X2ZpbGVzeXN0ZW1fZG5v
ZGUnOg0KPiA+PiA+IHwgZnMvemZzL3pmcy5jOjE0NDk6NzogZXJyb3I6IGRlcmVmZXJlbmNpbmcg
dHlwZS1wdW5uZWQgcG9pbnRlcg0KPiA+PiA+IHwgd2lsbCBicmVhayBzdHJpY3QtYWxpYXNpbmcg
cnVsZXMgWy1XZXJyb3I9c3RyaWN0LWFsaWFzaW5nXQ0KPiA+PiA+IC4uLi4uLg0KPiA+PiA+IGNj
MTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQo+ID4+ID4NCj4gPj4gPiBX
aGlsZSBjb21wYXJlIHRoZSBjb21waWxlIGNvbW1hbmQgYmV0d2VlbiBnY2MgNC40LjQgYW5kIGdj
YyA0LjcuMCwNCj4gPj4gPiB0aGV5IGFyZSB0aGUgc2FtZSAoYm90aCBvZiB0aGVtIGhhdmUgLVdh
bGwgYW5kIC1XZXJyb3IpLCBpdCBzZWVtcw0KPiA+PiB0aGF0DQo+ID4+ID4gZ2NjDQo+ID4+ID4g
NC43LjAgaGFzIGNoYW5nZWQgaXRzIGFsZ29yaXRobSBmb3IgdGhlIHN0cmljdCBhbGlhc2luZyBj
aGVjaywgYnV0DQo+ID4+ID4gSSBkaWRuJ3QgZmluZCB0aGUgcmVsYXRlZCBpbmZvcm1hdGlvbiBm
cm9tIGl0cyByZWxlYXNlIG5vdGUuDQo+ID4+ID4NCj4gPj4gPiBBZGQgIi1mbm8tc3RyaWN0LWFs
aWFzaW5nIiB0byBnY2MncyBvcHRpb24gd291bGQgZml4IHRoZSBwcm9ibGVtLA0KPiA+PiB0aGlz
DQo+ID4+ID4gd291bGQgZGlzYWJsZSB0aGUgb3B0aW1pemF0aW9uIGZvciBzdHJpY3QtYWxpYXNp
bmcuDQo+ID4+DQo+ID4+IFRoaXMgc2VlbXMgYSBiaXQgbW9yZSB0aGFuIHdoYXRzIG5lZWRlZC4g
WW91IGNvdWxkIHRyeSBhZGRpbmcgLVduby0NCj4gPj4gZXJyb3I9c3RyaWN0LWFsaWFzaW5nIHRv
IENGTEFHUw0KPiA+Pg0KPiA+PiBvbiBhbm90aGVyIG5vdGUuIEkgZG8gbm90IHNlZSB0aGlzIGZh
aWxpbmcgd2l0aCBnY2MtNC43KHRhcmdldA0KPiA+PiBjb21waWxlcikgaGVyZSB3aGVuIEkgYnVp
bGQgZ3J1YiBmb3IgcWVtdXg4NiBzbyBJIGFtIGEgYml0IHB1enpsZWQNCj4gPj4NCj4gPg0KPiA+
DQo+ID4gS2hlbSwNCj4gPiDCoFRoZXJlIGlzIGFub3RoZXIgZ3J1YiByZWNpcGUgaXNzdWUsIGl0
IGlzIGJ1aWxkaW5nIHRhcmdldCBiaW5hcmllcw0KPiB3aXRoIGRpc3RybyBjb21waWxlci4gUHJv
YmFibHkgYmVjYXVzZSBvZiB0aGF0IHlvdSBkaWQgbm90IHNlZSBpc3N1ZQ0KPiB3aXRoIDQuNyBj
cm9zcyBjb21waWxlci4gV2UgaGF2ZSBmaXggZm9yIHRoYXQgaXNzdWUgbm93Lg0KPiANCj4gaG1t
bSBpbnRlcmVzdGluZyB0aGF0IGNsYXJpZmllcy4gU28gSSBndWVzcyBvbmNlIHlvdSBmaXggaXQg
dG8gZG8NCj4gX3Byb3Blcl8gY3Jvc3MgY29tcGlsZSBidWlsZCB0aGVuIEkgZ3Vlc3MgdGhlIHBy
b2JsZW0gZ2V0cyBmaXhlZCB3aGVuDQo+IHdlIHVzZSBnY2MgNC42IGJ1dCBhcyBzb29uIGFzIHdl
IG1vdmUgdG8gZ2NjLTQuNyB0aGlzIHdpbGwgcmVhcHBlYXIgc28NCj4gaW4gYW55IGNhc2UgdGhp
cyBpc3N1ZSBuZWVkcyB0byBmaXhlZCBpbiBhIGdvb2QgbWFubmVyIEkgdGhpbmsgaW4NCj4gYW55
Y2FzZS4NCj4gDQoNCg0KVGhlIDIyOTMgYnVnIGlzIGFib3V0IGdydWItZWZpLW5hdGl2ZSB3aGlj
aCBjb3JyZWN0bHkgdXNlcyB0aGUgZGlzdHJvIGNvbXBpbGVyLiBBbmQgaXQgaGl0cyBnY2MgNC43
IGlzc3VlIG9uIGZlZG9yYSAxNyBhbHBoYSwgYW5kIHRoYXQgaXMgYWxzbyBmaXhlZC4gSSB3aWxs
IHNlbmQgb3V0IGNvbW1pdHMgaW4gZmV3IG1pbnMuDQoNCk5pdGluDQoNCg0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29y
ZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8v
b3BlbmVtYmVkZGVkLWNvcmUNCg==


