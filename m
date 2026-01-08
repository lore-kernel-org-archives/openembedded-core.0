Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66D7D1D46D
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 15:12:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8557.1767885146134886678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 07:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pIdv3C8k;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 744621A270E
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 15:12:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48BAE606B6;
	Thu,  8 Jan 2026 15:12:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B489C103C8189;
	Thu,  8 Jan 2026 16:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767885143; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mue/P82bgr9R39wP+ibjUbB3zskLflHS+EEKAb6UEos=;
	b=pIdv3C8kM+SyA/2bFFXMiQE3CgrmDijPsDUPK1Q9V54USacARk4AE7/yKXqf0rqMC3WqnB
	cW+UxgnKhkU/xcGsK/23xzT76Y6jNYAb7kEpVKHjVhfMnEMd5nmh4/xMTvDFkrlOfPaHuh
	yBCWG4mzUIVciwcYh6O3Mzke6xHk1n6MsiJbuqPVHLNycRu0Ht+C3PmGno2RepfUi+FZ02
	1b2n0vpDl1NOD8IAHwaMyZRKCOnKkplC6lsZLaainSSvJllFyBfH4VHV3W9aF20Vj+UHTF
	Ej80S20ytQNMbH2sTSPalUGSqz0xpF+7frjE1vMYaj9bB4WLiZxDpsRwiXJGhA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 16:12:22 +0100
Message-Id: <DFJAZADQVDTG.102F6ZFCRZFLR@bootlin.com>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][scarthgap] grub: fix CVE-2025-54771
Cc: "Steve Sakoman" <steve@sakoman.com>, "Yoann Congal"
 <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260108094644.12175-1-amaury.couderc@est.tech>
In-Reply-To: <20260108094644.12175-1-amaury.couderc@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 15:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229083

On Thu Jan 8, 2026 at 10:43 AM CET, amaury.couderc wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---

Hi Amaury,

I believe this patch is not targeting the master branch but scarthgap.
Is that right?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


