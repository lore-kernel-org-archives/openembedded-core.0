Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.51.1616625531884982543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 15:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=CHJbaHIp;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616625532;
  x=1648161532;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cDI8gS3PqiYyjeyTIah812WXwigd6crNCVO+BdB8aDY=;
  b=CHJbaHIpoR40cOV0EBhwCG/xxSmLYL2Bq0FlwYcVSOioHsV3EzRJgXAU
   f4u1mDA6LfkxztDza5dFXKB5Ja/Lgb4gvJCNjc3uCAcXR9QAv3kMqK45z
   3+nkTyywj5BGdTpC4RoMaiFPgHEISR5kgvncMqBPLkVKlUPEpopJyG0EW
   /VDs4JzTwoJ85MgE51hXiM0QwUxE3O1D5uiIljDokWd9hnEibwtLWf8MV
   rT9faGtzA2GOAPeUZzg/bgWi+//zUeTG3fh/1SlfKLqjBXIRo9n2H+2ZI
   f/4OFlSx7417w98kMZPNVbvw+4NQgUbo9Ng17t7Wp0Gw7n40Y78QeC+pp
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] util-linux.inc: Set the correct license for util-linux-libuuid again
Thread-Topic: [OE-core] [PATCH] util-linux.inc: Set the correct license for
 util-linux-libuuid again
Thread-Index: AQHXIPWYkE3caF8rUUquD+ptRz4OM6qTtrRg
Date: Wed, 24 Mar 2021 22:38:39 +0000
Message-ID: <47b4399805074e89a13de8af539c4448@XBOX03.axis.com>
References: <20210324191508.8400-1-pkj@axis.com>
 <daec4eaf8dce63a70617a4a70b87e33b230f9462.camel@linuxfoundation.org>
In-Reply-To: <daec4eaf8dce63a70617a4a70b87e33b230f9462.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDI0IG1hcnMgMjAy
MSAyMjozNQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdXRpbC1saW51eC5pbmM6IFNldCB0aGUgY29y
cmVjdCBsaWNlbnNlIGZvcg0KPiB1dGlsLWxpbnV4LWxpYnV1aWQgYWdhaW4NCj4gDQo+IE9uIFdl
ZCwgMjAyMS0wMy0yNCBhdCAyMDoxNSArMDEwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0K
PiA+IExJQ0VOU0VfJHtQTn0tbGlidXVpZCB3YXMgbm90IHVwZGF0ZWQgd2hlbiBsaWJ1dWlkIHdh
cyBtb3ZlZCB0byB0aGUNCj4gPiB1dGlsLWxpbnV4LXV1aWQgcmVjaXBlLiBVc2UgTElDRU5TRV8k
e0JQTn0tbGlidXVpZCBpbnN0ZWFkIGFzIEJQTiBpcw0KPiA+IHNldCB0byAidXRpbC1saW51eCIg
Zm9yIGJvdGggdXRpbC1saW51eCBhbmQgdXRpbC1saW51eC11dWlkLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+ID4gLS0tDQo+ID4gwqBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jIHwgMTAgKysrKystLS0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jIGIvbWV0YS9yZWNpcGVzLQ0KPiBjb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC5pbmMNCj4gPiBpbmRleCA0MDMxYzU4NmM5Li5iYjkzZWI2N2Q2IDEw
MDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5p
bmMNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5j
DQo+ID4gQEAgLTcsMTEgKzcsMTEgQEAgZGlzayBwYXJ0aXRpb25pbmcsIGtlcm5lbCBtZXNzYWdl
IG1hbmFnZW1lbnQsDQo+IGZpbGVzeXN0ZW0gY3JlYXRpb24sIGFuZCBzeXN0ZW0gbG8NCj4gPiDC
oFNFQ1RJT04gPSAiYmFzZSINCj4gPiDCoMKgTElDRU5TRSA9ICJHUEx2MisgJiBMR1BMdjIuMSsg
JiBCU0QtMy1DbGF1c2UgJiBCU0QtNC1DbGF1c2UiDQo+ID4gLUxJQ0VOU0VfJHtQTn0tbGliYmxr
aWQgPSAiTEdQTHYyLjErIg0KPiA+IC1MSUNFTlNFXyR7UE59LWxpYmZkaXNrID0gIkxHUEx2Mi4x
KyINCj4gPiAtTElDRU5TRV8ke1BOfS1saWJtb3VudCA9ICJMR1BMdjIuMSsiDQo+ID4gLUxJQ0VO
U0VfJHtQTn0tbGlic21hcnRjb2xzID0gIkxHUEx2Mi4xKyINCj4gPiAtTElDRU5TRV8ke1BOfS1s
aWJ1dWlkID0gIkJTRC0zLUNsYXVzZSINCj4gPiArTElDRU5TRV8ke0JQTn0tbGliYmxraWQgPSAi
TEdQTHYyLjErIg0KPiA+ICtMSUNFTlNFXyR7QlBOfS1saWJmZGlzayA9ICJMR1BMdjIuMSsiDQo+
ID4gK0xJQ0VOU0VfJHtCUE59LWxpYm1vdW50ID0gIkxHUEx2Mi4xKyINCj4gPiArTElDRU5TRV8k
e0JQTn0tbGlic21hcnRjb2xzID0gIkxHUEx2Mi4xKyINCj4gPiArTElDRU5TRV8ke0JQTn0tbGli
dXVpZCA9ICJCU0QtMy1DbGF1c2UiDQo+IA0KPiBIb3cgd2FzIHRoaXMgdGVzdGVkPyBUaGlzIHdp
bGwgbm90IHdvcmsgZm9yIG11bHRpbGlicyBvciBuYXRpdmVzZGsuDQoNCldlbGwsIHdlIGRvbid0
IHVzZSBlaXRoZXIsIHNvIG9idmlvdXNseSBJIG9ubHkgdGVzdGVkIGJ1aWxkaW5nIGZvciANCnRh
cmdldC4gSG93ZXZlciwgSSBiZWxpZXZlIGl0IHNob3VsZCB3b3JrLiBBdCBsZWFzdCBgYml0YmFr
ZSAtZSANCm5hdGl2ZXNkay11dGlsLWxpbnV4LXV1aWRgIHNob3dzIHRoZSBleHBlY3RlZCB2YWx1
ZSBmb3IgDQpMSUNFTlNFX25hdGl2ZXNkay11dGlsLWxpbnV4LWxpYnV1aWQuDQoNCk5vdGUgdGhh
dCBCUE4gaXMgZXhwbGljaXRseSBzZXQgaW4gdGhlIHV0aWwtbGludXguaW5jIGZpbGUgdG8gDQoi
dXRpbC1saW51eCIsIHNvIHRoZSBkZWZpbml0aW9ucyBhYm92ZSBzaG91bGQgYmUgbm8gZGlmZmVy
ZW50IHRoYW4gDQppZiBJIGhhZCB1c2VkIExJQ0VOU0VfdXRpbC1saW51eC1saWJ1dWlkID0gIkJT
RC0zLUNsYXVzZSINCk9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNCj4gQ2hlZXJzLA0KPiAN
Cj4gUmljaGFyZA0KDQovL1BldGVyDQo=
