Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.30096.1607919259004255392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 20:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vD0x0T7j1fWWRZnBrFe7zFnHUWoFuLv+dB8SngZio7wUdkiuF8b8lYfSPYrDM9xbleLonKkpYN
 bI4pr1VoqfCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="162403202"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="162403202"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 20:14:14 -0800
IronPort-SDR: 8HxcBb/bLryJcELru+zPyGwUe+p2I2tNahznGBTqrz8BqxmN5IUPLIjLS8j4WJ1uXwpyUcREOM
 zmVY1WwFg1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="367045669"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2020 20:14:13 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 12:14:13 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 12:14:12 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: "alistair@alistair23.me" <alistair@alistair23.me>
Subject: Re: [PATCH 2/2] mesa: remove patch disabling asm
Thread-Topic: [PATCH 2/2] mesa: remove patch disabling asm
Thread-Index: AQHWz9yHI7hS27R6HkqVcVBnUxKQnan1eVIA
Date: Mon, 14 Dec 2020 04:14:12 +0000
Message-ID: <5c6996a2dbc28630bed661c6d2fa3c4efb51eaf8.camel@intel.com>
References: <20201211073640.479105-1-anuj.mittal@intel.com>
	 <20201211073640.479105-2-anuj.mittal@intel.com>
	 <b5957578-08bd-5926-02e7-9c13559e3f5b@gmail.com>
In-Reply-To: <b5957578-08bd-5926-02e7-9c13559e3f5b@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E746F8896F0EF419655F9289F0C9E2F@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTEyLTExIGF0IDA4OjQxIC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gDQo+
IA0KPiBPbiAxMi8xMC8yMCAxMTozNiBQTSwgQW51aiBNaXR0YWwgd3JvdGU6DQo+ID4gVGhpcyB3
YXMgb3JpZ2luYWxseSBhZGRlZCBmb3IgbXVzbCBvbmx5IFsxXS4gVXBzdHJlYW0gaGFzIHJlbW92
ZWQNCj4gPiB0aGlzDQo+ID4gb3B0aW9uIGJ1dCB3ZSByZXZlcnRlZCB0aGF0IGNoYW5nZSBkdXJp
bmcgYW4gdXBncmFkZSB0byBmaXggY2VydGFpbg0KPiA+IG11c2wgc3BlY2lmaWMgY29tcGlsZSB0
aW1lIGlzc3VlcyBbMl0uDQo+ID4gDQo+ID4gSSBjb21waWxlIHRlc3RlZCB3aXRob3V0IHRoaXMg
cGF0Y2ggb24gbXVzbC14ODYgYW5kIG11c2wteDg2LTY0IGFuZA0KPiA+IGRvbid0IHNlZSB0aGUg
d2FybmluZ3MgYW55bW9yZS4gU2ltaWxhciB0ZXh0cmVsIGlzc3VlcyB3ZXJlIGZpeGVkDQo+ID4g
dXBzdHJlYW0gc28gcGVyaGFwcyB0aG9zZSBoZWxwZWQgWzNdLg0KPiA+IA0KPiA+IFsxXSANCj4g
PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvcG9reS9jb21taXQ/
aWQ9NjhiZjEyOGU5MDFlODlkNWI0OWEyOGIxNWQ1MDgzYjJiZjZiNTM2Zg0KPiA+IFsyXSANCj4g
PiBodHRwczovL3d3dy5vcGVuZW1iZWRkZWQub3JnL3BpcGVybWFpbC9vcGVuZW1iZWRkZWQtY29y
ZS8yMDE5LU5vdmVtYmVyLzI4OTIyMi5odG1sDQo+ID4gWzNdIA0KPiA+IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21taXQvNDUyMDZkNzY3M2FkYjE0ODRjYmRi
M2VhZGFmODJlMDg0OWM5Y2RjZj9tZXJnZV9yZXF1ZXN0X2lpZD0xOTc0DQo+ID4gDQo+IA0KPiBQ
bGVhc2UgdHJ5IHJ1bm5pbmcvYm9vdGluZyBjb3JlLWltYWdlLXNhdG8gYWZ0ZXIgdGhpcyBjaGFu
Z2UgZm9yIGENCj4gbXVzbCANCj4gYmFzZWQgeDg2IHN5c3RlbSBhcyB3ZWxsLg0KDQpZZWFoLCBJ
IGhhZCBkb25lIHRoYXQgYW5kIGRpZG4ndCBzZWUgYW55IHByb2JsZW1zLg0KDQpUaGFua3MsDQoN
CkFudWoNCg0K
