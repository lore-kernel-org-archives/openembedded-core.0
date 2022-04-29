Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E2EC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 08:10:36 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7577.1651219827641062953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 01:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eSrNc3py;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651219828;
  x=1682755828;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3UHTYJkeavZQKk7PQpJB2qIYBBrB8p4NfJewrP6YFDQ=;
  b=eSrNc3pyYhdRNqjRB3B6fGik6ZedERksQK1KLh2ac6R/PmT5McdZpEZs
   v7lFYiGmm0+INij4E7gCmpZMf5JQAEI/5CXXsVknWsrjFuEvMoQyCwMui
   MnT8DO36XfU+f+2IGvGLumNCwTOr7GsxRPmdd6WG3Gd1QzBHztwwjqvYc
   IfsfnLJdbGiDfL2Ha3wk1cxYPmY927mrPQcWmGQ4AEmL4A/JqIZsMCN3z
   UrIu4W0rH+giEbt1HlVowEwRwPQjB1oD+ZKo2gKA99F6Uqkx3K2h0JrJu
   yqPXhPEBuIDIruJJIR9rxP3gtjy+y//Lky90b0us37RDZso27FBXz+hLk
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [master][kirkstone][PATCH] license_image.bbclass: Make
 QA errors fail the build
Thread-Topic: [OE-core] [master][kirkstone][PATCH] license_image.bbclass: Make
 QA errors fail the build
Thread-Index: AQHYWyZkvfyrxJY3Xk+PG76v/9wJD60GipNg
Date: Fri, 29 Apr 2022 08:10:24 +0000
Message-ID: <944ea3961d8c4fa5a68f647a538dc767@axis.com>
References: <20220421211146.19368-1-pkj@axis.com>
 <CAGDS+nke8qEOh8XX5x9Jej7x57DjDuW5s=hyd8U099-Ez6A3Yg@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nke8qEOh8XX5x9Jej7x57DjDuW5s=hyd8U099-Ez6A3Yg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 08:10:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164999

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZSBTYWtvbWFuIDxzdGV2
ZUBzYWtvbWFuLmNvbT4NCj4gU2VudDogZGVuIDI4IGFwcmlsIDIwMjIgMTk6MzYNCj4gVG86IFBl
dGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBDYzogUGF0
Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRl
ZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFttYXN0ZXJdW2tpcmtzdG9uZV1bUEFUQ0hdIGxpY2Vuc2VfaW1hZ2UuYmJjbGFzczoNCj4g
TWFrZSBRQSBlcnJvcnMgZmFpbCB0aGUgYnVpbGQNCj4gDQo+IEkgaGF2ZW4ndCBzZWVuIHRoaXMg
cGF0Y2ggaGl0IG1hc3RlciBvciBtYXN0ZXItbmV4dCB5ZXQuICBXZXJlIHRoZXJlDQo+IGlzc3Vl
cyB3aXRoIGl0Pw0KPiANCj4gSnVzdCB3YW50IHRvIG1ha2Ugc3VyZSBJIGRvbid0IG1pc3MgYW55
dGhpbmcgcmVxdWVzdGVkIGZvciBraXJrc3RvbmUuDQo+IA0KPiBTdGV2ZQ0KDQpJdCBpcyBpbiBt
YXN0ZXItbmV4dCBub3cgc28gSSBhc3N1bWUgaXQgd2lsbCBtYWtlIGl0IHRvIG1hc3RlciBzb29u
Lg0KDQovL1BldGVyDQoNCj4gDQo+IE9uIFRodSwgQXByIDIxLCAyMDIyIGF0IDExOjExIEFNIFBl
dGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToN
Cj4gPg0KPiA+IElmLCBlLmcuLCBsaWNlbnNlLWZpbGUtbWlzc2luZyBpcyBhZGRlZCB0byBFUlJP
Ul9RQSwgdGhlbiB0aGUgYnVpbGQNCj4gPiBzaG91bGQgZmFpbCBpZiBhbnkgbGljZW5zZXMgYXJl
IG1pc3NpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBl
dGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jbGFzc2VzL2xp
Y2Vuc2VfaW1hZ2UuYmJjbGFzcyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9saWNlbnNlX2ltYWdl
LmJiY2xhc3MNCj4gYi9tZXRhL2NsYXNzZXMvbGljZW5zZV9pbWFnZS5iYmNsYXNzDQo+ID4gaW5k
ZXggN2UxZDBlMDhhOS4uMzIxM2VhNzU4ZSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NsYXNzZXMv
bGljZW5zZV9pbWFnZS5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2xpY2Vuc2VfaW1h
Z2UuYmJjbGFzcw0KPiA+IEBAIC0xMDQsNiArMTA0LDggQEAgZGVmIHdyaXRlX2xpY2Vuc2VfZmls
ZXMoZCwgbGljZW5zZV9tYW5pZmVzdCwNCj4gcGtnX2RpYywgcm9vdGZzPVRydWUpOg0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiVGhlIGxpY2Vuc2UgbGlzdGVk
ICVzIHdhcyBub3QNCj4gaW4gdGhlICJcDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJsaWNlbnNlcyBjb2xsZWN0ZWQgZm9yIHJlY2lwZQ0KPiAlcyINCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJSAobGljLCBwa2dfZGljW3Br
Z11bIlBOIl0pLCBkKQ0KPiA+ICsgICAgb2UucWEuZXhpdF9pZl9lcnJvcnMoZCkNCj4gPiArDQo+
ID4gICAgICAjIFR3byBvcHRpb25zIGhlcmU6DQo+ID4gICAgICAjIC0gSnVzdCBjb3B5IHRoZSBt
YW5pZmVzdA0KPiA+ICAgICAgIyAtIENvcHkgdGhlIG1hbmlmZXN0IGFuZCB0aGUgbGljZW5zZSBk
aXJlY3Rvcmllcw0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzE2NDc2Nik6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTY0NzY2DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTA2MTU1ODIvMzYxNzYwMQ0KPiA+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL3Vuc3ViDQo+IFtzYWtvbWFuQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiA+DQo=

