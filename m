Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RLd94-0001ZH-Tq
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 16:54:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Nov 2011 08:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,444,1315206000"; d="scan'208";a="80482027"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2011 08:48:14 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 2 Nov 2011 23:48:13 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 2 Nov 2011 23:48:13 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Wed, 2 Nov 2011
	23:48:12 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 2 Nov 2011 23:48:11 +0800
Thread-Topic: [OE-core] [PATCH 1/1] bash: make job control really work
Thread-Index: AcyZSx36nks1X/lQROmzTcxOGkm6JAAKyizw
Message-ID: <1865303E0DED764181A9D882DEF65FB6D836780FE8@shsmsx502.ccr.corp.intel.com>
References: <cover.1320134607.git.dexuan.cui@intel.com>
	<ac7b821f266e932e267a4d62af83586ba3261a98.1320134607.git.dexuan.cui@intel.com>
	<1320142868.13918.0.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6D836780D9E@shsmsx502.ccr.corp.intel.com>
	<1320230106.20107.23.camel@ted>
In-Reply-To: <1320230106.20107.23.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bash: make job control really work
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
X-List-Received-Date: Wed, 02 Nov 2011 15:54:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmljaGFyZCBQdXJkaWUgd3JvdGUgb24gMjAxMS0xMS0wMjoNCj4gT24gV2VkLCAyMDExLTExLTAy
IGF0IDE1OjEwICswODAwLCBDdWksIERleHVhbiB3cm90ZToNCj4+IFJpY2hhcmQgUHVyZGllIHdy
b3RlIG9uIDIwMTEtMTEtMDE6DQo+Pj4gT24gVHVlLCAyMDExLTExLTAxIGF0IDE2OjA1ICswODAw
LCBEZXh1YW4gQ3VpIHdyb3RlOg0KPiBJIGhhZCBhIGdvIGF0IHRoaXMgcHJvYmxlbSBteXNlbGYg
YW5kIGl0IHRvb2sgYSBiaXQgb2YgZmlndXJpbmcgb3V0Lg0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0
IGJhc2ggc2hpcHMgImNvbmZpZy5oLmluIiBidXQgYXV0b2hlYWRlciBvdmVyd3JpdGVzIGl0Lg0K
PiBUaGlzIHJlbW92ZXMgdGhlIHN0YXJ0L2VuZCBpbmNsdWRlcyBmcm9tIGNvbmZpZy5oIG9yIGNv
bmZpZy1ib3QuaCBhbmQNCj4gY29uZmlnLXRvcC5oLiBXZSBjYW4gZG8gc29tZXRoaW5nIGxpa2Ug
dGhpczoNCj4gDQo+IGV4cG9ydCBBVVRPSEVBREVSID0gInRydWUiDQo+IA0KPiBkb19jb25maWd1
cmVfcHJlcGVuZCAoKSB7DQo+ICAgICAgICBpZiBbICEgLWUgYWNpbmNsdWRlLm00IF07IHRoZW4N
Cj4gICAgICAgICAgICAgICAgY2F0IGFjbG9jYWwubTQgPiBhY2luY2x1ZGUubTQNCj4gICAgICAg
IGZpDQo+IH0NCj4gDQo+IGluc3RlYWQgb2YgdGhlIGN1cnJlbnQgZG9fY29uZmlndXJlIG92ZXJy
aWRlLiBUaGUgX3ByZXBlbmQgZW5zdXJlcyB0aGUNCj4gYmFzaCBzcGVjaWZpYyBtYWNyb3MgYXJl
IHByZXNlcnZlZCBhbmQgdGhlIGV4cG9ydCBBVVRPSEVBREVSIHN0b3BzDQo+IGF1dG9oZWFkZXIg
ZnJvbSBydW5uaW5nIGF0IGFsbC4NCj4gDQo+IENvdWxkIHlvdSB0ZXN0IHRob3NlIGNoYW5nZXMg
YWdhaW5zdCBiYXNoIDQueCBhbmQgYmFzaCAzLnggKHJlcGxhY2luZw0KPiB0aGUgY3VycmVudCBk
b19jb25maWd1cmUgaW4gYmFzaC5pbmMpIGFuZCB0aGVuIGlmIHRoYXQgd29ya3Mgc2VuZCBhIHBh
dGNoIHBsZWFzZT8NCkxvb2tzIGJ1ZyA0ODcgb25seSBoYXBwZW5zIHRvIGJhc2ggNC54IGFuZCBi
YXNoIDMueCBkb2Vzbid0IGhhdmUgc3VjaCBhIGJ1ZyAodGhlDQpyZWNpcGUgb2YgYmFzaCAzLngg
ZG9lc24ndCB1c2UgYmFzaC5pbmMsIGVpdGhlcikNCg0KUlAsIHRoYW5rcyBhIGxvdCBmb3IgdGhl
IGhlbHAhIEhlcmUgaXMgdGhlIG5ldyBwYXRjaDoNCmh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9jZ2l0L2NnaXQuY2dpL3Bva3ktY29udHJpYi9jb21taXQvP2g9ZGN1aS9idWc0ODcmaWQ9YjUy
NDMzN2VkNTY3MGRlMmMwZDI5NGMzZjY5NzBlMjRmMjM4NDdlYg0KDQpUaGFua3MsDQotLSBEZXh1
YW4NCg0K


