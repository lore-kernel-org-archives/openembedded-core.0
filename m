Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 825FD615C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 00:23:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 17:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,881,1371106800"; d="scan'208";a="376325087"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2013 17:23:01 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 10 Sep 2013 17:23:01 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.161]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.190]) with mapi id
	14.03.0123.003; Tue, 10 Sep 2013 17:23:01 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
Thread-Index: AQHOrVfn4qnFo/lz+k+5cqfakFWZAJm9npjQgAGSyQCAAHv9sA==
Date: Wed, 11 Sep 2013 00:23:00 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
In-Reply-To: <CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
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
X-List-Received-Date: Wed, 11 Sep 2013 00:23:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2l0aCBmZXcgbW9yZSBmaXhlcywgdGhpcyBpcyB3b3JraW5nIGZvciBFTUdEIGJhc2VkIG1ldGEt
aW50ZWwgQlNQcy4gDQpIZXJlIGFyZSB0aGUgY29tbWl0cyB3aGljaCB3b3JrZWQ6DQoNCmh0dHA6
Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3ktY29udHJpYi9jb21taXQv
P2g9bml0aW4vbWVzYS1nbA0KaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5j
Z2kvbWV0YS1pbnRlbC1jb250cmliL2xvZy8/aD1uaXRpbi9tZXNhLWdsDQoNCkJUVyB0aGUgc2Ft
ZSBmdW5jdGlvbmFsaXR5IGNhbiBhbHNvIGJlIGltcGxlbWVudGVkIGJ5IGN1c3RvbWl6aW5nIGN1
cnJlbnQgbWVzYSANCnJlY2lwZSBiYXNlZCBvbiBhIG5ldyBtYWNoaW5lIGZlYXR1cmUgd2hpY2gg
Y2FuIGJlIGNhbGxlZCBhcw0KImN1c3RvbS1nbGVzIiBvciAibm8tbWVzYS1nbGVzIg0KDQpCVFcg
aW4gb3RoZXIgY29udGV4dCwgdGhpcyBkb2VzIG5vdCBoZWxwIGZvciB0aGUgcmVidWlsZCBpc3N1
ZSBSUCB3YXMgbWVudGlvbmluZyBlYXJsaWVyLg0KDQpUaGFua3MsDQpOaXRpbg0KDQoNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpy
b3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxMCwgMjAx
MyAyOjUyIEFNDQo+IFRvOiBLYW1ibGUsIE5pdGluIEENCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUkZDXVtQ
QVRDSF0gbWVzYS1nbDogYWRkIEdMLW9ubHkgTWVzYSByZWNpcGUNCj4gDQo+IE9uIDkgU2VwdGVt
YmVyIDIwMTMgMTc6NTcsIEthbWJsZSwgTml0aW4gQSA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29t
Pg0KPiB3cm90ZToNCj4gPiAgIFRoaXMgaXMgYSBjbGV2ZXIgd2F5IHRvIGRlYWwgd2l0aCB1bm5l
Y2Vzc2FyeSByZWJ1aWxkaW5nIG9mIG1lc2Egd2UNCj4gPiB3ZXJlIHNlZWluZyBlYXJsaWVyLiBX
aXRoIHRoaXMgbWVzYS1nbCwgdGhlIG1lc2EgYWxzbyBuZWVkIG1vZGlmaWNhdGlvbiB0bw0KPiBy
ZW1vdmUgZ2wgZnJvbSB0aGUgZGVmYXVsdCByZWNpcGUuDQo+IA0KPiBObywgbWVzYSBhbmQgbWVz
YS1nbCBpbnRlbnRpb25hbGx5IGNvbmZsaWN0LiAgbWVzYS1nbCBwcm92aWRlcyBHTCwgZW1nZC0N
Cj4gZHJpdmVyLWJpbiBwcm92aWRlcyBFR0wgYW5kIEdMRVMsIHlvdXIgbWFjaGluZXMgc2hvdWxk
bid0IG5lZWQgYm90aCBtZXNhDQo+IGFuZCBtZXNhLWdsLg0KPiANCj4gPiBBbHNvIGxvb2tzIGxp
a2UgdGhlcmUgaXMgYSBuZWVkIGZyb20gY29tbXVuaXR5IGZvciBtZXNhLWdsLWxpYiBhbmQNCj4g
PiBtZXNhLWdsLWhlYWRlcnMsIGFzIHNvbWUgcGxhdGZvcm1zIG5lZWQganVzdCB0aGUgbWVzYS1n
bC1oZWFkZXJzIGFuZA0KPiBub3QgdGhlIGxpYnMuDQo+IA0KPiBUbyBiZSBob25lc3QgR0wgcGxh
dGZvcm1zIHRoYXQgZG9uJ3Qgc2hpcCB0aGVpciBvd24gaGVhZGVycyBhcmUgKnRvdGFsbHkNCj4g
YnJva2VuKiBhbmQgdXNpbmcgbWVzYSdzIGhlYWRlcnMgaXMgYmFzaWNhbGx5IHRoZSBzYW1lIGFz
IGNyb3NzaW5nIHlvdXINCj4gZmluZ2VycyBhbmQgcHJheWluZyB0byAkREVJVFkuIFBsYXRmb3Jt
cyB0aGF0IGRvIHRoaXMgbmVlZCB0byBiZSBmaXhlZCwgbm90DQo+IHdvcmtlZCBhcm91bmQsIGFu
ZCB0YWtpbmcgTWVzYSdzIGhlYWRlcnMgd2l0aG91dCBlZGl0aW5nIHRoZW0gaXMganVzdA0KPiB3
cm9uZy4NCj4gDQo+IFJvc3MNCg==

