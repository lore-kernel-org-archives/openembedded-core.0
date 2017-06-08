Return-Path: <ismo.puustinen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2253265CC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 10:20:53 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 03:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,314,1493708400"; d="scan'208";a="112396785"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2017 03:20:54 -0700
Received: from irsmsx112.ger.corp.intel.com (10.108.20.5) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 8 Jun 2017 11:20:53 +0100
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.129]) by
	irsmsx112.ger.corp.intel.com ([169.254.1.42]) with mapi id
	14.03.0319.002; Thu, 8 Jun 2017 11:20:52 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2] python3: make readline, gdbm, and db
	support conditional.
Thread-Index: AQHS35T4FenGFKJDF06RYftNXiAgH6IZX6oAgAFSNQA=
Date: Thu, 8 Jun 2017 10:20:52 +0000
Message-ID: <1496917250.23488.3.camel@intel.com>
References: <20170607134942.13281-1-ismo.puustinen@intel.com>
	<CAJTo0LbcEL78uNKy6CS0vUkDCT1OkW+X7ojk=KsYV-wTi-5S9Q@mail.gmail.com>
In-Reply-To: <CAJTo0LbcEL78uNKy6CS0vUkDCT1OkW+X7ojk=KsYV-wTi-5S9Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.72]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Thu, 08 Jun 2017 10:20:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <06BE3C790EACE8488B10CD08D6B823CE@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA2LTA3IGF0IDE1OjEwICswMTAwLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQo+
IA0KPiBPbiA3IEp1bmUgMjAxNyBhdCAxNDo0OSwgSXNtbyBQdXVzdGluZW4gPGlzbW8ucHV1c3Rp
bmVuQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gK1JSRUNPTU1FTkRTXyR7UE59LWNvcmUgPSAi
JHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLA0KPiA+ICdyZWFkbGluZScsICck
e1BOfS1yZWFkbGluZScsICcnLCBkKX0iDQo+ID4gDQo+IA0KPiBSZWNvbW1lbmRzIGNhbiBub3Qg
ZXhpc3RzLCBzbyBJIHdvdWxkbid0IGJvdGhlciB3aXRoIHRoaXMNCj4gY29tcGxpY2F0aW9uLg0K
DQpPaywgSSdsbCByZW1vdmUgaXQuDQoNCj4gPiArUkRFUEVORFNfJHtQTn0tbW9kdWxlc19yZW1v
dmUgKz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ODQo+ID4gRklHJywgJ3JlYWRs
aW5lJywgJycsICcke1BOfS1yZWFkbGluZScsIGQpfSINCj4gDQo+IChldGMpDQo+IA0KPiBEb24n
dCB1c2UgX3JlbW92ZSBhbmQgKz0gYXMgaXQncyBjb25mdXNpbmcuDQoNCkknbGwgY2hhbmdlIHRo
YXQuDQoNCj4gQnV0IGlmIGZvciBleGFtcGxlIHJlYWRsaW5lIGlzIGRpc2FibGVkLCB3aHkgd291
bGQgdGhlIHBhY2thZ2UgYmUNCj4gY3JlYXRlZCBpbiB0aGUgZmlyc3QgcGxhY2U/DQoNClRoZSBw
YWNrYWdlIGluZGVlZCBpc24ndCBjcmVhdGVkLiBIb3dldmVyLCBpdCdzIGFkZGVkIHRvDQpSREVQ
RU5EU19weXRob24zLW1vZHVsZXMgaW4gcHl0aG9uMyBtYW5pZmVzdCBmaWxlIGhlcmU6DQoNCmh0
dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5L3RyZWUvbWV0YS9y
ZWNpcGVzLWRldnRvDQpvbHMvcHl0aG9uL3B5dGhvbi0zLjUtbWFuaWZlc3QuaW5jI24yODANCg0K
VGhlIG90aGVyIHZhcmlhYmxlIGNoYW5nZXMgYXJlIGRvbmUgYWxzbyBpbiB0aGUgbWFuaWZlc3Qu
IEhvd2V2ZXIsIHRoZQ0KbWFuaWZlc3QgZmlsZSB3YXJucyBhYm91dCBtb2RpZnlpbmcgaXQsIHNv
IHRoZSBwYXRjaCAicmV2ZXJzZXMiIHRoZQ0KY2hhbmdlcyBiYXNlZCBvbiBQQUNLQUdFQ09ORklH
IGZyb20gdGhlIHJlY2lwZS4NCg0KSXNtbw==

