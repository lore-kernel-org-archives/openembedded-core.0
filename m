Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAaCJ-0003Bs-6g
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 06:04:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Mar 2012 21:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80248732"
Received: from orsmsx605.amr.corp.intel.com ([10.22.226.10])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Mar 2012 21:55:31 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx605.amr.corp.intel.com (10.22.226.10) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 21:55:30 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.46]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 21:55:30 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build gdb
	with python support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg//+Uh4CAAHG8cP//vk0AgABePxD//+QoAIAAbP/w
Date: Thu, 22 Mar 2012 04:55:29 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
In-Reply-To: <CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 05:04:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMjEsIDIwMTIg
OToyNSBQTQ0KPiBUbzogS2FtYmxlLCBOaXRpbiBBDQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNz
aW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcjsgTWFydGluIEphbnNhOyBFcmljDQo+IELDqW5h
cmQNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8xXSBSZXZlcnQgImdkYi1jcm9z
cy1jYW5hZGlhbjogYnVpbGQNCj4gZ2RiIHdpdGggcHl0aG9uIHN1cHBvcnQiDQo+IA0KPiBPbiBX
ZWQsIE1hciAyMSwgMjAxMiBhdCA2OjU4IFBNLCBLYW1ibGUsIE5pdGluIEENCj4gPG5pdGluLmEu
a2FtYmxlQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gQWN0dWFsbHkgd2Ugbm90aWNlZCB0aGF0IEVy
aWPigJlzIHdvcmtpbmcgc2RrIGdkYiB3YXMgZ2V0dGluZyBsaW5rZWQNCj4gd2l0aCB0aGUNCj4g
PiBob3N0IGxpYnB5dGhvbi5zbywgQW5kIGlmIGl0IGlzIGxpbmtlZCB3aXRoIHRoZSBzZGsgbGli
cHl0aG9uLnNvIHRoZW4NCj4gaGUgaXMNCj4gPiBhYmxlIHRvIHNlZSBzYW1lIGlzc3VlIHdoYXQg
SSBhbSBzZWVpbmcuDQo+ID4NCj4gPiBTbyBsb29rIGxpa2UgaXNzdWUgaXMgaW4gdGhlIGdlbmVy
YXRlZCBsaWJweXRob24uc28uDQo+ID4NCj4gPiBBbmQgaW4gZmFpbGluZyBjYXNlLCBzb21laG93
IGxkZCBpcyBub3QgcmVwb3J0aW5nIHRoYXQgc2RrIGdkYiBpcw0KPiA+IGR5bmFtaWNhbGx5IGxp
bmtlZCB3aXRoIGxpYnB5dGhvbi5zby4gVGhhdCBpcyBhbHNvIHN0cmFuZ2UuDQo+ID4NCj4gDQo+
IE9LIGNhbiB5b3UgZ2VuZXJhdGUgdGhlIGdkYiBjb3JlIGFuZCBwb3N0IGl0LiBJIGNhbiBkZWJ1
ZyB3aGF0cyBjYXVzaW5nDQo+IGl0Lg0KPiANCg0KS2hlbSwNClRoYW5rcyBmb3IgaGVscGluZyBv
dXQuIEkgYWxzbyBoYXZlIHVwbG9hZGVkIHRoZSBjb3JlIGZpbGUgaGVyZTogaHR0cDovL21pbi51
cy9tYmlpMjhRbWtaDQoNCk5pdGluDQo=


