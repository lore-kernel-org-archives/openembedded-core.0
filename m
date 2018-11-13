Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 14BE26C317
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 11:16:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 03:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,499,1534834800"; d="scan'208";a="95922452"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2018 03:16:44 -0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.31]) by
	PGSMSX103.gar.corp.intel.com ([169.254.2.114]) with mapi id
	14.03.0415.000; Tue, 13 Nov 2018 19:16:43 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "Arsalan_Awan@mentor.com" <Arsalan_Awan@mentor.com>
Thread-Topic: [OE-core] [sumo][PATCH 1/1] wic/isoimage-isohybrid.py: fix
	booting from removable media
Thread-Index: AQHUcwXv+QwcnDmfIUKsWBVR/f3m7aVAR8KAgAzIdICAAAhXAA==
Date: Tue, 13 Nov 2018 11:16:42 +0000
Message-ID: <2b65cd7af45b116efc01a943c002917ddab3ba7e.camel@intel.com>
References: <cover.1541168618.git.Arsalan_Awan@mentor.com>
	<6bf54a814e2aaa03e262aa2edd529405d391ee22.1541168618.git.Arsalan_Awan@mentor.com>
	, <c1316e3a-ec0c-3320-0972-9c7ee532aee8@gmail.com>	,
	<1541403256938.5944@mentor.com> <1542106011533.81309@mentor.com>
In-Reply-To: <1542106011533.81309@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.144.169]
MIME-Version: 1.0
Subject: Re: [sumo][PATCH 1/1] wic/isoimage-isohybrid.py: fix booting from removable media
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
X-List-Received-Date: Tue, 13 Nov 2018 11:16:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <77D03471F3224849AD4F88884DC164DC@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE4LTExLTEzIGF0IDEwOjQ2ICswMDAwLCBBd2FuLCBBcnNhbGFuIHdyb3RlOg0K
PiBwaW5nDQo+IA0KPiA+ID4gQXJzYWxhbiwNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBPbiAxMS8y
LzE4IDg6MDEgQU0sIEFyc2FsYW4gQXdhbiB3cm90ZToNCj4gPiA+ID4gRnJvbTogIkFyc2FsYW4g
SC4gQXdhbiIgPEFyc2FsYW5fQXdhbkBtZW50b3IuY29tPg0KPiA+ID4gPiANCj4gPiA+ID4gVGhl
IEVGSSBib290bG9hZGVyIG5hbWUgYW5kIHBhdGggZm9yIGJlaW5nIGFibGUgdG8gYm9vdCBmcm9t
IGENCj4gPiA+ID4gcmVtb3ZhYmxlIHN0b3JhZ2UgbWVkaWEgLSBzdWNoIGFzIFVTQiAtIG11c3Qg
YmUgbGlrZToNCj4gPiA+ID4gDQo+ID4gPiA+ICAgIC9FRkkvQk9PVC9ib290PGFyY2g+LmVmaQ0K
PiA+ID4gPiAgICAvRUZJL0JPT1QvYm9vdHg2NC5lZmkNCj4gPiA+ID4gICAgL0VGSS9CT09UL2Jv
b3RpYTMyLmVmaQ0KPiA+ID4gPiAgICAvRUZJL0JPT1QvYm9vdGFhNjQuZWZpDQo+ID4gPiA+IA0K
PiA+ID4gPiBvdGhlcndpc2Ugc3lzdGVtIHdpbGwgbm90IGJlIGFibGUgdG8gYm9vdCBmcm9tIGl0
Lg0KPiA+ID4gDQo+ID4gPiBJcyB0aGlzIGZpeGVkIGluIE1hc3RlciAmIFRodWQgPw0KPiA+ID4g
DQo+ID4gPiAtIGFybWluDQo+ID4gDQo+ID4gWWVzIEFybWluISBJdCBpcyBmaXhlZCBpbiBUaHVk
IGFuZCBNYXN0ZXIuDQo+ID4gDQoNCldvdWxkIGl0IG1ha2UgbW9yZSBzZW5zZSB0byBzaW1wbHkg
YmFja3BvcnQ6DQoNCg0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dp
L3Bva3kvY29tbWl0P2lkPWI1OTFmYjg4OWIwMmJhODJlNmUzNWJiNjRiOWZjYjMxM2Y0YmI1Y2IN
Cg==

