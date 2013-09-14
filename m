Return-Path: <nitin.a.kamble@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 13CD76111E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 00:49:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2013 17:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,901,1371106800"; d="scan'208";a="395554352"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2013 17:49:55 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.161]) by
	ORSMSX109.amr.corp.intel.com ([169.254.2.174]) with mapi id
	14.03.0123.003; Fri, 13 Sep 2013 17:49:54 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
Thread-Index: AQHOrVfn4qnFo/lz+k+5cqfakFWZAJm9npjQgAGSyQCAAHv9sIABTWgAgANx+JA=
Date: Sat, 14 Sep 2013 00:49:53 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C70495CFD@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbvTNA=YgA5APK55MtO2wS7QDqJUy4t4C_C0g14AYC=wQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbvTNA=YgA5APK55MtO2wS7QDqJUy4t4C_C0g14AYC=wQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Sat, 14 Sep 2013 00:49:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCiAgSSBoYXZlIHVwZGF0ZWQgbXkgYnJhbmNoZXMgYWNjb3JkaW5nbHkgaGVyZS4g
DQoNCmh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3ktY29udHJp
Yi9sb2cvP2g9bml0aW4vbWVzYWdsDQpodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9j
Z2l0LmNnaS9tZXRhLWludGVsLWNvbnRyaWIvbG9nLz9oPW5pdGluL21lc2FnbA0KDQpJIGhhdmUg
dGVzdGVkIHRoaXMgd2l0aCBlbWVubG93IEJTUC4gIElmIGl0IGxvb2tzIG9rIHRvIHlvdSwgSSBj
YW4gc2VuZCB0aGVzZSBmb3IgdXBzdHJlYW1pbmcuDQoNClRoYW5rcywNCk5pdGluDQoNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpy
b3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDExLCAy
MDEzIDY6MDkgQU0NCj4gVG86IEthbWJsZSwgTml0aW4gQQ0KPiBDYzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtSRkNd
W1BBVENIXSBtZXNhLWdsOiBhZGQgR0wtb25seSBNZXNhIHJlY2lwZQ0KPiANCj4gT24gMTEgU2Vw
dGVtYmVyIDIwMTMgMDE6MjMsIEthbWJsZSwgTml0aW4gQSA8bml0aW4uYS5rYW1ibGVAaW50ZWwu
Y29tPg0KPiB3cm90ZToNCj4gPiBXaXRoIGZldyBtb3JlIGZpeGVzLCB0aGlzIGlzIHdvcmtpbmcg
Zm9yIEVNR0QgYmFzZWQgbWV0YS1pbnRlbCBCU1BzLg0KPiA+IEhlcmUgYXJlIHRoZSBjb21taXRz
IHdoaWNoIHdvcmtlZDoNCj4gPg0KPiA+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0
L2NnaXQuY2dpL3Bva3ktY29udHJpYi9jb21taXQvP2g9bml0aW4NCj4gPiAvbWVzYS1nbA0KPiAN
Cj4gVGhlIGRlcGVuZGVuY3kgb24gIm1lc2EiIGlzIGFjdHVhbGx5IHJpZ2h0LCBhbnkgb3RoZXIg
R0wgaW1wbGVtZW50YXRpb24NCj4gbWF5IG9yIG1heSBub3QgcHJvdmlkZSB0aGUgRFJJIGludGVy
ZmFjZSwgd2hpY2ggaXMgd2hhdCBYIGlzIGRlcGVuZGluZyBvbi4NCj4gDQo+IEkndmUgdXBkYXRl
ZCBteSBtZXNhZ2wgYnJhbmNoIHRvIGFkZCBhIHZpcnR1YWwvbWVzYSBwcm92aWRlci4NCj4gDQo+
ID4gaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvbWV0YS1pbnRlbC1j
b250cmliL2xvZy8/aD1uaQ0KPiA+IHRpbi9tZXNhLWdsDQo+IA0KPiBBZGQgYSBwcmVmZXJyZWQg
cHJvdmlkZXIgb2YgdmlydHVhbC9tZXNhPSJtZXNhLWdsIiBpbiBoZXJlIGFuZCBJIHRoaW5rIHlv
dSdsbA0KPiBiZSBzb3J0ZWQuDQo+IA0KPiBSb3NzDQo=

