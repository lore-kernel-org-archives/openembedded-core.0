Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.1489.1612932429189528409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 20:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: x6Jk6I6ByrGmU7NVett20wXYEvsmfaXc/r2H2ll7L5hNya2RLm56s0LLyEQy0I6CK2LUhx4Tr5
 4m15xpz+Hstg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="169691477"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; 
   d="scan'208";a="169691477"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 20:47:06 -0800
IronPort-SDR: 7VygnSR20LbcPQ6dp/5zqqkWIc1poimUB5jy1qR5YMa3EDzXTAiSj0ElDm/tZmv06HlRRrBUOF
 xeC+Y9dMeRAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; 
   d="scan'208";a="488480748"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2021 20:47:05 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Feb 2021 12:47:04 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.002;
 Wed, 10 Feb 2021 12:47:04 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] security_flags.inc: Use -O with -D_FORTIFY_SOURCE
Thread-Topic: [OE-core] [PATCH] security_flags.inc: Use -O with
 -D_FORTIFY_SOURCE
Thread-Index: AQHW/FHIdXSsKla2rUCY/CXjQrhfD6pQUM4A
Date: Wed, 10 Feb 2021 04:47:04 +0000
Message-ID: <3b2c317d565d09bda89eacb05002ef1f0d816c6c.camel@intel.com>
References: <20210206063138.1649019-1-raj.khem@gmail.com>
In-Reply-To: <20210206063138.1649019-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <02B0495592B69645A57ECFCD34372D92@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTAyLTA1IGF0IDIyOjMxIC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gY29t
cGlsZXIgY2FuIG9ubHkgdXNlIGZvcnRpZnkgb3B0aW9ucyB3aGVuIHNvbWUgbGV2ZWwgb2Ygb3B0
aW1pemF0aW9uDQo+IGlzDQo+IG9uLCBvdGhlcndpc2UgaXQgZW5kcyB1cCBzZW5kaW5nIHNvbWUg
d2FybmluZ3MuDQo+IA0KPiB3YXJuaW5nOiBfRk9SVElGWV9TT1VSQ0UgcmVxdWlyZXMgY29tcGls
aW5nIHdpdGggb3B0aW1pemF0aW9uICgtTykgWy0NCj4gVyN3YXJuaW5nc10NCj4gDQo+IHRoaXMg
aXMgdXN1YWxseSBPSywgc2luY2UgLU88bGV2ZWw+IHdvdWxkIGJlIGFkZGVkIHZpYSBDRkxBR1Mg
dG8NCj4gY29tcGlsZXIgY21kbGluZSBpbiBub3JtYWwgY29tcGlsZSBzdGFnZXMsIGhvd2V2ZXIg
ZHVyaW5nIGNvbmZpZ3VyZQ0KPiB0aGVyZSBhcmUgcHJvYmxlbXMgd2hlbiBDQyxDUFAsQ1hYIGFy
ZSBwcm9iZWQgYWxvbmUgaW4gY29uZmlndXJlDQo+IHRlc3RzDQo+IHdoaWNoIHJlc3VsdHMgaW4g
YWJvdmUgd2FybmluZywgd2hpY2ggY29uZnVzZXMgdGhlIGNvbmZpZ3VyZSByZXN1bHRzDQo+IGFu
ZA0KPiBhdXRvdG9vbHMgMi43MCsgZGV0ZWN0cyBpdCBhcyBlcnJvciBlLmcuDQo+IA0KPiBjb25m
aWd1cmU6MTcyOTI6IGVycm9yOiBDIHByZXByb2Nlc3NvciAicmlzY3YzMi15b2UtbGludXgtY2xh
bmcgLQ0KPiB0YXJnZXQgcmlzY3YzMi15b2UtbGludXjCoMKgwqDCoMKgIC1tbGl0dGxlLWVuZGlh
biAtbW5vLXJlbGF4IC1RdW51c2VkLQ0KPiBhcmd1bWVudHMgLWZzdGFjay1wcm90ZWN0b3Itc3Ry
b25nwqAgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtDQo+IFdmb3JtYXQtc2VjdXJpdHkg
LVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS0NCj4gc3lzcm9vdD0vbW50L2IveW9lL21hc3Rlci9i
dWlsZC90bXAvd29yay9yaXNjdjMyLXlvZS1saW51eC9uZHBpLzMuNC0NCj4gcjAvcmVjaXBlLXN5
c3Jvb3QgLUUiIGZhaWxzIHNhbml0eSBjaGVjaw0KPiBTZWUgYGNvbmZpZy5sb2cnIGZvciBtb3Jl
IGRldGFpbHMNCj4gDQo+IHRoZXJlZm9yZSBhZGRpbmcgYSAtTyAoIHdoaWNoIGFjdHVhbGx5IGlz
IC1PMSApIHRvIGxjbF9tYXliZV9mb3J0aWZ5DQo+IG1lYW5zIHdlIGNhbiBwcm9wZXJseSB0ZXN0
IHRoZXNlIGNvbmZpZ3VyZSB0ZXN0cyBhbmQgcmVhbCAtTzxsZXZlbD4NCj4gd2lsbA0KPiBzdGls
bCBvdmVycmlkZSAtTyBhZGRlZCBoZXJlLCBzbyBvdmVycmFsbCBiZWhhdmlvciBpbXByb3Zlcw0K
DQpnY2MgbWFuIHBhZ2Ugc2F5cyB0aGF0IHRoZSBsYXN0IHNwZWNpZmllZCBPIG9wdGlvbiB3aWxs
IHRha2UgZWZmZWN0Lg0KDQpJbiBjYXNlIG9mIG5jdXJzZXMgZm9yIGV4YW1wbGUgdXNpbmcgcG9r
eToNCg0KeDg2XzY0LXBva3ktbGludXgtZ2NjIC1tNjQgLW1hcmNoPXNreWxha2UgLW10dW5lPWdl
bmVyaWMgLW1hdngyIC0NCm1mcG1hdGg9c3NlIC0tc3lzcm9vdD0vaG9tZS9hbm1pdHRhMi93b3Jr
L3Bva3kvYnVpbGQvdG1wL3dvcmsvc2t5bGFrZS0NCjY0LXBva3ktbGludXgvbmN1cnNlcy82LjIt
cjAvcmVjaXBlLXN5c3Jvb3QgLURIQVZFX0NPTkZJR19IIC0NCkkuLi9uY3Vyc2VzIC1JLiAtSS4u
Ly4uLy4uL2dpdC9uY3Vyc2VzIC1JLi4vaW5jbHVkZSAtDQpJLi4vLi4vLi4vZ2l0L25jdXJzZXMv
Li4vaW5jbHVkZSAtRF9GT1JUSUZZX1NPVVJDRT0yIC1EX0RFRkFVTFRfU09VUkNFDQotRF9YT1BF
Tl9TT1VSQ0U9NjAwIC1ETkRFQlVHIC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVi
dWctDQp0eXBlcyAtZm1hY3JvLXByZWZpeC0NCm1hcD0vaG9tZS9hbm1pdHRhMi93b3JrL3Bva3kv
YnVpbGQvdG1wL3dvcmsvc2t5bGFrZS02NC1wb2t5LQ0KbGludXgvbmN1cnNlcy82LjItcjA9L3Vz
ci9zcmMvZGVidWcvbmN1cnNlcy82LjItcjAgICAgICAgICAgICAgICAgICAgIA0KLWZkZWJ1Zy1w
cmVmaXgtbWFwPS9ob21lL2FubWl0dGEyL3dvcmsvcG9reS9idWlsZC90bXAvd29yay9za3lsYWtl
LTY0LQ0KcG9reS1saW51eC9uY3Vyc2VzLzYuMi1yMD0vdXNyL3NyYy9kZWJ1Zy9uY3Vyc2VzLzYu
Mi1yMCAgICAgICAgICAgICAgIA0KLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2FubWl0dGEyL3dv
cmsvcG9reS9idWlsZC90bXAvd29yay9za3lsYWtlLTY0LQ0KcG9reS1saW51eC9uY3Vyc2VzLzYu
Mi1yMC9yZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy0NCnByZWZp
eC1tYXA9L2hvbWUvYW5taXR0YTIvd29yay9wb2t5L2J1aWxkL3RtcC93b3JrL3NreWxha2UtNjQt
cG9reS0NCmxpbnV4L25jdXJzZXMvNi4yLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0gIC1mc3Rh
Y2stcHJvdGVjdG9yLXN0cm9uZyAtDQpPIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJy
b3I9Zm9ybWF0LXNlY3VyaXR5IC0tcGFyYW0gbWF4LQ0KaW5saW5lLWluc25zLXNpbmdsZT0xMjAw
IC1mUElDIC1EVVNFX1RFUk1MSUIgLWMNCi4uLy4uLy4uL2dpdC9uY3Vyc2VzL3RpbmZvL2RvYWxs
b2MuYyAtbyAuLi9vYmpfcy9kb2FsbG9jLm8NCg0KSSBzZWUgLU8gYWZ0ZXIgLU8yIHNvIGlzIE8y
IHJlYWxseSB0YWtpbmcgZWZmZWN0PyANCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IC0tLQ0KPiDCoG1ldGEv
Y29uZi9kaXN0cm8vaW5jbHVkZS9zZWN1cml0eV9mbGFncy5pbmMgfCAyICstDQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3NlY3VyaXR5X2ZsYWdzLmluYw0KPiBiL21ldGEv
Y29uZi9kaXN0cm8vaW5jbHVkZS9zZWN1cml0eV9mbGFncy5pbmMNCj4gaW5kZXggNGU2NGViOTlm
OS4uMDUyNTNiMmRmOSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3Nl
Y3VyaXR5X2ZsYWdzLmluYw0KPiArKysgYi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvc2VjdXJp
dHlfZmxhZ3MuaW5jDQo+IEBAIC0xMCw3ICsxMCw3IEBAIEdDQ1BJRSA/PSAiLS1lbmFibGUtZGVm
YXVsdC1waWUiDQo+IMKgDQo+IMKgIyBfRk9SVElGWV9TT1VSQ0UgcmVxdWlyZXMgLU8xIG9yIGhp
Z2hlciwgc28gZGlzYWJsZSBpbiBkZWJ1ZyBidWlsZHMNCj4gYXMgdGhleSB1c2UNCj4gwqAjIC1P
MCB3aGljaCB0aGVuIHJlc3VsdHMgaW4gYSBjb21waWxlciB3YXJuaW5nLg0KPiAtbGNsX21heWJl
X2ZvcnRpZnkgPz0NCj4gIiR7QG9lLnV0aWxzLmNvbmRpdGlvbmFsKCdERUJVR19CVUlMRCcsJzEn
LCcnLCctDQo+IERfRk9SVElGWV9TT1VSQ0U9MicsZCl9Ig0KPiArbGNsX21heWJlX2ZvcnRpZnkg
Pz0NCj4gIiR7QG9lLnV0aWxzLmNvbmRpdGlvbmFsKCdERUJVR19CVUlMRCcsJzEnLCcnLCctTyAt
DQo+IERfRk9SVElGWV9TT1VSQ0U9MicsZCl9Ig0KPiDCoA0KPiDCoCMgRXJyb3Igb24gdXNlIG9m
IGZvcm1hdCBzdHJpbmdzIHRoYXQgcmVwcmVzZW50IHBvc3NpYmxlIHNlY3VyaXR5DQo+IHByb2Js
ZW1zDQo+IMKgU0VDVVJJVFlfU1RSSU5HRk9STUFUID89ICItV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1
cml0eSAtV2Vycm9yPWZvcm1hdC0NCj4gc2VjdXJpdHkiDQo+IA0KPiANCj4gDQoNCg==
