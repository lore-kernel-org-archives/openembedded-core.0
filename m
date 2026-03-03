Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC671E67A9A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 08:44:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13940.1772527494475787377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 00:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BvH5Hwbv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 663451A22C1;
	Tue,  3 Mar 2026 08:44:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AF545FF29;
	Tue,  3 Mar 2026 08:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2920210368535;
	Tue,  3 Mar 2026 09:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772527491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k+dxABEGHQQOvuNzQZTZDkg6ovWbmayQLP4A75B+KRI=;
	b=BvH5Hwbv+VWGIgkBkLxsCM7gUxlo0ZvU/7gLs0SLyM9WKKN5+ydETWc4Ez5VqShuIZ1svY
	cuUb81TzW0z6Q/Vehhqp2Ct7Mmpw0c+QTy8E1MZ8AzF9MQ1aedP7QI8G0UMeMlV12ZM+La
	9QZZGQdLWH9Gw134Sb4jy8f9Pz1pYqcET+L7tC1Ws4JFT3+spMEih37IvUNZgZEo5cLTvh
	zPzEaDeIrLIbib1wFUyI1lEq1gWnKtE+D+UiEk7qvfgTOj/Z02qiOZxBqZhYfKRusbheAB
	mwlaAfKkFPU0uxzv5VP1IfQGUhGpRj5jLOAzeQMAQgwfF8y/BROWWluxdswumA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 09:44:50 +0100
Message-Id: <DGT0JZJJG1TR.2WO974AGZDT6G@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/10] linux-yocto: consolidated / combined
 pull request
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 08:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232266

On Mon Mar 2, 2026 at 5:55 AM CET, Bruce Ashfield via lists.openembedded.or=
g wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> Here's the next set of -stable update for 6.18.
>
> 7.0 will be the dev kernel shortly, just waiting for -rc2 on it
> before pushing the changes.
>
> Also note that this is again a combined oe-core, yocto-bsp pull
> request. I've keep the numbering 0-N to hopefully lore/b4 won't
> miss things.
>
> If this doesn't work (the formatting), I'll just go to different
> sends for the different repos.
>
> Bruce
>
> openembedded-core (7):
>   linux-yocto/6.18: update to v6.18.9
>   linux-yocto/6.18: update CVE exclusions (6.18.9)
>   linux-yocto/6.18: update to v6.18.11
>   linux-yocto/6.18: update CVE exclusions (6.18.11)
>   linux-yocto/6.16: genericarm64: feature splits and enablement
>   linux-yocto/6.18: update to v6.18.13
>   linux-yocto/6.18: update CVE exclusions (6.18.13)
>
> meta-yocto (3):
>   yocto-bsp: update to v6.18.9
>   yocto-bsp: update to v6.18.11
>   yocto-bsp: update to v6.18.13
>
>  openembedded-core:
>  meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 306 +++++++++++++++=
+++++-
>  meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |   6 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  24 +-
>  4 files changed, 313 insertions(+), 29 deletions(-)
>
>  meta-yocto:
>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi Bruce,

Thanks for your patches. Looks fine on the autobuilder, except for a
single warning on arm64:

WARNING: linux-yocto-6.18.13+git-r0 do_kernel_configcheck: [kernel config]:=
 This BSP contains fragments with warnings:

[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_PINCTRL_SM8350_LPASS_LPI

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3303
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3277

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


