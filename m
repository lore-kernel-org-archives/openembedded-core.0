Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111A7C27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 20:21:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.105196.1719087684117829819
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 13:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nZCjYLgu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6AD21BF204;
	Sat, 22 Jun 2024 20:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719087682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VWEohquqBusblzAw5Lpzcb/yAtXhfDwnPP2upwwTnHQ=;
	b=nZCjYLgufpw5Joxhdc6I4WFx38wbaDxx+fvlk+Gxfue8zicmL4JbsjH5pV94O9+R9W0+lq
	LsmvOhY8Jf8yhMk/u7aFnfazuGefur3Xs6PNFeo5Sed562J43Bf8EgCSu3jAhmKsMufnTz
	VzRclWakQik9/sgSHQKDaLQLxdttI0h+z1gT9frWeBjYvnxqxeEgli5EmM5vK2APp7slmS
	5KESFpWTd+HlORSnpS6HLEPRcrquxM49VxU0zgBC6zczsR3IRiq2xiXvPs/vyihF5E3x8e
	2G4hngpDndc2eoOHslsm24L982S8qB+ckTa8iXA0MeiA/hiQ1f4Wm9eRpGXErA==
Date: Sat, 22 Jun 2024 22:21:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 13/22] hwlatdetect: upgrade 2.6 -> 2.7
Message-ID: <2024062220212173f09c5c@mail.local>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
 <1718936206-8080-13-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718936206-8080-13-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 20:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201050

This causes:


ERROR: rt-tests-1_2.7-r0 do_patch: Applying patch '0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch' on target directory '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/rt-tests/2.7/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/rt-tests/2.7/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
patching file Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch 0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch does not apply (enforce with -f)
stderr: ')


On 21/06/2024 10:16:37+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
> index 70315c4694..3fbdfa2038 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,5 +1,5 @@
> -SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
> -PV = "2.6"
> +SRCREV = "5bd94923ffda2ab326d081926dbfc6775fb5050b"
> +PV = "2.7"
>  PE = "1"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200976): https://lists.openembedded.org/g/openembedded-core/message/200976
> Mute This Topic: https://lists.openembedded.org/mt/106792574/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

