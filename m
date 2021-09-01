Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.9233.1630507618772475351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 07:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kMPl17xk;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630507619;
  x=1662043619;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nImGbTLHXjRITT+mjW8LxbbDpcUz2iZtLRixUqABI8o=;
  b=kMPl17xkqmcZJ48uHdeSDI5cwTXwbkzmZ2rWI8730FUjFJwShDizlzfG
   4yUah61FlPYdJqpkVl5oRU5Vym1MU1bxpl3hZEfbm67b/X3yFQdp/EkQu
   1GpoSdITRwnhc4rp18+OV2jnqZV7PFYsrgCMUYNnuN+dcCBTIa/LVWXKU
   ySSRB/UMGebtODCpcoSD9W5wU/ZMR9OnBZIRmiRpBNcYQrOZIgKoNwMRw
   SxhP9SiuCS9copuYw8ZsL94kFi44s0WX4WqvW4kCp3Bbw5r4nDyh44UKj
   r6lG5CcBjBm3OkR6HcwlKyquPaQp1Hz8QNOHdWejICYk09hzYbp0hPsbN
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Michael Opdenacker
	<michael.opdenacker@bootlin.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES and RDEPENDS
Thread-Topic: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES and
 RDEPENDS
Thread-Index: AQHXnxKfQir5hwvro0alsVCES6aZLquPCXkAgAA1MwA=
Date: Wed, 1 Sep 2021 14:46:48 +0000
Message-ID: <f6c7916efaf24021815101c3b0086782@axis.com>
References: <20210901092020.116142-1-michael.opdenacker@bootlin.com>
 <CADkTA4NCnTW5Zx=UJ9Lk0szNdJqENZyZL=pNJVmMXanBHEYr6A@mail.gmail.com>
In-Reply-To: <CADkTA4NCnTW5Zx=UJ9Lk0szNdJqENZyZL=pNJVmMXanBHEYr6A@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEJydWNlIEFzaGZpZWxkDQo+IFNlbnQ6IGRlbiAxIHNl
cHRlbWJlciAyMDIxIDE1OjI0DQo+IFRvOiBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3Bk
ZW5hY2tlckBib290bGluLmNvbT4NCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0
IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG1ldGE6IHN0b3AgdXNp
bmcgInZpcnR1YWwvIiBpbiBSUFJPVklERVMNCj4gYW5kIFJERVBFTkRTDQo+IA0KPiBPbiBXZWQs
IFNlcCAxLCAyMDIxIGF0IDU6MjAgQU0gTWljaGFlbCBPcGRlbmFja2VyDQo+IDxtaWNoYWVsLm9w
ZGVuYWNrZXJAYm9vdGxpbi5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRml4ZXMgW1lPQ1RPICMxNDUz
OF0NCj4gPg0KPiA+IFJlY2lwZXMgc2hvdWxkbid0IHVzZSB0aGUgInZpcnR1YWwvIiBzdHJpbmcg
aW4gUlBST1ZJREVTIGFuZCBSREVQRU5EUy4NCj4gPg0KPiA+IFRoYXQncyBjb25mdXNpbmcgYmVj
YXVzZSAidmlydHVhbC8iIGhhcyBubyBzcGVjaWFsIG1lYW5pbmcgaW4NCj4gPiBSUFJPVklERVMg
YW5kIFJERVBFTkRTICh1bmxpa2UgaW4gUFJPVklERVMgYW5kIERFUEVORFMpLg0KPiA+DQo+ID4g
SW5zdGVhZCwgdXNpbmcgInZpcnR1YWwtIiBpbnN0ZWFkIG9mICJ2aXJ0dWFsLyINCj4gPiBhcyBh
bHJlYWR5IGRvbmUgaW4gdGhlIGdsaWJjIHJlY2lwZS4NCj4gDQo+IFdlIGhhdmUgcXVpdGUgYSBm
ZXcgY2FzZXMgaW4gbWV0YS12aXJ0dWFsaXphdGlvbiwgd2hlcmUgdGhlIHNhbWUNCj4gdW5jbGVh
ciBzeW50YXggaXMgdXNlZC4NCj4gDQo+IEkgY2FuIHRha2UgY2FyZSBvZiB1cGRhdGluZyBpdCwg
aWYgeW91IGFyZW4ndCBsb29raW5nIGF0IGl0IGFscmVhZHkuDQo+IA0KPiBCcnVjZQ0KDQpDYW4g
YW55b25lIGVubGlnaHRlbiBtZSB0byB3aGF0IGJlbmVmaXQgY2hhbmdpbmcgInZpcnR1YWwvIiB0
byANCiJ2aXJ0dWFsLSIgZm9yIHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGdpdmVzPyBBRkFJVSwgdGhp
cyBtYWtlcyBubyANCnRlY2huaWNhbCBkaWZmZXJlbmNlIGFuZCBldmVyeXRoaW5nIHdpbGwgc3Rp
bGwgd29yayBleGFjdGx5IGFzIA0KYmVmb3JlLCBidXQgd2l0aCBhIGRpZmZlcmVudCBwcm92aWRl
ZCBuYW1lLg0KDQpJZiB5b3UgdGhlbiBoYXZlIHZpcnR1YWwvZm9vIGZvciBidWlsZCBkZXBlbmRl
bmNpZXMgYW5kIHZpcnR1YWwtZm9vIA0KZm9yIHRoZSBjb3JyZXNwb25kaW5nIHJ1bnRpbWUgZGVw
ZW5kZW5jaWVzLCB0aGVuIEkgb25seSBzZWUgaW5jcmVhc2VkIA0KY29uZnVzaW9uIHdpdGggYSBj
aGFuZ2UgbGlrZSB0aGlzLg0KDQpBbmQgeWVzLCBJIGtub3cgYWJvdXQgdGhlIHByb2JsZW1zIHdp
dGggdmlydHVhbCBydW50aW1lIGRlcGVuZGVuY2llcywgDQpidXQgaW4gbXkgZXhwZXJpZW5jZSwg
YXMgbG9uZyBhcyB5b3UgZG8gbm90IHRyeSB0byBjcmVhdGUgYSBnbG9iYWwgDQpwYWNrYWdlIHJl
cG9zaXRvcnkgd2l0aCBwYWNrYWdlcyBmcm9tIG11bHRpcGxlIGJ1aWxkcywgYnV0IG9ubHkgdXNl
IA0KdGhlIHBhY2thZ2VzIGNyZWF0ZWQgYnkgYml0YmFrZSB0byBnZW5lcmF0ZSBhbiBpbWFnZSwg
dGhleSB3b3JrIGFzIA0KZXhwZWN0ZWQuDQoNCi8vUGV0ZXINCg0K
