Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.34661.1608519445860227648
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 18:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4IxnUrp6057ol9YwOyjSJf9aJrNSndZPPaQNU2tKVFro34uJiWGeA8NDVIpr25QWYCQULM1nUM
 WgpI/Sph9S/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="174896995"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="174896995"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 18:57:24 -0800
IronPort-SDR: 0/l/zVhlbjEQAMNLEIPWoGPno07Ffh3dYN6pCkpAk4w9xv/9en5eYi4KIOpV69GvNjwI1MtE16
 NWIiwnK1ySDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="388581094"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
  by fmsmga004.fm.intel.com with ESMTP; 20 Dec 2020 18:57:23 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Dec 2020 10:57:22 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Mon, 21 Dec 2020 10:57:22 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bluelightning@bluelightning.org"
	<bluelightning@bluelightning.org>
Subject: Re: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull requesrt
Thread-Topic: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull requesrt
Thread-Index: AQHW0islZgBX+o9yOE2o4zF1XyOd/Kn9ypqAgAKU84A=
Date: Mon, 21 Dec 2020 02:57:22 +0000
Message-ID: <cf65e19893f23bd5987ec4d50904e45838ad68d0.camel@intel.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
	 <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org>
In-Reply-To: <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DAED7D12F805B479F769EAAED8B32B7@intel.com>
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNCk9uIFNhdCwgMjAyMC0xMi0xOSBhdCAxMTozMSArMDAwMCwgUmljaGFyZCBQ
dXJkaWUgd3JvdGU6DQo+IEhpIEJydWNlLA0KPiANCj4gT24gTW9uLCAyMDIwLTEyLTE0IGF0IDEw
OjA5IC0wNTAwLCBicnVjZS5hc2hmaWVsZEBnbWFpbC5jb23CoHdyb3RlOg0KPiA+IEZyb206IEJy
dWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+ID4gDQo+ID4gNS4xMCBk
cm9wcGVkIHRoaXMgbW9ybmluZywgc28gSSdtIHN3aXRjaGluZyBvdmVyIHRvIHRoZSBsaWJjLQ0K
PiA+IGhlYWRlcnMNCj4gPiBhbmQgcmVmZXJlbmNlIGtlcm5lbCB1cGdyYWRlICg1LjQgYW5kIDUu
MTAgd2lsbCBiZSBpbiBtYXN0ZXIsIHdpdGgNCj4gPiA1LjggYmVpbmcgZHJvcHBlZCkuDQo+ID4g
DQo+ID4gQnV0IHNpbmNlIHRoYXQgd2lsbCB0YWtlIGEgYml0IHRvIHNvcnQgb3V0LCBJIHdhbnRl
ZCB0byBzZW5kIG15DQo+ID4gcXVldWUNCj4gPiBvZiBwYXRjaGVzIGZvciBvdGhlciBmaXhlcy92
ZXJzaW9ucy4NCj4gPiANCj4gPiBJIGRpZG4ndCBwaWNrIHVwIGFueSBpc3N1ZXMgd2l0aCBsb2Nh
bCB0ZXN0aW5nLCBzbyBob3BlZnVsbHkgdGhpcw0KPiA+IHdvbid0DQo+ID4gY2F1c2UgYW55IHBy
b2JsZW1zLg0KPiA+IA0KPiA+IEkgaGF2ZSB0aGUgbHR0bmctbW9kdWxlcyBwYXRjaCBmcm9tIGEg
cHJldmlvdXMgc2VuZCByZXBlYXRlZCBoZXJlLA0KPiA+IHNpbmNlDQo+ID4gaXQgbWF5IGJlIGVh
c2llciB0byB0YWtlIGl0IGFzIHBhcnQgb2YgdGhlIGJ1bGsgdXBkYXRlLiBJIGNoZWNrZWQNCj4g
PiBqdXN0IGEgZmV3IG1pbnV0ZXMgYWdvLCBhbmQgdGhlcmUgaXNuJ3QgYSBuZXcgdGFnZ2VkIHZl
cnNpb24gb2YgdGhlDQo+ID4gbW9kdWxlcyB5ZXQsIHNvIHdlIHN0aWxsIG5lZWQgdGhlIGJhY2tw
b3J0ZWQgcGF0Y2hlcyBmb3IgNS4xMCsNCj4gPiBidWlsZHMuDQo+IA0KPiBJIHdhcyBhYmxlIHRv
IG1lcmdlIHBhcnQgb2YgdGhlIHNlcmllcyBidXQgdGhlcmUgd2VyZSBzb21lIHdhcm5pbmdzDQo+
IHRoYXQgY2FtZSB1cDoNCj4gDQo+IG1ldGEtaW50ZWw6DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvMTAwL2J1aWxkcy8xMDIwDQoNCkkg
dGhpbmsgdGhpcyB3b3VsZCBuZWVkOg0KDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2Nn
aXQvY2dpdC5jZ2kveW9jdG8ta2VybmVsLWNhY2hlL2NvbW1pdC9mZWF0dXJlcy9maXJtd2FyZT9p
ZD0xYmRlNWFjM2MzYjMyNDg1Mzk1OGMyNDUxM2E2YTk0OWQwOTEzOGJjDQoNCnRvIGJlIGluY2x1
ZGVkIGluIHY1LjQgYnJhbmNoIGFzIHdlbGwuIEJ1dCBJIGFtIHdvbmRlcmluZyB3aHkgaXMgaXQN
CmJlaW5nIGZsYWdnZWQgbm93LiBJIGNhbid0IGZpZ3VyZSBvdXQgd2hhdCBoYXMgY2hhbmdlZCAu
Li4NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gcG9reS10aW55Og0KPiBodHRwczovL2F1dG9idWls
ZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzE1L2J1aWxkcy8zMTA1DQo+
IA0KPiBzbyBJJ3ZlIGRlZmVycmVkIHRoZSBrZXJuZWwgdG9vbGluZyBiaXQgdW50aWwgd2UgY2Fu
IGZpZ3VyZSB0aGVzZQ0KPiBvdXQuDQo+IFRoYXQgbWVhbnMgc2V2ZXJhbCBvdGhlciBwYXRjaGVz
IHdoaWNoIGRlcGVuZGVkIG9uIHRoYXQgYWxzbyBjb3VsZG4ndA0KPiBtYWtlIGl0IGluLg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQo+IA0KPiANCg0K
