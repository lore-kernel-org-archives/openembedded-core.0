Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F36B977BC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 19:35:09 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 12:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,354,1498546800"; d="scan'208";a="138797698"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga006.fm.intel.com with ESMTP; 10 Aug 2017 12:35:10 -0700
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 10 Aug 2017 12:35:10 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.170]) by
	ORSMSX163.amr.corp.intel.com ([169.254.9.158]) with mapi id
	14.03.0319.002; Thu, 10 Aug 2017 12:35:10 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH v3 07/11] image_types.bbclass: improve cpio
	image reproducibility
Thread-Index: AQHTETfNezyyTe07D0a7mibHNN2fmKJ8x3WAgAEzssA=
Date: Thu, 10 Aug 2017 19:35:09 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6119E1224@ORSMSX112.amr.corp.intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-8-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=Ud6Yh6m6+=n6DNaOm06fU+fc0L6ZhAoA32dDNSpTfWxg@mail.gmail.com>
In-Reply-To: <CAJ86T=Ud6Yh6m6+=n6DNaOm06fU+fc0L6ZhAoA32dDNSpTfWxg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 07/11] image_types.bbclass: improve cpio image reproducibility
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
X-List-Received-Date: Thu, 10 Aug 2017 19:35:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IA0KPiBJcyBpdCB1c2VmdWwgdG8ga2VlcCB0aGUgb3B0aW9uIHVzaW5nIGNwaW8gZnJvbSB0
aGUgaG9zdD8gV2h5IG5vdA0KPiBhbHdheXMgdXNlIGNwaW8tbmF0aXZlPw0KPiANCg0KSSBndWVz
cyBpdCBpcyBhIGp1ZGdlbWVudCBjYWxsIHdoaWNoIHRvb2xzIHRvIGJ1aWxkIGFuZCB3aGljaCB0
b29scyB0byB1c2UgZnJvbSB0aGUgaG9zdC4gTm90IGJ1aWxkaW5nIHRvb2xzIHdoaWNoIGFyZSBn
dWFyYW50ZWVkIHRvIGJlIG9uIHRoZSBob3N0IHNhdmVzIGJ1aWxkIHRpbWUuIEFsc28sIHRoZSBu
ZWVkIGZvciBjcGlvLW5hdGl2ZSB3aXRoIHRoZSByZXByb2R1Y2libGUgb3B0aW9ucyBpdCBpcyBn
b2luZyB0byBiZSBmYWlybHkgcmFyZS4NCg0KPiA+ICAgIGRvX2ltYWdlX2NwaW9bZGVwZW5kc10g
Kz0gImNwaW8tcmVwbGFjZW1lbnQtDQo+IG5hdGl2ZTpkb19wb3B1bGF0ZV9zeXNyb290Ig0KPiA+
ICAgIEVYVFJBTkFUSVZFUEFUSCArPSAiY3Bpby1uYXRpdmUiDQo+ID4NCj4gPiAyLiBQcm92aWRl
IGEgd2F5IHRvIHBhc3MgY3VzdG9tIGFyZ3VtZW50cyB0byBjcGlvLiBUaGlzIGlzIGRvbmUgdmlh
DQo+ID4gICAgYSBuZXcgdmFyaWFibGUgSU1BR0VfQ01EX0NQSU8uIEZvciBiaW5hcnkgcmVwcm9k
dWNpYmxlIGNwaW8gYXJjaGl2ZXMNCj4gPiAgICBvbmUgbmVlZHMgdG8gc2V0IChpbiBsb2NhbC5j
b25mKQ0KPiA+DQo+ID4gICAgSU1BR0VfQ01EX0NQSU8gPSAiY3BpbyAtLWlnbm9yZS1kZXZubyAt
LXJlcHJvZHVjaWJsZSAiDQo+ID4NCj4gPiAzLiBBIHN5bWxpbmsgaXMgY3JlYXRlZCBhcyBwYXJ0
IG9mIHRoZSBpbWFnZS4gSGVyZSB3ZSBtYWtlIHN1cmUgaXQgZ2V0cw0KPiB0aGUNCj4gPiAgICB0
aW1lc3RhbXBzIChtdGltZSkgYmFzZWQgb24gdGhlIHRpbWVzdGFtcCBvZiB0aGUgc3ltbGluayB0
YXJnZXQsDQo+IHJhdGhlciB0aGFuDQo+ID4gICAgdGhlIHRpbWVzdGFtcCBjb3JyZXNwb25kaW5n
IHRvIHRoZSBidWlsZCB0aW1lLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSnVybyBCeXN0cmlj
a3kgPGp1cm8uYnlzdHJpY2t5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jbGFzc2Vz
L2ltYWdlX3R5cGVzLmJiY2xhc3MgfCAxNCArKysrKysrKysrKystLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9tZXRhL2NsYXNzZXMvaW1hZ2VfdHlwZXMuYmJjbGFzcw0KPiBiL21ldGEvY2xhc3Nlcy9p
bWFnZV90eXBlcy5iYmNsYXNzDQo+ID4gaW5kZXggZTAzNjhjNy4uNTBkMGMwNyAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhL2NsYXNzZXMvaW1hZ2VfdHlwZXMuYmJjbGFzcw0KPiA+ICsrKyBiL21ldGEv
Y2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzDQo+ID4gQEAgLTEyMiw5ICsxMjIsMTcgQEAgSU1B
R0VfQ01EX1RBUiA/PSAidGFyIg0KPiA+ICAjIGlnbm9yZSByZXR1cm4gY29kZSAxICJmaWxlIGNo
YW5nZWQgYXMgd2UgcmVhZCBpdCIgYXMgb3RoZXIgdGFza3MoZS5nLg0KPiBkb19pbWFnZV93aWMp
IG1heSBiZSBoYXJkbGlua2luZyByb290ZnMNCj4gPiAgSU1BR0VfQ01EX3RhciA9ICIke0lNQUdF
X0NNRF9UQVJ9IC1jZg0KPiAke0lNR0RFUExPWURJUn0vJHtJTUFHRV9OQU1FfSR7SU1BR0VfTkFN
RV9TVUZGSVh9LnRhciAtQyAke0lNQUdFX1JPT1RGU30gLg0KPiB8fCBbICQ/IC1lcSAxIF0iDQo+
ID4NCj4gPiArIyBCeSBkZWZhdWx0LCBjcGlvIGZyb20gdGhlIGhvc3QgaXMgdXNlZCwgd2hpY2gg
Y2FuIGJlIHF1aXRlIG9sZC4gSWYNCj4gPiArIyB5b3UgbmVlZCBzcGVjaWFsIHBhcmFtZXRlcnMg
KGxpa2UgLS1pZ25vcmUtZGV2bm8gLS1yZXByb2R1Y2libGUpIHdoaWNoDQo+IGFyZSBvbmx5DQo+
ID4gKyMgc3VwcG9ydGVkIGJ5IEdOVSBjcGlvIHVwc3RyZWFtID49IDIuMTIsIHRoZW4gb3ZlcnJp
ZGUgdGhhdCBkZWZhdWx0Og0KPiA+ICsjIElNQUdFX0NNRF9DUElPID0gImNwaW8gLS1pZ25vcmUt
ZGV2bm8iDQo+ID4gKyMgZG9faW1hZ2VfY3Bpb1tkZXBlbmRzXSArPSAiY3Bpby1yZXBsYWNlbWVu
dC0NCj4gbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QiDQo+ID4gKyMgRVhUUkFOQVRJVkVQQVRI
ICs9ICJjcGlvLW5hdGl2ZSINCj4gPiArDQo+ID4gK0lNQUdFX0NNRF9DUElPID89ICJjcGlvIg0K
PiA+ICBkb19pbWFnZV9jcGlvW2NsZWFuZGlyc10gKz0gIiR7V09SS0RJUn0vY3Bpb19hcHBlbmQi
DQo+ID4gIElNQUdFX0NNRF9jcGlvICgpIHsNCj4gPiAtICAgICAgIChjZCAke0lNQUdFX1JPT1RG
U30gJiYgZmluZCAuIHwgY3BpbyAtbyAtSCBuZXdjDQo+ID4ke0lNR0RFUExPWURJUn0vJHtJTUFH
RV9OQU1FfSR7SU1BR0VfTkFNRV9TVUZGSVh9LmNwaW8pDQo+ID4gKyAgICAgICAoY2QgJHtJTUFH
RV9ST09URlN9ICYmIGZpbmQgLiB8ICR7SU1BR0VfQ01EX0NQSU99IC1vIC1IIG5ld2MgLXYNCj4g
PiR7SU1HREVQTE9ZRElSfS8ke0lNQUdFX05BTUV9JHtJTUFHRV9OQU1FX1NVRkZJWH0uY3BpbykN
Cj4gPiAgICAgICAgICMgV2Ugb25seSBuZWVkIHRoZSAvaW5pdCBzeW1saW5rIGlmIHdlJ3JlIGJ1
aWxkaW5nIHRoZSByZWFsDQo+ID4gICAgICAgICAjIGltYWdlLiBUaGUgLWRiZyBpbWFnZSBkb2Vz
bid0IG5lZWQgaXQhIEJ5IGJlaW5nIGNsZXZlcg0KPiA+ICAgICAgICAgIyBhYm91dCB0aGlzIHdl
IGFsc28gYXZvaWQgJ3RvdWNoJyBiZWxvdyBmYWlsaW5nLCBhcyBpdA0KPiA+IEBAIC0xMzQsMTAg
KzE0MiwxMiBAQCBJTUFHRV9DTURfY3BpbyAoKSB7DQo+ID4gICAgICAgICAgICAgICAgIGlmIFsg
ISAtTCAke0lNQUdFX1JPT1RGU30vaW5pdCBdICYmIFsgISAtZQ0KPiAke0lNQUdFX1JPT1RGU30v
aW5pdCBdOyB0aGVuDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgWyAtTCAke0lNQUdF
X1JPT1RGU30vc2Jpbi9pbml0IF0gfHwgWyAtZQ0KPiAke0lNQUdFX1JPT1RGU30vc2Jpbi9pbml0
IF07IHRoZW4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxuIC1zZiAvc2Jp
bi9pbml0DQo+ICR7V09SS0RJUn0vY3Bpb19hcHBlbmQvaW5pdA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIyBpbXByb3ZlIHJlcHJvZHVjaWJpbGl0eTogc2V0IHRoZSBsaW5r
DQo+IG10aW1lIHRvIGJlIHRoZSBzYW1lIGFzIHRoZSB0YXJnZXQNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRvdWNoIC1oIC1yICR7SU1BR0VfUk9PVEZTfS9zYmluL2luaXQN
Cj4gJHtXT1JLRElSfS9jcGlvX2FwcGVuZC9pbml0DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgZWxzZQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdG91Y2ggJHtXT1JL
RElSfS9jcGlvX2FwcGVuZC9pbml0DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZmkNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAoY2QgICR7V09SS0RJUn0vY3Bpb19hcHBlbmQgJiYg
ZWNobyAuL2luaXQgfCBjcGlvDQo+IC1vQSAtSCBuZXdjIC1GICR7SU1HREVQTE9ZRElSfS8ke0lN
QUdFX05BTUV9JHtJTUFHRV9OQU1FX1NVRkZJWH0uY3BpbykNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAoY2QgICR7V09SS0RJUn0vY3Bpb19hcHBlbmQgJiYgZWNobyAuL2luaXQgfA0KPiAk
e0lNQUdFX0NNRF9DUElPfSAtb0EgLUggbmV3YyAtRg0KPiAke0lNR0RFUExPWURJUn0vJHtJTUFH
RV9OQU1FfSR7SU1BR0VfTkFNRV9TVUZGSVh9LmNwaW8pDQo+ID4gICAgICAgICAgICAgICAgIGZp
DQo+ID4gICAgICAgICBmaQ0KPiA+ICB9DQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+ID4gLS0N
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+
IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

