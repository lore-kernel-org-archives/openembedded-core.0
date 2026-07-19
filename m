Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAE7C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 06:26:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.891.1784442374355542570
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 23:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LLun6//D;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1453B4E40E52;
	Sun, 19 Jul 2026 06:26:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBF20601A5;
	Sun, 19 Jul 2026 06:26:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DE2B11BD0158;
	Sun, 19 Jul 2026 08:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784442371; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XYcVTxEnHFVFDFwdU0V1Pq7oGyOJn/efjFTIesj/aP0=;
	b=LLun6//DzdhpIfh9lqq+znHtbu4qxThGHXCSU0in/60ra/bTbab6EW87DZO8Rf//8nq7KZ
	1pFNQK7PAlvNO1ffQMXKyOZFLOBPKHwPbSkQCXbBmVRlWLM3JMxLb3nZaHyY0LclLzvaqg
	NLh6q0IBnqEw0t2Frc/9shn5NbiAltc4xQ5yzNGgJO7fscw/NN/olfaORICciCQpb6KDVt
	TiFnE5JDpwQueEWkmeNAnRO4A/JT0ZIQFqhbSCc2BhTp1DCiYYEX2V38xI5nm8QF/qdIQE
	IRPQnJT53akF0wHyHs4EMaM9uo4+HKQIQvJDUMK5jVx+DVLU000I3rm5voLRCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 08:26:08 +0200
Message-Id: <DK2C0Z9DDTDG.OTLWJC41N5TD@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/3] mesa-libclc: New recipe for forking
 libclc for Rusticl purposes in Mesa
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <zboszor@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260718050502.62359-1-zboszor@gmail.com>
 <20260718050502.62359-2-zboszor@gmail.com>
In-Reply-To: <20260718050502.62359-2-zboszor@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 06:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241275

On Sat Jul 18, 2026 at 7:05 AM CEST, Zoltan Boszormenyi via lists.openembed=
ded.org wrote:
> See the reasoning and discussion at
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
>
> TL;DR: LLVM constantly introduces breaking changes that cause
> regressions for running OpenCL CTS with Rusticl and finally
> Karol Herbst had enough.
>
> This fork is from the LLVM 22 version of libclc and contains the
> necessary fixes to make Rusticl pass OpenCL CTS.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Hi Zolt=C3=A1n,

Thanks for your patch. Please keep in mind you need to add an entry in
meta/conf/distro/include/maintainers.inc.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


