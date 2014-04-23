Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C5A6E65D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 10:59:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Apr 2014 03:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,911,1389772800"; d="scan'208";a="497982384"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2014 03:59:29 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 23 Apr 2014 11:58:57 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.183]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.128]) with mapi id
	14.03.0123.003; Wed, 23 Apr 2014 11:58:57 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Thread-Topic: [OE-core] oe-selftest developer oriented improvements
Thread-Index: Ac9ezDUTM3PgP7mMTAmWhXLdaavYDwACjJ2AAAL7efA=
Date: Wed, 23 Apr 2014 10:58:56 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A25638D@IRSMSX103.ger.corp.intel.com>
References: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
	<CANyK_8cBY=H2vGYH9B7=5AdjCHoiP1AY_xk0o80+YcCuL8zG5g@mail.gmail.com>
In-Reply-To: <CANyK_8cBY=H2vGYH9B7=5AdjCHoiP1AY_xk0o80+YcCuL8zG5g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-selftest developer oriented improvements
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
X-List-Received-Date: Wed, 23 Apr 2014 10:59:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+ID4gMSkgICBUZXN0aW5nIHJlY2lwZXMgdXBkYXRlcyBvciBuZXcgcmVjaXBlcw0KPiA+DQo+
ID4gRXZlbiB0aG91Z2ggd2UgY2Fubm90IHRlc3QgZXZlcnkgc2luZ2xlIHNjZW5hcmlvIG9yIHRo
ZSBmdW5jdGlvbmFsaXR5IG9mIGENCj4gcmVjaXBlLCB3ZSBjb3VsZCBjcmVhdGUgYSB0ZXN0IHN1
aXRlIHRoYXQgd291bGQ6DQo+ID4gLSBidWlsZCB0aGUgcmVjaXBlIHdpdGggYWxsIG1ham9yIGFy
Y2hpdGVjdHVyZXMocWVtdXg4NiwgcWVtdXg4Ni02NCwNCj4gPiBxZW11YXJtLCBxZW11cHBjLCBx
ZW11bWlwcykNCj4gPiAtIHJlYnVpbGQgdGhlIHJlY2lwZSBmcm9tIHNzdGF0ZSh3aXRoIG9yIHdp
dGhvdXQgYSBzc3RhdGUgZmlsZSBmb3IgdGhlDQo+ID4gcmVjaXBlKQ0KPiA+IC0gcGVyZm9ybSBj
bGVhbmluZyBvcGVyYXRpb25zIG9uIHRoZSByZWNpcGUoY2xlYW5zc3RhdGUpDQo+ID4gLSBmb3Jj
ZSBhbGwgbWFqb3IgdGFza3Mgb24gdGhlIHJlY2lwZSAoYml0YmFrZSAtQyA8dGFzaz4gPHJlY2lw
ZT4pDQo+ID4gLSBzZWxlY3RpdmVseSB1c2UgZWFjaCBjb21iaW5hdGlvbiBvZiAuYmJhcHBlbmQg
ZmlsZXMgd2l0aCB0aGUgcmVjaXBlOyBhbGwNCj4gdGhlIGNvbWJpbmF0aW9ucyBzaG91bGQgbm90
IGJyZWFrIHRoZSByZWNpcGUgYnVpbGQuDQo+ID4gLSB3ZSBjb3VsZCBhbHNvIGNyZWF0ZSBtaW5p
IHRlc3Qgc3VpdGVzIGp1c3QgZm9yIHNvbWUgb2YgdGhlc2UgdGVzdHMgbGlrZQ0KPiB0ZXN0aW5n
IG9ubHkgdGhlIHJlYnVpbGQgZnJvbSBzc3RhdGUuDQo+ID4gKGFueSBleHBlcmllbmNlIGZyb20g
Y29tbW9uIHJlY2lwZSBidWlsZCBmYWlscyBjYW4gYmUgaGVscGZ1bCBoZXJlKQ0KPiA+DQo+IA0K
PiBJJ2QgcmVhbGx5IGxpa2UgdG8gc2VlIHRoaXMsIGl0IGNvdWxkIGN1dCBkb3duIG9uIGNhc2Vz
IHdoZXJlIHNvbWV0aGluZyB3b3Jrcw0KPiBmb3Igb25lIGRldmVsb3BlciBidXQgdGhlbiBoaXRz
IGFuIGVkZ2UgY2FzZSB3aGVuIHNlbnQgdG8gdGhlIGF1dG9idWlsZGVyLg0KPiANCj4gSSBjYW4g
YWxzbyBzZWUgJ3R5cGU9cGFja2FnZScgYmVpbmcgdXNlZnVsLCB0byBjaGVjayB0aGF0IGEgZ2Vu
ZXJhdGVkDQo+IHBhY2thZ2UgaW5zdGFsbHMgY2xlYW5seSBpbiBhbiBpbWFnZS4gRm9yIGV4YW1w
bGUsIGlmIHBhY2thZ2UgeCBjb250YWlucyBhIGZpbGUNCj4gd2hpY2ggY2xhc2hlcyB3aXRoIHNv
bWV0aGluZyBhbHJlYWR5IGluc3RhbGxlZCBvbiBjb3JlLWltYWdlLW1pbmltYWwsDQo+ICdiaXRi
YWtlIHgnIHdvbid0IHNob3cgdGhpcyBidXQgJ2JpdGJha2UgY29yZS1pbWFnZS1taW5pbWFsJyB3
aXRoDQo+ICdJTUFHRV9JTlNUQUxMICs9IHgnIHNldCB3aWxsIGRvLg0KPiANCj4gVGFraW5nIHRo
YXQgYSBzdGVwIGZ1cnRoZXIsIHRoYXQgaW1hZ2UgY291bGQgdGhlbiBiZSBib290ZWQgaW4gcWVt
dSBhbmQgdGhlDQo+IHJlbGV2YW50IHB0ZXN0IHN1aXRlIHJhbi4gSSdtIG5vdCBzdXJlIGhvdyB0
aGF0IHdvdWxkIGJlIGF1dG9tYXRlZCBteXNlbGYgb3INCj4gaG93IHRoZSBwdGVzdCBsb2cgYW5k
IHJlc3VsdHMgd291bGQgYmUgcHVsbGVkIG9mZiB0aGUgcWVtdSBpbWFnZSBidXQgaWYgaXQgaXMN
Cj4gcG9zc2libGUgSSB0aGluayBpdCB3b3VsZCBiZSBhIHZlcnkgdXNlZnVsIG9wdGlvbi4NCg0K
RXZlbiB0aG91Z2ggd2UgY2Fubm90IGJvb3QgdGhlIGltYWdlIGFuZCBydW4gcHRlc3QgYXQgdGhl
IG1vbWVudCB1c2luZyBvZS1zZWxmdGVzdCwgaXQgY291bGQgYmUgZG9uZSBpbiB0aGUgZnV0dXJl
LiBUaGlzIGNhbiBiZSBkb25lIG5vdyB3aXRoIHRoZSAndGVzdGltYWdlJyBmZWF0dXJlIHRob3Vn
aC4gV2UgbmVlZCB0byBpbnZlc3RpZ2F0ZSB0aGUgdXNhZ2Ugb2YgdGhlIDIgdG9vbHMgdG9nZXRo
ZXIuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrIQ0KDQpSZWdhcmRzLA0KQ29ybmVsaXUg
DQpZb2N0byBRQQ0K

