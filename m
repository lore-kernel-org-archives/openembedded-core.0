Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DDA2E73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 22:43:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Sep 2015 15:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,554,1437462000"; d="scan'208";a="792830115"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2015 15:43:37 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 18 Sep 2015 15:43:36 -0700
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.207]) by
	FMSMSX151.amr.corp.intel.com ([169.254.7.179]) with mapi id
	14.03.0224.002; Fri, 18 Sep 2015 15:43:34 -0700
From: "Joya Cruz, Alejandro" <alejandro.joya.cruz@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH V2 0/3] Dynamic common utilities
Thread-Index: AQHQ8lZKC2tGJgCd80mINJbHgou25Z5DVC2AgAADX4A=
Date: Fri, 18 Sep 2015 22:43:33 +0000
Message-ID: <1442616209.5986.10.camel@intel.com>
References: <cover.1442610201.git.alejandro.joya.cruz@intel.com>
	<1442615485.12435.64.camel@linuxfoundation.org>
In-Reply-To: <1442615485.12435.64.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.128.56]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/3] Dynamic common utilities
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
X-List-Received-Date: Fri, 18 Sep 2015 22:43:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4E8C126CE27534BA0CDEBB41E00479C@intel.com>
Content-Transfer-Encoding: base64

T24gdmllLCAyMDE1LTA5LTE4IGF0IDIzOjMxICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDE1LTA5LTE4IGF0IDE2OjA5IC0wNTAwLCBBbGVqYW5kcm8gSm95YSB3cm90
ZToNCj4gPiBJdCBwcm92aWRlIGEgdmlydHVhbCByZWZlcmVuY2UgZm9yIHRoZSBjb21tb24gdXRp
bGl0aWVzLg0KPiA+IGl0IHJlcGxhY2Ugb2YgdGhlIGxvY2sgdG8gYnVzeWJveCwgaXQgd2lsbCBi
ZSBzaW1wbGUgZXhjaGFuZ2UgYmV0d2VlbiBvdGhlcg0KPiA+IGNvbW1vbiB1dGlsaXRpZXMgbGlr
ZSBnbnUgY29yZSB1dGlscyBvciB0b3lib3ggYW1vbmcgb3RoZXJzLg0KPiA+IA0KPiA+IEluIG9y
ZGVyIHRvIGVuYWJsZSBpdHMgcmVxdWlyZWQgdG8gZmlsbCBhdCB0aGUgZGlzdHJvIGNvbmYgb3Ig
bG9jYWwuY29uZg0KPiA+DQo+ID4gVklSVFVBTC1SVU5USU1FX2xvZ2luX21hbmFnZXIgPz0gImJ1
c3lib3giDQo+ID4gUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvYmFzZS11dGlscz89ICJidXN5
Ym94Ig0KPiA+IFBSRUZFUlJFRF9SUFJPVklERVJfdmlydHVhbC9iYXNlLXV0aWxzPz0gImJ1c3li
b3giDQo+ID4gVklSVFVBTC1SVU5USU1FX2Jhc2UtdXRpbHM/PSAiYnVzeWJveCINCj4gPiBWSVJU
VUFMLVJVTlRJTUVfYmFzZS11dGlscy1od2Nsb2NrID89ICJidXN5Ym94LWh3Y2xvY2siDQo+IA0K
PiBBcyBJIHVuZGVyc3RhbmQgaXQsIHlvdSBkb24ndCBhY3R1YWxseSBkZWZpbmUgZGVmYXVsdHMg
YW55d2hlcmUuIFRoaXMNCj4gbWVhbnMgT0Ugd291bGQgYnJlYWsgIm91dCB0aGUgYm94IiB3aGlj
aCBpc24ndCBhY2NlcHRhYmxlIGFuZCB0aGF0IGFsb25lDQo+IG1lYW5zIEkgY2FuJ3QgbWVyZ2Ug
dGhpcy4NCnlvdSBhcmUgdG90YWxseSByaWdodCwgb25lIG9mIG15IGRvdWJ0cyBzdGlsbCBpcywg
d2hlcmUgaXMgdGhlIG1vc3QNCnN1aXRhYmxlIHBsYWNlIHRvICBkZWZpbmVkICB0aGlzIGFzIHNp
bmdsZSBwb2ludD8NCj4gDQo+IFNlY29uZGx5LCB0aGUgdmlydHVhbC94eHggbmFtZXNwYWNlIGlz
ICpvbmx5KiBmb3IgREVQRU5EUy9QUk9WSURFUywgbm90DQo+IFJERVBFTkRTIG9yIFBBQ0tBR0Vf
SU5TVEFMTC4gRm9yIHJ1bnRpbWUgcGFja2FnZXMsIHlvdSBuZWVkIHRvIHVzZQ0KPiAke1ZJUlRV
QUwtUlVOVElNRV9iYXNlLXV0aWxzfS4NCj4gDQp0aGFua3MgSSBhcHByZWNpYXRlZCB0aGUgY29y
cmVjdGlvbi4NCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCg0K

