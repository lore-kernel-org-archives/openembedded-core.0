Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A38C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 11:55:49 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.13452.1677758144032520628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 03:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aXw7eR+v;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B87B2240008;
	Thu,  2 Mar 2023 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677758142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jz8d1vnXE9TGRg7NOOrJsFP70/WjVzVufPzzYDrq65s=;
	b=aXw7eR+vi3j95MOgbWkdDpoSLM9OG/7qQ1bh7EuNk1jLY748BOlAenVV/qLIHKTZeNgHbM
	YRGL5dtL7GsJdI/4cGTNboySdZmB5cBxWc0jMNOIOSVQu5fMKbLjGXfNHkUsk3JS4hvDUg
	XRrntYZ1T5mgXFLvvbn4WXmQL5bVwyecka9cJdhNXeZKjr8LtXL3OqxyjZlV73ehIx9Etr
	tKYwsJI4hMRCYLHmq7/S4l7L9D7zmIczyzjmnvYG5rsPXVo641qIq6HdJz3XDYK6Wasu84
	6plIZtX+S3lSkPc4VB1NMiSgaBdWzabJ6oo8OIULfK08dLzeFwNq7mDZkBloLw==
Date: Thu, 2 Mar 2023 12:55:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 6.1.3 -> 6.2
Message-ID: <ZACOvSVKmQ+n1P0K@mail.local>
References: <1677717540-2052-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677717540-2052-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 11:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177962

This fails on the AB:

stdio: ERROR: btrfs-tools-6.2-r0 do_fetch: Fetcher failure: Unable to find revision 6439e92cba81c068afca76f8e010fb7175620176 in branch master even from upstream
stdio: ERROR: btrfs-tools-6.2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master')

On 02/03/2023 08:39:00+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ==========
> * receive: fix a corruption when decompressing zstd extents
> * subvol sync: print total number and deletion progress
> * accelerated hash algorithm implementations in fallback mode on x86_64
> * fi mkswapfile: new option --uuid
> * new global option --log=level to set the verbosity level directly
> * other:
>    * experimental: update checksum conversion (not usable yet)
>    * build actually requires -std=gnu11
>    * refactor help option formatting, auto wrap long lines
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.bb} (98%)
> 
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.bb
> similarity index 98%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.bb
> index b4dfc5b3f3..4e3d544fad 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
>             file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
>             "
> -SRCREV = "908b4b4450320e30fdef693f09b42f4eb93702c3"
> +SRCREV = "6439e92cba81c068afca76f8e010fb7175620176"
>  S = "${WORKDIR}/git"
>  
>  PACKAGECONFIG ??= " \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177952): https://lists.openembedded.org/g/openembedded-core/message/177952
> Mute This Topic: https://lists.openembedded.org/mt/97329642/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

