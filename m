Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B1ECD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:06:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18122.1781784397490496202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 05:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UGfHTe5F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 431221A3A0D
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 12:06:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1C775FF03;
	Thu, 18 Jun 2026 12:06:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF1CC106C8098;
	Thu, 18 Jun 2026 14:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781784394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VAW6Vr8YgbFSj592O9LwnHVONg1oOL1VFOH5fy7eLXM=;
	b=UGfHTe5FcTvsdDP5tUOgT6bLoBUoaV4E/3QFKaRg56U8Cyt9CZqXSx71L/ooYeWzDxo/68
	E/nYQXwFKfWdyJeVhtamU/hmrYi4LmayJ1HQytLB9IgvwN0VY1OCI8aCbVgZDNsaeR3L+a
	3+sCY4rP7rQh39GQrHochsxXzTcHWjR/2witXUY3f530WyqjPcdMJBhAw29utIYWUx/Lz5
	yH7ay3dEMdwNnN4pJRZaX4K7/5lPbloP3stclaneum8M2EHD4upghA28cInVqL+FbsAihx
	YxWM7bZH//0ML9gypkpEQ9czBa8uPRBgu3UTPYdDpdYTDrr0N5W+/Hg6nvzbqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 14:06:30 +0200
Message-Id: <DJC5UOZ08MA6.3U11UOT7X8IA8@bootlin.com>
Subject: Re: [PATCH][wrynose] gstreamer1.0-plugins-bad: handle padded
 buffers in wl_shm buffer creation
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Yoann Congal"
 <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Tushar Darote" <tdarote@qti.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260618070054.543418-1-tdarote@qti.qualcomm.com>
In-Reply-To: <20260618070054.543418-1-tdarote@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 12:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239080

On Thu Jun 18, 2026 at 9:00 AM CEST, Tushar Darote wrote:
> Use GstBuffer metadata when constructing wl_shm buffers so stride and siz=
e reflect the actual buffer layout.
> This fixes incorrect rendering with DMA-backed buffers that include paddi=
ng or custom strides.
> (cherry picked from commit 866915fa7bcbe563849aa1100033c684a805fc24)
>
> Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hi Tushar,

So I believe this is a backport for wrynose, right? Please remember to
add the [wrynose] prefix in the subject.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


