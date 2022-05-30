Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC723C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 20:48:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.41515.1653943722746161291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 13:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OmQYHObP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0B0640004;
	Mon, 30 May 2022 20:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653943721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikV4/9peEKLJ3EoSIaPqT5jvoQc0PBL6aQuUkp6Uh9Y=;
	b=OmQYHObPKDwReLRHMOxbg6Tg6r1/1UfYA1GVOOo3QN3LaU0n+WVgVy9YZMCA/fMZsICNp7
	S2QIXV6dSa3HXB2/tfZQpue3SogAZ6NK/nzg5zNnYOkKsw++HyZiIvbcOeAZE/G5O7SCxR
	kfjnAYY17TJ8oiIULT6glysreeZtkuKUFNoEsovIyluSpGuNqVRYzTwk6pC8M0L81h9f51
	IC4QltmkiY8TQ7wbWd+tKvI05LYerBOUUOz4iiJoaqFATXqQVx08dh98jJDO7NXTIpNWGq
	GjkRUOFKCQvXWzdUOPq7qcdl1gbzzGnhOiQCj/5dz60iDKVAzCFB1S2MSpI3sQ==
Date: Mon, 30 May 2022 22:48:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 5.16.2 -> 5.18
Message-ID: <20220530224838.73d1009e@melee>
In-Reply-To: <1653892850-23554-2-git-send-email-wangmy@fujitsu.com>
References: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
	<1653892850-23554-2-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 20:48:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166299

Hi wangmy,

Il giorno Mon, 30 May 2022 14:40:48 +0800
"wangmy" <wangmy@fujitsu.com> ha scritto:

> lzo-option.patch
> removed since it's included in 5.18.
> 
> Changelog:
> ==========
> fixes:
>     dump-tree: don't print traling zeros in checksums
>     recognize paused balance as exclusive operation state, allow to start device add
>     convert: properly initialize target filesystem label
>     mkfs: don't create free space bitmaps for empty filesystem
> restore: make lzo support build-time configurable, print supported compression in help text
> update kernel-lib sources
> other:
>     documentation updates, finish conversion to RST, CHANGES and INSTALL could be included into RST
>     fix build detection of experimental mode
>     new tests
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

This patch triggers a build failure:

configure: error: cannot find sphinx-build, cannot build documentation

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3051/steps/11/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3051/steps/11/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

