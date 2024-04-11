Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C65C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 19:41:18 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.27756.1712864474224716574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 12:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=FC3cMyKs;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E33B6240104
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 21:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1712864471; bh=ZKP2VDqFnnBSkts7cIbRdDxzFp4O5ceiPUvlydeQsws=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=FC3cMyKsIqmi5UuoIxOS8IuyKMAZWuA1nI0uM7yQIJfmCGw7+zqcO5lH0DwyXzyOi
	 VWskOWwCXnLFDUsWGbOkRQygUZu8O8wtYextjN85E5+m40OLhMKVnx9aCR8UN+uj1s
	 azq2Y0/XQIXyVSh9s51rHCICveGEtZNA8Y+GlL6yHArKpfC9aCjxrXJ6QQwkK5YHeR
	 g9h90s3ouXB1RePX/Rdija4ICJujDyFvz3PlzLYQPLSJG59nV4reEC7cXRjL67Y5AC
	 icfjceHkYX098dwLWT9oVUILE1Bro5LPp8I8/aL6XYVhBblr/fGSz221YJ6LojSUPh
	 MtRkcV4yYotzw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VFqnL0f6wz6tm8;
	Thu, 11 Apr 2024 21:41:10 +0200 (CEST)
Message-ID: <0175215d2582da11040d25cd9981531fbbddf237.camel@posteo.net>
Subject: Re: [OE-core] [PATCH 10/33] gnutls: upgrade 3.8.4 -> 3.8.5
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: alexandre.belloni@bootlin.com, wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2024 19:41:09 +0000
In-Reply-To: <202404100045092623c1a2@mail.local>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
	 <1712646620-16608-10-git-send-email-wangmy@fujitsu.com>
	 <202404100045092623c1a2@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 19:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198142

T24gV2VkLCAyMDI0LTA0LTEwIGF0IDAyOjQ1ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB2aWEK
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiBGYWlsZWQgcHRlc3RzOgo+IHsnZ251dGxz
JzogWydhbGVydHMnLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2NlcnQtc3RhdHVzJywKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICdjaXBoZXJzdWl0ZS1uYW1lJywKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICdkdGxzLWV0bScsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnZHRsczEwLWNl
cnQta2V5LWV4Y2hhbmdlJywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdkdGxzMTItY2VydC1r
ZXktZXhjaGFuZ2UnLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2tleWxvZy1lbnYnLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJ21pbmktY2hhaW4tdW5zb3J0ZWQnLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJ21pbmktcmVjb3JkLWZhaWx1cmUnLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJ21pbmktb3ZlcmhlYWQnLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ21pbmktcmVjb3Jk
JywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdtaW5pLXJlY29yZC0yJywKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICdyZWNvcmQtcmV0dmFscycsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAn
cmVoYW5kc2hha2Utc3dpdGNoLWNlcnQnLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3JlaGFu
ZHNoYWtlLXN3aXRjaC1jZXJ0LWFsbG93JywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdyZWhh
bmRzaGFrZS1zd2l0Y2gtY2VydC1jbGllbnQnLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3Jl
aGFuZHNoYWtlLXN3aXRjaC1jZXJ0LWNsaWVudC1hbGxvdycsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAncnNhLWVuY3J5cHQtZGVjcnlwdCcsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAncnNh
LXBzaycsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAncnNhLXBzay1jYicsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAncnNhZXMtcGtjczEtdjFfNScsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAndGxzLWV0bScsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAndGxzLWZvcmNlLWV0bScsCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAndGxzLW5lZy1leHQ0LWtleScsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAndGxzMTAtY2VydC1rZXktZXhjaGFuZ2UnLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJ3RsczExLWNlcnQta2V5LWV4Y2hhbmdlJywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICd0bHMxMC1zZXJ2ZXIta3gtbmVnJywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0bHMxMi1h
bm9uLXVwZ3JhZGUnLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3RsczEyLWNlcnQta2V5LWV4
Y2hhbmdlJywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0bHMxMS1zZXJ2ZXIta3gtbmVnJywK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICd0bHMxMi1zZXJ2ZXIta3gtbmVnJywKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICd0bHMxMy1jZXJ0LWtleS1leGNoYW5nZScsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAndGxzMTMtc2VydmVyLWt4LW5lZycsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAndmVyc2lvbi1jaGVja3MnXX0KPiAKPiAKSGksCgppcyB0aGVyZSBhIGF1dG9idWlsZGVyIGxp
bmsgdG8gdGhpcz8gSSB0cmllZCBpdCBsb2NhbGx5IGFuZCBhbGwgd2FzIGZpbmUuCldvdWxkIGxp
a2UgdG8gY2hlY2sgaXQganVzdCB0byBzZWUgaWYgSSBjYW4gc3BvdCBhIGRpZmZlcmVuY2UuIE9y
IGRvIHlvdQooV2FuZyBNaW5neXUpIGFscmVhZHkgY2hlY2sgYXQgdGhlIG1vbWVudD8KCkJlc3QK



