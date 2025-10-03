Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530CECAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 14:46:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.9376.1759502792754489724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 07:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zb90d3NZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B6111A10D8
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Oct 2025 14:46:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D56E760683;
	Fri,  3 Oct 2025 14:46:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FB7C102F1B8A;
	Fri,  3 Oct 2025 16:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759502790; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9yQ/x3rADe3FAEV9NKsMviIs0HQ2JHasnNl/uvjt60E=;
	b=zb90d3NZm2PXgKTqnTRXFscEMXeNa9lYjo+Vg48EvMLuLufUY8bH4vkkCjKvsmidhhSI/f
	SbSqOJJ/RzDIJ65lFU0Q7EaUhoUjALY7nu/7fDqR3lRjimsYywtpZC0Sje/4LZBUKdnkaC
	EaiZBWmDjVDyz5uVtn/5DQGmx+p1/OcbRMTBVMeZgKAKiKb3N8MJ+b7MTn4O8efncanspO
	8V4sI1l+HH+RkhG/Sn/04j4uagdWSUcjjq7SCpT9vqOdCn+Vw2FLSpar3mvB9VksT1kHWI
	i0j31PpHkH5Gnr8AHkcUqeJKaMjdENZ0vaxi4gMvjk0t5xuwvQjt1I9HvTyP7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 16:46:24 +0200
Message-Id: <DD8ROKJ3ZOQU.BJNE39ZC6RYD@bootlin.com>
Subject: Re: [OE-core][PATCH] ghostscript: upgrade 10.05.1 -> 10.06.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <reatmon@ti.com>, <vanusuri@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250929104731.19684-1-vanusuri@mvista.com>
 <a177c9f3-ac3d-4c37-9723-60b04e0984ca@ti.com>
In-Reply-To: <a177c9f3-ac3d-4c37-9723-60b04e0984ca@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224392

On Fri Oct 3, 2025 at 3:36 PM CEST, Ryan Eatmon via lists.openembedded.org =
wrote:
>
> This was accepted onto master, and we are seeing different a different=20
> 32bit build failure:
>
> ./brotli/c/dec/decode.c: In function 'PreloadSymbol':
> ./brotli/c/dec/huffman.h:83:47: error: ISO C90 forbids mixed=20
> declarations and code [-Werror=3Ddeclaration-after-statement]
>     83 | #define BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(H) uint32_t=20
> __fastload_##H =3D (*H)
>        |                                               ^~~~~~~~
> ./brotli/c/dec/decode.c:440:3: note: in expansion of macro=20
> 'BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD'
>    440 |   BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
>        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

Hi Ryan,

Just for reference, this is not the version of the patch that was
accepted: the v2 was.

Message-ID: <20250930153901.246829-1-vanusuri@mvista.com>

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


