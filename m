Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QfEXc-0004ML-DG
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:08:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2011 10:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="23257910"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2011 10:04:42 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 8 Jul 2011 10:04:41 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Fri, 8 Jul 2011 10:04:41 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 10:04:40 -0700
Thread-Topic: [OE-core] [PATCH 5/7] eglibc: fix installed but not packaged
	files
Thread-Index: Acw87sbaCQGxR8U1RTWbIEmnaXQFHgAoksiw
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE22663A@orsmsx504.amr.corp.intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<24e836176430410a91d0c18fcef0854536798766.1310070283.git.nitin.a.kamble@intel.com>
	<1310071349.18564.2.camel@lenovo.internal.reciva.com>
	<CAMKF1srLZ2XZxss7h_FAy3nkuBY29qL+K_S4nd2a0Ra-mzmyjg@mail.gmail.com>
In-Reply-To: <CAMKF1srLZ2XZxss7h_FAy3nkuBY29qL+K_S4nd2a0Ra-mzmyjg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] eglibc: fix installed but not packaged	files
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
X-List-Received-Date: Fri, 08 Jul 2011 17:08:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciBjbGFyaWZpY2F0aW9ucy4gSSB3aWxsIHJld29yayB0aGUgcGF0Y2ggdG8gdGFr
ZSBvdXQgdGhlIHJwYy4NCk5pdGluDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmddIE9uIEJlaGFsZiBPZg0KPiBLaGVtIFJhag0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAwNywg
MjAxMSAyOjQxIFBNDQo+IFRvOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2Ut
Y29yZSBsYXllcg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCA1LzddIGVnbGliYzog
Zml4IGluc3RhbGxlZCBidXQgbm90DQo+IHBhY2thZ2VkIGZpbGVzDQo+IA0KPiBPbiBUaHUsIEp1
bCA3LCAyMDExIGF0IDE6NDIgUE0sIFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0PiB3cm90ZToN
Cj4gPiBPbiBUaHUsIDIwMTEtMDctMDcgYXQgMTM6MjUgLTA3MDAsIG5pdGluLmEua2FtYmxlQGlu
dGVsLmNvbSB3cm90ZToNCj4gPj4gLUZJTEVTXyR7UE59ID0gIiR7bGliY19iYXNlbGlic30gJHts
aWJleGVjZGlyfS8qDQo+ICR7QGJhc2VfY29uZGl0aW9uYWwoJ1VTRV9MRENPTkZJRycsICcxJywg
JyR7YmFzZV9zYmluZGlyfS9sZGNvbmZpZw0KPiAke3N5c2NvbmZkaXJ9L2xkLnNvLmNvbmYnLCAn
JywgZCl9Ig0KPiA+PiArRklMRVNfJHtQTn0gPSAiJHtsaWJjX2Jhc2VsaWJzfSAke2xpYmV4ZWNk
aXJ9LyogJHtzeXNjb25mZGlyfS9ycGMNCj4gJHtAYmFzZV9jb25kaXRpb25hbCgnVVNFX0xEQ09O
RklHJywgJzEnLCAnJHtiYXNlX3NiaW5kaXJ9L2xkY29uZmlnDQo+ICR7c3lzY29uZmRpcn0vbGQu
c28uY29uZicsICcnLCBkKX0iDQo+ID4NCj4gPiBJIGRvbid0IHRoaW5rIHdlIHdhbnQgL2V0Yy9y
cGMgaW4gbGliYzYsIGl0J3MganVzdCBhIHdhc3RlIG9mIHNwYWNlDQo+IGlmDQo+ID4geW91IGFy
ZW4ndCB1c2luZyBzdW5ycGMuIMKgTm9ib2R5IGhhcyBtaXNzZWQgaXQgdGh1cyBmYXIgc28gSSB3
b3VsZCBiZQ0KPiA+IGluY2xpbmVkIHRvIGRlbGV0ZSBpdCwgYnV0IGl0IGNvdWxkIGdvIGluIGEg
cGFja2FnZSBvZiBpdHMgb3duIGlmDQo+IHRoZXJlDQo+ID4gaXMgYSBmZWVsaW5nIHRoYXQgaXQn
cyB2YWx1YWJsZS4NCj4gDQo+IE1vcmVvdmVyIHN1biBycGMgaXMgbm93IG9ic29sZXRlIGluIGds
aWJjIDIuMTQgb253YXJkcyBzbyBwcm9iYWJseQ0KPiByZW1vdmluZyBpdCBmcm9tIHBhY2thZ2Ug
aXMgcmlnaHQgdGhpbmcgdG8gZG8uDQo+ID4NCj4gPiBwLg0KPiA+DQo+ID4NCj4gPg0KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gT3BlbmVt
YmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5saW51eHRvZ28ub3JnL2NnaS1iaW4vbWFp
bG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KPiA+DQo+IA0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBt
YWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8vb3Bl
bmVtYmVkZGVkLWNvcmUNCg==


