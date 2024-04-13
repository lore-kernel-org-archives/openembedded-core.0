Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C3CC4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 20:56:00 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.20528.1713041754052458686
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 13:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=VSqy8M/Y;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D77DE240101
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 22:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1713041751; bh=5cXjOi0S59YhPs5F6RHKJ1wqyAEnWSjU872YUVdqjCw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=VSqy8M/YBy/ycEiZQ85dMgT0cvjMCIO57VW1uXo1MeJk5ZoLQO9m6qvhYAT6CUQus
	 aotfgbTlxa3zRNHELLPcGcciPZ8EYZ/ZoKZHI4wmeYEb3d8IE1sjSR0aZwRgNYsecC
	 kLS5NOlC+m57XNNpAa0QqL8pKUAZCtOOzim5pJ8MN2LjKqZE71b3hvXgTKGYjyalY6
	 wmzwOl6jcc3Jr/s7m9/Wr1w/l6/xhAEcBMPBSyfsUI1AwPYz8dKbjKJ8bvjk72nZM1
	 tx+ZhoAtwQDhNZcEIU0Ydh1hDNMRzoIrZJ45ttqzRsHjX8t9N0LJmmbkUHOT4TMVst
	 dDlrgTcfSu6Fw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VH5LZ1MMkz9rxG;
	Sat, 13 Apr 2024 22:55:50 +0200 (CEST)
Message-ID: <fac2b3548c6247d503a147c11ca0ab4bc96ae7a1.camel@posteo.net>
Subject: Re: [OE-core] [PATCH 10/33] gnutls: upgrade 3.8.4 -> 3.8.5
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Simone
	=?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2024 20:55:49 +0000
In-Reply-To: <2024041214390494ce0c8b@mail.local>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
	 <1712646620-16608-10-git-send-email-wangmy@fujitsu.com>
	 <202404100045092623c1a2@mail.local>
	 <0175215d2582da11040d25cd9981531fbbddf237.camel@posteo.net>
	 <2024041214390494ce0c8b@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 20:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198201

T24gRnJpLCAyMDI0LTA0LTEyIGF0IDE2OjM5ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToKPiBPbiAxMS8wNC8yMDI0IDE5OjQxOjA5KzAwMDAsIFNpbW9uZSBXZWnDnyB3cm90ZToKPiA+
IE9uIFdlZCwgMjAyNC0wNC0xMCBhdCAwMjo0NSArMDIwMCwgQWxleGFuZHJlIEJlbGxvbmkgdmlh
Cj4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+ID4gPiBGYWlsZWQgcHRlc3RzOgo+
ID4gPiB7J2dudXRscyc6IFsnYWxlcnRzJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAn
Y2VydC1zdGF0dXMnLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdjaXBoZXJzdWl0ZS1u
YW1lJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnZHRscy1ldG0nLAo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICdkdGxzMTAtY2VydC1rZXktZXhjaGFuZ2UnLAo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICdkdGxzMTItY2VydC1rZXktZXhjaGFuZ2UnLAo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICdrZXlsb2ctZW52JywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAnbWluaS1jaGFpbi11bnNvcnRlZCcsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
J21pbmktcmVjb3JkLWZhaWx1cmUnLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdtaW5p
LW92ZXJoZWFkJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnbWluaS1yZWNvcmQnLAo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdtaW5pLXJlY29yZC0yJywKPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAncmVjb3JkLXJldHZhbHMnLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICdyZWhhbmRzaGFrZS1zd2l0Y2gtY2VydCcsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJ3JlaGFuZHNoYWtlLXN3aXRjaC1jZXJ0LWFsbG93JywKPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAncmVoYW5kc2hha2Utc3dpdGNoLWNlcnQtY2xpZW50JywKPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAncmVoYW5kc2hha2Utc3dpdGNoLWNlcnQtY2xpZW50LWFsbG93JywK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAncnNhLWVuY3J5cHQtZGVjcnlwdCcsCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3JzYS1wc2snLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICdyc2EtcHNrLWNiJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAncnNhZXMt
cGtjczEtdjFfNScsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3Rscy1ldG0nLAo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0bHMtZm9yY2UtZXRtJywKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAndGxzLW5lZy1leHQ0LWtleScsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJ3RsczEwLWNlcnQta2V5LWV4Y2hhbmdlJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAndGxzMTEtY2VydC1rZXktZXhjaGFuZ2UnLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICd0bHMxMC1zZXJ2ZXIta3gtbmVnJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAn
dGxzMTItYW5vbi11cGdyYWRlJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAndGxzMTIt
Y2VydC1rZXktZXhjaGFuZ2UnLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0bHMxMS1z
ZXJ2ZXIta3gtbmVnJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAndGxzMTItc2VydmVy
LWt4LW5lZycsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3RsczEzLWNlcnQta2V5LWV4
Y2hhbmdlJywKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAndGxzMTMtc2VydmVyLWt4LW5l
ZycsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3ZlcnNpb24tY2hlY2tzJ119Cj4gPiA+
IAo+ID4gPiAKPiA+IEhpLAo+ID4gCj4gPiBpcyB0aGVyZSBhIGF1dG9idWlsZGVyIGxpbmsgdG8g
dGhpcz8gSSB0cmllZCBpdCBsb2NhbGx5IGFuZCBhbGwgd2FzCj4gPiBmaW5lLgo+ID4gV291bGQg
bGlrZSB0byBjaGVjayBpdCBqdXN0IHRvIHNlZSBpZiBJIGNhbiBzcG90IGEgZGlmZmVyZW5jZS4g
T3IgZG8KPiA+IHlvdQo+ID4gKFdhbmcgTWluZ3l1KSBhbHJlYWR5IGNoZWNrIGF0IHRoZSBtb21l
bnQ/Cj4gCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9i
dWlsZGVycy84MS9idWlsZHMvNjQ4OS9zdGVwcy8xMi9sb2dzL3N0ZGlvCj4gCj4gaHR0cHM6Ly9h
dXRvYnVpbGRlci55b2N0by5pby9wdWIvbm9uLXJlbGVhc2UvMjAyNDA0MDktMjUvdGVzdHJlc3Vs
dHMvcWVtdXg4Ni02NC1wdGVzdC9nbnV0bHMubG9nCgpMb29rcyBsaWtlIGF0IGxlYXN0IHNvbWUg
bWlnaHQgYmUgZml4YWJsZSB3aXRoCmh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0v
bWVyZ2VfcmVxdWVzdHMvMTgzMAoKSSB3aWxsIHRha2UgYSBmdXJ0aGVyIGxvb2sKCj4gCg==


