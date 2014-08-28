Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB1470F28
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 20:14:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2014 13:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,420,1406617200"; d="scan'208";a="583076995"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2014 13:14:24 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 28 Aug 2014 13:14:24 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.252]) by
	ORSMSX158.amr.corp.intel.com ([10.22.240.20]) with mapi id
	14.03.0195.001; Thu, 28 Aug 2014 13:14:24 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] imageconfigurator: a new recipe for
	boottime image configuration
Thread-Index: AQHPwvAuLnAH6mPsWkeiY92+tL7cDZvm522A//+LUzA=
Date: Thu, 28 Aug 2014 20:14:23 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
	<CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: OE-core <Openembedded-core@lists.openembedded.org>, "Hart,
	Darren" <darren.hart@intel.com>, "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] imageconfigurator: a new recipe for boottime image configuration
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
X-List-Received-Date: Thu, 28 Aug 2014 20:14:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgUm9zcywgTXkgY29tbWVudHMgYmVsb3cuDQoNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpy
b3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIwMTQg
MToxMCBQTQ0KPiBUbzogS2FtYmxlLCBOaXRpbiBBDQo+IENjOiBIYXJ0LCBEYXJyZW47IFB1cmRp
ZSwgUmljaGFyZDsgV29sZCwgU2F1bDsgT0UtY29yZQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSCAxLzFdIGltYWdlY29uZmlndXJhdG9yOiBhIG5ldyByZWNpcGUgZm9yDQo+IGJvb3R0
aW1lIGltYWdlIGNvbmZpZ3VyYXRpb24NCj4gDQo+IE9uIDI4IEF1Z3VzdCAyMDE0IDE5OjQ3LCAg
PG5pdGluLmEua2FtYmxlQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gK1BFID0gIjEiDQo+IA0KPiBO
byBuZWVkIGZvciBhbiBlcG9jaC4NCkNvbW1pdCBjaGFuZ2VkIG9uIHRoZSBjb250cmliIGJyYW5j
aCBmb3IgdGhpcy4NCg0KPiANCj4gPiArUEFDS0FHRV9BUkNIID0gIiR7TUFDSElORV9BUkNIfSIN
Cj4gDQo+IFdvdWxkbid0IGl0IGJlIHNpbXBsZXIgdG8gaGF2ZSB0aGlzIGFzIG5vcm1hbCBhcmNo
aXRlY3R1cmUsIGFuZCBkZXBlbmQgb24gYQ0KPiBtYWNoaW5lLXNwZWNpZmljIGRhdGEgcGFja2Fn
ZT8NCg0KVGhpcyByZWFsbHkgbmVlZCB0byBiZSBtYWNoaW5lIHNwZWNpZmljLiBGb3IgZXZlcnkg
QlNQIGRpZmZlcmVudCBmaWxlcyB3aWxsIGJlIHBhY2thZ2VkLg0KDQpOaXRpbg0KDQo+IA0KPiBS
b3NzDQo=

