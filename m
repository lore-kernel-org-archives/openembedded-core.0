Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVQrM-0001f6-2e
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 17:48:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 08:42:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,592,1315206000"; d="scan'208";a="90228493"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2011 08:42:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 29 Nov 2011 08:42:02 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Tue, 29 Nov 2011 08:42:04 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 08:42:02 -0800
Thread-Topic: [OE-core] [PATCH 3/4] gmp: also generate the libgmpcxx library
	& package it properly
Thread-Index: AcyubPXGvTAKcm7MQfuBRLcTN3YeqgASI2Ew
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3D06A4F@orsmsx504.amr.corp.intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
	<6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
	<4f8425c0c7856dba2b3765407a97754c7b06aeb5.1322526931.git.nitin.a.kamble@intel.com>
	<CAP9ODKpm7jB4FhBuNC7biDyuhVg8Kdxf5wEcm+WwsAyRtZR+WQ@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D06804@orsmsx504.amr.corp.intel.com>
	<1322553613.3077.10.camel@lenovo.internal.reciva.com>
In-Reply-To: <1322553613.3077.10.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 16:48:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gUGhp
bCBCbHVuZGVsbA0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyOSwgMjAxMSAxMjowMCBBTQ0K
PiBUbzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMy80XSBnbXA6IGFsc28gZ2VuZXJhdGUgdGhl
IGxpYmdtcGN4eA0KPiBsaWJyYXJ5ICYgcGFja2FnZSBpdCBwcm9wZXJseQ0KPiANCj4gT24gTW9u
LCAyMDExLTExLTI4IGF0IDE3OjUyIC0wODAwLCBLYW1ibGUsIE5pdGluIEEgd3JvdGU6DQo+IA0K
PiA+IEJlZm9yZSB0aGUgZ2VuZXJhdGlvbiBvZiBsaWJnbXB4eCBsaWJyYXJ5LCB0aGVyZSB3YXMg
b25seSBvbmUNCj4gbGlicmFyeSwNCj4gPiBsaWJnbXAsIGFuZCBpdCB3YXMgZ2V0dGluZyBwYWNr
YWdlZCBpbnRvIGxpYmdtcDEwIHBhY2thZ2UuIEFmdGVyDQo+ID4gYWRkaXRpb24gb2YgdGhlIGxp
YmdtcHh4IGxpYnJhcnkgdGhlIHBhY2thZ2UgbmFtZSBjaGFuZ2VkIHRvIHRoZQ0KPiA+IHJlY2lw
ZSBuYW1lIChnbXApLCBpbiBvcmRlciB0byBwcmVzZXJ2ZSB0aGUgcHJldmlvdXMgcGFja2FnZSBu
YW1lKGZvcg0KPiA+IGRpc3RybyB1cGdyYWRlcyksIGFuZCB0byBsZXQgcGVvcGxlIGF2b2lkIGlu
c3RhbGxhdGlvbiBvZiBsaWJnbXB4eCBpZg0KPiA+IHRoZXkgZG9u4oCZdCBuZWVkIGl0IGluIG9y
ZGVyIHRvIHNhdmUgdGhlIHNwYWNlIG9uIHRhcmdldCwgdHdvIHBhY2thZ2VzDQo+ID4gYXJlIGdl
bmVyYXRlZCBmb3IgZWFjaCBsaWJyYXJ5IHdpdGggdGhpcyBzY2hlbWUuDQo+IA0KPiBSaWdodCwg
YnV0IHRoYXQncyBub3QgcmVhbGx5IHRoZSBwb2ludC4gIEkgdGhpbmsgd2hhdCBPdGF2aW8gd2Fz
IHRyeWluZw0KPiB0byBhc2sgd2FzLCB3aHkgZGlkbid0IHlvdSBqdXN0IGRvOg0KPiANCj4gUEFD
S0FHRVMgPSsgImxpYmdtcHh4Ig0KPiBGSUxFU19saWJnbXB4eCA9ICIke2xpYmRpcn0vbGliZ21w
eHgke1NPTElCU30iDQo+IA0KPiA/ICBJIHRoaW5rIHRoZSB3YXkgeW91IGhhdmUgZG9uZSBpdCB3
aWxsIGNhdXNlIHRoZSBsaWJnbXAgcGFja2FnZSBuYW1lDQo+IHRvIGNoYW5nZSBmb3IgcGVvcGxl
IG5vdCB1c2luZyBkZWJpYW4uYmJjbGFzcywgd2hpY2ggaXMgcHJvYmFibHkgYSBiYWQNCj4gdGhp
bmcuDQo+IA0KPiBwLg0KDQpUaGFua3MgUGhpbCwNCiAgVGhpcyB3YXMgYWxzbyB3b3JrcyB0aGUg
c2FtZS4gQW5kIHByb2R1Y2luZyBzYW1lIHJwbSBwYWNrYWdlcyBhcyBwcmV2aW91cyBvbmUuIFNv
IEkgYW0gaGFwcHkgdG8gYWNjZXB0IHRoaXMgY2hhbmdlIGlmIGl0IGhlbHBzIHRoZSBkZWIgcGFj
a2FnZXMuIFdpbGwgcmVzZW5kIHRoZSBjb21taXQuDQpOaXRpbg0KDQo+IA0KPiANCj4gDQo+IA0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVu
ZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxt
YW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==


