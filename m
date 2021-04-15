Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.1741.1618454273384652054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 19:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FQXJOItefRkbTtlI0sobNhZ9P9Av3aDmvSd0R+0qVic5+MtAWKxgdtN5EH6I2xnMfyBebRLkmq
 G0YAqMknVGbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="192651556"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="192651556"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 19:37:52 -0700
IronPort-SDR: GVdNn1W/oE9ZwMI+Xc58ZAMaLMyrOWIuT7/vXkewDWOLnwOZUnfaeOX3TaTdxN9IBu957/sl3r
 f8N/eIoR6jpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="418574342"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
  by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2021 19:37:51 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 10:37:50 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Thu, 15 Apr 2021 10:37:50 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "sjl@vctlabs.com" <sjl@vctlabs.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [gatesgarth][PATCH] image_types.bbclass: tar: support EXTRA_IMGAGECMD
Thread-Topic: [OE-core] [gatesgarth][PATCH] image_types.bbclass: tar: support
 EXTRA_IMGAGECMD
Thread-Index: AQHXMZ+Vwr93NbkywEWk1Josdhojvaq0V0aA
Date: Thu, 15 Apr 2021 02:37:50 +0000
Message-ID: <223a6806479ee1bcd9b3b7967ca1219917a132b7.camel@intel.com>
References: <20210415023208.GQ1189447@codepurple>
In-Reply-To: <20210415023208.GQ1189447@codepurple>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3531AB01F7806447966FDB3964CF5F60@intel.com>
Content-Transfer-Encoding: base64

