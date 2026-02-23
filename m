Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAFDE98E08
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:14:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31392.1771834481961866939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NgEcjQjr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3FF574E4102B;
	Mon, 23 Feb 2026 08:14:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F34645FD43;
	Mon, 23 Feb 2026 08:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94F6110368A24;
	Mon, 23 Feb 2026 09:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771834479; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QNyg2dqwhQUvpahyfIueQq7oxktgzZqtjkVGGNMJ+t4=;
	b=NgEcjQjrN76x1roO7dWaFdhAv+O8zD2byXrfNItv62qN5xedhbvzUZltSmsEEXzq0liD1J
	zPTDs+YQIh5P4mZ6Sy7bzFoUIQkjKPc5yqKsyjsWJjkInlfL4XDmvo69Mv5DN8dpBLjpcr
	YuxpHoWcmCGMfvHI4R4bywriXIPgt5ltS8tHZBk+RyqjjjK+3o/tZRXuVYBnxVVZz6BEC6
	N2sAJXd3VKI6Aop6G6S32HBjLH1wuYYm1GssCQ8lI0QTSu67W+JKndn5AXIF1qAVORTG6B
	iYGLiLw760AjDw2qOwgU8xswDBksUIA7z8VeX+5un2roxwe9eCGpSsxVbrVhBw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 09:14:36 +0100
Message-Id: <DGM6WHKGGWC9.3LW57QP3T4P5Z@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mark.yang@lge.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] llvm: enable LLVMgold.so build by adding
 binutils dependency
References: <20260223064905.2417217-1-mark.yang@lge.com>
In-Reply-To: <20260223064905.2417217-1-mark.yang@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231654

Hi,

On Mon Feb 23, 2026 at 7:49 AM CET, mark.yang via lists.openembedded.org wr=
ote:
> From: "mark.yang" <mark.yang@lge.com>
>
> Currently, LLVMgold.so is not built because the binutils headers
> are missing during the build process.
>
> This allows LLVM to find the necessary headers and build the LLVMgold.so,
> which is required for Link Time Optimization (LTO) support properly.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

I don't think my Signed-off-by here is appropriate as I did not sign-off th=
is
version of the patch in particular. I may have picked a previous version of=
 this
patch and applied it to my branch. But when re-sending a patch please the
Signed-off-by list to your identity only.

Thanks!
Antonin

