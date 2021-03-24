Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.157.1616627104433855507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 16:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kCI7cHbV;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616627104;
  x=1648163104;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o/uIlgWxCqZ79yTy7+ixqMOeeM9b9GwFRNPasKIQJtE=;
  b=kCI7cHbVeFCPfZdxMctu2fsmlrOkRQEgO5KZmlTWuQF9489Q1kh1ZNc1
   VoY3/eSiFmVj+9SWm3uj6xjoqHKlejjAKPLHrz6hRoK5BUAIa7JE8lyvW
   UibeKZip6IDe4HYZKTIlV5dtF1cHYYEAFXks/P3OKfmf/xMba8aov1oJi
   jU5SYzkpA+DAEmJoxdM79jLpMngtvAYXEtqfQAlNj89l4UxxL4RqIZt6s
   yZWUwnyebvZ6ZYV/k7dPTUSnd59/FpHnVU7vWj13FjKBPxehok+OTrgjp
   60rN6xJKpEpLsOy80GLdNJFjmBmz2D/vX7CgtqqX66tAPMbxxl3IMPPAF
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Luca Bocassi
	<luca.boccassi@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "scott.branden@broadcom.com" <scott.branden@broadcom.com>
Subject: Re: [OE-core] [PATCH] util-linux-uuid: include /usr/lib/debug in FILES_util-linux-libuuid-dbg
Thread-Topic: [OE-core] [PATCH] util-linux-uuid: include /usr/lib/debug in
 FILES_util-linux-libuuid-dbg
Thread-Index: AQHXINBNy/ClvzCsikGEp8mJ947F8aqTrJ8AgAAUMjA=
Date: Wed, 24 Mar 2021 23:05:02 +0000
Message-ID: <64afe6af8f274ef1800dfb286a2f0217@XBOX03.axis.com>
References: <20210324170722.566059-1-luca.boccassi@gmail.com>
 <17537f6de5412295e31f8130acb0aec0e4fdebf7.camel@linuxfoundation.org>
