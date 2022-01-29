Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82B3C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 04:29:03 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.2401.1643430542196008130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 20:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=j2flQjjI;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643430542;
  x=1674966542;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8q8YuBDSH+IO598b98Khrd5QSdIAciSagm4Q9dwT1Io=;
  b=j2flQjjINPYRZDGRoOneMvZxpMT2qY5GkJKFipIYFEgPgdDfFsQSgCrR
   KXQBJhAMtBjWv7qBECVtd97FBBSXIKnESipDUr0SczQB9a8+89uOL1sik
   S31cesHnGWDveudD9KE5GJ/5XOdHucC+zdrUdXDMTFqfFiJ24Vn8hO3Ke
   zs/7fyeB4uNbill0SGmEcICHaGfnDFKsqTE0XIVvn2q3BWWp+OkBWSTQt
   VWy/OMR5Ufs3weeGryA9mOJCzem51JHr+uhpQnEXhqN8NnJ/vdH7oecTz
   UmBlAqU8Y67TRqmccP2Oe2R8Pw2tumban21QdbsdvlfSmshDjA6Aoe9VL
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "crg7475@mailbox.org" <crg7475@mailbox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] How to properly enable PAM integration - docs no longer
 valid?
Thread-Topic: [OE-core] How to properly enable PAM integration - docs no
 longer valid?
Thread-Index: AQHYFMdqXLjLi52gBEq1qLCMvvbGJKx5ZoHA
Date: Sat, 29 Jan 2022 04:29:00 +0000
Message-ID: <cea00cf19cea4e78a8ad0596b7a43612@axis.com>
References: <7d9d9223-77bf-eea7-2f8f-b4e7855e40b3@mailbox.org>
In-Reply-To: <7d9d9223-77bf-eea7-2f8f-b4e7855e40b3@mailbox.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 04:29:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161098

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIENhcmxvcyBSYWZhZWwgR2lhbmkgdmlhDQo+IGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogZGVuIDI5IGphbnVhcmkgMjAyMiAwNToxOQ0KPiBU
bzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBb
T0UtY29yZV0gSG93IHRvIHByb3Blcmx5IGVuYWJsZSBQQU0gaW50ZWdyYXRpb24gLSBkb2NzIG5v
IGxvbmdlcg0KPiB2YWxpZD8NCj4gDQo+IEFjY29yZGluZyB0byB0aGlzIGRvY3VtZW50Og0KPiAN
Cj4gIMKgIGh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qub3JnL3dpa2kvUEFNX0ludGVncmF0aW9u
DQo+IA0KPiBQQU0gY2FuIGJlIGVuYWJsZWQgYnkgYWRkaW5nIHRoaXMgbGluZSB0byBsb2NhbC5j
b25mOg0KPiANCj4gIMKgIERJU1RST19GRUFUVVJFU19hcHBlbmQgKz0gIiBwYW0iDQo+IA0KPiBJ
biBuZXdlciBZb2N0byB2ZXJzaW9ucywgdGhpcyB3b3VsZCBiZToNCj4gDQo+ICDCoCBESVNUUk9f
RkVBVFVSRVM6YXBwZW5kICs9ICIgcGFtIg0KPiANCj4gYW5kIHRoaXMgd29ya3MuIEkgKmhhZCog
dG8gdXNlICIrPSIgaW5zdGVhZCBvZiAiPSIgaGVyZSwgb3RoZXJ3aXNlIHBhbQ0KPiB3b3VsZCBu
b3QgYmUgYWRkZWQgY29ycmVjdGx5Lg0KPiANCj4gQnV0LCB0aGVuIEkgZ2V0IHRoaXMgd2Fybmlu
ZzoNCj4gDQo+ICDCoCBXQVJOSU5HOiBESVNUUk9fRkVBVFVSRVM6YXBwZW5kICs9IGlzIG5vdCBh
IHJlY29tbWVuZGVkIG9wZXJhdG9yDQo+IGNvbWJpbmF0aW9uLCBwbGVhc2UgcmVwbGFjZSBpdA0K
PiANCj4gU28sIGhvdyBhbSBJIHN1cHBvc2VkIHRvIGVuYWJsZSBQQU0gaW4gbG9jYWwuY29uZiBp
ZiBJIG5lZWQgdG8gZW5hYmxlIGl0DQo+IHF1aWNrbHkgZm9yIGEgdGVzdCBieSB1c2luZyBwb2t5
IGFuZCBjYW4ndCBzZXQgdXAgbXkgb3duIGRpc3RybyByaWdodCBub3c/DQoNClRoZSBjb3JyZWN0
IGZvcm0gaXM6DQoNCkRJU1RST19GRUFUVVJFUzphcHBlbmQgPSAiIHBhbSINCg0KVGhlcmUgc2hv
dWxkIGJlIG5vIHJlYXNvbiB0byB1c2UgKz0gYWJvdmUgKHdoaWNoIGlzIGFsc28gd2h5IGl0IG5v
dyANCmdlbmVyYXRlcyBhIHdhcm5pbmcgaWYgeW91IGRvKS4NCg0KWW91IGNhbiBhbHdheXMgY2hl
Y2sgdGhlIHZhbHVlIG9mIGEgdmFyaWFibGUgYW5kIGhvdyBpdCBnb3QgZGVmaW5lZCBieSANCnVz
aW5nIGBiaXRiYWtlIC1lYCwgb3IgdGhlIG5ldyBiaXRiYWtlLWdldHZhciwgZS5nLiwgYGJpdGJh
a2UtZ2V0dmFyIA0KRElTVFJPX0ZFQVRVUkVTYC4NCg0KLy9QZXRlcg0KDQo=

