Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.12726.1619794281931195165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 07:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hzHJZ7P5eGsNtsuU8wplnJk+GjY9gnaNHa0l8cfPyfgjie/cUVz14qodOEAnKiy+Mm5y/8rqW1
 6OQyWjHWqt0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="177449601"
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; 
   d="scan'208";a="177449601"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2021 07:51:21 -0700
IronPort-SDR: IDJooSg7Ys8DMEYOZYEccMXjvGB+sL1Sqzhvl2w49KR/12W5lTioa0ANy/v6wYFDRS72diNNnX
 5F6KP3jPPm+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; 
   d="scan'208";a="459466824"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2021 07:51:19 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 30 Apr 2021 22:51:18 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Fri, 30 Apr 2021 22:51:18 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "flowergom@gmail.com"
	<flowergom@gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH v2] qemu: fix CVE-2021-3392
Thread-Topic: [OE-core] [gatesgarth][PATCH v2] qemu: fix CVE-2021-3392
Thread-Index: AQHXOz7ckm9jszdTbU2JgfhETbYDYarMo/MA
Date: Fri, 30 Apr 2021 14:51:18 +0000
Message-ID: <bb20da39d53c6975f86fd108a000fc359b1a1c80.camel@intel.com>
References: <20210427082501.1737-1-flowergom@gmail.com>
In-Reply-To: <20210427082501.1737-1-flowergom@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A57EA4AB0C911D49A9244FC52C10BC1E@intel.com>
Content-Transfer-Encoding: base64

