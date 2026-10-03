Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6808BCA5FEC
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 17:32:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9752.1791048749504375973
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 10:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GUzeam5l;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B7C14E41138
	for <openembedded-core@lists.openembedded.org>; Sat,  3 Oct 2026 17:32:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16F22604FF;
	Sat,  3 Oct 2026 17:32:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5CB910328170;
	Sat,  3 Oct 2026 19:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791048746; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uJatcqff85i4rp/CGgY03kxT6kpLI0CSEd60RFhCXG0=;
	b=GUzeam5l8JTSfQWjCqO01fPGQ9Uk8VyDeI/6BQ/VPEEXayR/hmHwiLAZY+XxJXjLTA+xpo
	FlkPqElUqaGjWbrzfZclzlS8nhjXFLUYZBpTNOQ0rT5HCDp+SyyFN+otnA6AicR2VKW9J/
	nxIecIXtJs01LOEids/M3/alLmkT2wl4kiNyz81KjRtScO7Sa3r06v4OaD6Ce0DrkjVZec
	iroVXunNCS2ZxpZG0Kq1tuHgtoOHNvPOaM9gGuq0QlhgW2jpX7/hjaBCZ9EBdBkwc0E5EP
	swt2L9++GVAL4vw1A+yAsbqjD1qhWqdX4yoHMHFjfUh82pPt5IjE9FVRWWy5sg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 19:32:23 +0200
Message-Id: <DLVDSHR4BS6N.IM40D20RGZGK@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] igt-gpu-tools: fix build on non-x86
 platforms
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261002-igt-v2-1-77231953eead@oss.qualcomm.com>
In-Reply-To: <20261002-igt-v2-1-77231953eead@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 17:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247172

On Fri Oct 2, 2026 at 9:30 PM CEST, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> The "pause" assembly mnemonic is only available on IA-32 platforms,
> breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
> only with -O1 or -O0, the default -O2 seems to optimize the condition
> away.
>
> Guard this inline assembly with the preprocessor checks, making sure
> that other platforms don't see the invalid assembly.
>
> FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> Assembler messages:
> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for your patch. igt-gpu-tools was recently upgrade to 2.6, and
this patch does not apply cleanly on top of it? Can you send a rebased
version please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


