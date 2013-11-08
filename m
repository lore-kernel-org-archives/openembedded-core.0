Return-Path: <darren.hart@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8433A6D350
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 17:23:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Nov 2013 09:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="432070931"
Received: from fmsmsx103.amr.corp.intel.com ([10.19.9.34])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2013 09:23:45 -0800
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	FMSMSX103.amr.corp.intel.com (10.19.9.34) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 8 Nov 2013 09:23:45 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.92]) by
	FMSMSX109.amr.corp.intel.com ([169.254.5.191]) with mapi id
	14.03.0123.003; Fri, 8 Nov 2013 09:23:45 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
Thread-Index: AQHO3JXOmudx7eC+cEOEuRd8Zb/Mb5ob/uYAgAAD+4CAAADvAIAADleAgAAJVgA=
Date: Fri, 8 Nov 2013 17:23:45 +0000
Message-ID: <1383931424.5378.131.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1383923880.2345.4.camel@ted> <527D0624.3060407@windriver.com>
	<1383926139.2345.7.camel@ted> <527D0A44.7020005@windriver.com>
	<1383929419.2345.11.camel@ted>
In-Reply-To: <1383929419.2345.11.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.15.85]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
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
X-List-Received-Date: Fri, 08 Nov 2013 17:23:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <436AD783FF28EA48A3FFA674F46640C5@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDEzLTExLTA4IGF0IDE2OjUwICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDEzLTExLTA4IGF0IDEwOjU5IC0wNTAwLCBCcnVjZSBBc2hmaWVsZCB3cm90
ZToNCj4gPiBPbiAxMy0xMS0wOCAxMDo1NSBBTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4g
PiBPbiBGcmksIDIwMTMtMTEtMDggYXQgMTA6NDEgLTA1MDAsIEJydWNlIEFzaGZpZWxkIHdyb3Rl
Og0KPiA+ID4+IE9uIDEzLTExLTA4IDEwOjE4IEFNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4g
PiA+Pj4gVGhlIGtlcm5lbCB0cmVlIGlzIGxhcmdlIGFuZCBkb2Vzbid0IG5lZWQgdG8gYmUgY29w
aWVkLiBPdmVycmlkZQ0KPiA+ID4+PiB0aGUgZGVmYXVsdCBzeXNyb290IGhhbmRsaW5nIGZ1bmN0
aW9uIHRvIHVzZSBhIGhhcmRsaW5rIGNvcHlpbmcNCj4gPiA+Pj4gZnVuY3Rpb24gaW4gcHl0aG9u
Lg0KPiA+ID4+Pg0KPiA+ID4+PiBUaGlzIGNvbW1pdCBhbHNvIGRyb3BzIHRoZSBjb3B5aW5nIG9m
IHRoZSAvbGliIGRpcmVjdG9yeSB3aGljaA0KPiA+ID4+PiBqdXN0IGNvbnRhaW5zIHRoZSBrZXJu
ZWwgbW9kdWxlcy4gV2UgbmV2ZXIgdXNlIHRob3NlIGluIHRoZSBzeXNyb290DQo+ID4gPj4+IHNv
IHRoZXJlIGlzIGxpdHRsZSBwb2ludCBpbiBjYXJyeWluZyB0aG9zZSBhcm91bmQuDQo+ID4gPj4+
DQo+ID4gPj4+IEZvciBsaW51eC15b2N0byB0aGlzIHRha2VzIHRoZSBkb19wb3B1bGF0ZV9zeXNy
b290IHRpbWUgMjRzIC0+IDE0cy4NCj4gPiA+Pg0KPiA+ID4+IEZhbnRhc3RpYy4gT25lIGxlc3Mg
dGhpbmcgZm9yIG1lIHRvIGRpZyBpbnRvIGxhdGVyLiBJIHRob3VnaHQgdGhpcw0KPiA+ID4+IHdh
cyBhbHJlYWR5IGluIHBsYWNlLCBzbyBJJ20gcGxlYXNhbnRseSBzdXJwcmlzZWQgdGhhdCB0aGVy
ZSB3YXMgYQ0KPiA+ID4+IHRpbWUgc2F2aW5ncyB0byBiZSBmb3VuZCENCj4gPiA+DQo+ID4gPiBJ
IHdhcyBzb21ld2hhdCBzdXJwcmlzZWQgdG9vLg0KPiA+ID4NCj4gPiA+IFdlIHN0aWxsIG5lZWQg
dG8gb3B0aW1pc2Ugd2hhdCB3ZSBpbnN0YWxsIGluIGRvX2luc3RhbGwgc2luY2UgdGhhdCBpcw0K
PiA+ID4gd2hlcmUgc2lnbmlmaWNhbnQgZ2FpbnMgY2FuIHN0aWxsIGJlIG1hZGUuDQo+ID4gDQo+
ID4gQWdyZWVkLiBJIHN0YXJ0ZWQgc29tZSBjaGFuZ2VzIGluIHRoYXQgYXJlYSByaWdodCBhZnRl
ciBFTEMtZSwgSSdsbA0KPiA+IHRyeSBhbmQgZ2V0IHRoZW0gb3V0IHNvb25lciByYXRoZXIgdGhh
biBsYXRlci4NCj4gDQo+IEkgdGhvdWdodCBJJ2Qgc2hhcmUgdGhpcyBmb3IgcGVvcGxlJ3MgaW50
ZXJlc3Q6DQo+IA0KPiBodHRwOi8vZGFuLnJwc3lzLm5ldC9rZXJuZWxidWlsZGlzc3VlLnBuZw0K
PiANCj4gSXRzIHRoZSBvdXRwdXQgZnJvbSBweWJvb3RjaGFydCBvZiBhIGJpdGJha2UgY29yZS1p
bWFnZS1zYXRvIGZyb20NCj4gc2NyYXRjaC4gSSd2ZSB6b29tZWQgb3V0IHRvIHB1dCBzb21lIGJh
cnMgaW4gcGFydGljdWxhciBpbnRvDQo+IHBlcnNwZWN0aXZlLg0KPiANCj4gVGhlIHBpbmsgY29s
b3VyIGlzIGxpbnV4LXlvY3RvOmRvX2luc3RhbGwsIHRoZSBjeWFuIGlzDQo+IGxpbnV4LXlvY3Rv
OmRvX3BhY2thZ2UgYW5kIHRoZSBibHVlIGlzIGxpbnV4LXlvY3RvOmRvX3BvcHVsYXRlX3N5c3Jv
b3QuDQo+IFRoZSB1bmNvbG91cmVkIGJhciBhdCB0aGUgYm90dG9tIGlzIGxpbnV4LXlvY3RvOmRv
X3BhY2thZ2Vfd3JpdGVfcnBtLg0KPiANCj4gU28gdGhlIGZpbmFsIHRoaW5nIHRvIGJ1aWxkIGlz
IHRoZSBrZXJuZWwgYnkgcXVpdGUgc29tZSBtYXJnaW4sIGl0cw0KPiBob2xkaW5nIHRoZSByZXN0
IG9mIHRoZSBidWlsZCB1cC4NCj4gDQo+IEhvcGVmdWxseSB0aGVzZSBwYXRjaGVzIHN0YXJ0IHRv
IGltcHJvdmUgdGhhdCBhIGJpdCENCj4gDQoNCll1cCwgbGludXgteW9jdG8gZG9fcGFja2FnZSBp
cyB0aGUgYmlnZ2VzdCBidWlsZC10aW1lIGhpbmRyYW5jZSBmb3IgbWUNCmFuZCBzb21ldGhpbmcg
d2UndmUgd2FudGVkIHRvIGxvb2sgaW50byBmb3IgYSBsb25nIHRpbWUuIEdyZWF0IHRvIHNlZQ0K
c29tZSBwcm9ncmVzcy4NCg0KLS0gDQpEYXJyZW4gSGFydA0KSW50ZWwgT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXINCllvY3RvIFByb2plY3QgLSBMaW51eCBLZXJuZWwNCg0K

