Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.4611.1590106986429828762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 17:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Xuk1S7dbv0mc8FNh9ZfvyUhcaFbYLTyMjnbKdyAMtVn8QMG+aVVaO1xQ9Oqxdn11z1G+m1EXRr
 2FqxnwNU/D2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 17:23:05 -0700
IronPort-SDR: L7FSqUYIEEyGTnHacj3vVI/kVJtgQ0Uw70d9yNeYZNje6Wdxw9Ttm8tJSHGI+4kKoiieH/6g1x
 XHTCiWusmIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; 
   d="scan'208";a="440672407"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
  by orsmga005.jf.intel.com with ESMTP; 21 May 2020 17:23:04 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 PGSMSX104.gar.corp.intel.com ([169.254.3.168]) with mapi id 14.03.0439.000;
 Fri, 22 May 2020 08:23:03 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>
Subject: Re: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
Thread-Topic: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
Thread-Index: AQHWL4shX+cMedWa00is6OQn1penj6iyR7gAgABoDoCAAARdAIAABPiA
Date: Fri, 22 May 2020 00:23:02 +0000
Message-ID: <7185bff15ca130c5ed472812368a0fdf221d7921.camel@intel.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
	 <20200521161543.3273063-8-raj.khem@gmail.com>
	 <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com>
	 <e21304ef6fc99ca4cf33b96eb920095027ebf297.camel@intel.com>
	 <CAMKF1spHodgTCgAOs30tSYE9ypGenA1JUS9U6Wc6HfMnWabKdQ@mail.gmail.com>
In-Reply-To: <CAMKF1spHodgTCgAOs30tSYE9ypGenA1JUS9U6Wc6HfMnWabKdQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.135.70]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3656846F17C204A99D3BDC4E4A560B8@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDE3OjA1IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
VGh1LCBNYXkgMjEsIDIwMjAgYXQgNDo0OSBQTSBNaXR0YWwsIEFudWogPGFudWoubWl0dGFsQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gVGh1LCAyMDIwLTA1LTIxIGF0IDE5OjM3ICswMjAw
LCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+ID4gPiBPbiBUaHUsIE1heSAyMSwgMjAyMCBhdCA2OjE2
IFBNIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4g
Tm93IHRoYXQgdGhleSB1c2VzIC1tY3B1LCBpdHMgYmV0dGVyIHRvIGhhdmUgdHVuZSBzcGVjaWZp
Yw0KPiA+ID4gPiBidWlsZA0KPiA+ID4gPiBkaXJlY3Rvcmllcywgc2luY2UgYWFyY2g2NCB3b250
IGJlIGFwcHJvcHJpYXRlIGFueSBsb25nZXINCj4gPiA+IA0KPiA+ID4gSSBhZ3JlZSB3aXRoIFN0
ZXZlIHRoYXQgdGhpcyBpcyBhIGJpdCBpbnZhc2l2ZSBmb3Igc3RhYmxlIGJyYW5jaCwNCj4gPiA+
IGJ1dA0KPiA+ID4gb24gdGhlIG90aGVyIGhhbmQgaXQncyBsb25nIG92ZXJkdWUgYW5kIGlmIHdl
IGRvbid0IGltcHJvdmUgaXQgaW4NCj4gPiA+IExUUw0KPiA+ID4gYnJhbmNoIHRoZW4gbWFueSBw
ZW9wbGUgd2lsbCBuZWVkIHRvIGNhcnJ5IGxvY2FsIHdvcmsgYXJvdW5kcyBmb3INCj4gPiA+IG11
bHRpLW1hY2hpbmUgYnVpbGRzLiArMSBmcm9tIG1lLg0KPiA+ID4gDQo+ID4gDQo+ID4gQnV0IHRo
aXMgaXMgYWdhaW5zdCB0aGUgTFRTL1N0YWJsZSBicmFuY2ggcG9saWN5LiBXaGF0IGlzIHRoZSBw
b2ludA0KPiA+IG9mDQo+ID4gaGF2aW5nIGEgcG9saWN5IGlmIHdlIGFyZSBnb2luZyB0byBrZWVw
IG1ha2luZyBleGNlcHRpb25zPyBUaGVyZSdkDQo+ID4gYmUNCj4gPiBvdGhlciBjaGFuZ2VzIGFz
IHdlbGwgZm9yIHdoaWNoIHBlb3BsZSBtaWdodCBiZSBjYXJyeWluZyB3b3JrLQ0KPiA+IGFyb3Vu
ZHMuDQo+ID4gV291bGQgd2UgYmUgd2lsbGluZyB0byBtYWtlIGV4Y2VwdGlvbnMgZm9yIGFsbD8N
Cj4gPiANCj4gDQo+IFRoYW5rcyBmb3IgYnJpbmdpbmcgdGhpcyB1cC4gUG9saWN5IGV4Y2VwdGlv
bnMgYXJlIG5vdCBjb21tb24gYnV0DQo+IHRoZXkNCg0KVGhhdCdzIHR3byBleGNlcHRpb25zIGlu
IGEgd2Vlay4NCg0KSSBhbSBub3QgYWdhaW5zdCB0aGUgY2hhbmdlIGJ1dCBJIHRoaW5rIHRoZSBw
b2xpY3kgZG9jdW1lbnQgc2hvdWxkIGJlDQptb2RpZmllZCB0byBkZWZpbmUgaG93IGV4Y2VwdGlv
bnMgc2hvdWxkL3dpbGwgYmUgaGFuZGxlZC4gDQoNCj4gYXJlIG5vdCBhYnNlbnQgZWl0aGVyDQo+
IGhlbmNlIGNvbnRleHQgaXMgaW1wb3J0YW50IGZvciBzdWNoIGNoYW5nZXMsIEkgYW0gZGVmaW5p
dGVseQ0KPiBpbnRlcmVzdGVkIHRvIGhlYXINCj4gYWJvdXQgaG93IGl0IGlzIGdvaW5nIHRvIGFm
ZmVjdCBhcm02NCB1c2VycyBhdCB0aGlzIGVhcmx5IHN0YWdlIG9mDQo+IHJlbGVhc2UuIA0KDQpU
aGUgcmVsZWFzZSBoYXMgYmVlbiBtYWRlIGFuZCBJIHRoaW5rIHRoZSBicmFuY2ggaXMgYXNzdW1l
ZCB0byBiZQ0Kc3RhYmxlIGZyb20gdGhlIHRpbWUgaXQgd2FzIHJlbGVhc2VkIGFuZCBwb2xpY3kg
c2hvdWxkIGJlIGFwcGxpZWQ/DQpUaGVyZSdzIG5vIGVhcmx5IHJlbGVhc2Ugc3RhZ2UgZGVmaW5l
ZCB3aGVyZS1pbiBzdWNoIGNoYW5nZXMgd291bGQgYmUNCmFjY2VwdGFibGUuDQoNClRoYW5rcywN
Cg0KQW51ag0K