In-Reply-To: <17537f6de5412295e31f8130acb0aec0e4fdebf7.camel@linuxfoundation.org>
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
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiAyNCBt
YXJzIDIwMjEgMjM6NDYNCj4gVG86IEx1Y2EgQm9jYXNzaSA8bHVjYS5ib2NjYXNzaUBnbWFpbC5j
b20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzog
c2NvdHQuYnJhbmRlbkBicm9hZGNvbS5jb20NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFU
Q0hdIHV0aWwtbGludXgtdXVpZDogaW5jbHVkZSAvdXNyL2xpYi9kZWJ1ZyBpbg0KPiBGSUxFU191
dGlsLWxpbnV4LWxpYnV1aWQtZGJnDQo+IA0KPiBPbiBXZWQsIDIwMjEtMDMtMjQgYXQgMTc6MDcg
KzAwMDAsIEx1Y2EgQm9jYXNzaSB3cm90ZToNCj4gPiBGcm9tOiBMdWNhIEJvY2Nhc3NpIDxsdWNh
LmJvY2Nhc3NpQG1pY3Jvc29mdC5jb20+DQo+ID4NCj4gPiBBcHBhcmVudGx5IHNvbWUgdXNlcnMg
aGF2ZSAvdXNyL2xpYi9kZWJ1ZyBpbnN0ZWFkIG9mIC91c3IvbGliLy5kZWJ1Zw0KPiA+IHNvIGFk
ZCBpdCB0byB0aGUgRklMRVMgbWF0Y2hpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNh
IEJvY2Nhc3NpIDxsdWNhLmJvY2Nhc3NpQG1pY3Jvc29mdC5jb20+DQo+ID4gLS0tDQo+ID4gwqBt
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtdXVpZF8yLjM2LjIuYmIgfCAy
ICstDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgtdXVpZF8yLjM2LjIuYmINCj4gYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgtdXVpZF8yLjM2LjIuYmINCj4gPiBpbmRleCA2NWU0ZDIzYjdlLi4xZmYzN2E0ZGNi
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC11dWlkXzIuMzYuMi5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC11dWlkXzIuMzYuMi5iYg0KPiA+IEBAIC0xMSw3ICsxMSw3IEBAIFBBQ0tBR0VT
ID0gInV0aWwtbGludXgtbGlidXVpZCB1dGlsLWxpbnV4LWxpYnV1aWQtZGV2DQo+IHV0aWwtbGlu
dXgtbGlidXVpZC1zdGF0aWNkDQo+ID4gwqBGSUxFU191dGlsLWxpbnV4LWxpYnV1aWQgPSAiJHts
aWJkaXJ9L2xpYnV1aWQuc28uKiINCj4gPiDCoEZJTEVTX3V0aWwtbGludXgtbGlidXVpZC1kZXYg
PSAiJHtsaWJkaXJ9L2xpYnV1aWQuc28gJHtpbmNsdWRlZGlyfQ0KPiAke2xpYmRpcn0vcGtnY29u
ZmlnIg0KPiA+IMKgRklMRVNfdXRpbC1saW51eC1saWJ1dWlkLXN0YXRpY2RldiA9ICIke2xpYmRp
cn0vbGlidXVpZC5hIg0KPiA+IC1GSUxFU191dGlsLWxpbnV4LWxpYnV1aWQtZGJnID0gIi91c3Iv
c3JjICR7bGliZGlyfS8uZGVidWciDQo+ID4gK0ZJTEVTX3V0aWwtbGludXgtbGlidXVpZC1kYmcg
PSAiL3Vzci9zcmMgJHtsaWJkaXJ9Ly5kZWJ1ZyAke2xpYmRpcn0vZGVidWciDQoNClRoaXMgaXMg
dGhlIG9ubHkgb2NjdXJyZW5jZSBvZiAke2xpYmRpcn0vZGVidWcgaW4gT0UtQ29yZS4gV2h5IGlz
IGl0IG5lZWRlZCANCmhlcmUgaWYgaXQgaXMgYSBnZW5lcmljIHRoaW5nLCB3aGVuIGl0IGlzIG5v
dCBuZWVkZWQgYW55d2hlcmUgZWxzZT8NCiANCj4gSXMgdGhlcmUgYSByZWFzb24gdGhlIHJlY2lw
ZSBpcyBjYWxsZWQgInV0aWwtbGludXgtdXVpZCIgeWV0IGl0IHdhbnRzDQo+IHRvIGJlICJ1dGls
LWxpbnV4LWxpYnV1aWQiPyBJIHN1c3BlY3QgaWYgd2UgY2FuIHJlbmFtZSBpdCwgc29tZSBvZg0K
PiB0aGlzIGp1Z2dsaW5nIGdvZXMgYXdheS4NCg0KRm9yIHdoYXQgaXQncyB3b3J0aCwgaXQgc2Vl
bXMgdGhlIHBhY2thZ2VzIGVuZCB1cCBhcyBsaWJ1dWlkMSwgbGlidXVpZC1kYmcgDQphbmQgbGli
dXVpZC1kZXYgYW55d2F5LiBCdXQgdXRpbC1saW51eC11dWlkLXNyYyByZXRhaW5zIGl0cyBvcmln
aW5hbCBuYW1lIA0KKG5vdCBzdXJlIGlmIHRoYXQgaXMgYSBidWcgb3Igd29ya2luZyBhcyBpbnRl
bmRlZCkuDQogDQo+IElkZWFsbHkgcmVjaXBlcyBzaG91bGRuJ3QgYmUgbmVlZGluZyB0byBvdmVy
cmlkZSB0aGUgZGVmYXVsdHMgZm9yDQo+IFBBQ0tBR0VTIGFuZCBGSUxFUy4gSSBqdXN0IHRyaWVk
IGEgdGVzdCBidWlsZCB3aXRoIGEgbG90IG9mIHRoaXMgc3RyaXBwZWQNCj4gYXdheSBhbmQgaXRz
IHNlZWluZyBpc3N1ZXMgd2l0aCB0aGUgLWRldiBwYWNrYWdlIGJ1dCBldmVuIGFkZGluZyBhbg0K
PiBSUFJPVklERVMgZm9yIHRoYXQgd291bGQgYmUgYmV0dGVyIHRoYW4gYWxsIHRoZSBhYm92ZSBv
dmVycmlkZXMuLi4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KLy9QZXRlcg0KDQoN
Cg==
