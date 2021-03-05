Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1448.1614975683132410638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 12:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OFQR3suj;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614975683;
  x=1646511683;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1fWE97lHSz4ZDAeZCjystMkF8SH4EffiBXaskVoAx9M=;
  b=OFQR3suj4+KN08RHtLOciLeb+9jTR9QsbnFDcfqqthIv3trW+Eq5HPOa
   0N43ONh2YMGAc4PRCO4n124+GPUlxb+OmkVZdu6VJyxF4SxzaKmqri7PT
   UYzhq6clCMBjFaq8i2d/BhRmBO4ApanYc+ppdTxN6Kty2xJpBjp27Q8fd
   CzxQ0HWw2YVFeVhZXTFyXHaInVzzNRyvNJXN5Z4bSIpO24J/+Qobu71Kf
   mOSxy0QfviVQgDAyFGhhY7sCAR0HY7kx5/W20PqV4J4tSkwQeBWZVpk/n
   t0Nf8REAbyxBIOKZjLkwGKk4kh3F4BFQIqfL54o+T33xAawhPvS+sJpoL
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "anibal.limon@linaro.org"
	<anibal.limon@linaro.org>, "geoffhp@gmail.com" <geoffhp@gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Topic: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Index: AQHXD5xPurcQ4I2XYE+3ZHRfllSLwap1OySggAAHIVD///lSAIAAU8YQgAARz4CAADcJEA==
Date: Fri, 5 Mar 2021 20:21:10 +0000
Message-ID: <5aea5e8a740f4079beb62be11234cc4c@XBOX03.axis.com>
References: <20210302193229.175044-1-Martin.Jansa@gmail.com>
	 <16696CDA6651CD2C.16425@lists.openembedded.org>
	 <0c5fb27d35c142d488642d21d24a37c4@XBOX03.axis.com>
	 <20210305115050.chhf5zf357wns3xl@jama>
	 <38592c5c6824461687563ed1a52913eb@XBOX03.axis.com>
 <b9ceb42871b6bfa49caaf1bb86ae6627154688d4.camel@linuxfoundation.org>
