Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E811E6BF60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 16:17:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2013 09:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,916,1371106800"; d="scan'208";a="404108480"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2013 09:17:00 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.161]) by
	ORSMSX108.amr.corp.intel.com ([169.254.4.62]) with mapi id
	14.03.0123.003; Mon, 16 Sep 2013 09:16:59 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
Thread-Index: AQHOrVfn4qnFo/lz+k+5cqfakFWZAJm9npjQgAGSyQCAAHv9sIABTWgAgANx+JCABIjFgP//i6hg
Date: Mon, 16 Sep 2013 16:16:58 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C704963FC@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbvTNA=YgA5APK55MtO2wS7QDqJUy4t4C_C0g14AYC=wQ@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70495CFD@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LZucKPx8oG-v+JghEwQmcXhu5qz36bie_sgB9tWoN2tfw@mail.gmail.com>
In-Reply-To: <CAJTo0LZucKPx8oG-v+JghEwQmcXhu5qz36bie_sgB9tWoN2tfw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 16 Sep 2013 16:17:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAx
NiwgMjAxMyA4OjAwIEFNDQo+IFRvOiBLYW1ibGUsIE5pdGluIEENCj4gQ2M6IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UkZDXVtQQVRDSF0gbWVzYS1nbDogYWRkIEdMLW9ubHkgTWVzYSByZWNpcGUNCj4gDQo+IE9uIDE0
IFNlcHRlbWJlciAyMDEzIDAxOjQ5LCBLYW1ibGUsIE5pdGluIEEgPG5pdGluLmEua2FtYmxlQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQv
Y2dpdC5jZ2kvcG9reS1jb250cmliL2xvZy8/aD1uaXRpbi9tZQ0KPiA+IHNhZ2wNCj4gDQo+IFRo
ZSBjaGFuZ2UgdG8gc2VwYXJhdGVidWlsZGRpci5pbmMgc2VlbXMgd3JvbmcgYW5kIEkgbWVyZ2Vk
IHlvdXIgZHJpDQo+IGNoYW5nZSB0byBtZXNhLWdsLmJiIGludG8gbXkgYnJhbmNoIHdoaWNoIGhh
ZCBtb3ZlZCBvbiBzaW5jZSB5b3UgbG9va2VkDQo+IGF0IGl0LiAgWW91IHdvbid0IG5lZWQgYSBQ
Uk9WSURFUyBpbiBtZXNhLWdsIGFzIGl0J3MgaW4gbWVzYS5pbmMuDQo+IA0KDQoNClJvc3MsDQoN
ClRoZSBQUk9WSURFUyBmcm9tIG1lc2EuaW5jIGlzIG5vdCB3aGF0IG1lc2EtZ2wgcmVjaXBlIHBy
b3ZpZGVzLiBNZXNhLWdsIGlzIGRyb3BwaW5nDQpnbGVzICYgZWxnIGNvbXBvbmVudHMsIGFuZCB0
aGF0IHNob3VsZCBiZSByZWZsZWN0ZWQgaW4gdGhlIFBST1ZJREVTLiBSaWdodD8NCg0KTml0aW4N
Cg0KDQoNCj4gSSdsbCBzZW5kIG15IGJyYW5jaCBzaG9ydGx5Lg0KPiANCj4gPiBodHRwOi8vZ2l0
LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLWludGVsLWNvbnRyaWIvbG9nLz9o
PW5pDQo+ID4gdGluL21lc2FnbA0KPiANCj4gTG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IFJvc3MN
Cg==

