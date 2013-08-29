Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC0C6BC83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:19:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2013 04:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,983,1367996400"; d="scan'208";a="370353505"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2013 04:18:48 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0123.003; Thu, 29 Aug 2013 12:18:47 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Colin Walters <walters@verbum.org>
Thread-Topic: [OE-core] [RFC PATCH 5/8] lib/oeqa/utils/qemurunner.py: class
	to handle qemu instance
Thread-Index: AQHOkhVJmaLzqNogq0SmNvxWqsEukpmsHhyA
Date: Thu, 29 Aug 2013 11:18:46 +0000
Message-ID: <1377775123.9984.7.camel@firebird.rb.intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
	<3047815ee6268db95c3916960eb31508fb7729f6.1372413711.git.stefanx.stanacar@intel.com>
	<1375732226.4750.25.camel@localhost>
In-Reply-To: <1375732226.4750.25.camel@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 5/8] lib/oeqa/utils/qemurunner.py: class to handle qemu instance
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
X-List-Received-Date: Thu, 29 Aug 2013 11:19:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A6C341EC1A3464DBC1C608047D831A9@intel.com>
Content-Transfer-Encoding: base64

SGkgQ29saW4sDQoNCk9uIE1vbiwgMjAxMy0wOC0wNSBhdCAyMTo1MCArMDIwMCwgQ29saW4gV2Fs
dGVycyB3cm90ZToNCj4gT24gRnJpLCAyMDEzLTA2LTI4IGF0IDEzOjA0ICswMzAwLCBTdGVmYW4g
U3RhbmFjYXIgd3JvdGU6DQo+IA0KPiA+ICsgICAgICAgIHNlbGYuc3RyZWFtcGF0aCA9ICcvdG1w
L3FlbXVjb25uZWN0aW9uLiVzJyAlIG9zLmdldHBpZCgpDQo+IA0KPiBUaGF0J3MgYSBzZWN1cml0
eSBwcm9ibGVtIG9uIHNoYXJlZCBtYWNoaW5lcy4NCg0KSSBrbm93IHRoaXMgaXMgYSBsYXRlIHJl
cGx5LCBzb3JyeSwgSSBtaXNzZWQgdGhlIGVtYWlsIGJhY2sgdGhlbi4NClRoaXMgaGFzIGJlZW4g
Y2hhbmdlZCBzaW5jZSB0aGVuIHRvIHNvbWV0aGluZyBlbHNlIChidXQgdGhlIHJlYXNvbnMgd2Vy
ZQ0KZGlmZmVyZW50KQ0KaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kv
cG9reS9jb21taXQvP2lkPTBiYTc4YzExNjJiYjEyNTg1MGEwZWU1MDRjYTZmYmU1YmYyMTI0N2YN
ClRoYXQncyBhIHRjcCBzb2NrZXQgbG9jYWxob3N0IG9ubHkgbm93LCByYW5kb20gaGlnaCBwb3J0
IChjYWxscyBiaW5kDQp3aXRoIDEyNy4wLjAuMSwgMCBzbyB0aGUgb3MgY2hvb3NlcyB0aGUgcG9y
dCkuDQoNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgIGJiLm5vdGUoIlJlYWNoZWQgbG9naW4g
YmFubmVyIikNCj4gPiArICAgICAgICAgICAgICAgIGNvbnNvbGUud3JpdGUoInJvb3RcbiIpDQo+
ID4gKyAgICAgICAgICAgICAgICAoaW5kZXgsIG1hdGNoLCB0ZXh0KSA9IGNvbnNvbGUuZXhwZWN0
KFtyIihyb290QFtcdy1dKzp+IykiXSwxMCkNCj4gDQo+IFNvIEkgZm9yZ2V0IGlmIEkndmUgbWVu
dGlvbmVkIHRoaXMgaGVyZSwgYnV0IHdoYXQgSSBkbyBmb3IgdGhlDQo+IGdub21lLW9zdHJlZSB0
ZXN0aW5nIGlzIGF0IGJvb3QgdGltZSwgdXNlIGEgcWNvdzIgb3ZlcmxheSBkaXNrIHRvIHdyaXRl
DQo+IGEgY3VzdG9tIHN5c3RlbWQgc2VydmljZSB0aGF0IGV4cG9ydHMgdGhlIGpvdXJuYWwgb3Zl
ciBhIHZpcnRpby1zZXJpYWwNCj4gY2hhbm5lbC4gIFRoZW4gSSBsb29rIGZvciBzcGVjaWZpYyBN
RVNTQUdFX0lEcyBpbiB0aGUgam91cm5hbC4NCj4gDQo+IFRoaXMgaXMgZXh0cmVtZWx5IHJlbGlh
YmxlLCBubyBwYXJzaW5nIG9mIGxvZyBtZXNzYWdlcyBldGMuDQo+IA0KDQpUaGF0IHNvdW5kcyBy
ZWFsbHkgY29vbCwgbmljZSBqb2IhIA0KSSBtaWdodCBiZSB3cm9uZyBidXQgZG9lc24ndCB0aGF0
IHJlcXVpcmUgdmlydGlvIHN1cHBvcnQgaW4gdGhlIHRhcmdldA0Ka2VybmVsICh3aGljaCBpcyBz
b21ldGhpbmcgd2UgY2FuJ3QgZXhwZWN0IHRvIGhhdmUpPw0KDQpDaGVlcnMsDQpTdGVmYW4NCg0K
PiBTZWU6DQo+IGh0dHBzOi8vcndtai53b3JkcHJlc3MuY29tLzIwMTMvMDcvMTkvaGFsZi1iYWtl
ZC1pZGVhcy1vY3Itdm0tY29uc29sZS10by1kaWFnbm9zZS1zdGF0ZS1hbmQtZXJyb3JzLw0KPiAN
Cj4gDQoNCg==

