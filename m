Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3F2C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 13:17:05 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.18176.1661174223707606537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 06:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Vr2TIsfF;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661174224;
  x=1692710224;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=u9Yln7MU/IjwcC9jg7HJgGWTGTPkXjRHsIY5nIG8kvc=;
  b=Vr2TIsfFDbj1WmUwfHtIumuo9x0W0+scO+dzq+SfxtGm5dZ4i/taTgzu
   FKCW3KDUP7C//YjOW54mxqcwMEM2OukEKGU92LxGJxcPPQeLiV8ZFA3Uo
   0ECW3m/o8jPNCwXqU/OdP6AKz8buZUwzFkOcExDTQwUgHWuY2cUEweOJs
   SI5gVX8bAOQVnZwzO4Dg4YvDrC1uDnSVELkZceScMJCxELs8tipfOwQT2
   1pK5fqu7BwiPXfeOHgqUkGPqOw5lnYydQDo3KUQZA5snKfKUCmFjZF4MF
   L6FYvviA2R+ca4+jfY9u0Mp/xn6fYCt5IZLuxx7T/r31m/fmmnznRj0gd
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Quentin Schulz
	<quentin.schulz@theobroma-systems.com>, Wes Lindauer
	<wesley.lindauer@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore
 list
Thread-Topic: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore
 list
Thread-Index: AQHYteQOZr/RDflC406BOYbQOclv+q26hdKAgAAe0ACAAEAOgA==
Date: Mon, 22 Aug 2022 13:17:00 +0000
Message-ID: <d6dc09aea26447ed99a4ad5cee62c048@axis.com>
References: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
	 <cf290a54-3b62-9c0d-32cc-08195f682b99@theobroma-systems.com>
 <01dce5b603bc47fc195ba4ea738e7a333ac1992e.camel@linuxfoundation.org>
In-Reply-To: 
 <01dce5b603bc47fc195ba4ea738e7a333ac1992e.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 13:17:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169672

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiAyMiBh
dWd1c3RpIDIwMjIgMTM6MTkNCj4gVG86IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekB0
aGVvYnJvbWEtc3lzdGVtcy5jb20+OyBXZXMgTGluZGF1ZXINCj4gPHdlc2xleS5saW5kYXVlckBn
bWFpbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIGJpdGJha2UuY29uZjogQWRkIHJlc291cmNlIHZh
cnMgdG8gaGFzaA0KPiBpZ25vcmUgbGlzdA0KPiANCj4gT24gTW9uLCAyMDIyLTA4LTIyIGF0IDEx
OjI4ICswMjAwLCBRdWVudGluIFNjaHVseiB3cm90ZToNCj4gPiBIaSBXZXMsDQo+ID4NCj4gPiBP
biA4LzIyLzIyIDA2OjU5LCBXZXMgTGluZGF1ZXIgd3JvdGU6DQo+ID4gPiBJdCBzaG91bGQgbm90
IG1hdHRlciB3aGF0IHh6L3pzdGQgcGFyYWxsZWxpc20gYW5kIHJlc291cmNlIHVzYWdlIGlzIHNl
dCB0bw0KPiA+ID4gd2hlbiBkZXRlcm1pbmluZyBoYXNoIHNpZ25hdHVyZXMuIFRoaXMgYWxsb3dz
IHNoYXJpbmcgbW9yZSBzc3RhdGUgYWNyb3NzDQo+ID4gPiBob3N0IG1hY2hpbmVzIHdpdGggZGlm
ZmVyZW50IENQVSBjb25maWd1cmF0aW9ucy4NCj4gPiA+DQo+ID4NCj4gPiBJdCBzZWVtcyBsaWtl
IGl0IGRvZXMgbWF0dGVyIGluIHNvbWUgd2F5cywgYy5mLjoNCj4gPiBodHRwczovL2dpdC5vcGVu
ZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8/aWQ9MDI5NmRjNzFjMDFkMWI3
OTUzZDc0ZWYzN2Q1NjQyOWUyZjRmY2ZhYg0KPiA+IGFuZA0KPiA+IGh0dHBzOi8vZ2l0Lm9wZW5l
bWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9pZD1lNzJjMGI5NDU1NGE5YmMy
OTM4NDRlYzJiZGRiMGMwNGVhMTk3OTFkDQo+IA0KPiBBcyBRdWVudGluIG1lbnRpb25zLCB0aGUg
dmFsdWUgZG9lcyBtYXR0ZXIuIEluIHBhcnRpY3VsYXIsIHRob3NlDQo+IGNvbXBpbGVkIHdpdGgg
YSBzaW5nbGUgdGhyZWFkIGRpZmZlciB0byB0aG9zZSB3aXRoIG11bHRpcGxlIHRocmVhZHMuIEFz
DQo+IHN1Y2ggdGhlIHByb3Bvc2VkIHBhdGNoIGNhbid0IGJlIGFjY2VwdGVkLg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gUmljaGFyZA0KDQpJc24ndCB0aGUgcHJvYmxlbSBvZiB2YXJ5aW5nIFhaX1RI
UkVBRC9aU1REX1RIUkVBRCB2cyB0YXNraGFzaGVzIA0KYWxyZWFkeSB0YWtlbiBjYXJlIG9mIGJ5
IGhhdmluZzoNCg0KWFpfVEhSRUFEUyA/PSAiJHtAb2UudXRpbHMuY3B1X2NvdW50KGF0X2xlYXN0
PTIpfSIgDQpYWl9USFJFQURTW3ZhcmRlcHZhbHVlXSA9ICIxIg0KWFpfREVGQVVMVFMgPz0gIi0t
bWVtbGltaXQ9JHtYWl9NRU1MSU1JVH0gLS10aHJlYWRzPSR7WFpfVEhSRUFEU30iIA0KWFpfREVG
QVVMVFNbdmFyZGVwc2V4Y2x1ZGVdICs9ICJYWl9NRU1MSU1JVCBYWl9USFJFQURTIg0KWlNURF9U
SFJFQURTID89ICIke0BvZS51dGlscy5jcHVfY291bnQoYXRfbGVhc3Q9Mil9IiANClpTVERfVEhS
RUFEU1t2YXJkZXB2YWx1ZV0gPSAiMSINCg0KaW4gYml0YmFrZS5jb25mLg0KDQovL1BldGVyDQoN
Cg==

