Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.2046.1605743805719236337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 15:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /e30PFmK88w+S3/quZ1ql17knACcXZYc+FJ2rrI/y3xg97L3mZhZo7Tq9KCT7NZ9icfOsko3Mc
 avFg/MRTYN7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="189288405"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="189288405"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 15:56:41 -0800
IronPort-SDR: PkYxMbgeoKedGGXE3aXOelyF9hylzDrSnZZOGbTE8n/yJ5Oe+6YYuRGqp3VAYMA1ESoE88swEd
 whB6azFG9NKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="357185328"
Received: from kmsmsx601.gar.corp.intel.com ([172.21.219.141])
  by orsmga008.jf.intel.com with ESMTP; 18 Nov 2020 15:56:40 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx601.gar.corp.intel.com (172.21.219.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 07:56:39 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 07:56:39 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core] cups: whitelist CVE-2018-6553
Thread-Topic: [OE-core] cups: whitelist CVE-2018-6553
Thread-Index: AQHWvb8dCUic9V2vQkuxY9Z+liifXqnOC00A
Date: Wed, 18 Nov 2020 23:56:38 +0000
Message-ID: <8df909f90903613c2aa74e2b43dec9d747b5330a.camel@intel.com>
References: <20201118152522.20849-1-steve@sakoman.com>
In-Reply-To: <20201118152522.20849-1-steve@sakoman.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FDCC11E10F1374991633C487DB313FB@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTExLTE4IGF0IDA1OjI1IC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiBUaGlzIGFuIFVidWJ0dSBzcGVjaWZpYyBpc3N1ZToNCj4gDQo+IFRoZSBDVVBTIEFwcEFybW9y
IHByb2ZpbGUgaW5jb3JyZWN0bHkgY29uZmluZWQgdGhlIGRuc3NkIGJhY2tlbmQNCj4gZHVlIHRv
IHVzZSBvZiBoYXJkIGxpbmtzLiBBIGxvY2FsIGF0dGFja2VyIGNvdWxkIHBvc3NpYmx5IHVzZSB0
aGlzDQo+IGlzc3VlIHRvIGVzY2FwZSBjb25maW5lbWVudC4gVGhpcyBmbGF3IGFmZmVjdHMgdmVy
c2lvbnMgcHJpb3IgdG8NCj4gMi4yLjctMXVidW50dTIuMSBpbiBVYnVudHUgMTguMDQgTFRTLCBw
cmlvciB0byAyLjIuNC03dWJ1bnR1My4xDQo+IGluIFVidW50dSAxNy4xMCwgcHJpb3IgdG8gMi4x
LjMtNHVidW50dTAuNSBpbiBVYnVudHUgMTYuMDQgTFRTLA0KPiDCoGFuZCBwcmlvciB0byAxLjcu
Mi0wdWJ1bnR1MS4xMCBpbiBVYnVudHUgMTQuMDQgTFRTDQoNCkl0IGRvZXNuJ3QgYWZmZWN0IHRo
ZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gYnV0IHNvbWVvbmUgaW4gdGhlb3J5IGNvdWxkDQpoYXZl
IGV4dGVuZGVkIHRoZSByZWNpcGUgdG8gaGF2ZSBBcHBBcm1vciBzdXBwb3J0IGFuZCB0aGVuIGl0
IG1pZ2h0IGJlDQp2dWxuZXJhYmxlPw0KDQpTaW5jZSB0aGlzIENWRSBpcyBzb3J0IG9mIGRpc3Ry
byBzcGVjaWZpYyBhbmQgbm90IHBhY2thZ2Ugc3BlY2lmaWMsDQpzaG91bGQgdGhpcyBiZSBwYXJ0
IG9mIHJlY2lwZSBvciB0aGUgcG9reSBkaXN0cm8gbWV0YSBkYXRhPw0KDQpUaGFua3MsDQoNCkFu
dWoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5j
b20+DQo+IC0tLQ0KPiDCoG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMuaW5jIHwgMyAr
KysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+
IGV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMNCj4gaW5kZXggODc4NzBlNGFiYS4uZGY4ZDRkMjg0YSAx
MDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMNCj4gKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmMNCj4gQEAgLTIwLDYgKzIwLDkg
QEAgU1JDX1VSSSA9ICINCj4gaHR0cHM6Ly9naXRodWIuY29tL2FwcGxlL2N1cHMvcmVsZWFzZXMv
ZG93bmxvYWQvdiR7UFZ9LyR7QlB9LXNvdXJjZS50DQo+IMKgVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9hcHBsZS9jdXBzL3JlbGVhc2VzIg0KPiDCoFVQU1RSRUFNX0NI
RUNLX1JFR0VYID0gImN1cHMtKD9QPHB2ZXI+XGQrXC5cZCsoXC5cZCspPyktc291cmNlLnRhciIN
Cj4gwqANCj4gKyMgVGhpcyBpcyBhbiBVYnVudHUgb25seSBpc3N1ZS4NCj4gK0NWRV9DSEVDS19X
SElURUxJU1QgKz0gIkNWRS0yMDE4LTY1NTMiDQo+ICsNCj4gwqBMRUFEX1NPTkFNRSA9ICJsaWJj
dXBzZHJpdmVyLnNvIg0KPiDCoA0KPiDCoENMRUFOQlJPS0VOID0gIjEiDQo+IA0KPiANCj4gDQoN
Cg==