SGksDQoNCk9uIFdlZCwgMjAyMS0wNC0xNCBhdCAxOTozMiAtMDcwMCwgUy4gTG9ja3dvb2QtQ2hp
bGRzIHdyb3RlOg0KPiBUaGUgcHJpbWFyeSBtb3RpdmF0aW9uIGZvciBtYWtpbmcgdGFyIGltYWdl
IG9wdGlvbnMgY29uZmlndXJhYmxlDQo+IGlzIHRvIHByb3ZpZGUgY2hvaWNlIG9uIGEgcGVyLW1h
Y2hpbmUgYmFzaXMgYmV0d2VlbiBnbnUgYW5kIHBvc2l4DQo+IGZvcm1hdHMuIE5laXRoZXIgb25l
IGlzIHN1aXRhYmxlIGZvciBhbGwgdXNlIGNhc2VzLg0KPiAqIGdudSBpc24ndCBjb21wYXRpYmxl
IHdoZW4geGF0dHJzIGFyZSByZXF1aXJlZA0KPiAqIHBvc2l4IGNhbiBjYXVzZSBsb2NhbGUgaGVh
ZGFjaGVzDQo+IMKgIGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZy9zd3VwZGF0ZS9jL3pVT1Nx
bWtrN2NBDQo+IA0KPiBPbmUgY291bGQgc2F5ICJqdXN0IGZpeCB5b3VyIGltYWdlIGluc3RhbGxl
ciIgYnV0IGl0J3MgbmljZSB0byBiZSBhYmxlDQo+IHRvIHN0aWxsIHByb2R1Y2UgaW1hZ2VzIHRo
YXQgY3VycmVudGx5LWRlcGxveWVkIHN5c3RlbXMgY2FuIGhhbmRsZSwNCj4gZm9yIGluc3RhbmNl
IHRvIG1ha2UgdXBkYXRlIHBhY2thZ2VzIHRvIHVwZGF0ZSB5b3VyIHVwZGF0ZXIgOikNCj4gDQo+
IERlZmF1bHQgaXMgc3RpbGwgcG9zaXggZm9ybWF0LCBzbyBjdXJyZW50IGJlaGF2aW9yIGlzIHVu
Y2hhbmdlZA0KPiB1bmxlc3MgRVhUUkFfSU1BR0VDTURfdGFyIGlzIGN1c3RvbWl6ZWQuDQo+IA0K
DQpUaGlzIHdvdWxkIG5lZWQgdG8gYmUgcHJvcG9zZWQgZm9yIGFuZCBtZXJnZWQgaW4gbWFzdGVy
IGJyYW5jaCBmaXJzdA0KYmVmb3JlIGl0IGNhbiBiZSBiYWNrcG9ydGVkIHRvIGEgc3RhYmxlIGJy
YW5jaC4NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gU2lnbmVkLW9mZi1ieTogUy4gTG9ja3dvb2Qt
Q2hpbGRzIDxzamxAdmN0bGFicy5jb20+DQo+IC0tLQ0KPiDCoG1ldGEvY2xhc3Nlcy9pbWFnZV90
eXBlcy5iYmNsYXNzIHwgNSArKysrLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvaW1hZ2Vf
dHlwZXMuYmJjbGFzcw0KPiBiL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzDQo+IGlu
ZGV4IDMwOTUxYWUzNjYuLmMwZGNhMzUxZDUgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY2xhc3Nlcy9p
bWFnZV90eXBlcy5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNs
YXNzDQo+IEBAIC0xMTAsNyArMTEwLDcgQEAgSU1BR0VfQ01EX3NxdWFzaGZzLWx6NCA9ICJta3Nx
dWFzaGZzDQo+ICR7SU1BR0VfUk9PVEZTfSAke0lNR0RFUExPWURJUn0vJHtJTUFHRV9OQU0NCj4g
wqANCj4gwqBJTUFHRV9DTURfVEFSID89ICJ0YXIiDQo+IMKgIyBpZ25vcmUgcmV0dXJuIGNvZGUg
MSAiZmlsZSBjaGFuZ2VkIGFzIHdlIHJlYWQgaXQiIGFzIG90aGVyDQo+IHRhc2tzKGUuZy4gZG9f
aW1hZ2Vfd2ljKSBtYXkgYmUgaGFyZGxpbmtpbmcgcm9vdGZzDQo+IC1JTUFHRV9DTURfdGFyID0g
IiR7SU1BR0VfQ01EX1RBUn0gLS1zb3J0PW5hbWUgLS1mb3JtYXQ9cG9zaXggLS0NCj4gbnVtZXJp
Yy1vd25lciAtY2YgJHtJTUdERVBMT1lESVJ9LyR7SU1BR0VfTkFNRX0ke0lNQUdFX05BTUVfU1VG
RklYfS50YXINCj4gLUMgJHtJTUFHRV9ST09URlN9IC4gfHwgWyAkPyAtZXEgMSBdIg0KPiArSU1B
R0VfQ01EX3RhciA9ICIke0lNQUdFX0NNRF9UQVJ9IC0tc29ydD1uYW1lIC0tbnVtZXJpYy1vd25l
cg0KPiAke0VYVFJBX0lNQUdFQ01EfSAtY2YNCj4gJHtJTUdERVBMT1lESVJ9LyR7SU1BR0VfTkFN
RX0ke0lNQUdFX05BTUVfU1VGRklYfS50YXIgLUMNCj4gJHtJTUFHRV9ST09URlN9IC4gfHwgWyAk
PyAtZXEgMSBdIg0KPiDCoA0KPiDCoGRvX2ltYWdlX2NwaW9bY2xlYW5kaXJzXSArPSAiJHtXT1JL
RElSfS9jcGlvX2FwcGVuZCINCj4gwqBJTUFHRV9DTURfY3BpbyAoKSB7DQo+IEBAIC0yMjgsNiAr
MjI4LDkgQEAgRVhUUkFfSU1BR0VDTURfZXh0NCA/PSAiLWkgNDA5NiINCj4gwqBFWFRSQV9JTUFH
RUNNRF9idHJmcyA/PSAiLW4gNDA5NiINCj4gwqBFWFRSQV9JTUFHRUNNRF9mMmZzID89ICIiDQo+
IMKgDQo+ICsjIEN1c3RvbWl6ZSB0YXIgZm9ybWF0IGlmIG5lZWRlZCwgc2luY2UgZ251IGFuZCBw
b3NpeCBoYXZlIGRpZmZlcmVudA0KPiBkcmF3YmFja3MNCj4gK0VYVFJBX0lNQUdFQ01EX3RhciA/
PSAiLS1mb3JtYXQ9cG9zaXgiDQo+ICsNCj4gwqBkb19pbWFnZV9jcGlvW2RlcGVuZHNdICs9ICJj
cGlvLW5hdGl2ZTpkb19wb3B1bGF0ZV9zeXNyb290Ig0KPiDCoGRvX2ltYWdlX2pmZnMyW2RlcGVu
ZHNdICs9ICJtdGQtdXRpbHMtbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QiDQo+IMKgZG9faW1h
Z2VfY3JhbWZzW2RlcGVuZHNdICs9ICJ1dGlsLWxpbnV4LW5hdGl2ZTpkb19wb3B1bGF0ZV9zeXNy
b290Ig0KPiANCj4gDQo+IA0KDQo=