In-Reply-To: <b9ceb42871b6bfa49caaf1bb86ae6627154688d4.camel@linuxfoundation.org>
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
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDUgbWFycyAyMDIx
IDE4OjU0DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlz
LmNvbT47IE1hcnRpbiBKYW5zYQ0KPiA8bWFydGluLmphbnNhQGdtYWlsLmNvbT4NCj4gQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IGFuaWJhbC5saW1vbkBsaW5h
cm8ub3JnOw0KPiBnZW9mZmhwQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSF0gZ2xpYi0yLjA6IGNhbGwgb3MucGF0aC5ub3JtcGF0aCBvbiBUSElTRElSDQo+IA0KPiBP
biBGcmksIDIwMjEtMDMtMDUgYXQgMTU6NTIgKzAwMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90
ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBNYXJ0aW4g
SmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5jb20+DQo+ID4gPiBTZW50OiBkZW4gNSBtYXJzIDIw
MjEgMTI6NTENCj4gPiA+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVk
dEBheGlzLmNvbT4NCj4gPiA+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnOyBhbmliYWwubGltb25AbGluYXJvLm9yZzsNCj4gPiA+ID4NCj4gPiA+ID4gQWN0dWFs
bHksIHRoaW5raW5nIGEgYml0IG1vcmUgb24gdGhpcywgSSBiZWxpZXZlIHRoYXQgd2l0aCBteSBw
YXRjaA0KPiA+ID4gPiBhcHBsaWVkLCB0aGlzIHBhdGNoIHNob3VsZCBfbm90XyBiZSBhcHBsaWVk
LiBUaGF0IGlzIGJlY2F1c2UgaXQNCj4gbWFrZXMNCj4gPiA+ID4gdGhlIHBhdGhzIHJlbGF0aXZl
IHRvIHRoaXNkaXIsIGJ1dCB0aGVuIHVzZXMgJHtUSElTRElSfSB3aGVuIHVzaW5nDQo+ID4gPiA+
IHRoZW0uIFRodXMgaWYgdGhpc2RpciBpcyBub3JtYWxpemVkLCBpdCBtYXkgbm8gbG9uZ2VyIG1h
dGNoDQo+ICR7VEhJU0RJUn0NCj4gPiA+ID4gYW5kIHRoZSByZWxhdGl2ZSBwYXRocyB3aWxsIG5v
dCB3b3JrIGFzIGludGVuZGVkLg0KPiA+ID4NCj4gPiA+IEknbSBzb3JyeSBJJ3ZlIHRlc3RlZCBh
bmQgd3JvdGUgdGhhdCBwYXJ0IG9mIGNvbW1pdCBtZXNzYWdlIHdoZW4gSSBoYWQNCj4gPiA+IGlm
IG9zLnBhdGguZXhpc3RzKGZpbGVuYW1lKToNCj4gPiA+IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhp
cyB3aG9sZSBzZWN0aW9uLCB3aGljaCBJJ3ZlIHRoZW4gcmUtd3JvdGUgdG8NCj4ganVzdA0KPiA+
ID4gc3RvcmUgb25seSBleGlzdGluZyBmaWxlbmFtZXMgaW4gZmlsZXMgYXMgYSBsaXN0IGluc3Rl
YWQgb2YgYSBtYXAgKHRvDQo+ID4gPiBzaW1wbGlmeSB0aGUgcmVzdCBvZiB0aGlzIGZ1bmN0aW9u
IGFzIHdlbGwpLCBidXQgdGhlbiBJIHdhcyB3b25kZXJpbmcNCj4gPiA+IHdoeSBSb3NzIHVzZWQg
dGhlIG1hcCBpbiB0aGUgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBoZXJlOg0KPiA+ID4gaHR0cHM6
Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtDQo+ID4gPiBjb3JlL2NvbW1pdC8/
aWQ9NWFjZDljYmM5ZDVjNjM1NTAxMDc3NTI1MGZiMjVmMDQzNDQxYzVjZA0KPiA+ID4gYW5kIGFz
c3VtZWQgaXQgd2FzIG5lZWRlZCB0byBnZXQgYWxsIHBvc3NpYmxlIGZpbGVuYW1lcyBpbg0KPiA+
ID4gZG9fY29uZmlndXJlW2ZpbGUtY2hlY2tzdW1zXSBpbiBjYXNlIHRoZXkgYXJlIGNyZWF0ZWQg
bGF0ZXIuDQo+ID4gPg0KPiA+ID4gU28gSSd2ZSByZW1vdmVkIGFsbCBteSBjbGVhbnVwcyBhbmQg
cmV0dXJuZWQgdG8gc21hbGxlc3QgY2hhbmdlIHRvDQo+IGp1c3QNCj4gPiA+IHJlcGxhY2UgQ09S
RUJBU0Ugd2l0aCBUSElTRElSLg0KPiA+ID4NCj4gPiA+IFdoYXQgYWJvdXQgY2hlY2tpbmcgdGhl
IGV4aXN0ZW5jZSBiZWZvcmUgc2hvd2luZyB0aGUgZXJyb3IsIHRoYXQgd2lsbA0KPiA+ID4gc2hv
dyBhbiBlcnJvciBvbmx5IHdoZW4gbWF0Y2hpbmcgZmlsZSBleGlzdHMgd2hpbGUga2VlcGluZyBh
bGwNCj4gPiA+IG5vdC1za2lwcGVkIHBhdGhzIGluIGRvX2NvbmZpZ3VyZVtmaWxlLWNoZWNrc3Vt
c10gZXZlbiB3aGVuIHRoZXkgZG9uJ3QNCj4gPiA+IGV4aXN0IHlldC4NCj4gPiA+DQo+ID4gPiBX
aWxsIHNlbmQgYSBwYXRjaCBmb3IgdGhpcyBzaG9ydGx5Lg0KPiA+DQo+ID4gQW55IG9iamVjdGlv
bnMgdG8gbXkgcGF0Y2gsIHdoZXJlIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBiYi5lcnJvcigp
DQo+ID4gaW4gdGhlIGZpcnN0IHBsYWNlPw0KPiANCj4gWW91ciBwYXRjaCBlbmNvZGVzIHRoZSBw
YXRocyBvZiBsYXllcnMgcmVsYXRpdmUgdG8gZWFjaCBvdGhlciBpbnRvIHRoZQ0KPiBzc3RhdGUg
Y2hlY2tzdW1zLiBJJ20gbm90IHN1cmUgd2Ugd2FudCB0byBlbmNvdXJhZ2UgdGhhdCBhbmQgdGhp
cyBjb2RlDQo+IHdpbGwgZW5kIHVwIGNvcHkgYW5kIHBhc3RlZCBhcm91bmQgd2l0aG91dCBwZW9w
bGUgcmVhbGlzaW5nIHdoYXQgdGhleSdyZQ0KPiBkb2luZyA6Ly4NCg0KSG1tLCBJIGd1ZXNzIHRo
YXQgbWF5IGJlIGNvbnNpZGVyZWQgYmFkLiA6Lw0KDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQN
Cg0KVGhlbiB3ZSB3aWxsIGhhdmUgdG8gZGVjaWRlIG9uIHdoYXQgdG8gZG8gd2l0aCB0aGUgY3Jv
c3MtZmlsZXMuIEN1cnJlbnRseSANCnRoZSBjb2RlIHRyaWVzIHRvIGhhbmRsZSBjcm9zcy1maWxl
cyBwcm92aWRlZCBieSBhbnkgbGF5ZXIsIGJ1dCB3aXRoIHRoZSANCnJlY2VudCBjaGFuZ2VzIGFu
ZCB3aXRob3V0IG1pbmUgaXQgcmVhbGx5IG9ubHkgc3VwcG9ydHMgc3BlY2lmeWluZyANCmNyb3Nz
LWZpbGVzIGluIHRoZSBzYW1lIGxheWVyIHdoZXJlIHRoZSByZWNpcGUgaXMuIFNvIHdlIHdpbGwg
ZWl0aGVyIGhhdmUgDQp0byBmaW5kIGEgd2F5IHRvIGFjdHVhbGx5IHN1cHBvcnQgY3Jvc3MtZmls
ZXMgZnJvbSBtdWx0aXBsZSBsYXllcnMsIG9yIA0Kd2UgbWF5IGFzIHdlbGwgcmlwIG91dCB0aGUg
Y3VycmVudCBhdHRlbXB0IGF0IHN1cHBvcnRpbmcgaXQuIA0KDQovL1BldGVyDQoNCg==
