Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.5243.1614666717132496698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 22:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HmnUqzHlsqHhlyOVJjPfnLgyIicK61aamxgs6SQnKY21sKtKh4h9HhQ3NeL+BrN4+Ke+ZjmZpc
 CN9QDdw/d4JA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184270141"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="184270141"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 22:31:55 -0800
IronPort-SDR: hKbVAhcGw+CTeGs3wdPVH4f1ykUR48Odal78UVGMXL9DDVVQZtZZRqA0Be5vJaagebZZPBY2kp
 WkzlGX/Y46AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="427373356"
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2021 22:31:55 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx601.gar.corp.intel.com (10.108.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Mar 2021 14:31:54 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.002;
 Tue, 2 Mar 2021 14:31:54 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "flowergom@gmail.com"
	<flowergom@gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH] bind: fix CVE-2020-8625
Thread-Topic: [OE-core] [gatesgarth][PATCH] bind: fix CVE-2020-8625
Thread-Index: AQHXDux+sJ4+yqmnVkuHCruCD0gAzKpvt4KA
Date: Tue, 2 Mar 2021 06:31:54 +0000
Message-ID: <8eed7a010b9d0152de961699a59860a92459a8f6.camel@intel.com>
References: <20210301224342.2898-1-flowergom@gmail.com>
In-Reply-To: <20210301224342.2898-1-flowergom@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E69F4BC3C2591488CE105CBDFF61615@intel.com>
Content-Transfer-Encoding: base64

