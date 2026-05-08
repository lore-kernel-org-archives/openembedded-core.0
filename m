Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8D9CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 12:57:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12928.1778245048198734591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 05:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wGcdPwVZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 22799C5DC71
	for <openembedded-core@lists.openembedded.org>; Fri,  8 May 2026 12:58:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6686605D0;
	Fri,  8 May 2026 12:57:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3871F10819B8C;
	Fri,  8 May 2026 14:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778245045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yObUOiTZ16/e2LCPP8G0l54SNDZLRGyp1butJsu5nqA=;
	b=wGcdPwVZWZnc+SM4c7P8znLqL5LZRgp64slj7OxL3U7tr+lk7KFUnO6eghxzrV690RORKL
	nlM8yPCZUERa8Sq1KGdA6amu5Gr5Io52PjqAHxMtc1CCLCK23b9IosNENm4MooGAaZMLiM
	0+A0i45ioNfKywAI7y4Xj4L8kWUE5eVWldyIXuIh/tFp8dqBGcd3YTgNyk7YcobwlF9D+2
	//D6SnOk/R3JHlFIu2CfZlFL8kalJVvyfYCszmxdfQxqyDnHEUiTX3mtHuAp80ACoOpyoF
	AyZMmB7Mz98YpCFxpajrf3kIxIzzLJN2NvuZ6ACfJ4ZWPRwJQBSwfPcxrPTaCg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: yoann.congal@smile.fr
Cc: Joao Costa <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
Subject: [scarthgap] SPDX3, lz4 and avahi: Patches status
Date: Fri, 08 May 2026 14:57:23 +0200
Message-ID: <Mj30OkfVRxGpGbLR46KjAA@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 12:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236709

Hello Yoann,

Today I checked the status on patchwork of all the patches that I sent.
I noticed that 3 patches, which I forgot to monitor, are currently stuck in
the following state: Awaiting Upstream.

Do you have any information about it?

meta: fix generation of kernel CONFIG_ in SPDX3
 - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-backport-fixes-scarthgap-v1-3-2dc803f921a9@bootlin.com/
 - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-3-2dc803f921a9@bootlin.com/

lz4: Remove a reference to the rejected CVE-2025-62813
 - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-backport-fixes-scarthgap-v1-2-2dc803f921a9@bootlin.com/
 - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-2-2dc803f921a9@bootlin.com/

avahi: Remove a reference to the rejected CVE-2021-36217
 - https://patchwork.yoctoproject.org/project/oe-core/patch/20260303-backport-fixes-scarthgap-v1-1-2dc803f921a9@bootlin.com/
 - https://lore.kernel.org/all/20260303-backport-fixes-scarthgap-v1-1-2dc803f921a9@bootlin.com/

Best regards,
-- 
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




