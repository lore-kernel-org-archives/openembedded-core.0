Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F8AC4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:07:41 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.3270.1713118057593665330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 11:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=Hp/plsgR;
 spf=pass (domain: posteo.net, ip: 185.67.36.65, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 57F4D240027
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 20:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1713118055; bh=1sQzD/ZY7rkF/C0UUYZJI5TEVLd4LQludTgNOzH/s6U=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=Hp/plsgRHBiCmQTcML3zclhxcvxpe3e/0yucWVhK4auoMtWA1BVPv2SAPONdduWCw
	 SDYyulqMy5m+yCIhw/04Xk8+khny5V5/fRjCM7HS9D2cqSTiig/iHVXo+Uell4YswS
	 3D2W9HmjoiExqLkxwRpNnFuzjZ87CmSMmFopGBXm3malgWNPOVLhQApFhn8TVDm2D4
	 rq+CjL6WsnkqPHonQB39zHZj9AKFWkSPLFuchtaZbD5ofVRcYUpAjuF/3/oRoJ+efj
	 Gp2sAojxHodGeO29OsExdf88VuK1gEE73RPMuDmX1N/ALZFcvHUyzzQ4BxOh7v5E2O
	 BlaxNxj3ZgO1Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VHdYy4S8Kz6twn;
	Sun, 14 Apr 2024 20:07:34 +0200 (CEST)
Message-ID: <848c22ce192bf9198dcd73b5815fda9dbe3db2b8.camel@posteo.net>
Subject: Re: [OE-core] [PATCH 10/33] gnutls: upgrade 3.8.4 -> 3.8.5
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Simone
	=?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2024 18:07:33 +0000
In-Reply-To: <fac2b3548c6247d503a147c11ca0ab4bc96ae7a1.camel@posteo.net>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
	 <1712646620-16608-10-git-send-email-wangmy@fujitsu.com>
	 <202404100045092623c1a2@mail.local>
	 <0175215d2582da11040d25cd9981531fbbddf237.camel@posteo.net>
	 <2024041214390494ce0c8b@mail.local>
	 <fac2b3548c6247d503a147c11ca0ab4bc96ae7a1.camel@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 18:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198214

T24gU2F0LCAyMDI0LTA0LTEzIGF0IDIwOjU1ICswMDAwLCBTaW1vbmUgV2Vpw58gd3JvdGU6Cj4g
T24gRnJpLCAyMDI0LTA0LTEyIGF0IDE2OjM5ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToKPiA+IE9uIDExLzA0LzIwMjQgMTk6NDE6MDkrMDAwMCwgU2ltb25lIFdlacOfIHdyb3RlOgo+
ID4gPiBPbiBXZWQsIDIwMjQtMDQtMTAgYXQgMDI6NDUgKzAyMDAsIEFsZXhhbmRyZSBCZWxsb25p
IHZpYQo+ID4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+ID4gPiA+IEZhaWxlZCBw
dGVzdHM6Cj4gPiA+ID4geydnbnV0bHMnOiBbJ2FsZXJ0cycsCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAnY2VydC1zdGF0dXMnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
J2NpcGhlcnN1aXRlLW5hbWUnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2R0bHMt
ZXRtJywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdkdGxzMTAtY2VydC1rZXktZXhj
aGFuZ2UnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2R0bHMxMi1jZXJ0LWtleS1l
eGNoYW5nZScsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAna2V5bG9nLWVudicsCj4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnbWluaS1jaGFpbi11bnNvcnRlZCcsCj4gPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnbWluaS1yZWNvcmQtZmFpbHVyZScsCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnbWluaS1vdmVyaGVhZCcsCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAnbWluaS1yZWNvcmQnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJ21pbmktcmVjb3JkLTInLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3JlY29y
ZC1yZXR2YWxzJywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdyZWhhbmRzaGFrZS1z
d2l0Y2gtY2VydCcsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAncmVoYW5kc2hha2Ut
c3dpdGNoLWNlcnQtYWxsb3cnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3JlaGFu
ZHNoYWtlLXN3aXRjaC1jZXJ0LWNsaWVudCcsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAncmVoYW5kc2hha2Utc3dpdGNoLWNlcnQtY2xpZW50LWFsbG93JywKPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICdyc2EtZW5jcnlwdC1kZWNyeXB0JywKPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICdyc2EtcHNrJywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdy
c2EtcHNrLWNiJywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdyc2Flcy1wa2NzMS12
MV81JywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0bHMtZXRtJywKPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0bHMtZm9yY2UtZXRtJywKPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICd0bHMtbmVnLWV4dDQta2V5JywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICd0bHMxMC1jZXJ0LWtleS1leGNoYW5nZScsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAndGxzMTEtY2VydC1rZXktZXhjaGFuZ2UnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJ3RsczEwLXNlcnZlci1reC1uZWcnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJ3RsczEyLWFub24tdXBncmFkZScsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAndGxzMTItY2VydC1rZXktZXhjaGFuZ2UnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJ3RsczExLXNlcnZlci1reC1uZWcnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
J3RsczEyLXNlcnZlci1reC1uZWcnLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3Rs
czEzLWNlcnQta2V5LWV4Y2hhbmdlJywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0
bHMxMy1zZXJ2ZXIta3gtbmVnJywKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd2ZXJz
aW9uLWNoZWNrcyddfQo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IGlz
IHRoZXJlIGEgYXV0b2J1aWxkZXIgbGluayB0byB0aGlzPyBJIHRyaWVkIGl0IGxvY2FsbHkgYW5k
IGFsbCB3YXMKPiA+ID4gZmluZS4KPiA+ID4gV291bGQgbGlrZSB0byBjaGVjayBpdCBqdXN0IHRv
IHNlZSBpZiBJIGNhbiBzcG90IGEgZGlmZmVyZW5jZS4gT3IgZG8KPiA+ID4geW91Cj4gPiA+IChX
YW5nIE1pbmd5dSkgYWxyZWFkeSBjaGVjayBhdCB0aGUgbW9tZW50Pwo+ID4gCj4gPiBodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzgxL2J1aWxk
cy82NDg5L3N0ZXBzLzEyL2xvZ3Mvc3RkaW8KPiA+IAo+ID4gaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0by5pby9wdWIvbm9uLXJlbGVhc2UvMjAyNDA0MDktMjUvdGVzdHJlc3VsdHMvcWVtdXg4Ni02
NC1wdGVzdC9nbnV0bHMubG9nCj4gCj4gTG9va3MgbGlrZSBhdCBsZWFzdCBzb21lIG1pZ2h0IGJl
IGZpeGFibGUgd2l0aAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vbWVyZ2Vf
cmVxdWVzdHMvMTgzMAo+IAo+IEkgd2lsbCB0YWtlIGEgZnVydGhlciBsb29rCk5ldyBwYXRjaGVz
IGFyZSBvbiB0aGUgbGlzdC4gKFdhbmcgTWluZ3l1OiBJIGluY2x1ZGVkIHlvdXIgY29tbWl0LCBo
b3BlCnRoYXQgaXMgb2spCgpTaW1vbmUK


