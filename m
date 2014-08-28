Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4744660E49
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 21:05:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2014 14:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,420,1406617200"; d="scan'208";a="583097473"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2014 14:05:29 -0700
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 28 Aug 2014 14:05:29 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.252]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.44]) with mapi id
	14.03.0195.001; Thu, 28 Aug 2014 14:05:28 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] imageconfigurator: a new recipe for
	boottime image configuration
Thread-Index: AQHPwvAuLnAH6mPsWkeiY92+tL7cDZvm522A//+LUzCAAHt7gP//kOtg
Date: Thu, 28 Aug 2014 21:05:28 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CEBAB24@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
	<CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYr4r2WBBdPQeQWyHEhKYx_Fc-7DHKbSO57Rnx8_OMTJA@mail.gmail.com>
In-Reply-To: <CAJTo0LYr4r2WBBdPQeQWyHEhKYx_Fc-7DHKbSO57Rnx8_OMTJA@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Aug 2014 21:05:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDI4
LCAyMDE0IDE6MzQgUE0NCj4gVG86IEthbWJsZSwgTml0aW4gQQ0KPiBDYzogSGFydCwgRGFycmVu
OyBQdXJkaWUsIFJpY2hhcmQ7IFdvbGQsIFNhdWw7IE9FLWNvcmUNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0ggMS8xXSBpbWFnZWNvbmZpZ3VyYXRvcjogYSBuZXcgcmVjaXBlIGZvcg0K
PiBib290dGltZSBpbWFnZSBjb25maWd1cmF0aW9uDQo+IA0KPiBPbiAyOCBBdWd1c3QgMjAxNCAy
MToxNCwgS2FtYmxlLCBOaXRpbiBBIDxuaXRpbi5hLmthbWJsZUBpbnRlbC5jb20+IHdyb3RlOg0K
PiA+PiBXb3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIGhhdmUgdGhpcyBhcyBub3JtYWwgYXJjaGl0
ZWN0dXJlLCBhbmQNCj4gPj4gZGVwZW5kIG9uIGEgbWFjaGluZS1zcGVjaWZpYyBkYXRhIHBhY2th
Z2U/DQo+ID4NCj4gPiBUaGlzIHJlYWxseSBuZWVkIHRvIGJlIG1hY2hpbmUgc3BlY2lmaWMuIEZv
ciBldmVyeSBCU1AgZGlmZmVyZW50IGZpbGVzIHdpbGwgYmUNCj4gcGFja2FnZWQuDQo+IA0KPiBT
dXJlLCBJIHdhcyBwcm9wb3NpbmcgYW4gaW1hZ2Vjb25maWd1cmF0b3IgdGhhdCBpcyBub3QgbWFj
aGluZS1zcGVjaWZpYywgYW5kDQo+IHRoZW4gaW1hZ2Vjb25maWd1cmF0b3ItZGF0YSBwYWNrYWdl
cyB0aGF0IGFyZSBwZXItQlNQLg0KPiANCj4gUm9zcw0KDQpPaGgsIFRoYXQgaXMgYSBnb29kIGlk
ZWEuIERvIHlvdSBoYXZlIGFueSBleGFtcGxlIHJlY2lwZSBmb3IgbWUgdG8gbG9vayBhdCB3aGlj
aCBpcyBkb2luZyBzb21ldGhpbmcgc2ltaWxhcj8NCg0KVGhhbmtzLA0KTml0aW4NCg0KDQoNCg==

