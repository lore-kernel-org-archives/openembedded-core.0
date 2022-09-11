Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8718AECAAA1
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 08:37:21 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.8197.1662885432955648920
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 01:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FiUYnMo1;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662885434;
  x=1694421434;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V1FkfCSFknkgklwLVehsFojUxXTQ2GfwdkqJYmFopdM=;
  b=FiUYnMo1t01h5t+7B1i7K+7M5DTPb7eTa0dEMID2UDMUYueuCH3fYz/b
   rVEePSLEAalrWFdv2WmYgYkwSUh3Ypfq6YONzmqqslF65PPPfBxstSd2o
   d28wldzLIPYlOwTsIZ8uaj7GeBThPp5pety3gmmx3OP62Vw9EHD/nw4N3
   W4Y5fUdaz8sYgrCvLq5+VcYVGBHSmm5lVDVr8rERJyzfQ9VEu7FwXcYy0
   kecAOYvxPWCGsBsCCsaTeoz/jc9h/Y8gsWhvY5L8Z45dp9JKe4oz2NIOm
   waDbdLbJzO88Lf7mbk520rGtU2z4WtvnP5oP7Y25JJnACsFbqS2Qgw45I
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<ross.burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "nd@arm.com" <nd@arm.com>
Subject: RE: [OE-core] [PATCH][honister] mobile-broadband-provider-info:
 update branch name in SRC_URI
Thread-Topic: [OE-core] [PATCH][honister] mobile-broadband-provider-info:
 update branch name in SRC_URI
Thread-Index: AQHYxDhBSWKrmNOsOkCzIwsMjcrYmK3W0mEAgAMXreA=
Date: Sun, 11 Sep 2022 08:37:10 +0000
Message-ID: <003bc8d808d74214a71b20ee467210af@axis.com>
References: <20220909103754.3036413-1-ross.burton@arm.com>
 <1b7fce81bcc901c50f7a5042fb2bb94a81839896.camel@linuxfoundation.org>
In-Reply-To: 
 <1b7fce81bcc901c50f7a5042fb2bb94a81839896.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 08:37:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170515

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDkgc2VwdGVt
YmVyIDIwMjIgMTM6MjENCj4gVG86IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPjsg
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogbmRAYXJtLmNv
bQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF1baG9uaXN0ZXJdIG1vYmlsZS1icm9h
ZGJhbmQtcHJvdmlkZXItaW5mbzogdXBkYXRlIGJyYW5jaCBuYW1lIGluIFNSQ19VUkkNCj4gDQo+
IE9uIEZyaSwgMjAyMi0wOS0wOSBhdCAxMTozNyArMDEwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+
ID4gVGhlIG1hc3RlciBicmFuY2ggaGFzIGJlZW4gcmVuYW1lZCB0byBtYWluIGFuZCBub3cgbWFz
dGVyIG5vIGxvbmdlcg0KPiA+IGV4aXN0cywgc28gZmV0Y2hlcyB0aGF0IGRvbid0IHVzZSBhIHNv
dXJjZSBtaXJyb3Igd2lsbCBmYWlsLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9tb2JpbGUtYnJvYWRi
YW5kLXByb3ZpZGVyLWluZm9fZ2l0LmJiICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJvYWRiYW5k
LXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5iYiBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21v
YmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb19naXQuYmINCj4gPiBpbmRleCA0MjQ2ZjRkY2Jk
My4uM2IxNzBmNGZkZDIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRl
ci1pbmZvX2dpdC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9iaWxl
LWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb19n
aXQuYmINCj4gPiBAQCAtOCw3ICs4LDcgQEAgU1JDUkVWID0gIjExZjIyNDdlY2NkM2MxNjFiOGZk
OWI0MTE0Mzg2MmU5ZmI4MTE5M2MiDQo+ID4gIFBWID0gIjIwMjEwODA1Ig0KPiA+ICBQRSA9ICIx
Ig0KPiA+DQo+ID4gLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tb2Jp
bGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0
ZXIiDQo+ID4gK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tb2JpbGUt
YnJvYWRiYW5kLXByb3ZpZGVyLWluZm8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIg0K
PiA+ICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+DQo+ID4gIGluaGVyaXQgYXV0b3Rvb2xzDQo+
IA0KPiBUaGUgdHJvdWJsZSBpcyBpZiBJIG1lcmdlZCB0aGlzLCBpdCB3b3VsZCBvcGVuIHRoZSBm
bG9vZGdhdGVzIG9uIG90aGVyDQo+IHBhdGNoZXMuLi4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJp
Y2hhcmQNCg0KQnV0IGlzbid0IGhhdmluZyBhIHJlY2lwZSB0cnlpbmcgdG8gZmV0Y2ggc29tZXRo
aW5nIHRoYXQgZG9lc24ndCBleGlzdCANCmNvbnNpZGVyZWQgYSBidWc/IEFuZCB0aHVzIGl0IHNo
b3VsZCBiZSBvayB0byBtZXJnZSBldmVuIGluIGZlYXR1cmUgZnJlZXplLg0KT3IgYW0gSSBtaXNz
aW5nIHNvbWV0aGluZz8NCg0KLy9QZXRlcg0KDQo=

