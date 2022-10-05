Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA707C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 15:06:15 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.24567.1664982370609972553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 08:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=HZmp2+ip;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664982371;
  x=1696518371;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wh813kICIuNGtqt2f8EDPhJLweV2bBpnZqcoNa6GIgE=;
  b=HZmp2+ipi1Rhw6oXVuDi2Xc0R0mGwq+tmsi6Lt47pDyI8ugQvIitGedG
   sCXVZWPsPyG/QMnDJaH2uE70d6ZxyPgluG8R11H1wBy9HGy4je17Q2rLn
   X7oUMXeKhXYhQ4CjUXfZmCuJ7W6vqMnKuRMbwgv6ysRCFq5iD0BAFmtMp
   jS3cjzQRURjO8BBrmAafj/FzhbYRrfNSFZvgQLc5PJEurwlyWWfEDnhGL
   pMlRov8UwYL8p98By6pigcT5wO/ALs7dQCpnWUg/mYxX6IT80EzAK9KdF
   cKuupPCtagotJhMhhg8EpigXZnB14/PR8NwoDSm8EKTLYjfOjNdJPeAI4
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@arm.com>, "david.bagonyi@gmail.com"
	<david.bagonyi@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gpgme: Allow setuptools3-base to be excluded
 from the inherit list
Thread-Topic: [OE-core] [PATCH] gpgme: Allow setuptools3-base to be excluded
 from the inherit list
Thread-Index: AQHY2KgLHEiIouZiTkmmBXwUfgLMgq3/h9uAgABdOmA=
Date: Wed, 5 Oct 2022 15:06:07 +0000
Message-ID: <94da13d2ddcc4335b9967da1475f68cf@axis.com>
References: <20221005104810.16863-1-david.bagonyi@gmail.com>
 <C4870FFC-4738-4652-A853-9CBFF44FF1A8@arm.com>
In-Reply-To: <C4870FFC-4738-4652-A853-9CBFF44FF1A8@arm.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 15:06:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171462

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJvc3MgQnVydG9uDQo+IFNlbnQ6IGRlbiA1IG9rdG9i
ZXIgMjAyMiAxMzoyNw0KPiBUbzogZGF2aWQuYmFnb255aUBnbWFpbC5jb20NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIGdwZ21lOiBBbGxvdyBzZXR1cHRvb2xzMy1iYXNlIHRvIGJlDQo+IGV4Y2x1
ZGVkIGZyb20gdGhlIGluaGVyaXQgbGlzdA0KPiANCj4gPiBPbiA1IE9jdCAyMDIyLCBhdCAxMTo0
OCwgRGF2aWQgQmFnb255aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8ZGF2aWQuYmFnb255
aT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gUFlUSE9OX0lO
SEVSSVQgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAncHl0aG9uMics
ICdweXRob25uYXRpdmUnLCAnJywgZCl9Ig0KPiA+IFBZVEhPTl9JTkhFUklUIC49ICIke0BiYi51
dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdweXRob24zJywgJ3B5dGhvbjNuYXRpdmUg
cHl0aG9uM3RhcmdldGNvbmZpZycsICcnLCBkKX0iDQo+ID4gK1BZVEhPTl9JTkhFUklUIC49ICIk
e0BiYi51dGlscy5jb250YWlucygnTEFOR1VBR0VTJywgJ3B5dGhvbicsICdzZXR1cHRvb2xzMy1i
YXNlJywgJycsIGQpfeKAnQ0KPiANCj4gTm90ZSB0aGF0IHNldHVwdG9vbHMzLWJhc2UgaXRzZWxm
IGluaGVyaXRzIHB5dGhvbjNuYXRpdmUgYW5kDQo+IHB5dGhvbjN0YXJnZXRjb25maWcuICBUaGlz
IGlzIGltcG9ydGFudCBkdWUgdG8gb3JkZXJpbmc6IGlmIHB5dGhvbjIgaXMNCj4gc2VsZWN0ZWQg
dGhlbiBweXRob25uYXRpdmUgbmVlZHMgdG8gYmUgaW5oZXJpdGVkICphZnRlciogc2V0dXB0b29s
czMtYmFzZQ0KPiBzbyB0aGF0IFBZVEhPTiBpcyBweXRob24yIGFuZCBub3QgcHl0aG9uMy4NCj4g
DQo+IEhvd2V2ZXIgYXMgUHkyIGhhcyBiZWVuIEVPTCBmb3IgbmVhcmx5IHRocmVlIHllYXJzIG5v
dywgSSBzdWdnZXN0IHdlIGp1c3QNCj4gcmlwIG91dCBhbGwgb2YgdGhlIHB5dGhvbjIgcGFydHMg
aW4gdGhlIHByb2Nlc3Mgb2YgZml4aW5nIHRoZSBpbmhlcml0Lg0KPiANCj4gUm9zcw0KDQpBbHNv
IG5vdGUgdGhhdCB0aGUgYWJvdmUgc2hvdWxkIHVzZSAiKz0iIHJhdGhlciB0aGFuICIuPSIsIGFz
IG90aGVyd2lzZSANCnRoZSBpbmhlcml0cyB3aWxsIGJlIGNvbmNhdGVuYXRlZCBpbnRvIGEgbWVz
cyB3aXRob3V0IHNwYWNlcyBpZiBtdWx0aXBsZSANCm9wdGlvbnMgYXJlIGVuYWJsZWQgYXQgdGhl
IHNhbWUgdGltZS4NCg0KLy9QZXRlcg0KDQo=

