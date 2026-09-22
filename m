Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E942C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 06:56:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4384.1790060187645270018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 23:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=e/ipBljd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A6789C23DB0
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:57:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 307BB60580;
	Tue, 22 Sep 2026 06:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBD5C10329157;
	Tue, 22 Sep 2026 08:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790060184; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2lhFuwo+mrM+jNccbEqzGw0pX86gH2g7kkTL9n1CSKU=;
	b=e/ipBljdSbuJmoAH35+WdXpJwaQzXiLcfpnvWTfhjH0091p9Ey1h/H+l84SKAdtxHykVDq
	zx89IICRsKNsG2P5NZV5u7D4tRKp9MiIoNT41DrJ7PMwPkoRvtGWe7afGhvHTq//r85Iu2
	w75CAXBGJp7Gu8DhMeiuwLFcKXrYmCoRHZdToTSVol21TYyw+KgsX6qeDAu1808u5vTQ2E
	yhgNVFd25jp+9BqV0/ItliIzfp0AieHI8GP2RxNrachwwLIqyquJEwNjShAb3D9sp9LN+8
	s26m5NrSbec4TvxEfQyJUZCQoSZxyJ6s5jA27LBYkoZasj/+6U7sCMjABWsGiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 08:56:22 +0200
Message-Id: <DLLNDJ3DBNK2.2NRQIBOT9Q52N@bootlin.com>
Subject: Re: [OE-core] [PATCH] pybootchartgui/README: fix broken
 bootchart.org URL
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Sandeep.J@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20260706040833.1138974-1-Sandeep.J@windriver.com>
 <881932.1790055763321136031@lists.openembedded.org>
In-Reply-To: <881932.1790055763321136031@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246379

Hi,

On Tue Sep 22, 2026 at 7:42 AM CEST, Sandeep J via lists.openembedded.org w=
rote:
> Hi,
>
> Gentle ping on this patch. It has been waiting for review for some time.
>
> Could someone please take a look and provide feedback?

Your patch is currently merged on the master branch.

Antonin

