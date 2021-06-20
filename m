Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web08.28952.1624154929441130634
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jun 2021 19:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Gwb5GX9d4uDG/UgSXU+DunJu9l7i5n+Sc5p898S1mgfPx7g/weQCqBiRrsNbUAzxYtMrLv30pl
 MJKvXXa3Unng==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="187074253"
X-IronPort-AV: E=Sophos;i="5.83,286,1616482800"; 
   d="scan'208";a="187074253"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2021 19:08:48 -0700
IronPort-SDR: /YPuzGmujBEXQHsNM1bo7DDekkhOhpCUDJOJ2vuvjQkzuVZbhjU9IcGzX84TN/wYfZ1kvfpAXd
 ibfr9kjx6XkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,286,1616482800"; 
   d="scan'208";a="473103875"
Received: from kmsmsx601.gar.corp.intel.com ([172.21.219.141])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jun 2021 19:08:47 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx601.gar.corp.intel.com (172.21.219.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 20 Jun 2021 10:08:46 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2242.008;
 Sun, 20 Jun 2021 10:08:46 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [hardknott][PATCH 00/17] pull request (cover letter only)
Thread-Topic: [OE-core] [hardknott][PATCH 00/17] pull request (cover letter
 only)
Thread-Index: AQHXYbZ6qfR5CB2ptEG/GSc/G1GsaqsbqN0A
Date: Sun, 20 Jun 2021 02:08:46 +0000
Message-ID: <2a1a183149de831d424dab3a22abeb80c9fd39e2.camel@intel.com>
References: <1688B03B5B7CF353.6379@lists.openembedded.org>
In-Reply-To: <1688B03B5B7CF353.6379@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FF11287F891B849996EB8606E4AAB18@intel.com>
Content-Transfer-Encoding: base64

UGluZw0KDQpPbiBUdWUsIDIwMjEtMDYtMTUgYXQgMTU6MTcgKzA4MDAsIEFudWogTWl0dGFsIHdy
b3RlOg0KPiBQbGVhc2UgbWVyZ2UgdGhlc2UgY2hhbmdlcyBpbiBoYXJka25vdHQuDQo+IA0KPiBU
aGFua3MsDQo+IA0KPiBBbnVqDQo+IA0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0DQo+IDZjYTEwNDdlOThhMWM4YmMzMDVhM2Y0MGFkMTkxOWM1MDM4ZTE2OTg6DQo+IA0KPiDC
oCBvZXFhL3J1bnRpbWUvcnBtOiBEcm9wIGxvZyBtZXNzYWdlIGNvdW50aW5nIHRlc3QgY29tcG9u
ZW50ICgyMDIxLQ0KPiAwNi0wMiAxNDoyNjo1OCArMDEwMCkNCj4gDQo+IGFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4gwqAgZ2l0Oi8vcHVzaC5vcGVuZW1iZWRk
ZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLWNvbnRyaWINCj4gc3RhYmxlL2hhcmRrbm90dC1uZXh0
DQo+IA0KPiBCcnVjZSBBc2hmaWVsZCAoMTEpOg0KPiDCoCBsaW51eC15b2N0by81LjEwOiB1cGRh
dGUgdG8gdjUuMTAuMzUNCj4gwqAgbGludXgteW9jdG8vNS40OiB1cGRhdGUgdG8gdjUuNC4xMTcN
Cj4gwqAgbGludXgteW9jdG8vNS4xMDoga3R5cGVzL3N0YW5kYXJkOiBkaXNhYmxlIG9ic29sZXRl
IGNyeXB0byBvcHRpb25zDQo+IGJ5DQo+IMKgwqDCoCBkZWZhdWx0DQo+IMKgIGxpbnV4LXlvY3Rv
LzUuMTA6IHVwZGF0ZSB0byB2NS4xMC4zNg0KPiDCoCBsaW51eC15b2N0by81LjQ6IHVwZGF0ZSB0
byB2NS40LjExOA0KPiDCoCBsaW51eC15b2N0by81LjEwOiB1cGRhdGUgdG8gdjUuMTAuMzcNCj4g
wqAgbGludXgteW9jdG8vNS40OiB1cGRhdGUgdG8gdjUuNC4xMTkNCj4gwqAgbGludXgteW9jdG8v
NS4xMDogdXBkYXRlIHRvIHY1LjEwLjM4DQo+IMKgIGxpbnV4LXlvY3RvLzUuNDogdXBkYXRlIHRv
IHY1LjQuMTIwDQo+IMKgIGxpbnV4LXlvY3RvLzUuMTA6IHVwZGF0ZSB0byB2NS4xMC40MQ0KPiDC
oCBsaW51eC15b2N0by81LjQ6IHVwZGF0ZSB0byB2NS40LjEyMw0KPiANCj4gR3VpbGxhdW1lIENo
YW1wYWduZSAoMSk6DQo+IMKgIGltYWdlLWxpdmUuYmJjbGFzczogb3JkZXIgZG9fYm9vdGltZyBh
ZnRlciBkb19yb290ZnMNCj4gDQo+IEpvc2h1YSBXYXR0ICgxKToNCj4gwqAgY2xhc3Nlcy9yZXBy
b2R1Y2libGVfYnVpbGQ6IFVzZSBhdG9taWMgcmVuYW1lIGZvciBTREUgZmlsZQ0KPiANCj4gS2Fp
IEthbmcgKDEpOg0KPiDCoCB2YWxncmluZDogZml4IGEgdHlwbw0KPiANCj4gUmljaGFyZCBQdXJk
aWUgKDEpOg0KPiDCoCBsaW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIxMDMxNSAtPiAyMDIxMDUx
MQ0KPiANCj4gVG9ueSBUYXNjaW9nbHUgKDEpOg0KPiDCoCB2YWxncmluZDogSW1wcm92ZSBub24t
ZGV0ZXJtaW5pc3RpYyBwdGVzdCByZWxpYWJpbGl0eQ0KPiANCj4gVHJldm9yIEdhbWJsaW4gKDEp
Og0KPiDCoCBweXRob24zOiB1cGdyYWRlIDMuOS40IC0+IDMuOS41DQo+IA0KPiDCoG1ldGEvY2xh
c3Nlcy9pbWFnZS1saXZlLmJiY2xhc3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstDQo+IMKgbWV0YS9jbGFzc2VzL3JlcHJvZHVjaWJsZV9idWlsZC5iYmNsYXNzwqDCoMKgwqDC
oMKgIHwgMTMgKysrKystLS0tLQ0KPiDCoC4uLi97cHl0aG9uM18zLjkuNC5iYiA9PiBweXRob24z
XzMuOS41LmJifcKgwqDCoCB8wqAgMiArLQ0KPiDCoC4uLi92YWxncmluZC92YWxncmluZC9ydW4t
cHRlc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIgKysrKysrKysrKw0KPiDCoC4u
Li92YWxncmluZC90YXNrc2V0X25vbmRldGVybWluaXN0aWNfdGVzdHPCoMKgIHzCoCA0ICsrKysN
Cj4gwqAuLi4vdmFsZ3JpbmQvdmFsZ3JpbmRfMy4xNi4xLmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMiArLQ0KPiDCoC4uLjIwMjEwMzE1LmJiID0+IGxpbnV4LWZpcm13YXJlXzIw
MjEwNTExLmJifSB8wqAgNCArKy0tDQo+IMKgLi4uL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzUuMTAu
YmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKy0tLQ0KPiDCoC4uLi9saW51eC9s
aW51eC15b2N0by1ydF81LjQuYmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsr
LS0tDQo+IMKgLi4uL2xpbnV4L2xpbnV4LXlvY3RvLXRpbnlfNS4xMC5iYsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDggKysrLS0tLQ0KPiDCoC4uLi9saW51eC9saW51eC15b2N0by10aW55XzUu
NC5iYsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOCArKystLS0tDQo+IMKgbWV0YS9yZWNp
cGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0b181LjEwLmJiIHwgMjQgKysrKysrKysrLS0tLS0t
LS0NCj4gLS0NCj4gwqBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvXzUuNC5i
YsKgIHwgMjIgKysrKysrKystLS0tLS0tLS0NCj4gwqAxMyBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNl
cnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkNCj4gwqByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi97cHl0aG9uM18zLjkuNC5iYiA9Pg0KPiBweXRob24zXzMuOS41LmJifSAoOTkl
KQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtDQo+IGRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kL3Rhc2tzZXRfbm9uZGV0ZXJtaW5pc3RpY190ZXN0cw0KPiDCoHJlbmFtZSBt
ZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC0NCj4gZmlybXdhcmVfMjAy
MTAzMTUuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMTA1MTEuYmJ9ICg5OSUpDQo+IA0KPiANCj4g
DQo+IA0KDQo=
