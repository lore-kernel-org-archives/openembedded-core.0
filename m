Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UZkP0-0002bs-EH
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:06:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 May 2013 08:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,629,1363158000"; d="scan'208";a="298932589"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2013 08:47:59 -0700
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 7 May 2013 16:47:52 +0100
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.19]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.14]) with mapi id
	14.01.0438.000; Tue, 7 May 2013 16:47:51 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Thread-Topic: [OE-core] [PATCH] xkeyboard-config: Remove xkbcomp from
	RDEPENDS_${PN}
Thread-Index: AQHOSzo7ic8vL8B0/ECS8TVUctSf0w==
Date: Tue, 7 May 2013 15:47:51 +0000
Message-ID: <1367941688.6101.1.camel@firebird.rb.intel.com>
References: <1367240260.14512.120.camel@phil-desktop.brightsign>
	<518919FE.9000004@mlbassoc.com>
	<CAJTo0Lb1TW9gOW79fbDdqyn61-tvxW+Fh1aQxf+mLuGRUhv0RA@mail.gmail.com>
	<5189211B.6050905@mlbassoc.com>
In-Reply-To: <5189211B.6050905@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.149]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: Remove xkbcomp from RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 07 May 2013 16:06:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <809609B40AD3254D8CA55BF3FF104267@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFR1ZSwgMjAxMy0wNS0wNyBhdCAwOTo0MyAtMDYwMCwgR2FyeSBUaG9tYXMgd3JvdGU6
DQo+IE9uIDIwMTMtMDUtMDcgMDk6MjMsIEJ1cnRvbiwgUm9zcyB3cm90ZToNCj4gPiBPbiA3IE1h
eSAyMDEzIDE2OjEzLCBHYXJ5IFRob21hcyA8Z2FyeUBtbGJhc3NvYy5jb20+IHdyb3RlOg0KPiA+
PiBJdCBsb29rcyBsaWtlIHRoZSBwYWNrYWdlKHMpIHlvdSdyZSByZWZlcnJpbmcgdG8gYXJlIHRo
ZSBYIHNlcnZlci4NCj4gPj4gVG9vIGJhZCB5b3UgZGlkbid0IHByb3ZpZGUgdGhvc2UgcGF0Y2hl
cyBhcyB3ZWxsIGFzIGltYWdlcyB3aGljaA0KPiA+PiB1c2UgWCBhcmUgY3VycmVudGx5IGJyb2tl
biAoYXQgbGVhc3QgbWluZSBhcmUpDQo+ID4NCj4gPiBZZWFoLCBJIG5vdGljZWQgdGhhdCB3aGVu
IGJyb3dzaW5nIG1haWwgb3ZlciBicmVha2Zhc3QgYnV0IGRyb3BwZWQgdGhlDQo+ID4gYmFsbCBp
biBhY3R1YWxseSBzYXlpbmcgb24gdGhlIGxpc3QuICBBZGQgYSBkZXBlbmRlbmN5IHRvIGl0IGlu
DQo+ID4geHNlcnZlci14b3JnLg0KPiANCj4gSSdsbCBwdXQgc29tZXRoaW5nIHRvZ2V0aGVyIHNo
b3J0bHkuDQo+IA0KDQpJIGRpZG4ndCBub3RpY2VkIHlvdXIgcmVwbHkgdW50aWwgbm93LCBJIGp1
c3Qgc2VudCBhIHBhdGNoLi4uIDopDQo=


