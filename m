Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8382C54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 13:55:56 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7377.1663854952957795975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 06:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PlIxV7mY;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1663854954;
  x=1695390954;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=niqzVMqFEuRqr0/jbRc0YkQAQFSEiB62V53wxtnCxmo=;
  b=PlIxV7mYoghiBJ0XP6MApmranbaRosDb1mQPt0KM66cIRNNXdbiTtwNN
   34Z1Lhgk0l9hjbt48Lj79qF2L56f3SsPE37YfhSXuA93aBp2gk0/hXIOt
   ppNZkFJD1ab5RgU+KnaeWSYDLbHKwxvlBN0ynXJtQZuHovihJoExcRuZK
   Zluwsqv1gTz+SIDbzn5592HaQXeEAPg0qhN+TC152UO3cFmNV8EKgQODN
   rmKqutlkRvhJRvSPt/7tdJmVXk4VVfHfFo+LSrDeFE4qaSKn9bEavSMoj
   3YUkUTeXEXvjk44lh9QQPtRJTd3A3cnkxLQ9oEIPsXC0tvELOaLWzo6RI
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Richard Purdie <rpurdie@rpsys.net>
CC: Ross Burton <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] poky.conf: allow changes to DISTRO_VERSION,
 SDK_VERSION and MAINTAINER
Thread-Topic: [OE-core] [PATCH 1/2] poky.conf: allow changes to
 DISTRO_VERSION, SDK_VERSION and MAINTAINER
Thread-Index: AQHYzn5ASt6mwc70nEuJ4GY3v1scnq3rQvuAgAAA7oCAABBEAIAAJB9w
Date: Thu, 22 Sep 2022 13:55:51 +0000
Message-ID: <d4ddb00322c14cee9580c16e0c786f3e@axis.com>
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
 <A7BB2455-96E4-4403-8E60-AE010F0AF124@arm.com>
 <36a2e82978462cfcd53ae5228ead7dc8b3ce4603.camel@rpsys.net>
 <CAJFpGrPS+uuihkS0+E0+gPoPFB8wRNEsLZSgVWG_zR4C8EeNiQ@mail.gmail.com>
In-Reply-To: 
 <CAJFpGrPS+uuihkS0+E0+gPoPFB8wRNEsLZSgVWG_zR4C8EeNiQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 13:55:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170983

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIE1pa2tvIFJhcGVsaQ0KPiBTZW50OiBkZW4gMjIgc2Vw
dGVtYmVyIDIwMjIgMTU6NDQNCj4gVG86IFJpY2hhcmQgUHVyZGllIDxycHVyZGllQHJwc3lzLm5l
dD4NCj4gQ2M6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPjsgb3BlbmVtYmVkZGVk
LQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggMS8yXSBwb2t5LmNvbmY6IGFsbG93IGNoYW5nZXMgdG8NCj4gRElTVFJPX1ZFUlNJ
T04sIFNES19WRVJTSU9OIGFuZCBNQUlOVEFJTkVSDQo+IA0KPiBIaSwNCj4gDQo+IFRoYW5rcyBm
b3IgdGhlIGZlZWRiYWNrLiBNeSBwcm9kdWN0IGlzbid0IGEgcmVhbCBvbmUsIGl0J3MgYWN0dWFs
bHkNCj4gc29tZSBtZXRhIGxheWVycyB0byBiZSB1c2VkDQo+IGJ5IG90aGVycyB0byBjcmVhdGUg
cmVhbCBwcm9kdWN0cy4NCj4gDQo+IFRoZSByZWFzb24gZm9yIHVzaW5nIHBva3kuY29uZiBkaXN0
cm8gaXMgdG8gc3RheSBhcyBjbG9zZSB0byBpdCBhcw0KPiBwb3NzaWJsZS4gQnV0IEkgc3RpbGwg
bmVlZCB0byBrbm93DQo+IHdoYXQgaXMgdGhlIG91dHB1dCBvZiBteSBidWlsZHMgdnMuIHNvbWV0
aGluZyBlbHNlIGZyb20gcG9reS4NCj4gDQo+IElmIGNoYW5pbmcgdGhlc2UgdmVyaWFibGVzIGZy
b20gbG9jYWwuY29uZiBpcyBiYWQgcHJhY3RpY2UsIHRoZW4gSQ0KPiBuZWVkIHRvIGZpbmQgb3Ro
ZXIgcG9zc2liaWxpdGllcywgbGlrZQ0KPiB0aGUgY3VzdG9tIGRpc3RybyBjb25maWcgKG1heWJl
IG1vdmUgYXdheSBmcm9tIGthcykuIEJ1dCB0aGUgYWltIGlzIHRvDQo+IGRvIGFzIGZldyBjaGFu
Z2VzIHRvDQo+IHBva3kgYXMgcG9zc2libGUuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtTWlra28N
Cj4gQ2hlZXJzLA0KPiAtTWlra28NCg0KSWYgYWxsIHlvdSB3YW50IGlzIGZvciB5b3VyIHZhbHVl
cyBmcm9tIHlvdXIgbG9jYWwuY29uZiB0byBiZSB1c2VkLCANCnRoZW4geW91IGNhbiB1c2UgYW4g
b3ZlcnJpZGUgd2hlbiBzZXR0aW5nIHRoZSB2YXJpYWJsZXMuIEluIHRoaXMgDQpjYXNlLCBzaW5j
ZSB5b3Ugd2FudCB0byBvdmVycmlkZSB0aGUgdmFsdWVzIGZyb20gdGhlIHBva3kgZGlzdHJvLCAN
CndoeSBub3QgdXNlIGl0IGFzIHRoZSBvdmVycmlkZSwgZS5nLjoNCg0KRElTVFJPX1ZFUlNJT046
cG9reSA9ICJteS12ZXJzaW9uIg0KDQovL1BldGVyDQoNCg==

