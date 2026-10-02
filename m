Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7627FCA5FD9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 08:52:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6995.1790931125214364130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 01:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RIZ1PInu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 129544E41100
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 08:52:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D39CF603DC;
	Fri,  2 Oct 2026 08:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78CD410328295;
	Fri,  2 Oct 2026 10:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790931122; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gvMK7qdFrvJmYpx38KY0fWHWE47ou3Bv3eOy/7XO4d4=;
	b=RIZ1PInujr+q+fv+469M995ZF0WxiiPa8mTdZeMHJaWCiNJZkM4mQpTOKxVHsoTfhC8jpx
	CqtWSDosSyCYEAblr+dYrFXksrX97RcmBK9MUUeMTACkMn87KjdG3u3VFaj+5CPen8J1+p
	xH5eOktpC+dwky4ducFqf2DkZWB/LeFH20IF5TbkKsfcjfCW3ooX88UGOOj9RBv26shXtn
	WeEzeSLc5+xUIcG/GhKxIjbOiOEse3QWn9a8EHKVevLY2eYbU99/e1A9WrvXQskD8LaFCX
	JMjxpl7ijnFi8FhzYxN637wJmib1MWiIha7fsfSY6IIOd/oz9T5K6D2yFAY1Wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 10:52:00 +0200
Message-Id: <DLU83IUWHFP0.2IU6H1IY0JSAW@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] libjitterentropy: upgrade 3.6.3 -> 3.7.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
 <20261002071557.74249-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20261002071557.74249-2-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 08:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247091

On Fri Oct 2, 2026 at 9:15 AM CEST, Jaipaul Cheernam wrote:
> Source: CHANGES.md
>
> 3.7.0
>  * Add secure memory implementation for Linux and {Net,Open,Free}BSD, Mac=
OS and Windows
>  * Update supported CMake version to 3.10
>  * doc: use Doxygen-style comments
>  * NTG.1 compliance: Modify startup such that the memory access and SHA-3=
 loop are treated as independent noise sources which are sampled to collect=
 at least 240 bits each before first block of random numbers is released
>  * Remove all code when JENT_CONF_DISABLE_LOOP_SHUFFLE is unset. This cod=
e is already discouraged for a long time. Now it is taken out for good.
>  * If cache size cannot be detected from base system (e.g. virtualization=
), use the requested memory size.
>  * Change the stuck test to always calculate the absolute values of the 2=
nd and 3rd discrete derivation of time.
>  * Replace SHA3-256 output generation with XDRBG-256
>  * Prune the jitterentropy.h header file of internal definitions and delc=
arations which are moved to src/jitterentropy-internal.h. With that, jitter=
entropy.h only contains the API. This modification does not alter the Jitte=
r RNG behavior at all.
>  * Update secure storage memory implementation for libgcrypt and OpenSSL
>  * Add API jent_status
>
> License-Update: copyright years updated.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade.

It looks like this is breaking rng-tools:

ERROR: lib32-rng-tools-6.17-r0 do_compile: oe_runmake failed
...
| ../sources/rng-tools-6.17/rngd_jitter.c: In function 'rngd_notime_start':
| ../sources/rng-tools-6.17/rngd_jitter.c:56:45: error: invalid use of unde=
fined type 'struct jent_notime_ctx'
|    56 |         ret =3D -pthread_attr_init(&thread_ctx->notime_pthread_at=
tr);

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4614
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4816

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


