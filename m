Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388A1C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:06:35 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.164.1645106793350416969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=KBBcR8c3;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645106793;
  x=1676642793;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4lRPcfvHe2CKbN9tjq37jgkO0qZDthPex+IWjQ8yXtQ=;
  b=KBBcR8c3V1hTsWQpxkyBll03VxK08pF5G0ESNKdweyd86HNFrjYqikBf
   TJx5d8ReHFVzvMJcI2RUi0k2DKg5V76XRS79FhLN304DYIvZllYPtITbs
   pUjRZIhudnI8JrO7Tw0XtQT5UET/HkSKzpHgPVA8BW1dc+7X9nWfrcBPg
   A3oxM0rFIyQwHYfmKeBhLo+CGX1jHyijuo/WwqCH4S+0LGr0v4l0rfZGu
   qGMt+tKaXQe1s6pybtYO0e9TTWUgI0VmxPDiR2XRLpw4CENKEe0ft9d7w
   P8IfTcrbFoCng2ZAU1u9ft8sQSfJ71ewhuthrM8pKlARBnhAsA13XbWVF
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Saul Wold
	<Saul.Wold@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC PATCH] Rename INCOMPATIBLE related varibale
Thread-Topic: [OE-core] [RFC PATCH] Rename INCOMPATIBLE related varibale
Thread-Index: AQHYI5BWY0hdCM0xb0Wz/aGQhUOyEqyXfogAgABH6oA=
Date: Thu, 17 Feb 2022 14:06:29 +0000
Message-ID: <262e7eaec4e44237abf3f0f7853d6f6f@axis.com>
References: <20220216235233.575379-1-saul.wold@windriver.com>
 <35c7accdbd700eb31e9728fc4f773c648695bff9.camel@linuxfoundation.org>
In-Reply-To: 
 <35c7accdbd700eb31e9728fc4f773c648695bff9.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:06:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161798

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiAxNyBm
ZWJydWFyaSAyMDIyIDExOjQ0DQo+IFRvOiBTYXVsIFdvbGQgPFNhdWwuV29sZEB3aW5kcml2ZXIu
Y29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUkZDIFBBVENIXSBSZW5hbWUgSU5DT01QQVRJQkxFIHJlbGF0
ZWQgdmFyaWJhbGUNCj4gDQo+IE9uIFdlZCwgMjAyMi0wMi0xNiBhdCAxNTo1MiAtMDgwMCwgU2F1
bCBXb2xkIHdyb3RlOg0KPiA+IFRoaXMgaXMgb25lIG9wdGlvbiB0byBoYW5kbGUgdGhlIHJlbmFt
ZSwgYW5vdGhlciBhbHRlcm5hdGl2ZSB3b3VsZA0KPiA+IGJlIHRvIGNoYW5nZSB0aGUgbmV3IElO
Q09NUEFUSUJMRV9MSUNFTlNFX0FMTE9XRURfUkVDSVBFUyB0byBWYXJGbGFnDQo+ID4gc3R5bGUu
DQo+IA0KPiBJdCBpcyBvbmUgb3B0aW9uIGJ1dCBJJ20gbm90IHN1cmUgaXQgbWFrZXMgc2Vuc2Uu
IFRoaXMgZnVuY3Rpb25hbGl0eSANCj4gaXMgYSBiaXQgb2YgYSBoaXN0b3JpY2FsIHJlbGljIGFu
ZCB0aGUgc3ludGF4IGlzIGFic29sdXRlbHkgaG9ycmlibGUuIA0KPiBJZiB3ZSdyZSBnb2luZyB0
byBjaGFuZ2UgaXQsIEknZCBsaWtlIHRvIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHN0ZXAgDQo+
IGJhY2sgYW5kIGZpeCBpdCBzb21laG93LiBJJ3ZlIG5vdCBzcGVudCB0aGUgdGltZSB0aGlua2lu
ZyB3aGF0IHRoYXQgDQo+IG1pZ2h0IGxvb2sgbGlrZSB1bmZvcnR1bmF0ZWx5Lg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gUmljaGFyZA0KDQpJIGRlZmluaXRlbHkgYWdyZWUgdGhhdCB0aGUgc3lzdGVt
IGZvciBoYW5kbGluZyBjb21wYXRpYmxlL2luY29tcGF0aWJsZSANCmxpY2Vuc2VzIG5lZWQgdG8g
YmUgcmV3b3JrZWQuIEkgc2VudCBhIGxvbmdpc2ggcmVzcG9uc2UgdG8gSm9uJ3MgbWFpbCANCm9u
IHRoZSB5b2N0byBsaXN0IEphbnVhcnkgMjkgd2hlcmUgSSBkaXNjdXNzZWQgdGhpcy4NCg0KLy9Q
ZXRlcg0KDQo=

