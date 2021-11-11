Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DC8C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 01:41:58 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.4872.1636594916992469968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 17:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=khm/4bsa;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636594918;
  x=1668130918;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GOobU1SO2wZzcJlwF9iH5brmJR1I0gPz0RcQzLkdRdo=;
  b=khm/4bsafA4pkkwWkH+Krd70um5sce8rmPPlbXHuRu+tURtM4P8Sj36j
   SfY/ypUt7q8r651MfCzjKOO6J+AZFAlijxcnEqeISYM1qMRMGuEIWCYbh
   4/wDq6Co64gxNc8B5jfyKAt1++qKyozuQj3o+as7KhVPKFaQ1v9zvNKnZ
   nOT/UXmAr3MqcaACqtuK9x3ftq3ZoxVzOXjaVx5HmZ9zccDEkiaPPuNZ7
   M15GWuJG1SiRdTcuRvzqD5ithG0h4NIf/k6/iilIk1GNGwochox33U8vj
   p8b+uftwYRyL4sds8C8t0+DMQs2eVcMrOwk9ZRfamcLTTp22Gz8MG8rZm
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Anibal Limon <anibal.limon@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] recipe-graphics: Add depends on cmake-native
Thread-Topic: [OE-core] [PATCH] recipe-graphics: Add depends on cmake-native
Thread-Index: AQHX1pVF5cvbxnbr4k+fop37yXZvAqv9jGiw
Date: Thu, 11 Nov 2021 01:41:48 +0000
Message-ID: <3e7d66a3e2484c9a830a37b3d2cc91ba@axis.com>
References: <20211111004407.3036301-1-anibal.limon@linaro.org>
In-Reply-To: <20211111004407.3036301-1-anibal.limon@linaro.org>
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
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 01:41:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158126

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQW5pYmFsIExpbW9uDQo+IFNlbnQ6IGRlbiAxMSBub3ZlbWJl
ciAyMDIxIDAxOjQ0DQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IENjOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnOyBBbsOtYmFsIExp
bcOzbiA8YW5pYmFsLmxpbW9uQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFU
Q0hdIHJlY2lwZS1ncmFwaGljczogQWRkIGRlcGVuZHMgb24gY21ha2UtbmF0aXZlDQoNCkNoYW5n
ZSAicmVjaXBlLWdyYXBoaWNzIiB0byAid2FmZmxlIi4NCg0KLy9QZXRlcg0KDQo+IA0KPiBGaXhl
cywNCj4gDQo+IC4uLg0KPiAgIEZpbGUgIi9ob21lL2J1aWxkcy9vZS1ycGItbWFzdGVyL2J1aWxk
LTQxMGMvdG1wLXJwYi1nbGliYy93b3JrL2NvcnRleGE1My1saW5hcm8tbGludXgvd2FmZmxlLzEu
Ny4wLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliL3B5dGhvbjMuMTAvc2l0ZS1wYWNr
YWdlcy9tZXNvbmJ1aWxkL21vZHVsZXMvY21ha2UucHkiLCBsaW5lIDI0MSwgaW4gZGV0ZWN0X2Nt
YWtlDQo+ICAgICBwLCBzdGRvdXQsIHN0ZGVyciA9IG1lc29ubGliLlBvcGVuX3NhZmUoY21ha2Vi
aW4uZ2V0X2NvbW1hbmQoKSArIFsnLS1zeXN0ZW0taW5mb3JtYXRpb24nLCAnLUcnLCAnTmluamEn
XSlbMDozXQ0KPiAgIEZpbGUgIi9ob21lL2J1aWxkcy9vZS1ycGItbWFzdGVyL2J1aWxkLTQxMGMv
dG1wLXJwYi1nbGliYy93b3JrL2NvcnRleGE1My1saW5hcm8tbGludXgvd2FmZmxlLzEuNy4wLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliL3B5dGhvbjMuMTAvc2l0ZS1wYWNrYWdlcy9t
ZXNvbmJ1aWxkL21lc29ubGliL3VuaXZlcnNhbC5weSIsIGxpbmUgMTM5NywgaW4gUG9wZW5fc2Fm
ZQ0KPiAgICAgcCA9IHN1YnByb2Nlc3MuUG9wZW4oYXJncywgdW5pdmVyc2FsX25ld2xpbmVzPVRy
dWUsIGNsb3NlX2Zkcz1GYWxzZSwNCj4gICBGaWxlICIvaG9tZS9idWlsZHMvb2UtcnBiLW1hc3Rl
ci9idWlsZC00MTBjL3RtcC1ycGItZ2xpYmMvd29yay9jb3J0ZXhhNTMtbGluYXJvLWxpbnV4L3dh
ZmZsZS8xLjcuMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9weXRob24zLjEwL3N1
YnByb2Nlc3MucHkiLCBsaW5lIDk2NiwgaW4gX19pbml0X18NCj4gICAgIHNlbGYuX2V4ZWN1dGVf
Y2hpbGQoYXJncywgZXhlY3V0YWJsZSwgcHJlZXhlY19mbiwgY2xvc2VfZmRzLA0KPiAgIEZpbGUg
Ii9ob21lL2J1aWxkcy9vZS1ycGItbWFzdGVyL2J1aWxkLTQxMGMvdG1wLXJwYi1nbGliYy93b3Jr
L2NvcnRleGE1My1saW5hcm8tbGludXgvd2FmZmxlLzEuNy4wLXIwL3JlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvbGliL3B5dGhvbjMuMTAvc3VicHJvY2Vzcy5weSIsIGxpbmUgMTcxNywgaW4gX2V4
ZWN1dGVfY2hpbGQNCj4gICAgIGFuZCBvcy5wYXRoLmRpcm5hbWUoZXhlY3V0YWJsZSkNCj4gICBG
aWxlICIvaG9tZS9idWlsZHMvb2UtcnBiLW1hc3Rlci9idWlsZC00MTBjL3RtcC1ycGItZ2xpYmMv
d29yay9jb3J0ZXhhNTMtbGluYXJvLWxpbnV4L3dhZmZsZS8xLjcuMC1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL2xpYi9weXRob24zLjEwL3Bvc2l4cGF0aC5weSIsIGxpbmUgMTUyLCBpbiBk
aXJuYW1lDQo+ICAgICBwID0gb3MuZnNwYXRoKHApDQo+IC4uLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW7DrWJhbCBMaW3Ds24gPGFuaWJhbC5saW1vbkBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlXzEuNy4wLmJiIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dhZmZsZS93YWZmbGVfMS43LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjcuMC5iYg0KPiBpbmRleCA2Mjg0YWYz
MDc2Li5lYTExMzA5OTQwIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2Fm
ZmxlL3dhZmZsZV8xLjcuMC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxl
L3dhZmZsZV8xLjcuMC5iYg0KPiBAQCAtMTcsNyArMTcsNyBAQCBTID0gIiR7V09SS0RJUn0vZ2l0
Ig0KPiANCj4gIGluaGVyaXQgbWVzb24gZmVhdHVyZXNfY2hlY2sgbGliX3BhY2thZ2UgYmFzaC1j
b21wbGV0aW9uIHBrZ2NvbmZpZw0KPiANCj4gLURFUEVORFM6YXBwZW5kID0gIiBweXRob24zIg0K
PiArREVQRU5EUzphcHBlbmQgPSAiIHB5dGhvbjMgY21ha2UtbmF0aXZlIg0KPiANCj4gICMgVGhp
cyBzaG91bGQgYmUgb3ZlcnJpZGRlbiBwZXItbWFjaGluZSB0byByZWZsZWN0IHRoZSBjYXBhYmls
aXRpZXMgb2YgdGhlIEdMDQo+ICAjIHN0YWNrLg0KPiAtLQ0KPiAyLjMzLjENCg0K

