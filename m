Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.5517.1617951118560474339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 23:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: doo8j3fK5jnQJnKzZxA8xRE8ogWewdn94XqZOpPM7m/xn92hl4TUrUHg7e3iIPsq5Ge4lIZ8wA
 xoeDvvsxczcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="180832541"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="180832541"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 23:51:56 -0700
IronPort-SDR: 2ze1GTDqwj1/2hqAd36/G6dKWbZbHTuXXrlQr7jwFg99jyJP1LL9cTBUAitdkp1LaKA/ZXqz3F
 DSsUZe/Z7kbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="442047165"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
  by fmsmga004.fm.intel.com with ESMTP; 08 Apr 2021 23:51:55 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 9 Apr 2021 14:51:54 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Fri, 9 Apr 2021 14:51:54 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "saloni.jain@kpit.com"
	<saloni.jain@kpit.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "nisha.parrakat@kpit.com" <nisha.parrakat@kpit.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] fuse: Whitelisted CVE-2019-14860
Thread-Topic: [OE-core] [meta-oe][dunfell][PATCH] fuse: Whitelisted
 CVE-2019-14860
Thread-Index: AQHXLQqVIxntdDBvl0CPo0hAJ5kyyaqrOXSA
Date: Fri, 9 Apr 2021 06:51:54 +0000
Message-ID: <cebbde52208c872da797b2dea6574d7f8589d388.camel@intel.com>
References: <20210409063450.10269-1-Saloni.Jain@kpit.com>
In-Reply-To: <20210409063450.10269-1-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B62A5CC8835CF459DC9A0F473911775@intel.com>
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBzaG91bGQgZ28gdG8gb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcuDQoNCkkgdGhpbmsgdGhlIGNvcnJlY3Qgc29sdXRpb24gaGVyZSB3b3VsZCBiZSB0
byBhZGQgQ1ZFX1BST0RVQ1QgPQ0KImZ1c2VfcHJvamVjdDpmdXNlIiBpbiB0aGUgcmVjaXBlIHRv
IGRpZmZlcmVudGlhdGUgaXQgZnJvbQ0KInJlZGhhdDpmdXNlIi4NCg0KVGhhbmtzLA0KDQpBbnVq
DQoNCk9uIEZyaSwgMjAyMS0wNC0wOSBhdCAxMjowNCArMDUzMCwgc2Fsb25pIHdyb3RlOg0KPiBD
VkUtMjAxOS0xNDg2MCBpcyBhIFJFREhBVCBzcGVjaWZpYyBpc3N1ZSBhbmQNCj4gd2FzIGFkZHJl
c3NlZCBmb3IgUkVESEFUIEZ1c2UgcHJvZHVjdHMgb24NCj4gUmVkIEhhdCBGdXNlIDcuNC4xIGFu
ZCBSZWQgSGF0IEZ1c2UgNy41LjAuDQo+IFJFREhBVCBoYXMgYWxzbyByZWxlYXNlZCB0aGUgZml4
IGFuZCB1cGRhdGVkIHRoZWlyDQo+IHNlY3VyaXR5IGFkdmlzb3JpZXMgYWZ0ZXIgc2lnbmlmaWNh
bnQgcmVsZWFzZXMuDQo+IEhlbmNlLCB3aGl0ZWxpdGVkIHRoZSBDVkUtMjAxOS0xNDg2MC4NCj4g
DQo+IExpbms6IGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vc2VjdXJpdHkvY3ZlL2N2ZS0yMDE5
LTE0ODYwDQo+IExpbms6IGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vZXJyYXRhL1JIU0EtMjAx
OTozMjQ0DQo+IExpbms6IGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vZXJyYXRhL1JIU0EtMjAx
OTozODkyDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYWxvbmkgSmFpbiA8U2Fsb25pLkphaW5Aa3Bp
dC5jb20+DQo+IC0tLQ0KPiDCoG1ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1zdXBwb3J0L2Z1c2Uv
ZnVzZV8yLjkuOS5iYiB8IDQgKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtc3VwcG9ydC9m
dXNlL2Z1c2VfMi45LjkuYmINCj4gYi9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtc3VwcG9ydC9m
dXNlL2Z1c2VfMi45LjkuYmINCj4gaW5kZXggMmMyNzJkNDUyLi42MDEyMzJjNmIgMTAwNjQ0DQo+
IC0tLSBhL21ldGEtZmlsZXN5c3RlbXMvcmVjaXBlcy1zdXBwb3J0L2Z1c2UvZnVzZV8yLjkuOS5i
Yg0KPiArKysgYi9tZXRhLWZpbGVzeXN0ZW1zL3JlY2lwZXMtc3VwcG9ydC9mdXNlL2Z1c2VfMi45
LjkuYmINCj4gQEAgLTE5LDYgKzE5LDEwIEBAIFNSQ19VUkkgPQ0KPiAiaHR0cHM6Ly9naXRodWIu
Y29tL2xpYmZ1c2UvbGliZnVzZS9yZWxlYXNlcy9kb3dubG9hZC8ke0JQfS8ke0JQfS50YXINCj4g
Lg0KPiDCoFNSQ19VUklbbWQ1c3VtXSA9ICI4MDAwNDEwYWFkYzkyMzFmZDQ4NDk1Zjc2NDJmMzMx
MiINCj4gwqBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZDBlNjlkNWQ2MDhjYzIyZmY0ODQzNzkx
YWQwOTdmNTU0ZGQzMjU0MGRkYzliZWQ3NjM4Y2M2ZmVhN2MxYjRiNSINCj4gDQo+ICsjIENWRS0y
MDE5LTE0ODYwIGlzIGEgUkVESEFUIHNwZWNpZmljIGlzc3VlIGFuZCB3YXMgYWRkcmVzc2VkIGZv
cg0KPiBSRURIQVQgRnVzZSBwcm9kdWN0cyBvbiBSZWQgSGF0IEZ1c2UgNy40LjEgYW5kIFJlZCBI
YXQgRnVzZSA3LjUuMC4NCj4gKyMgUkVESEFUIGhhcyBhbHNvIHJlbGVhc2VkIHRoZSBmaXggYW5k
IHVwZGF0ZWQgdGhlaXIgc2VjdXJpdHkNCj4gYWR2aXNvcmllcyBhZnRlciBzaWduaWZpY2FudCBy
ZWxlYXNlcy4NCj4gK0NWRV9DSEVDS19XSElURUxJU1QgKz0gIkNWRS0yMDE5LTE0ODYwIg0KPiAr
DQo+IMKgVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJmdXNlL2xp
YmZ1c2UvcmVsZWFzZXMiDQo+IMKgVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiZnVzZVwtKD9QPHB2
ZXI+MihcLlxkKykrKS50YXIuZ3oiDQo+IA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IFRoaXMgbWVz
c2FnZSBjb250YWlucyBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcml2aWxlZ2VkIG9yDQo+IGNv
bmZpZGVudGlhbCBhbmQgaXMgdGhlIHByb3BlcnR5IG9mIHRoZSBLUElUIFRlY2hub2xvZ2llcyBM
dGQuIEl0IGlzDQo+IGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gdG8gd2hvbSBpdCBpcyBh
ZGRyZXNzZWQuIElmIHlvdSBhcmUgbm90DQo+IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBh
cmUgbm90IGF1dGhvcml6ZWQgdG8gcmVhZCwgcHJpbnQsIHJldGFpbg0KPiBjb3B5LCBkaXNzZW1p
bmF0ZSwgZGlzdHJpYnV0ZSwgb3IgdXNlIHRoaXMgbWVzc2FnZSBvciBhbnkgcGFydA0KPiB0aGVy
ZW9mLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlDQo+IHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgdGhpcyBt
ZXNzYWdlLiBLUElUDQo+IFRlY2hub2xvZ2llcyBMdGQuIGRvZXMgbm90IGFjY2VwdCBhbnkgbGlh
YmlsaXR5IGZvciB2aXJ1cyBpbmZlY3RlZA0KPiBtYWlscy4NCj4gDQo+IA0KPiANCg0K
