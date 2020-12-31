Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.17168.1609389800147658299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 20:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: WXU5hDzt5iEbwIy5emd6XrFksZn3rmK1InETevLWr2P3W953fh8tGGb1akQ6u3nG02MjFlCCUM
 6X/tvpXg674w==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="240751256"
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="240751256"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 20:43:18 -0800
IronPort-SDR: AXMPKLBEyg35pOJw5T4cP6glIhmej1rMQrqss/Yok19ykHozouBs5v3HjI+AOyVQLst9xLqw9o
 pY1z8Qjf5b+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="419755961"
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136])
  by orsmga001.jf.intel.com with ESMTP; 30 Dec 2020 20:43:17 -0800
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 pgsmsx601.gar.corp.intel.com (10.108.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 31 Dec 2020 12:43:16 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.1713.004;
 Thu, 31 Dec 2020 12:43:16 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Randy Li <ayaka@soulik.info>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 0/2] meson: fixup nativesdk sysroot
Thread-Topic: [OE-core] [PATCH v2 0/2] meson: fixup nativesdk sysroot
Thread-Index: AQHW3ZaO1sRcaUKt6UmloR9cw7eseKoPKE8AgADD0ACAALcSQA==
Date: Thu, 31 Dec 2020 04:43:16 +0000
Message-ID: <390f5f92da9944a08fea5c65b5e04a10@intel.com>
References: <20201229035550.226617-1-ayaka@soulik.info>
 <0caca27102d49a9897438734f3f0d955ecf17656.camel@linuxfoundation.org>
 <E4DB717E-1AD6-4B7D-8A6B-91217F3C5769@soulik.info>
In-Reply-To: <E4DB717E-1AD6-4B7D-8A6B-91217F3C5769@soulik.info>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBmYWlsaW5nIGluIGNhc2Ugb2Ygbm9uLW5hdGl2ZSBzZGsgdG9vLCB3aGVyZSBQS0dfQ09O
RklHX1NZU1JPT1RfRElSIGlzIGFsc28gZXhwb3J0ZWQuIEl0IGRvZXMgbm90IHByZXBlbmQgUEtH
X0NPTkZJR19TWVNST09UX0RJUiBwYXRoLiANCg0KSSB0aGluayBpdCBzaG91bGQgYmUgZml4ZWQg
bWFudWFsbHkgYnkgcHJlcGVuZGluZyBzeXNyb290IHBhdGguIA0KDQorICBwa2djb25mX3N5c3Jv
b3QgPSBydW5fY29tbWFuZChweXRob24zLCAnLWMnLCAnaW1wb3J0IG9zOyBwcmludChvcy5lbnZp
cm9uLmdldCgiUEtHX0NPTkZJR19TWVNST09UX0RJUiIpKScpLnN0ZG91dCgpLnN0cmlwKCkNCiAg
IG1meF9pbmNkaXIgPSBtZnhfZGVwLmdldF9wa2djb25maWdfdmFyaWFibGUoJ2luY2x1ZGVkaXIn
KQ0KKyAgbWZ4X2luY2RpciA9IHBrZ2NvbmZfc3lzcm9vdCArICBtZnhfaW5jZGlyDQoNClJlZjog
aHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3kvdHJlZS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAw
MDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5w
YXRjaCNuMjYNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUmFuZHkgTGkNCj4gU2VudDog
VGh1cnNkYXksIERlY2VtYmVyIDMxLCAyMDIwIDk6NDYgQU0NCj4gVG86IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBDYzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCB2MiAwLzJdIG1lc29uOiBmaXh1cCBuYXRpdmVzZGsgc3lzcm9vdA0KPiANCj4gDQo+ID4g
T24gRGVjIDMwLCAyMDIwLCBhdCAxMDowNSBQTSwgUmljaGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+DQo+ID4+IE9uIFR1ZSwgMjAy
MC0xMi0yOSBhdCAxMTo1NSArMDgwMCwgUmFuZHkgTGkgd3JvdGU6DQo+ID4+IEkgc3RpbGwgc2F3
IHRoZSByZXF1ZXN0IGZvciB0aGlzIHBhdGNoIGZyb20gR3N0cmVhbWVyIHVzZXJzDQo+ID4+IHNv
bWV0aW1lcy4gSSBoYXZlIHZlcmlmaWVkIHRoaXMgdmVyc2lvbiB3b3VsZCB3b3JrIGZpbmUuDQo+
ID4+DQo+ID4+IE9ubHkgdGhlIGV4cG9ydGVkIFNESyB3b3VsZCBuZWVkIHRoaXMgcGF0Y2guDQo+
ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaGVzLCBpcyB0aGVyZSBzb21ldGhpbmcgd2Ugc2hv
dWxkIGFkZCB0byB0aGUNCj4gPiBhdXRvbWF0ZWQgdGVzdHMgKGUuZy4gaW4gbWV0YS9saWIvb2Vx
YS9zZGsvY2FzZXMpIHRvIHRlc3QgdGhpcz8NCj4gPg0KPiBUaGUgb3JpZ2luYWwgY2FzZSBpcyB0
aGF0IHdoZW4gSSB3YXMgY29tcGlsaW5nIHRoZSBHc3RyZWFtZXIgcGx1Z2lucyBiYWQgZm9yDQo+
IEludGVsIE1lZGlhIFNESywgdGhlIGluY2x1ZGUgcGF0aCBmcm9tIHRoZSBwa2ctY29uZmlnIHdv
dWxkIGJlIG9uZSB3aXRob3V0DQo+IHN5c3Jvb3QuIE1vc3Qgb2YgcGFja2FnZXMgd29u4oCZdCBt
ZWV0IHN1Y2ggcHJvYmxlbSwgdGhleSBjYW4ganVzdCBvcmRpbmFyeQ0KPiBpbmNsdWRlZGlyLCB3
aGljaCBpcyBub3QgZnJvbSBtZXNvbiBidXQgY29tcGlsZXIgSSB0aGluaywgdGhlbiBwcmVwZW5k
IGENCj4gcGFja2FnZSBuYW1lIHdoZW4gaXRzIGNvZGUgaW5jbHVkZSB0aGVtcy4NCj4gDQo+IEkg
dGhpbmsgdGhpcyBjYXNlIG9ubHkgZml4IHRob3NlIHBhY2thZ2UgdXNpbmcgbWVzb24gYW5kIG5l
ZWQgdG8gZ2V0DQo+IHNvbWV0aGluZyBsaWtlcyBwYXRoIGluZm9ybWF0aW9uIGZyb20gdGhlIHBr
Zy1jb25maWcuDQo+IA0KPiBJIGhhdmUgbm90IHJlYWQgdGhlIFFBIHBhcnQsIHNvIEkgZG9u4oCZ
dCBrbm93IHdoYXQgaXMgbmVjZXNzYXJ5IGZvciBzdWNoIGNhc2UuDQo+IE1heWJlIGEgY2hlY2sg
Zm9yIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMgZnJvbSBhbGwgdGhvc2UgYXV0byBidWlsZCB0
b29scyA/DQo+IEkgbmVlZCB0byByZWFkIGFuZCBtYWtlIHRoZSByaWdodCBjb21tZW50IGFzIHdl
bGwgYXMgSSB3ZWxjb21lIHRoZSBpZGVhDQo+IGZyb20gdGhlIG90aGVycy4NCj4gPiBDaGVlcnMs
DQo+ID4NCj4gPiBSaWNoYXJkDQo+ID4NCj4gU2luY2VyZWx5DQo+IFJhbmR5DQo=
