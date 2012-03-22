Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAm6Y-0005AT-7i
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:47:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2012 10:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132075910"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2012 10:38:22 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 22 Mar 2012 10:38:22 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.160]) with mapi id
	14.01.0355.002; Thu, 22 Mar 2012 10:38:21 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build gdb
	with python support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg//+Uh4CAAHG8cP//vk0AgABePxD//+QoAIAAbP/w//+eq4AADuUhAAAAJUEAAADrcAAAAH4QAAAAmVaAAAhCLcAAASiuAAAO5twg
Date: Thu, 22 Mar 2012 17:38:20 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
In-Reply-To: <CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Jansa <martin.jansa@gmail.com>, Martin, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 22 Mar 2012 17:47:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyMiwgMjAxMiA5
OjM4IEFNDQo+IFRvOiBLYW1ibGUsIE5pdGluIEENCj4gQ2M6IEVyaWMgQsOpbmFyZDsgUGF0Y2hl
cyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXI7DQo+IE1hcnRpbiBKYW5z
YQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzFdIFJldmVydCAiZ2RiLWNyb3Nz
LWNhbmFkaWFuOiBidWlsZA0KPiBnZGIgd2l0aCBweXRob24gc3VwcG9ydCINCj4gDQo+IE9uIFRo
dSwgTWFyIDIyLCAyMDEyIGF0IDk6MjAgQU0sIEthbWJsZSwgTml0aW4gQQ0KPiA8bml0aW4uYS5r
YW1ibGVAaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IFJlbmFtaW5nIHRoZSBzZGsgcHl0aG9u
Mi43L2xpYi1keW5sb2FkL3JlYWRsaW5lLnNvIHRvIHB5dGhvbjIuNy9saWItDQo+IGR5bmxvYWQv
cmVhZGxpbmVfZC5zbyBnZXRzIHRoZSBzZGsgZ2RiIHdvcmtpbmcgZm9yIG1lIHRvby4NCj4gPiBT
byBpcyB0aGlzIGEgd29ya2Fyb3VuZCBvciBzb2x1dGlvbiB0byB0aGUgcHJvYmxlbT8gSWYgaXQg
aXMgYQ0KPiB3b3JrYXJvdW5kIHdoYXQgc2hvdWxkIGJlIHJpZ2h0IHNvbHV0aW9uPw0KPiANCj4g
SSB0aGluayB3ZSBzaG91bGQgYmUgZ2VuZXJhdGluZyB0aGVzZSBfZC5zbyBmaWxlcyBkdXJpbmcg
cHl0aG9uLW5hdGl2ZQ0KPiBidWlsZC4gU28gcGxlYXNlIGxvb2sgaW50byB3aHkgaXRzIG5vdCBo
YXBwZW5pbmcuIEkgd29udCBoYXZlIG11Y2gNCj4gY2hhbmNlDQo+IGR1cmluZyB0aGUgZGF5IHRv
IGxvb2sgYXQgdGhhdA0KDQpMb29rcyBsaWtlIHdlIG5lZWQgdGhpcyBwYXRjaCBmb3IgdGhlIHB5
dGhvbiByZWNpcGUgdG8gZ2VuZXJhdGUgZGVidWcgbW9kdWxlczoNCmh0dHA6Ly9wYXRjaC10cmFj
a2VyLmRlYmlhbi5vcmcvcGF0Y2gvc2VyaWVzL3ZpZXcvcHl0aG9uMi43LzIuNy4yLTgvZGVidWct
YnVpbGQuZGlmZg0KDQpOaXRpbg0KDQo=


