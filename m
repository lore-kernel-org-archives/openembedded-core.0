Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC5CF4486A
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:44:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156808.1775828634009482735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zkIDgGWx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 174544E429A3
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:43:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1CDE603F0;
	Fri, 10 Apr 2026 13:43:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A7D91045001B;
	Fri, 10 Apr 2026 15:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775828631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FKBtVkZwUw4vMo+EMkuMf3CuDB4XEpMSaFJ3edKVbpQ=;
	b=zkIDgGWxuYYjAFBAaMNfIUhrxOhjkiuK01+4qlLLcuM5jbvOSDAMAFMj51WIHdvZYNxNX5
	ytio2Tc/sQ7yOjW1Hj8a/KztX3IGk1Y68l6QHETxNJPBKYsuSH0YGag0L439OO86cJjekp
	fQwbhZi0XzjZSZK7D/N9+5DT6DcbUgW3p8ZPQlC3BHUoWxiMfSIAr1FbuI+R/AK9YSqFBs
	L35GCMvMW61BwB2/AWp45B8Y+nG7xodAO3jRs6dmG9kXTmPylG2SS4z1yW/J9S5PeKan9k
	7LhWu+2zH48xpfWbuilhCBuvZCvcRe+/a5HrEBwu4oyAuyc2Uc9fvcARvkFBkA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 15:43:48 +0200
Message-Id: <DHPIPLRXIPB1.299V6FDJVU86@bootlin.com>
Cc: <festevam@gmail.com>, <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jon Mason" <jon.mason@arm.com>, "Ross Burton" <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: upgrade 2026.01 -> 2026.04
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260408114523.112252-1-festevam@gmail.com>
In-Reply-To: <20260408114523.112252-1-festevam@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235031

On Wed Apr 8, 2026 at 1:45 PM CEST, Fabio Estevam via lists.openembedded.or=
g wrote:
> Upgrade to U-Boot 2026.04.
>
> Remove the CVE-2026-33243.patch as it is already applied in 2026.04.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Hi Jon, Ross,

I just want to let you now some patches in meta-arm will have to be
dropped or refreshed once this upgrade is merged in master:

ERROR: u-boot-1_2026.04-r0 do_patch: QA Issue: Fuzz detected:
Applying patch 0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/3451

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


