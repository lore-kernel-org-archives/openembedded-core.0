Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527F5F36C42
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:38:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14804.1776670732565028277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wu/Enf3e;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F8EFC5C98B
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:39:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F79E5FFA5;
	Mon, 20 Apr 2026 07:38:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AB0610460890;
	Mon, 20 Apr 2026 09:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776670729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EZQIj9EyARExaRSvZQj00kIGNeFoXn83cg4U3DBuUMM=;
	b=wu/Enf3eG7vQGs4tRPt0UiFTEnaSwBuywr57W+KwmOQci2K0H1fOTTFn/zljIz2yK0gO5x
	UhCeKZSq2YnkdVOcT7FOkDwbPju3to7fGicS83eNkJMLZMQGkU4XMWl92aRReZjegOEoWf
	WxZ3ZmOV29aoyde+6wuwXdkfXSzE1rIpobfRV7aUjUBcn/E3fr90OYxNfCliuC7l3fjKan
	yLWfq+rdW2k2VR464lskCj5RYlB/JRIruOAqyVddOry6neaBPyOptFZce+VBRDfehWxlFV
	Wy8rJhz2IGeA9bVvyxIt0IQYWMuXqiWyxiP5pJAyf7Tq2l7UatV+PWqncWHpuA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
Cc: Ross Burton <ross.burton@arm.com>
Subject: 
 Re: [OE-core][question] sbom-cve-check: question about ${DEPLOY_DIR_IMAGE}
Date: Mon, 20 Apr 2026 09:38:48 +0200
Message-ID: <nDCCJOaNSUiE7m-GDyIPpA@bootlin.com>
In-Reply-To: 
 <TY7PR01MB14803D1141A848F97B5A907368B2F2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
References: 
 <TY7PR01MB14803D1141A848F97B5A907368B2F2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235540

SGVsbG8sCgpPbiBNb25kYXksIEFwcmlsIDIwLCAyMDI2IGF0IDM6NDPigK9BTSwgUnVvcWluIFpo
ZW5nIChGdWppdHN1KSB3cm90ZToKPiAgSGkgQWxsCj4gCj4gICAgSSB0cnllZCB0byB1c2Ugc2Jv
bS1jdmUtY2hlY2stcmVjaXBlIGFuZCBmb3VuZCB0aGF0IHRoZSBzYm9tIGZpbGUgd2lsbCBjb3B5
IHRvICR7REVQTE9ZX0RJUl9JTUFHRX0uCj4gCj4gICAgSXQgd2lsbCBjYXVzZSBhIGxvdCBvZiBz
Ym9tIGZpbGVzIGluICR7REVQTE9ZX0RJUl9JTUFHRX0gZGlyIGFuZCBoYXJkIHRvIGZpbmQgdGhl
IHJvb3Rmcy9rZXJuZWwgd2hpY2ggdXNlciB3YW50IHRvIGZpbmQuCj4gCj4gICAgLi9kZXBsb3kv
aW1hZ2VzL3FlbXV4ODYtNjQvCj4gICAgLi4uLi4uCj4gICAgIHpsaWItbmF0aXZlLXJlY2lwZS1z
Ym9tLnNib20tY3ZlLWNoZWNrLnNwZHguanNvbuKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAggo+ICAgICB6bGliLW5hdGl2ZS1yZWNpcGUt
c2JvbS5zYm9tLWN2ZS1jaGVjay55b2N0by5qc29u4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCCj4gICAgIHpsaWItbmF0aXZlLXJlY2lwZS1z
Ym9tLnNwZHguanNvbuKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAggo+ICAgICB6bGliLXJlY2lwZS1zYm9tLnNib20tY3Zl
LWNoZWNrLnNwZHguanNvbuKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAggo+ICAgICB6bGliLXJlY2lwZS1zYm9tLnNib20tY3ZlLWNo
ZWNrLnlvY3RvLmpzb27igILigILigILigILigILigILigILigILigILigILigILigILigILigILi
gILigILigILigILigILigIIKPiAgICAgemxpYi1yZWNpcGUtc2JvbS5zcGR4Lmpzb27igILigILi
gILigILigILigILigILigILigILigILigILigILigILigILigILigILigILigILigILigILigILi
gILigILigIIKPiAgICAuLi4uLi4KPiAKPiAgICBGaXJzdCwgSSB3YW50IHRvIGFzayB0aGUgZGVz
aWduIGdvYWxzIG9mIHRoaXMgb3V0cHV0IGRpci4KPiAKPiAgICBUaGVuIEkgZm91bmQgaXQgd2Fz
IGRlZmluZWQgaW4gc2JvbS1jdmUtY2hlY2stcmVjaXBlLmJiY2xhc3MgYW5kIEkgdHJ5ZWQgdG8g
Y2hhbmdlIGl0IHRvIG90aGVyIGRpciBpbiBsb2NhbC5jb25mIGJ1dCBpdCBjYW4ndCB3b3JrLgo+
ICAgIGRvX3Nib21fY3ZlX2NoZWNrX3JlY2lwZVtzc3RhdGUtb3V0cHV0ZGlyc10gPSAiJHtERVBM
T1lfRElSX0lNQUdFfSIKPiAKPiAgICBEb2VzIGFueSBvbmUga25vdyB0aGUgd2F5IHRvIGNoYW5n
ZSBpdCBvdXRzaWRlIG9mIHNib20tY3ZlLWNoZWNrLXJlY2lwZS5iYmNsYXNzPwoKQ3VycmVudGx5
IGFzIGRlc2lnbmVkLCB3aXRob3V0IG1vZGlmeWluZyB0aGUgYmJjbGFzcywgaXQgaXMgbm90IHBv
c3NpYmxlIHRvCm1vZGlmeSB0aGUgb3V0cHV0IGRpcmVjdG9yeS4KV2UgY291bGQgY3JlYXRlIGEg
dmFyaWFibGUsIHdoaWNoIGlzIGJ5IGRlZmF1bHQgc2V0IHRvICIke0RFUExPWV9ESVJfSU1BR0V9
IgphbmQgdXNlIHRoaXMgbmV3IHZhcmlhYmxlIHRvIGNvbmZpZ3VyZSBzc3RhdGUtb3V0cHV0ZGly
cy4KCk9yIHdlIGNvdWxkIHNpbXBseSByZXBsYWNlIHRoZSBsaW5lIGJ5Ogpkb19zYm9tX2N2ZV9j
aGVja19yZWNpcGVbc3N0YXRlLW91dHB1dGRpcnNdID89ICIke0RFUExPWV9ESVJfSU1BR0V9IgoK
LS0gCkJlbmphbWluIFJvYmluLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQo=





