Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9FCC433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 01:24:29 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.32484.1638667467249756833
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 17:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=YddgoF5u;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638667467;
  x=1670203467;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Q/sEewAM4isXEh2vf2qjRuSe4Nwv7jA8MlIbfgU8Sq0=;
  b=YddgoF5u+hrT6qwYKYpB8U1xlKHuR8klHbfWvUMVyP5LCJXsuf4nLJ1K
   IHJZr+0KPaF6uKAxt1eS7Rq1AYxEAjH83JmbhXPbCV8ODtBx0OpJTWvMN
   R6aHnPDG/85MIxchgF/7LC2h1U5X11MIYaC9dvjoW2QUvYjrtqBDR4F57
   b1FpJ4udz8qrMAfa+8xuqQTqtu3AkvRO5hK+CvyMgtSk+6xusL9H6xy8H
   cU+wKVwoIr7HOF3yUnDfUmAqz2S0z324oxOuM08J73NFQQnNex8DtfLWu
   A+204VgIdNZb32yZzOZ4U2AutQj1fFHo8zO3mJahHwdhUmzfFCXZnQEhc
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<ross@burtonini.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/6] libxkbcommon: allow building of API
 documentation
Thread-Topic: [OE-core] [PATCH 3/6] libxkbcommon: allow building of API
 documentation
Thread-Index: AQHX6GUUNmRTuaHdV0OSn6la0JmRjawi6UcAgAAyJwA=
Date: Sun, 5 Dec 2021 01:24:24 +0000
Message-ID: <44ecb2fe1e3d42988f77a4074baa8075@axis.com>
References: <20211203164340.2963235-1-ross.burton@arm.com>
	 <20211203164340.2963235-3-ross.burton@arm.com>
 <505b640190d97b7dbcfc306de4c5a357008978a1.camel@linuxfoundation.org>
In-Reply-To: 
 <505b640190d97b7dbcfc306de4c5a357008978a1.camel@linuxfoundation.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 01:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159187

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDUgZGVjZW1i
ZXIgMjAyMSAwMDoyMA0KPiBUbzogUm9zcyBCdXJ0b24gPHJvc3NAYnVydG9uaW5pLmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0ggMy82XSBsaWJ4a2Jjb21tb246IGFsbG93IGJ1aWxkaW5nIG9mIEFQSSBk
b2N1bWVudGF0aW9uDQo+IA0KPiBPbiBGcmksIDIwMjEtMTItMDMgYXQgMTY6NDMgKzAwMDAsIFJv
c3MgQnVydG9uIHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1s
aWIvbGlieGtiY29tbW9uXzEuMy4xLmJiIHwgNyArKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjMuMS5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4zLjEuYmINCj4gPiBp
bmRleCA5NWFjY2ZjMTg0Li43MjVmY2YwMDllIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4zLjEuYmINCj4gPiArKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuMy4xLmJiDQo+ID4gQEAg
LTE1LDExICsxNSwxNCBAQCBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3hrYmNvbW1vbi5v
cmcvIg0KPiA+DQo+ID4gIGluaGVyaXQgbWVzb24gcGtnY29uZmlnDQo+ID4NCj4gPiAtRVhUUkFf
T0VNRVNPTiA9ICItRGVuYWJsZS1kb2NzPWZhbHNlIC1EZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNl
Ig0KPiA+ICtFWFRSQV9PRU1FU09OID0gIi1EZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNlIg0KPiA+
DQo+ID4gIFBBQ0tBR0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRV
UkVTJywgJ3gxMSB3YXlsYW5kJywgZCl9Ig0KPiA+IC1QQUNLQUdFQ09ORklHW3gxMV0gPSAiLURl
bmFibGUteDExPXRydWUsLURlbmFibGUteDExPWZhbHNlLGxpYnhjYiB4a2V5Ym9hcmQtY29uZmln
LCINCj4gPiArUEFDS0FHRUNPTkZJRzphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiAke0BiYi51dGls
cy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2FwaS1kb2N1bWVudGF0aW9uJywgJ2RvY3Mn
LCAnJywgZCl9Ig0KPiA+ICsNCj4gPiArUEFDS0FHRUNPTkZJR1tkb2NzXSA9ICItRGVuYWJsZS1k
b2NzPXRydWUsLURlbmFibGUtZG9jcz1mYWxzZSxkb3h5Z2VuLW5hdGl2ZSINCj4gPiAgUEFDS0FH
RUNPTkZJR1t3YXlsYW5kXSA9ICItRGVuYWJsZS13YXlsYW5kPXRydWUsLURlbmFibGUtd2F5bGFu
ZD1mYWxzZSx3YXlsYW5kLW5hdGl2ZSB3YXlsYW5kIHdheWxhbmQtcHJvdG9jb2xzLCINCj4gPiAr
UEFDS0FHRUNPTkZJR1t4MTFdID0gIi1EZW5hYmxlLXgxMT10cnVlLC1EZW5hYmxlLXgxMT1mYWxz
ZSxsaWJ4Y2IgeGtleWJvYXJkLWNvbmZpZywiDQo+ID4NCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvMTA4L2J1aWxkcy8yMzk2L3N0
ZXBzLzExL2xvZ3MvZXJyb3JzDQo+IA0KPiBzdGRpbzogRVJST1I6IE5vdGhpbmcgUFJPVklERVMg
J2RveHlnZW4tbmF0aXZlJyAoYnV0IC9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdXg4
Ni13b3JsZC1hbHQvYnVpbGQvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNv
bW1vbl8xLjMuMS5iYiwNCj4gdmlydHVhbDptdWx0aWxpYjpsaWIzMjovaG9tZS9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL3FlbXV4ODYtd29ybGQtYWx0L2J1aWxkL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS4zLjEuYmIgREVQRU5EUyBvbg0KPiBvciBvdGhlcndp
c2UgcmVxdWlyZXMgaXQpLiBDbG9zZSBtYXRjaGVzOg0KPiANCj4gTm90IHF1aXRlIHN1cmUgd2hh
dCBpcyBnb2luZyBvbiB0aGVyZSB5ZXQsIHNlZW1zIGEgbGl0dGxlIHN0cmFuZ2UuDQoNCk5vdCB2
ZXJ5IHN0cmFuZ2Ugd2hlbiB5b3UgY29uc2lkZXIgdGhhdCB0aGUgZG94eWdlbiByZWNpcGUgaXMg
aW4gbWV0YS1vZS4uLi4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCg0KLy9Q
ZXRlcg0KDQo=