SGVsbG8NCg0KT24gVHVlLCAyMDIxLTAzLTAyIGF0IDA3OjQzICswOTAwLCBNaW5qYWUgS2ltIHdy
b3RlOg0KPiBCSU5EIE9wZXJhdGlvbmFsIE5vdGlmaWNhdGlvbjogWm9uZSBqb3VybmFsICguam5s
KSBmaWxlIGluY29tcGF0aWJpbGl0eQ0KPiANCj4gVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydGlu
ZyBbDQo+IGh0dHBzOi8vZG93bmxvYWRzLmlzYy5vcmcvaXNjL2JpbmQ5LzkuMTYuMTIvcGF0Y2hl
cy9DVkUtMjAyMC04NjI1LnBhdGNoDQo+IF0NCj4gQ1ZFOiBDVkUtMjAyMC04NjI1DQoNClRoaXMg
ZmFpbGVkIHdoaWxlIGFwcGx5aW5nOg0KDQpFUlJPUjogYmluZC05LjE2LjctcjAgZG9fcGF0Y2g6
IENvbW1hbmQgRXJyb3I6ICdxdWlsdCAtLXF1aWx0cmMNCi9ob21lL3Bva3lidWlsZC95b2N0by13
b3JrZXIvbXVzbC1xZW11eDg2LQ0KNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC1tdXNsL2JpbmQvOS4xNi43LXIwL3JlY2lwZS0NCnN5c3Jvb3QtbmF0aXZlL2V0Yy9x
dWlsdHJjIHB1c2gnIGV4aXRlZCB3aXRoIDAgIE91dHB1dDoNCnN0ZG91dDogQXBwbHlpbmcgcGF0
Y2ggQ1ZFLTIwMjAtODYyNS5wYXRjaA0KcGF0Y2hpbmcgZmlsZSBsaWIvZG5zL3NwbmVnby5jDQpI
dW5rICMxIEZBSUxFRCBhdCA4NDguDQoxIG91dCBvZiAxIGh1bmsgRkFJTEVEIC0tIHJlamVjdHMg
aW4gZmlsZSBsaWIvZG5zL3NwbmVnby5jDQpQYXRjaCBDVkUtMjAyMC04NjI1LnBhdGNoIGRvZXMg
bm90IGFwcGx5IChlbmZvcmNlIHdpdGggLWYpDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IFNpZ25l
ZC1vZmYtYnk6IE1pbmphZSBLaW0gPGZsb3dlcmdvbUBnbWFpbC5jb20+DQo+IC0tLQ0KPiDCoC4u
Li9iaW5kL2JpbmQtOS4xNi43L0NWRS0yMDIwLTg2MjUucGF0Y2jCoMKgwqDCoMKgwqDCoCB8IDE3
ICsrKysrKysrKysrKysrKysrDQo+IMKgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmRfOS4xNi43LmJiwqDCoCB8wqAgMSArDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLTkuMTYuNy9DVkUtDQo+IDIwMjAtODYyNS5wYXRjaA0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTYuNy9DVkUtMjAyMC0N
Cj4gODYyNS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLTkuMTYu
Ny9DVkUtMjAyMC0NCj4gODYyNS5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwMDAwLi5iMGI1MWU3MDMwDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQtOS4xNi43L0NWRS0yMDIwLTg2MjUucGF0Y2gN
Cj4gQEAgLTAsMCArMSwxNyBAQA0KPiArVXBzdHJlYW0tU3RhdHVzOiBBY2VwdGVkIFsNCj4gaHR0
cHM6Ly9kb3dubG9hZHMuaXNjLm9yZy9pc2MvYmluZDkvOS4xNi4xMi9wYXRjaGVzL0NWRS0yMDIw
LTg2MjUucGF0Y2gNCj4gXQ0KPiArQ1ZFOiBDVkUtMjAyMC04NjI1DQo+ICtTaWduZWQtb2ZmLWJ5
OiBNaW5qYWUgS2ltIDxmbG93ZXJnb21AZ21haWwuY29tPg0KPiArDQo+ICtkaWZmIC0tZ2l0IGEv
bGliL2Rucy9zcG5lZ28uYyBiL2xpYi9kbnMvc3BuZWdvLmMNCj4gK2luZGV4IGU2MWQxYzYwMGYy
Li43NTNkYzgwNDlmYSAxMDA2NDQNCj4gKy0tLSBhL2xpYi9kbnMvc3BuZWdvLmMNCj4gKysrKyBi
L2xpYi9kbnMvc3BuZWdvLmMNCj4gK0BAIC04NDgsNyArODQ4LDcgQEAgZGVyX2dldF9vaWQoY29u
c3QgdW5zaWduZWQgY2hhciAqcCwgc2l6ZV90IGxlbiwNCj4gb2lkICpkYXRhLCBzaXplX3QgKnNp
emUpIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChBU04xX09WRVJS
VU4pOw0KPiArwqDCoMKgwqDCoMKgIH0NCj4gKw0KPiArLcKgwqDCoMKgwqAgZGF0YS0+Y29tcG9u
ZW50cyA9IG1hbGxvYyhsZW4gKiBzaXplb2YoKmRhdGEtPmNvbXBvbmVudHMpKTsNCj4gKyvCoMKg
wqDCoMKgIGRhdGEtPmNvbXBvbmVudHMgPSBtYWxsb2MoKGxlbiArIDEpICogc2l6ZW9mKCpkYXRh
LQ0KPiA+Y29tcG9uZW50cykpOw0KPiArwqDCoMKgwqDCoMKgIGlmIChkYXRhLT5jb21wb25lbnRz
ID09IE5VTEwpIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChFTk9N
RU0pOw0KPiArwqDCoMKgwqDCoMKgIH0NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmluZC9iaW5kXzkuMTYuNy5iYg0KPiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmluZC9iaW5kXzkuMTYuNy5iYg0KPiBpbmRleCA1ZmMyYzFkM2NkLi44MmMxYmI2NmRmIDEw
MDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE2Ljcu
YmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xNi43LmJi
DQo+IEBAIC0xNyw2ICsxNyw3IEBAIFNSQ19VUkkgPSAiDQo+IGh0dHBzOi8vZnRwLmlzYy5vcmcv
aXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHrCoFwNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCANCj4gZmlsZTovL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJz
LXNlYXJjaGVzLXN5c3IucGF0Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCANCj4gZmls
ZTovLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMu
cGF0Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vMDAwMS1hdm9pZC1zdGFy
dC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNowqBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmaWxlOi8vQ1ZFLTIwMjAtODYyNS5wYXRjaMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICINCj4gwqANCj4gwqBTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiOWY3ZDE4MTJlYmJkMjZhNjk5
ZjYyYjZmYTg1MjJkNWRlYzU3ZTRiZjQzYWYwMDQyYTBkNjBkMzllZDgzMTRkMSINCj4gDQo+IA0K
PiANCg0K
