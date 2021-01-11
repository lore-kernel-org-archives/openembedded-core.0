Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.544.1610389362226084364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 10:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PiuXAk8A;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1610389362;
  x=1641925362;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lWhmk6KtndTDX8AN5GHK9uysPpS2X2foK1viLavzIsg=;
  b=PiuXAk8A0JnYwwHFoBEO0PHmziWcdrMTqP1jYOQ3U8RqbnVODwji0RUM
   O7LHMrSMQ8r+FfycTyG8A5I088RfoCNonUcJtmAlqgVzmhdA2GWVgEVrB
   p4dQ6EweeYOOsKduoXTw8+y+y5qOjDGzckXZgY68VsdmCWCh2el7QHhD+
   s093G5RGfYw5GEHsmFXQDwLjtd/l5Q4z87zhdqc+I1/lTwz5LlBsdo0F8
   rNOVX/ocRyMBESeL+amrUvamOfw4GPEYi4Y4tubTxQLOeNoYsdWZ757+4
   1O/alIm0MCz8CxRXde4Zdri/BNq2ApcUpGL7XDe3F5Yq/x/GtA+uNLr/c
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Anton Kachalov
	<rnouse@google.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
Thread-Topic: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore
 paths
Thread-Index: AQHW5UA/U4QVrsBaxUC0ftXAsYepTaocqjCAgAAs0ACAAH2pAIAFZpfA
Date: Mon, 11 Jan 2021 18:22:40 +0000
Message-ID: <3810611592a344cbaeb1b907e150c2c5@XBOX03.axis.com>
References: <20210107215121.3901938-1-gmouse@google.com>
	 <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
	 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
	 <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
	 <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
 <bfb21f1ec874e5d9638885885eb2530104c28ac5.camel@linuxfoundation.org>
In-Reply-To: <bfb21f1ec874e5d9638885885eb2530104c28ac5.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiA4IGph
bnVhcmkgMjAyMSAwOToyNw0KPiBUbzogQW50b24gS2FjaGFsb3YgPHJub3VzZUBnb29nbGUuY29t
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtwb2t5XVtQQVRDSF0gYml0YmFrZTogcmVtb3ZlIC91c3IgZnJv
bSBwc2V1ZG8NCj4gaWdub3JlIHBhdGhzDQo+IA0KPiBPbiBGcmksIDIwMjEtMDEtMDggYXQgMDE6
NTYgKzAxMDAsIEFudG9uIEthY2hhbG92IHdyb3RlOg0KPiA+IEhlbGxvLCBSaWNoYXJkLg0KPiA+
IFllcywgZm9yIHZhcmlvdXMgcmVhc29ucyB3ZSBjYW4gbm90IG1vdmUgb3V0IGZyb20gL3Vzci9s
b2NhbC4NCg0KVXNpbmcgYSBidWlsZCBkaXJlY3RvcnkgYW55d2hlcmUgdW5kZXIgL3VzciBzb3Vu
ZHMgbGlrZSBhIHZlcnkgdW51c3VhbCANCnNldHVwIGFuZCBJIGRvIG5vdCB0aGluayBpdCBpcyBh
IHNpdHVhdGlvbiB0aGF0IHdhcnJhbnRzIHNwZWNpYWwgDQp0cmVhdG1lbnQgaW4gdGhlIGNvbW1v
biBjb25maWd1cmF0aW9uLiBXb3JrYXJvdW5kcyBhcmUgYmV0dGVyIGRvbmUgaW4gDQp0aGUgbG9j
YWwgZW52aXJvbm1lbnQuDQoNCj4gPiBCZWZvcmUgdGhlIGNoYW5nZSBpdCB3b3JrcyBzbW9vdGhs
eSBhbmQgd2UgZGlkbid0IG5vdGljZSBhYm91dCBhbnkNCj4gPiBraW5kIG9mIHBlcmZvcm1hbmNl
IGlzc3Vlcy4NCj4gPiBNYXkgYmUgd2UgY2FuIGV4cGxpY2l0bHkgYWRkIHZhcmlvdXMgc3RhbmRh
cmQgc3ViZGlycyB1bmRlciAvdXNyDQo+ID4gZXhjbHVkaW5nIC91c3IvbG9jYWw/DQoNCkkgYmVs
aWV2ZSBpdCB3b3VsZCBiZSBoYXJkIHRvIG1haW50YWluIGEgc3VpdGFibGUgbGlzdCBvZiBzdWJk
aXJlY3RvcmllcyANCm9mIC91c3IgKGluY2x1ZGluZyAvdXNyL2xvY2FsKSB0aGF0IHBzZXVkbyBz
aG91bGQgaWdub3JlLiBIb3dldmVyLCANCmRvIHdlIGFjdHVhbGx5IGtub3cgaWYgcHNldWRvIGlz
IG5vcm1hbGx5IGFjY2Vzc2luZyBwYXRocyB1bmRlciAvdXNyLCANCm9yIHdhcyBpdCBqdXN0IGFk
ZGVkIGFzIGEgInBzZXVkbyBzaG91bGQgbmV2ZXIgY2FyZSBhYm91dCBhbnl0aGluZyBoZXJlIA0K
c28gd2UgbWF5IGFzIHdlbGwgYWRkIGl0Ij8NCg0KPiBDYW4geW91IGFkZCBsb2NhbCBjb25maWcg
bGlrZToNCj4gDQo+IFBTRVVET19JR09OUkVfUEFUSFNfcmVtb3ZlID0gIi91c3IvLCINCj4gDQo+
IHdoaWNoIHNob3VsZCBhbGxvdyB0aGluZ3MgdG8gd29yayBmb3IgeW91Pw0KDQpDb3JyZWN0IG1l
IGlmIEkgYW0gd3JvbmcsIGJ1dCBBRkFJSyB5b3UgY2Fubm90IHVzZSB0aGUgX3JlbW92ZSBvcGVy
YXRvciANCnRvIHJlbW92ZSBhIHBhcnQgb2YgYSBzdHJpbmcuIEl0IG9ubHkgd29ya3Mgb24gc3Bh
Y2Ugc2VwYXJhdGVkIHdvcmRzLiANCllvdSB3aWxsIGhhdmUgdG8gcmVkZWZpbmUgdGhlIGVudGly
ZSBQU0VVRE9fSUdPTlJFX1BBVEhTIHRvIHJlbW92ZSBhbnkgDQpwYXJ0cyBvZiBpdC4NCg0KVGhp
cyBpcyBhIGRyYXdiYWNrIG9mIHVzaW5nIGEgbGlzdCBpbiBhIGJpdGJha2UgdmFyaWFibGUgdGhh
dCBpcyBzZXBhcmF0ZWQgDQp1c2luZyBzb21ldGhpbmcgb3RoZXIgdGhhbiBzcGFjZXMuIEkgZ3Vl
c3MgY29tbWFzIHdlcmUgY2hvc2VuIGFzIHNlcGFyYXRvciANCmZvciB0aGlzIHZhcmlhYmxlIHNp
bmNlIHNwYWNlcyBhcmUgbW9yZSBjb21tb24gKGlmIHN0aWxsIHJhcmUpIGluIHBhdGhzIA0KdGhh
biBjb21tYXMsIGJ1dCBpdCBjYXVzZXMgcHJvYmxlbXMgbGlrZSB0aGlzLg0KDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiBSaWNoYXJkDQoNCi8vUGV0ZXINCg0K
