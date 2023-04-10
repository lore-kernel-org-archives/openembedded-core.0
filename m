Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5B4C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 17:27:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.51861.1681147669224019182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 10:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U0+jNeJk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 81A7E1BF203;
	Mon, 10 Apr 2023 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681147666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8K/qCQ7+6/cHYZTG+gfAUkRqasVLouamNMAyaHwSHI=;
	b=U0+jNeJkorE78yixl+I/3s7Z4De8ml3B+7BVxbk3QAyVc51oafoZvqOXQM6t6ds6gxW3hX
	LKj92ByVyGq2gp8EaFQZwdAAssI//AC6fsK55AgzcJ4F0N5IAA+QILkHirGglQTes8mPD7
	7qobSbFblG5yY1RQwpGHzWPP1HPmqL+itFNZvEosjXAaPzNHL8nDmvHs/JWS/olerDlGvF
	LQ69geQCUc0mNSeFyc/3cVDENNuN9vn7cxMbttBzlp/uMp1W7/iz5tIxlpvTpVYjpjfSPG
	FUhzdAqPRHKHxly0HE/IyJKj8ZPiKmi8YUOyEBlLCUXPyjC1va8okswVbRX2mw==
Date: Mon, 10 Apr 2023 19:27:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cryptodev-linux: upgrade 1.12 -> 1.13
Message-ID: <2023041017274515a16a50@mail.local>
References: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
 <1681116997-24685-4-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681116997-24685-4-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 17:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179900


ERROR: cryptodev-module-1.12-r0 do_patch: QA Issue: Fuzz detected:
Applying patch 0001-Disable-installing-header-file-provided-by-another-p.patch
patching file Makefile
Hunk #1 succeeded at 36 with fuzz 2 (offset 3 lines).
The context lines in the patches can be updated with devtool:
    devtool modify cryptodev-module
    devtool finish --force-patch-refresh cryptodev-module <layer_path>
Don't forget to review changes done by devtool!
Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: cryptodev-module-1.12-r0 do_patch: Fatal QA errors were found, failing task.

On 10/04/2023 16:56:36+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ==========
> * Fix compilation issues against Linux kernel 6.3
> * Add support for xts, cfb, ofb and ccm aes algorithms
> * Fix for a potential issue with CIOCCPHASH
> * clean-up and maintenance
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{cryptodev-linux_1.12.bb => cryptodev-linux_1.13.bb}        | 0
>  meta/recipes-kernel/cryptodev/cryptodev.inc                     | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.12.bb => cryptodev-linux_1.13.bb} (100%)
> 
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
> similarity index 100%
> rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb
> rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> index ef342a157c..61c688f1d0 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
>             "
> -SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
> +SRCREV = "795f5fda1485d447cdbad342e8304be317d4f7e8"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179846): https://lists.openembedded.org/g/openembedded-core/message/179846
> Mute This Topic: https://lists.openembedded.org/mt/98171941/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

