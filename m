Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1885C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 21:57:52 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.2259.1653343064159670014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 14:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=ADnHbKFw;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1653343064;
  x=1684879064;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ywjk5+SqDMiGVbp1FQaBZf0yel3hIAHwg5xbGf8DrNU=;
  b=ADnHbKFwLHWZAD6UvNcWySJkn5TADTs4IuA109E55u3rcr6/wS6wi2Au
   9FGfaPAjF1LlWyLXiAjD+X88nrutYRV3NFkLzhktjGUpS623yFm+zonK7
   7lj+3CKVgggD4Wht1GXu270W/Z70iyX5KuAy3uwvxzTX46mQnDrXWJRtn
   UwDQcHsbZvoNi+JOk8meFY8P4gmlRj+C3CjkYZUHeVhTymD0xjul+EHRB
   I+cVRDdSsUVJfmCJn1dsLFV/P4oPM9nIKLOwNTpYduGzfvOu3qW+jtOZb
   1J6tyrqKYWJLgRzdVAQYFtMkOhAmvVzOQ9psF0m6Lb4s4WggSDnmIqvyU
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [master][kirkstone][PATCH] license_image.bbclass: Make
 QA errors fail the build
Thread-Topic: [OE-core] [master][kirkstone][PATCH] license_image.bbclass: Make
 QA errors fail the build
Thread-Index: AQHYWyZkvfyrxJY3Xk+PG76v/9wJD60GipNggCae4/A=
Date: Mon, 23 May 2022 21:57:41 +0000
Message-ID: <9323e409d22b4c56a8e8a0456cc1e27f@axis.com>
References: <20220421211146.19368-1-pkj@axis.com>
 <CAGDS+nke8qEOh8XX5x9Jej7x57DjDuW5s=hyd8U099-Ez6A3Yg@mail.gmail.com>
 <16EA4FAF914EDF73.11702@lists.openembedded.org>
In-Reply-To: <16EA4FAF914EDF73.11702@lists.openembedded.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 21:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166041

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFBldGVyIEtqZWxsZXJzdGVkdA0KPiBTZW50OiBkZW4g
MjkgYXByaWwgMjAyMiAxMDoxMA0KPiBUbzogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5j
b20+DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXll
ciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW21hc3Rlcl1ba2lya3N0b25lXVtQQVRDSF0gbGljZW5zZV9pbWFn
ZS5iYmNsYXNzOg0KPiBNYWtlIFFBIGVycm9ycyBmYWlsIHRoZSBidWlsZA0KPiANCj4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNh
a29tYW4uY29tPg0KPiA+IFNlbnQ6IGRlbiAyOCBhcHJpbCAyMDIyIDE5OjM2DQo+ID4gVG86IFBl
dGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IENjOiBQ
YXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVk
ZGVkLQ0KPiA+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFttYXN0ZXJdW2tpcmtzdG9uZV1bUEFUQ0hdIGxpY2Vuc2VfaW1hZ2UuYmJjbGFz
czoNCj4gPiBNYWtlIFFBIGVycm9ycyBmYWlsIHRoZSBidWlsZA0KPiA+DQo+ID4gSSBoYXZlbid0
IHNlZW4gdGhpcyBwYXRjaCBoaXQgbWFzdGVyIG9yIG1hc3Rlci1uZXh0IHlldC4gIFdlcmUgdGhl
cmUNCj4gPiBpc3N1ZXMgd2l0aCBpdD8NCj4gPg0KPiA+IEp1c3Qgd2FudCB0byBtYWtlIHN1cmUg
SSBkb24ndCBtaXNzIGFueXRoaW5nIHJlcXVlc3RlZCBmb3Iga2lya3N0b25lLg0KPiA+DQo+ID4g
U3RldmUNCj4gDQo+IEl0IGlzIGluIG1hc3Rlci1uZXh0IG5vdyBzbyBJIGFzc3VtZSBpdCB3aWxs
IG1ha2UgaXQgdG8gbWFzdGVyIHNvb24uDQo+IA0KPiAvL1BldGVyDQoNCkkgZ3Vlc3MgeW91IG1p
c3NlZCBpdCBzaW5jZSBpdCBkaWRuJ3QgbWFrZSA0LjAuMS4uLiA7KQ0KDQovL1BldGVyDQoNCj4g
PiBPbiBUaHUsIEFwciAyMSwgMjAyMiBhdCAxMToxMSBBTSBQZXRlciBLamVsbGVyc3RlZHQgPHBl
dGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSWYsIGUuZy4s
IGxpY2Vuc2UtZmlsZS1taXNzaW5nIGlzIGFkZGVkIHRvIEVSUk9SX1FBLCB0aGVuIHRoZSBidWls
ZA0KPiA+ID4gc2hvdWxkIGZhaWwgaWYgYW55IGxpY2Vuc2VzIGFyZSBtaXNzaW5nLg0KPiA+ID4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0
ZWR0QGF4aXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgbWV0YS9jbGFzc2VzL2xpY2Vuc2VfaW1h
Z2UuYmJjbGFzcyB8IDIgKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9saWNlbnNlX2ltYWdlLmJi
Y2xhc3MgYi9tZXRhL2NsYXNzZXMvbGljZW5zZV9pbWFnZS5iYmNsYXNzDQo+ID4gPiBpbmRleCA3
ZTFkMGUwOGE5Li4zMjEzZWE3NThlIDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2xp
Y2Vuc2VfaW1hZ2UuYmJjbGFzcw0KPiA+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2xpY2Vuc2VfaW1h
Z2UuYmJjbGFzcw0KPiA+ID4gQEAgLTEwNCw2ICsxMDQsOCBAQCBkZWYgd3JpdGVfbGljZW5zZV9m
aWxlcyhkLCBsaWNlbnNlX21hbmlmZXN0LCBwa2dfZGljLCByb290ZnM9VHJ1ZSk6DQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlRoZSBsaWNlbnNlIGxpc3Rl
ZCAlcyB3YXMgbm90IGluIHRoZSAiXA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJsaWNlbnNlcyBjb2xsZWN0ZWQgZm9yIHJlY2lwZSAlcyINCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlIChsaWMsIHBrZ19kaWNbcGtn
XVsiUE4iXSksIGQpDQo+ID4gPiArICAgIG9lLnFhLmV4aXRfaWZfZXJyb3JzKGQpDQo+ID4gPiAr
DQo+ID4gPiAgICAgICMgVHdvIG9wdGlvbnMgaGVyZToNCj4gPiA+ICAgICAgIyAtIEp1c3QgY29w
eSB0aGUgbWFuaWZlc3QNCj4gPiA+ICAgICAgIyAtIENvcHkgdGhlIG1hbmlmZXN0IGFuZCB0aGUg
bGljZW5zZSBkaXJlY3Rvcmllcw0KDQo=

