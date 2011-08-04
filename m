Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qozgx-0004W3-Ru
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:18:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 08:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,317,1309762800"; d="scan'208";a="35388924"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 08:14:09 -0700
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 23:14:08 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Thu, 4 Aug 2011 23:13:56 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Thu, 4 Aug 2011
	23:14:07 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Thu, 4 Aug 2011 23:14:05 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxStlCLHyyhDAAyS5unJmHx1B9CwwAAJ9ng
Message-ID: <1865303E0DED764181A9D882DEF65FB6B3046C9C16@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
	<4E3AA24A.7050400@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
	<1312469622.5417.1.camel@phil-desktop>
In-Reply-To: <1312469622.5417.1.camel@phil-desktop>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Thu, 04 Aug 2011 15:18:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGhpbCBCbHVuZGVsbCB3cm90ZSBvbiAyMDExLTA4LTA0Og0KPiBPbiBUaHUsIDIwMTEtMDgtMDQg
YXQgMjI6NDkgKzA4MDAsIEN1aSwgRGV4dWFuIHdyb3RlOg0KPj4gKyAgICAgICAgQkRJUj1gcmVh
ZGxpbmsgLWYgIiRCRElSImANCj4+ICsgICAgICAgIGlmIFsgLXogIiRCRElSIiBdOyB0aGVuDQo+
PiArICAgICAgICAgICAgUEFSRU5URElSPWBkaXJuYW1lICIkMSJgDQo+PiArICAgICAgICAgICAg
ZWNobyA+JjIgIkVycm9yOiB0aGUgZGlyZWN0b3J5ICRQQVJFTlRESVIgZG9lcyBub3QgZXhpc3Q/
Ig0KPj4gICAgICAgICAgICAgIHJldHVybiAxDQo+PiAgICAgICAgICBmaQ0KPj4gICAgICBmaQ0K
PiANCj4gSnVzdCBvdXQgb2YgY3VyaW9zaXR5LCBjb3VsZCB5b3Ugbm90IGp1c3QgZG8gIm1rZGly
IC1wICRCRElSIiBhbmQNCj4gYXZvaWQgdGhpcyB3aG9sZSBzZXQgb2YgY29tcGxpY2F0ZWQgdGVz
dHM/ICBPciBpcyB0aGVyZSBzb21lIHJlYXNvbg0KPiB3aHkgaXQncyBhY3R1YWxseSBpbXBvcnRh
bnQgdG8ga25vdyB3aGV0aGVyIHRoZSBwYXJlbnQgZGlyZWN0b3J5IGV4aXN0ZWQgYWxyZWFkeT8N
CkhpIFBoaWwsDQpBY3R1YWxseSBpbiBzY3JpcHRzL29lLXNldHVwLWJ1aWxkZGlyLCB3ZSBkbyBo
YXZlIGEgbGluZQ0KbWtkaXIgLXAgJEJVSUxERElSL2NvbmYgLg0KDQpUaGUgaXNzdWUgaXM6ICJy
ZWFkbGluayAtZiBub3RfZXhpc3RlbnRfZGlyL2J1aWxkIiByZXR1cm5zIGVtcHR5LCBzbyBCVUlM
RERJUiB3b3VsZCBiZSBhc3NpZ25lZCB3aXRoIGBwd2RgIGFuZCB0aGlzIGlzIG5vdCBleHBlY3Rl
ZC4NCg0KSSBkb24ndCByZWFsbHkga25vdyB3aHkgdGhlIHRlc3QgInJlYWRsaW5rIC1mIiBpcyBo
ZXJlIC0tICJyZWFkbGluayAtZiIgaXMgdXNlZCAzIHRpbWVzIGluIHNjcmlwdHMvb2UtYnVpbGRl
bnYtaW50ZXJuYWwuIE1heWJlIFJQIGtub3dzIHRoZSBoaXN0b3J5PyBJIGFsc28gdGhpbmsgd2Ug
Y2FuIGRyb3AgdGhlIHRlc3RzICJyZWFkbGluayAtZiIgc2luY2Ugd2UgdXNlICJta2RpciAtcCI/
DQoNClRoYW5rcywNCi0tIERleHVhbg0KDQoNCg==


