Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAD0FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 07:59:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10028.1777881589234001946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 00:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rMq9Y1/m;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B49F4E42BBE
	for <openembedded-core@lists.openembedded.org>; Mon,  4 May 2026 07:59:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20046602AC;
	Mon,  4 May 2026 07:59:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F50411AD22DD;
	Mon,  4 May 2026 09:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777881586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MC7PGxbwlhy9exclYaeEzoo7ZTEaaHO+BtjU1LI8HpI=;
	b=rMq9Y1/mmERmU/P8sHRi3xkqJQva9Z7+ElQnJBVYH5d1thOUpybSgrD0pCgzJRzjQu/1eQ
	GXz7RfeFVMkkGEESD4RSA/RXtu1ELmSV7uxUBmF5IvQsnOcDuJNf5mkTT/XswJSyZIG1B5
	OUOBanEHSexq2tFfME6fBBjkWJT6qVp4xNn+2bIYeGDK/0dT0woM1y9dX3ZVbkLqT3OOZn
	G255CyduV3awZOyq5IAlqlpHtuT/lrIdiwb37RLndWmSL9cACJhOcgHp/IGvQMfKFvyCp3
	DSf2cHtnDutAZK1c2wnKRZDjOM+lg0GXQXDX1YqQ2jGRI4qMlI0tZYQgXspDyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 09:59:44 +0200
Message-Id: <DI9QF8RCYOPJ.I433OB527RZU@bootlin.com>
To: <sam.john.kent@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/2] oeqa/selftest: add oe-selftest for
 kernel module pre-filter
Cc: <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
 <20260429124524.2890648-1-sam.john.kent@gmail.com>
 <20260429124524.2890648-2-sam.john.kent@gmail.com>
In-Reply-To: <20260429124524.2890648-2-sam.john.kent@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 07:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236435

On Wed Apr 29, 2026 at 2:45 PM CEST, Sam Kent via lists.openembedded.org wr=
ote:
> Add selftest-ko-filter recipe and a PackageTests.test_kmodule_prefilter
> oe-selftest that builds it to verify process_split_and_strip_files()
> handles .ko.xz/.ko.gz alongside a real .ko without corrupting them.
> Regression test for YOCTO #2348.
>
> AI-Generated: Uses Claude Sonnet 4.6
>
> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> ---

Hi Sam,

Thanks for your patch.

> diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/self=
test/cases/package.py
> index 38ed717..d33424b 100644
> --- a/meta/lib/oeqa/selftest/cases/package.py
> +++ b/meta/lib/oeqa/selftest/cases/package.py

I have some trouble to find a version with this patch in. Are you based
on the master branch?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


