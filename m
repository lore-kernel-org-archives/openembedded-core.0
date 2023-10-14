Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B4FCDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 18:12:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.69703.1697307160494198826
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 11:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P4Ypaa6E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1100B240006;
	Sat, 14 Oct 2023 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697307158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVZO0C0Ut/qsjsBLNQF8kCOeG+0i6NHq2FDSfeiH9mQ=;
	b=P4Ypaa6EjjF07ryPf/mSHIA1RUr+G/RTdKnG6jdgc7Qm+BbLJ89vvjPw5Ennwd/REW6skQ
	c27nqu6hUnJLuzGpSRFfmu/YEoxkEfOm/YkSVTaB5F6bW0r7KuLt6RfaGMsCDK2dPeUY45
	x62tXHDzo1WSksaQfYOjfO/ibsmzkPioQLpM7eKC1Anx//Z32zFPALnnrq7Kr71qBCbFzA
	xbPN5LAkm1S/yrvFE8u5RGdBQLxGzgMvmOhIFZsJw81RlSfVcpw675G2y2PK1VxR7QFaOG
	KE8x0li3HKxxEGC7tZZUvAWsnVes1D0UMY3x8a3phzLqzbCV+CpvV6QA1zy7Gg==
Date: Sat, 14 Oct 2023 20:12:32 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] hwlatdetect: upgrade 2.5 -> 2.6
Message-ID: <20231014201232.4143f4ea@booty>
In-Reply-To: <1697187448-4077-1-git-send-email-wangmy@fujitsu.com>
References: <1697187448-4077-1-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 18:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189120

Hello wangmy,

On Fri, 13 Oct 2023 16:57:28 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--

The subject should be "rt-tests: ..." I think.

Besides, the patch fails:

ERROR: rt-tests-1_2.6-r0 do_patch: Applying patch '0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch' on target directory '/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/rt-tests/2.6/git'

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7974/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7974/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7852/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5210/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3750/steps/12/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