SGksDQoNCk9uIFR1ZSwgMjAyMS0wNC0yNyBhdCAxNzoyNSArMDkwMCwgTWluamFlIEtpbSB3cm90
ZToNCj4gc2NzaTogdXNlLWFmdGVyLWZyZWUgaW4gbXB0c2FzX3Byb2Nlc3Nfc2NzaV9pb19yZXF1
ZXN0KCkgb2YNCj4gbXB0c2FzMTA2OCBlbXVsYXRvcg0KDQpJIGhhdmUgdGhlIHNhbWUgY29tbWVu
dCBmb3IgdGhpcyBhcyB3ZWxsLiBUaGlzIHBhdGNoIHNob3VsZCBiZSByZXBsYWNlZA0KYnkgdGhl
IG9uZSBtZXJnZWQgdXBzdHJlYW0uDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IC0tLQ0KPiDCoG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDEgKw0KPiDCoC4uLi9xZW11L3FlbXUvQ1ZFLTIwMjEtMzM5Mi5wYXRjaMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDQ1DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gwqAyIGZpbGVzIGNoYW5n
ZWQsIDQ2IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0NCj4gMzM5Mi5wYXRjaA0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVz
LQ0KPiBkZXZ0b29scy9xZW11L3FlbXUuaW5jDQo+IGluZGV4IDVlOGQzZTA5ZmYuLjc2NDdlNDQ3
MjYgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jDQo+
ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jDQo+IEBAIC01NCw2ICs1
NCw3IEBAIFNSQ19VUkkgPSAiDQo+IGh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7
UFZ9LnRhci54esKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjAtMjQz
NTIucGF0Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL0NWRS0yMDIwLTI1NzIz
LnBhdGNowqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyMS0yMDIwMy5w
YXRjaMKgXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyMS0zMzkyLnBhdGNo
wqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICINCj4gwqBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJxZW11LSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIg0KPiDCoA0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0zMzkyLnBhdGNoDQo+IGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMS0zMzkyLnBhdGNoDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjFjNjg4ODI3ZGINCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0y
MDIxLTMzOTIucGF0Y2gNCj4gQEAgLTAsMCArMSw0NSBAQA0KPiArRnJvbSAzNDMxYjAxYjQzNTg0
ZGU1ZjcxMGM0MDYwNWZlMzI1MWY4MWMwZTExIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0K
PiArRnJvbTogTWluamFlIEtpbSA8Zmxvd2VyZ29tQGdtYWlsLmNvbT4NCj4gK0RhdGU6IFR1ZSwg
MjcgQXByIDIwMjEgMDI6MDk6NDkgKzAwMDANCj4gK1N1YmplY3Q6IFtQQVRDSF0gc2NzaTogbXB0
c2FzOiBkZXF1ZXVlIHJlcXVlc3Qgb2JqZWN0IGluIGNhc2Ugb2YgYW4NCj4gZXJyb3INCj4gKyAo
Q1ZFLTIwMjEtMzM5MikNCj4gKw0KPiArRnJvbTogUHJhc2FkIEogUGFuZGl0IDxwanBAZmVkb3Jh
cHJvamVjdC5vcmc+DQo+ICsNCj4gK1doaWxlIHByb2Nlc3NpbmcgU0NTSSBpL28gcmVxdWVzdHMg
aW4NCj4gbXB0c2FzX3Byb2Nlc3Nfc2NzaV9pb19yZXF1ZXN0KCksDQo+ICt0aGUgTWVnYXJhaWQg
ZW11bGF0b3IgYXBwZW5kcyBuZXcgTVBUU0FTUmVxdWVzdCBvYmplY3QgJ3JlcScgdG8NCj4gK3Ro
ZSAncy0+cGVuZGluZycgcXVldWUuIEluIGNhc2Ugb2YgYW4gZXJyb3IsIHRoaXMgc2FtZSBvYmpl
Y3QgZ2V0cw0KPiArZGVxdWV1ZWQgaW4gbXB0c2FzX2ZyZWVfcmVxdWVzdCgpIG9ubHkgaWYgU0NT
SVJlcXVlc3Qgb2JqZWN0DQo+ICsncmVxLT5zcmVxJyBpcyBpbml0aWFsaXNlZC4gVGhpcyBtYXkg
bGVhZCB0byBhIHVzZS1hZnRlci1mcmVlIGlzc3VlLg0KPiArVW5jb25kaXRpb25hbGx5IGRlcXVl
dWUgJ3JlcScgb2JqZWN0IGZyb20gJ3MtPnBlbmRpbmcnIHRvIGF2b2lkIGl0Lg0KPiArDQo+ICtG
aXhlczogQ1ZFLTIwMjEtMzM5Mg0KPiArQnVnbGluazogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5u
ZXQvcWVtdS8rYnVnLzE5MTQyMzYNCj4gK1JlcG9ydGVkLWJ5OiBDaGVvbHdvbyBNeXVuZyA8Y3dt
eXVuZ0BzbnUuYWMua3I+DQo+ICtTaWduZWQtb2ZmLWJ5OiBQcmFzYWQgSiBQYW5kaXQgPHBqcEBm
ZWRvcmFwcm9qZWN0Lm9yZz4NCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBBY2VwdGVkDQo+ICtb
aHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjEtMDIvbXNn
MDA0ODguaHRtbA0KPiBdDQo+ICtDVkU6IENWRS0yMDIxLTMzOTINCj4gK1NpZ25lZC1vZmYtYnk6
IE1pbmphZSBLaW0gPGZsb3dlcmdvbUBnbWFpbC5jb20+DQo+ICstLS0NCj4gKyBody9zY3NpL21w
dHNhcy5jIHwgMiArLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvaHcvc2NzaS9tcHRzYXMuYyBiL2h3L3Njc2kv
bXB0c2FzLmMNCj4gK2luZGV4IGY4NjYxNjU0NC4uYWRmZjViMGJmIDEwMDY0NA0KPiArLS0tIGEv
aHcvc2NzaS9tcHRzYXMuYw0KPiArKysrIGIvaHcvc2NzaS9tcHRzYXMuYw0KPiArQEAgLTI1Nyw4
ICsyNTcsOCBAQCBzdGF0aWMgdm9pZCBtcHRzYXNfZnJlZV9yZXF1ZXN0KE1QVFNBU1JlcXVlc3QN
Cj4gKnJlcSkNCj4gK8KgwqDCoMKgwqDCoMKgwqAgcmVxLT5zcmVxLT5oYmFfcHJpdmF0ZSA9IE5V
TEw7DQo+ICvCoMKgwqDCoMKgwqDCoMKgIHNjc2lfcmVxX3VucmVmKHJlcS0+c3JlcSk7DQo+ICvC
oMKgwqDCoMKgwqDCoMKgIHJlcS0+c3JlcSA9IE5VTEw7DQo+ICstwqDCoMKgwqDCoMKgwqAgUVRB
SUxRX1JFTU9WRSgmcy0+cGVuZGluZywgcmVxLCBuZXh0KTsNCj4gK8KgwqDCoMKgIH0NCj4gKyvC
oMKgwqAgUVRBSUxRX1JFTU9WRSgmcy0+cGVuZGluZywgcmVxLCBuZXh0KTsNCj4gK8KgwqDCoMKg
IHFlbXVfc2dsaXN0X2Rlc3Ryb3koJnJlcS0+cXNnKTsNCj4gK8KgwqDCoMKgIGdfZnJlZShyZXEp
Ow0KPiArIH0NCj4gKy0tIA0KPiArMi4xNy4xDQo+ICsNCj4gDQo+IA0KPiANCg0K
