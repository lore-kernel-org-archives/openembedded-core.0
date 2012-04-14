Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIrCy-0002AH-V4
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 02:51:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Apr 2012 17:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88922710"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Apr 2012 17:41:57 -0700
Received: from fmsmsx106.amr.corp.intel.com (10.19.9.37) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 13 Apr 2012 17:41:57 -0700
Received: from fmsmsx152.amr.corp.intel.com ([169.254.7.134]) by
	FMSMSX106.amr.corp.intel.com ([169.254.6.145]) with mapi id
	14.01.0355.002; Fri, 13 Apr 2012 17:41:56 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] grub 1.99: fix build for gcc 4.7
Thread-Index: AQHNGVmrbeIxRq32M0yDQJHCMFvFQ5aZqIAA///CGFCAABE5MA==
Date: Sat, 14 Apr 2012 00:41:50 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0306004B@fmsmsx152.amr.corp.intel.com>
References: <cover.1334308316.git.liezhi.yang@windriver.com>
	<638c4f827223820ee30ff0820df4179d41acfb60.1334308316.git.liezhi.yang@windriver.com>
	<CAMKF1soUx3Ov3Z1jZJpn3=hj_u79j5VaTVEG-S27SMQ8icsUWg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C03060012@fmsmsx152.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C03060012@fmsmsx152.amr.corp.intel.com>
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
X-List-Received-Date: Sat, 14 Apr 2012 00:51:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2Ft
YmxlLCBOaXRpbiBBDQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgMTMsIDIwMTIgNDo0MyBQTQ0KPiBU
bzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8xXSBncnViIDEuOTk6IGZpeCBidWlsZCBmb3Ig
Z2NjIDQuNw0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
RnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmddIE9uIEJlaGFsZg0KPiBPZg0KPiA+IEtoZW0gUmFqDQo+ID4gU2VudDogRnJpZGF5LCBBcHJp
bCAxMywgMjAxMiAxOjIxIFBNDQo+ID4gVG86IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0
IHRoZSBvZS1jb3JlIGxheWVyDQo+ID4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8x
XSBncnViIDEuOTk6IGZpeCBidWlsZCBmb3IgZ2NjIDQuNw0KPiA+DQo+ID4gT24gRnJpLCBBcHIg
MTMsIDIwMTIgYXQgMjo0MSBBTSwgUm9iZXJ0IFlhbmcNCj4gPiA8bGllemhpLnlhbmdAd2luZHJp
dmVyLmNvbT4gd3JvdGU6DQo+ID4gPiBUaGVyZSB3YXMgYW4gZXJyb3Igd2hlbiBidWlsZCB3aXRo
IGdjYyA0LjcgKEZDIDE3IDY0Yml0KToNCj4gPiA+IHwgZnMvemZzL3pmcy5jOiBJbiBmdW5jdGlv
biAnZ2V0X2ZpbGVzeXN0ZW1fZG5vZGUnOg0KPiA+ID4gfCBmcy96ZnMvemZzLmM6MTQ0OTo3OiBl
cnJvcjogZGVyZWZlcmVuY2luZyB0eXBlLXB1bm5lZCBwb2ludGVyDQo+IHdpbGwNCj4gPiA+IHwg
YnJlYWsgc3RyaWN0LWFsaWFzaW5nIHJ1bGVzIFstV2Vycm9yPXN0cmljdC1hbGlhc2luZ10NCj4g
PiA+IC4uLi4uLg0KPiA+ID4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJv
cnMNCj4gPiA+DQo+ID4gPiBXaGlsZSBjb21wYXJlIHRoZSBjb21waWxlIGNvbW1hbmQgYmV0d2Vl
biBnY2MgNC40LjQgYW5kIGdjYyA0LjcuMCwNCj4gPiA+IHRoZXkgYXJlIHRoZSBzYW1lIChib3Ro
IG9mIHRoZW0gaGF2ZSAtV2FsbCBhbmQgLVdlcnJvciksIGl0IHNlZW1zDQo+ID4gdGhhdA0KPiA+
ID4gZ2NjDQo+ID4gPiA0LjcuMCBoYXMgY2hhbmdlZCBpdHMgYWxnb3JpdGhtIGZvciB0aGUgc3Ry
aWN0IGFsaWFzaW5nIGNoZWNrLCBidXQNCj4gSQ0KPiA+ID4gZGlkbid0IGZpbmQgdGhlIHJlbGF0
ZWQgaW5mb3JtYXRpb24gZnJvbSBpdHMgcmVsZWFzZSBub3RlLg0KPiA+ID4NCj4gPiA+IEFkZCAi
LWZuby1zdHJpY3QtYWxpYXNpbmciIHRvIGdjYydzIG9wdGlvbiB3b3VsZCBmaXggdGhlIHByb2Js
ZW0sDQo+ID4gdGhpcw0KPiA+ID4gd291bGQgZGlzYWJsZSB0aGUgb3B0aW1pemF0aW9uIGZvciBz
dHJpY3QtYWxpYXNpbmcuDQo+ID4NCj4gPiBUaGlzIHNlZW1zIGEgYml0IG1vcmUgdGhhbiB3aGF0
cyBuZWVkZWQuIFlvdSBjb3VsZCB0cnkgYWRkaW5nIC1Xbm8tDQo+ID4gZXJyb3I9c3RyaWN0LWFs
aWFzaW5nIHRvIENGTEFHUw0KPiA+DQo+ID4gb24gYW5vdGhlciBub3RlLiBJIGRvIG5vdCBzZWUg
dGhpcyBmYWlsaW5nIHdpdGggZ2NjLTQuNyh0YXJnZXQNCj4gPiBjb21waWxlcikgaGVyZSB3aGVu
IEkgYnVpbGQgZ3J1YiBmb3IgcWVtdXg4NiBzbyBJIGFtIGEgYml0IHB1enpsZWQNCj4gPg0KPiAN
Cj4gDQo+IEtoZW0sDQo+ICAgVGhlcmUgaXMgYW5vdGhlciBncnViIHJlY2lwZSBpc3N1ZSwgaXQg
aXMgYnVpbGRpbmcgdGFyZ2V0IGJpbmFyaWVzDQo+IHdpdGggZGlzdHJvIGNvbXBpbGVyLiBQcm9i
YWJseSBiZWNhdXNlIG9mIHRoYXQgeW91IGRpZCBub3Qgc2VlIGlzc3VlDQo+IHdpdGggNC43IGNy
b3NzIGNvbXBpbGVyLiBXZSBoYXZlIGZpeCBmb3IgdGhhdCBpc3N1ZSBub3cuDQo+IA0KPiBOaXRp
bg0KPiANCg0KS2hlbSwgTG9vayBhdCB0aGVzZToNCg0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3By
b2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0yMjkxDQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJv
amVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTIyOTMNCg0KQW5kIGJvdGggaGF2ZSBiZWVuIGZpeGVk
Lg0KDQpOaXRpbg0KDQo+IA0KPiANCj4gPiA+DQo+ID4gPiBbWU9DVE8gIzIyOTFdDQo+ID4gPg0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5j
b20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgbWV0YS9yZWNpcGVzLWJzcC9ncnViL2dydWJfMS45OS5i
YiB8IMKgIMKgNyArKysrKystDQo+ID4gPiDCoDEgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtYnNwL2dydWIvZ3J1Yl8xLjk5LmJiDQo+ID4gPiBiL21ldGEvcmVjaXBlcy1ic3AvZ3J1Yi9n
cnViXzEuOTkuYmINCj4gPiA+IGluZGV4IGFjNjZlODMuLmY0NWI2MzQgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9tZXRhL3JlY2lwZXMtYnNwL2dydWIvZ3J1Yl8xLjk5LmJiDQo+ID4gPiArKysgYi9tZXRh
L3JlY2lwZXMtYnNwL2dydWIvZ3J1Yl8xLjk5LmJiDQo+ID4gPiBAQCAtMTIsNyArMTIsNyBAQCBM
SUNFTlNFID0gIkdQTHYzIg0KPiA+ID4gwqBMSUNfRklMRVNfQ0hLU1VNID0NCj4gPiAiZmlsZTov
L0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgwZDQ3ZmFlNTA0Ig0KPiA+ID4NCj4g
PiA+IMKgUkRFUEVORFNfJHtQTn0gPSAiZGlmZnV0aWxzIGZyZWV0eXBlIg0KPiA+ID4gLVBSID0g
InIzIg0KPiA+ID4gK1BSID0gInI0Ig0KPiA+ID4NCj4gPiA+IMKgU1JDX1VSSSA9ICJmdHA6Ly9m
dHAuZ251Lm9yZy9nbnUvZ3J1Yi9ncnViLSR7UFZ9LnRhci5neiBcDQo+ID4gPiDCoCDCoCDCoCDC
oCDCoCBmaWxlOi8vZ3J1Yi1pbnN0YWxsLmluLnBhdGNoIFwgQEAgLTI5LDYgKzI5LDExIEBAIGlu
aGVyaXQNCj4gPiA+IGdldHRleHQNCj4gPiA+IMKgRVhUUkFfT0VDT05GID0gIi0td2l0aC1wbGF0
Zm9ybT1wYyAtLWRpc2FibGUtZ3J1Yi1ta2ZvbnQgLS0NCj4gPiB0YXJnZXQ9JHtUQVJHRVRfQVJD
SH0gLS1wcm9ncmFtLXByZWZpeD0iIiINCj4gPiA+DQo+ID4gPiDCoGRvX2NvbmZpZ3VyZSgpIHsN
Cj4gPiA+ICsgwqAgwqAjIEZpeCBidWlsZCBlcnJvciBmb3IgZ2NjIDQuNw0KPiA+ID4gKyDCoCDC
oGVjaG8gIkNQUEZMQUdTX0RFRkFVTFQgKz0gLWZuby1zdHJpY3QtYWxpYXNpbmciID4+DQo+ID4g
PiArIGNvbmYvTWFrZWZpbGUuY29tbW9uDQo+ID4gPiArIMKgIMKgIyBBbHNvIG1vZGlmeSBNYWtl
ZmlsZS5pbiwgd2UgY2FuIHJlbW92ZSB0aGlzIHdoZW4gd2UgY2FuIHJ1bg0KPiA+ID4gKyBhdXRv
cmVjb25mDQo+ID4gPiArIMKgIMKgc2VkIC1pICdzL15DUFBGTEFHU19ERUZBVUxUID0gXCguKlwp
L0NQUEZMQUdTX0RFRkFVTFQgPQ0KPiA+ID4gKyAtZm5vLXN0cmljdC1hbGlhc2luZyBcMS8nIFwN
Cj4gPiA+ICsgwqAgwqAgwqAgTWFrZWZpbGUuaW4gZ3J1Yi1jb3JlL01ha2VmaWxlLmluDQo+ID4g
PiDCoCDCoCBvZV9ydW5jb25mDQo+ID4gPiDCoH0NCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gMS43
LjENCj4gPiA+DQo+ID4gPg0KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gPiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+
ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gaHR0cDov
L2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRl
ZC0NCj4gY29yDQo+ID4gPiBlDQo+ID4NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0K
PiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8v
bGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVk
LWNvcmUNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJp
bi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=


