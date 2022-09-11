Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B46ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 08:44:21 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.8232.1662885856182960138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 01:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ore/ld7E;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662885856;
  x=1694421856;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9qXo2BSlntiRYKeU92L9YhGQRfmLjNBETqZnaX7hVhQ=;
  b=ore/ld7EhJWZWPiKgELfWLfYT34U7b+yd7iPbZ0jvjZRY8hjxaQWyOig
   DhV4yEV6K1hjCUpGCIY3zdY8FDyshzB7DJTAYKzP1vQVV668ksiKRwA05
   G5T2Y9B8Fxu++LJMCAMIRNBcIlIxfplUOHTQ23E9Sx80AoOiRvo8LJPtI
   1M+arJyfhZyrz7jX94g/21fRdmIqy6FP/TrzB7i0+7CGAn7owfyeP8/6m
   +vSGlwfOlA0sF01pSsNH655ojZzeKVyDU26+V8auICoLLhCUw9l7SohdP
   09dYNRY8LoRAJqLzAqz37l0zS4PwFjHXzxY3oJRhbh+EduU1htdr4nutt
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<ross.burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "nd@arm.com" <nd@arm.com>
Subject: RE: [OE-core] [PATCH][honister] mobile-broadband-provider-info:
 update branch name in SRC_URI
Thread-Topic: [OE-core] [PATCH][honister] mobile-broadband-provider-info:
 update branch name in SRC_URI
Thread-Index: AQHYxDhBSWKrmNOsOkCzIwsMjcrYmK3W0mEAgAMXreCAAAI2AA==
Date: Sun, 11 Sep 2022 08:44:14 +0000
Message-ID: <5cb8de593faa40af9f49a615c6fa028b@axis.com>
References: <20220909103754.3036413-1-ross.burton@arm.com>
 <1b7fce81bcc901c50f7a5042fb2bb94a81839896.camel@linuxfoundation.org>
 <1713C17E1A3F1A25.13191@lists.openembedded.org>
In-Reply-To: <1713C17E1A3F1A25.13191@lists.openembedded.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 08:44:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170516

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IFNlbnQ6IGRlbiAxMSBz
ZXB0ZW1iZXIgMjAyMiAxMDozNw0KPiBUbzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IG5kQGFybS5j
b20NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdW2hvbmlzdGVyXSBtb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm86IHVwZGF0ZSBicmFuY2ggbmFtZSBpbiBTUkNfVVJJDQo+IA0K
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+ID4gU2VudDogZGVuIDkg
c2VwdGVtYmVyIDIwMjIgMTM6MjENCj4gPiBUbzogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gQ2M6
IG5kQGFybS5jb20NCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF1baG9uaXN0ZXJd
IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mbzogdXBkYXRlIGJyYW5jaCBuYW1lIGluIFNS
Q19VUkkNCj4gPg0KPiA+IE9uIEZyaSwgMjAyMi0wOS0wOSBhdCAxMTozNyArMDEwMCwgUm9zcyBC
dXJ0b24gd3JvdGU6DQo+ID4gPiBUaGUgbWFzdGVyIGJyYW5jaCBoYXMgYmVlbiByZW5hbWVkIHRv
IG1haW4gYW5kIG5vdyBtYXN0ZXIgbm8gbG9uZ2VyDQo+ID4gPiBleGlzdHMsIHNvIGZldGNoZXMg
dGhhdCBkb24ndCB1c2UgYSBzb3VyY2UgbWlycm9yIHdpbGwgZmFpbC4NCj4gPiA+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gPiA+IC0t
LQ0KPiA+ID4gIC4uLi9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fZ2l0LmJiICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJy
b2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXIt
aW5mb19naXQuYmINCj4gPiA+IGluZGV4IDQyNDZmNGRjYmQzLi4zYjE3MGY0ZmRkMiAxMDA2NDQN
Cj4gPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9iaWxlLWJyb2FkYmFuZC1w
cm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb19naXQuYmINCj4gPiA+
ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRl
ci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb19naXQuYmINCj4gPiA+IEBAIC04
LDcgKzgsNyBAQCBTUkNSRVYgPSAiMTFmMjI0N2VjY2QzYzE2MWI4ZmQ5YjQxMTQzODYyZTlmYjgx
MTkzYyINCj4gPiA+ICBQViA9ICIyMDIxMDgwNSINCj4gPiA+ICBQRSA9ICIxIg0KPiA+ID4NCj4g
PiA+IC1TUkNfVVJJID0gImdpdDovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbW9iaWxlLWJyb2Fk
YmFuZC1wcm92aWRlci1pbmZvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIg0KPiA+
ID4gK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tb2JpbGUtYnJvYWRi
YW5kLXByb3ZpZGVyLWluZm8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIg0KPiA+ID4g
IFMgPSAiJHtXT1JLRElSfS9naXQiDQo+ID4gPg0KPiA+ID4gIGluaGVyaXQgYXV0b3Rvb2xzDQo+
ID4NCj4gPiBUaGUgdHJvdWJsZSBpcyBpZiBJIG1lcmdlZCB0aGlzLCBpdCB3b3VsZCBvcGVuIHRo
ZSBmbG9vZGdhdGVzIG9uIG90aGVyDQo+ID4gcGF0Y2hlcy4uLg0KPiA+DQo+ID4gQ2hlZXJzLA0K
PiA+DQo+ID4gUmljaGFyZA0KPiANCj4gQnV0IGlzbid0IGhhdmluZyBhIHJlY2lwZSB0cnlpbmcg
dG8gZmV0Y2ggc29tZXRoaW5nIHRoYXQgZG9lc24ndCBleGlzdA0KPiBjb25zaWRlcmVkIGEgYnVn
PyBBbmQgdGh1cyBpdCBzaG91bGQgYmUgb2sgdG8gbWVyZ2UgZXZlbiBpbiBmZWF0dXJlIGZyZWV6
ZS4NCj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gDQo+IC8vUGV0ZXINCg0KQW5kIHdo
YXQgSSB3YXMgbWlzc2luZyB3YXMgb2YgY291cnNlIHRoYXQgdGhpcyB3YXMgcmVsYXRlZCB0byBI
b25pc3RlciBhbmQgDQpub3QgbWFzdGVyLiBEdWguDQoNCi8vUGV0ZXINCg==

