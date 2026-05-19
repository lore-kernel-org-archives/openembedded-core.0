Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210ACCD4F52
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 08:34:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16794.1779179659151288902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 01:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wFtQGa1S;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 62E32C2B9E9;
	Tue, 19 May 2026 08:35:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 422E2606E9;
	Tue, 19 May 2026 08:34:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8CD711AF8B70;
	Tue, 19 May 2026 10:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779179656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PKGtTWPbi6V/uhbrAZaGXmauDHjRfDfgQBZB52IIbZ0=;
	b=wFtQGa1S6EIYSZWq286yMFRCM7S4K6iPNBpndeWaptimzzqZS3NKcEeDrw55YqpCjR+vf4
	vfC6ZEFt9Hxqg6eWZfF6VlGAiLr8pJgm3mirLmesAWw5AYO6PrbFXlDWPn6EbM2uS/WM5o
	TnTxza0rQwTrVQJb83xC9nC9zfj3DvPWTu9zoAbHfs1iub1GIKcyzlCSDB+AcKA3UtIsgM
	yoKE+C6baxXpYCIcWYGcGYSX/jfMXnP0r3A1DBvT4Aa//TIN9ZdfLZobUwIvEBpYb6Kssh
	H0hc/n11ZndB14sCm49+dp0/onz4w7xP7i/9t4sO6qutRwwyS47UCNRjYawB/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 10:34:14 +0200
Message-Id: <DIMIJTY0GGEX.13JQIE01GIF1N@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v1] zstd: add ptest support
Cc: <pratik.farkase@ericsson.com>
References: <20260508083451.11094-1-pratik.farkase@est.tech>
In-Reply-To: <20260508083451.11094-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 08:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237292

Hi,

Sorry, this patch no longer applies on master, due to conflicts with the QB=
_MEM
assignment. Could you rebase and resend?

Antonin

