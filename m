Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9975CCA47D
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:55:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7478.1655906100063445223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EIFhieUY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A10611C0010;
	Wed, 22 Jun 2022 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655906098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHNMgSI6hXRicz0AYNmLbsgu4jmBSVx8mCnpSXqJW0U=;
	b=EIFhieUY/TuxuzgLRb7+SQPzD83ClDPyGV7zSxr1dlvEa5JMUOd4m7EbEGapHOdKbTdxVh
	SGIpxnViMc/XBLhcp8lVrTykrshjcgrYSZXQMZ7eSeyAUVdStHqYLPlrDyB8p/h2cqPHrn
	v09TGaNWj5IcVucS91sNDfiNTLhP2h1jVMfK6ar+ijystW2UbA34x9YKoj1O7DQ7XGGcqq
	FvE3B2fycvHIMGFrRM4Rpd9X5BlDdUkpFR3l+GzJIuL+sY7211KN4wtlxvKruVFrRlj20m
	bDGRbd2KDCgz7taxyBg/PrJaTfzG22FxCxQ2swB11+K/sK3oO2smv6aiAEYp8g==
Date: Wed, 22 Jun 2022 15:54:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] xcb-proto: upgrade 1.15 -> 1.15.2
Message-ID: <20220622155455.47ed5d6f@booty>
In-Reply-To: <1655884130-22843-5-git-send-email-wangmy@fujitsu.com>
References: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
	<1655884130-22843-5-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 13:55:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167238

Hello wangmy,

On Wed, 22 Jun 2022 15:48:50 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

This patch triggers autobuilder failures in libxcb-native do_configure:

| checking for check >= 0.9.6... no
| checking for xcb-proto >= 1.14... no
| configure: error: Package requirements (xcb-proto >= 1.14) were not met:
| 
| Variable 'libdir' not defined in '/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/x86_64-linux/libxcb-native/1.15-r0/recipe-sysroot-native/usr/share/pkgconfig/xcb-proto.pc'

Some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/5675/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5419/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/5384/steps/11/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

