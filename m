Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.8054.1592183154266799859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 18:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: lBbko+PcdjpnU7W4tPkEbi3/0oS3hgp4hXlfWZ/+kukLoghV6Y0ZE8zVtirWOozl5+h1JQwNph
 KfOyMhXGUniw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2020 18:05:44 -0700
IronPort-SDR: /wPfjWeH1w1o1JO78H+aDkJW/V8oR/g13LmJ6GJlS7o/AyNjLqfbAClF88vNT2GY0GnnFVBOtU
 8psMUUeNFzhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,513,1583222400"; 
   d="scan'208";a="261628205"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
  by orsmga007.jf.intel.com with ESMTP; 14 Jun 2020 18:05:42 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 PGSMSX102.gar.corp.intel.com ([169.254.6.53]) with mapi id 14.03.0439.000;
 Mon, 15 Jun 2020 09:05:41 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "rrowe@xevo.com" <rrowe@xevo.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "jbroadus@xevo.com"
	<jbroadus@xevo.com>, "mkelly@xevo.com" <mkelly@xevo.com>
Subject: Re: [OE-core] python3 recipe PGO tests
Thread-Topic: [OE-core] python3 recipe PGO tests
Thread-Index: AQHWQQBr9DBCM++iU0S7IAPhJcbp6ajYWg4A
Date: Mon, 15 Jun 2020 01:05:41 +0000
Message-ID: <bc728c163c639ffd5c0e6d8fb4c10b94417a2a8a.camel@intel.com>
References: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com>
In-Reply-To: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.77.167]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B498A0AEB799E438B11DFF32773DE92@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA2LTEyIGF0IDIxOjI4ICswMDAwLCBSeWFuIFJvd2Ugd3JvdGU6DQo+IEhl
bGxvIEFsZXgsDQo+ICANCj4gSeKAmW0gaW52ZXN0aWdhdGluZyBQeXRob24gMyBwZXJmb3JtYW5j
ZSBpc3N1ZXMgb24gYSBSYXNwYmVycnkgUGkgWW9jdG8NCj4gYnVpbGQ7IEkgYXBwcmVjaWF0ZSBh
bnkgaW5zaWdodHMgeW91IGNhbiBwcm92aWRlIGludG8gdGhlIHByb2JsZW0uDQo+ICANCj4gSW4g
bXkgaW52ZXN0aWdhdGlvbiwgSSBub3RpY2VkIHRoYXQgUEdPIHdhcyBkaXNhYmxlZCBpbiBhbGwg
Y2FzZXMgZHVlDQo+IHRvIGEgc21hbGwgYnVnLiBJIGZpeGVkIGl0IGluIGEgcGF0Y2ggc3VibWl0
dGVkIHRvIE9FLUNvcmUgKCMxMzk0NTkpLg0KPiBFdmVuIHdoZW4gUEdPIGlzIGluZGVlZCBlbmFi
bGVkLCBQeXRob24gMyBydW5zIHNpZ25pZmljYW50bHkgc2xvd2VyDQo+IG9uIFlvY3RvLWNvbXBp
bGVkIFB5dGhvbiAzLjguMyB0aGFuIHRoZSBzYW1lIHZlcnNpb24gY29tcGlsZWQgb24NCj4gUmFz
cGJpYW4uDQo+ICANCj4gSW4geW91ciBwYXRjaCwgMDAwMS1NYWtlZmlsZS5wcmUtdXNlLXFlbXUt
d3JhcHBlci13aGVuLWdhdGhlcmluZy0NCj4gcHJvZmlsZS5wYXRjaCwgSSBzZWUgdGhhdCB5b3Ug
b3ZlcnJpZGUgdGhlIGRlZmF1bHQgUFJPRklMRV9UQVNLLA0KPiB3aGljaCBkaWQgbm90IGV4cGxp
Y2l0bHkgc3BlY2lmeSB0ZXN0IHN1aXRlcywgdG8gYSBjb21tYW5kIHRoYXQNCj4gZXhwbGljaXRs
eSBwcm92aWRlcyB0ZXN0IHN1aXRlcy4gSG93IGRpZCB5b3UgZGVjaWRlIG9uIHRoZXNlIHRlc3Rz
Pw0KPiBUaGUgc3RhbmRhcmQgUEdPIGNvbW1hbmQgcnVucyA0MyB0ZXN0cywgd2hpbGUgeW91IHNw
ZWNpZnkgNy4gV2hlbiBJDQo+IGNvbXBpbGUgUHl0aG9uIDMuOC4zIG9uIFJhc3BiaWFuLCBJIHNl
ZSBubyBpbnRlcnNlY3Rpb24gYmV0d2VlbiB0aGUNCj4gNDMgdGVzdHMgcnVuIGJ5IGRlZmF1bHQg
YW5kIHRoZSA3IHlvdSBzcGVjaWZ5LiBBZGRpdGlvbmFsbHksIHRoZQ0KPiBkZWZhdWx0IG1vZHVs
ZSBmb3IgUFJPRklMRSBpcyB0ZXN0IHdoaWxlIHlvdSB1c2UgdGVzdC5yZWdydGVzdC4NCg0KV2Ug
dXNlZCB0byBydW4gcHliZW5jaCBhbmQgdGhlbiBzd2l0Y2hlZCB0byByZWdydGVzdDoNCg0KaHR0
cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3kvY29tbWl0Lz9pZD1k
OWY3YjlkM2FkNDQxOTVlNjhiMmMxYjA5ZTNlYjQyZTYyM2M5YTIwDQoNClRoZSBQUk9GSUxFX1RB
U0sgdmFsdWUgaXQgbG9va3MgbGlrZSB3YXMgY2hhbmdlZCByZWNlbnRseToNCg0KaHR0cHM6Ly9n
aXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC8yNDA2NjcyOTg0ZTRjMWIxODYyOWU2MTVl
ZGFkNTI5MjhhNzJmZmNjI2RpZmYtNDVlOGI5MTA1N2YwYzViNjBlZmNiNTk0NDEyNWI1ODUNCg0K
SWYgdGhlIHBlcmZvcm1hbmNlIGlzIGFjdHVhbGx5IGRlZ3JhZGluZywgbWF5IGJlIHdlIHNob3Vs
ZCBjaGFuZ2UgaXQgdG8NCnNvbWV0aGluZyBtb3JlIHVzZWZ1bC4gRG8geW91IGtub3cgbXVjaCB0
aW1lIGRvZXMgdGhlIGRlZmF1bHQgc2V0IG9mDQp0YXNrcyB0YWtlIHRvIHJ1biBpbiBxZW11Pw0K
DQpUaGFua3MsDQoNCkFudWoNCg0KPiAgDQo+IEZvciByZWZlcmVuY2UsIGhlcmXigJlzIHRoZSBy
ZXN1bHRzIG9mIGEgc2ltcGxlIENQVS1ib3VuZCB0ZXN0LiBUaGVzZQ0KPiB0ZXN0cyB3ZXJlIHJ1
biBvbiB0aGUgc2FtZSBSYXNwYmVycnkgUGkgNCB3aXRoIHNhbWUgU0QgY2FyZC4NCj4gIA0KPiBw
eXRob24zIC1tIHRpbWVpdCAtciAxMCAtLXNldHVwICcNCj4gZGVmIGZpYihuKToNCj4gIGlmIG4g
PCAyOg0KPiAgICByZXR1cm4gbg0KPiAgaWYgbiA9PSAyOg0KPiAgICByZXR1cm4gMQ0KPiAgcmV0
dXJuIGZpYihuIC0gMSkgKyBmaWIobiAtIDIpDQo+ICcgJ1tmaWIobikgZm9yIG4gaW4gcmFuZ2Uo
MjApXScNCj4gIA0KPiAjIFlvY3RvIFB5dGhvbiAzLjguMw0KPiAjIDEwIGxvb3BzLCBiZXN0IG9m
IDEwOiAyOC45IG1zZWMgcGVyIGxvb3ANCj4gIyAxMCBsb29wcywgYmVzdCBvZiAxMDogMjkuMyBt
c2VjIHBlciBsb29wDQo+ICMgMTAgbG9vcHMsIGJlc3Qgb2YgMTA6IDI3LjkgbXNlYyBwZXIgbG9v
cA0KPiAjIDEwIGxvb3BzLCBiZXN0IG9mIDEwOiAzMC40IG1zZWMgcGVyIGxvb3ANCj4gIyBBdmVy
YWdlIHJlc3VsdDogMzEuNjI1IG1zZWMgcGVyIGxvb3ANCj4gIA0KPiAjIFJhc3BiaWFuIFB5dGhv
biAzLjguMw0KPiAjIDUwIGxvb3BzLCBiZXN0IG9mIDEwOiA3LjczIG1zZWMgcGVyIGxvb3ANCj4g
IyA1MCBsb29wcywgYmVzdCBvZiAxMDogNy43MiBtc2VjIHBlciBsb29wDQo+ICMgNTAgbG9vcHMs
IGJlc3Qgb2YgMTA6IDcuNjcgbXNlYyBwZXIgbG9vcA0KPiAjIDUwIGxvb3BzLCBiZXN0IG9mIDEw
OiA3Ljc0IG1zZWMgcGVyIGxvb3ANCj4gIyBBdmVyYWdlIHJlc3VsdDogNy43MTUgbXNlYyBwZXIg
bG9vcA0KPiAgDQo+ICMgUmFzcGJpYW4gc3BlZWR1cDogNC4wOXgNCj4gIA0KPiBCZXN0LA0KPiBS
eWFuIFJvd2UNCj4gDQo=
