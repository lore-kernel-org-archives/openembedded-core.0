Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CA9CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 07:22:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65205.1781248942320219824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 00:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XbIjJEG+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C5561A38D6;
	Fri, 12 Jun 2026 07:22:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A91560012;
	Fri, 12 Jun 2026 07:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 885BD106C801C;
	Fri, 12 Jun 2026 09:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781248939; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZIjx+/iA8KiGO8oRGM+F95AEFU7DrndlN/kDFJ27/Iw=;
	b=XbIjJEG+MtnrCJMAo4oRgj+aWdygHyhovnySYj9+yhWRqin8SnPzlXSdmb57uNJDfsSUvE
	oykP+SrLXvuHMBfwD2hl98SZToVkDQaQkgtRq5dXmW34JxOEKz59EX5DRRRU2Gp/d0uQCo
	7Vy3OhHuR99TxsZCO3Jpy2eDlLjkRTPTs4Rwa2rucQsdNcI8xSBr/xX9f6bNISvPev0TFb
	A6b8nAasMY4fU3lzxNThysvUj/PCIFwZMqbiKB7WQe282y0bjK8Tf1WxjghiGWkGCouFgB
	hoUE32GChKX/ceN0PHDuorOSkzIp5lxLPR9XehoUOGEEzgvLS9siLb819FxVqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 09:22:17 +0200
Message-Id: <DJ6W1TADIW9X.ZVL79ILEM8U@bootlin.com>
Subject: Re: [OE-core] [meta][scarthgap][PATCH] tiff: fix CVE-2026-4775
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <nmjain23@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612034133.804411-1-namanj1@kpit.com>
In-Reply-To: <20260612034133.804411-1-namanj1@kpit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238592

On Fri Jun 12, 2026 at 5:41 AM CEST, Naman Jain via lists.openembedded.org =
wrote:
> Fix CVE-2026-4775
>
> Reference: https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc2=
1e714950a4af5bf89f023c
>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---

Hi Naman,

Thanks for your patch, but we already have this CVE backport in the
master branch. Was this meant to target a stable branch?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


