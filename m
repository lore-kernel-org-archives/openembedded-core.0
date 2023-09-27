Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3785DE82CCC
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:52:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.26606.1695844324550185905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 12:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q/RZTKDf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8214620005;
	Wed, 27 Sep 2023 19:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695844322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wz7o/ztrmK1YYoHMkol71zamC5JknsUBkbj3zfp3D9o=;
	b=Q/RZTKDfvVbrBL3/4BMJ8/5oAX6Y/1nA3v1efoyekgZ5zR6/bdBr/n2VzR04XGo2bcjs9X
	hmSycS2Oetsc0gtLeKSkFQGPaIveePwemDa0VwfNb1hsUl7WMgFtnOv1+w7il+e+2Y7JDK
	1+X+lmqL2MXhrgSieGxKNd5OOsEyXm6EX6mZkm0qk2QWvM26Wv7n37RtnVugM3UdJvz1CF
	LBJBjnLpbhrBWRc0bYFMtFmW3GneK0yuNLwhqmPX8WCwCfDP4pp875mo1mGZeBAh1z2rsf
	H27CA8fdpK/9d4ZE6l5MFwrZCxva5f8naYKF//yiMtmTcxzfLX4ImOiVeBNiMg==
Date: Wed, 27 Sep 2023 21:52:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	Umesh.Kalappa@windriver.com, Naveen.Gowda@windriver.com,
	Shivaprasad.Moodalappa@windriver.com,
	Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: Re: [OE-core] [PATCH V2] glibc: stable 2.38 branch updates.
Message-ID: <20230927195200a7a1ed1e@mail.local>
References: <20230927104659.2900531-1-Deepthi.Hemraj@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927104659.2900531-1-Deepthi.Hemraj@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188340

Randy,

Can you please ensure everyone at Windriver that will contribute to YP
has setup their from identity? This is described here:

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

Thanks!

On 27/09/2023 03:46:59-0700, Hemraj, Deepthi via lists.openembedded.org wrote:
> Below commits on glibc-2.38 stable branch are updated.
> 0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) manual/jobs.texi: Add missing @item EPERM for getpgid
> d94461bb86 string: Fix tester build with fortify enable with gcc < 12
> 63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug 30694)
> 00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
> b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in no-aaaa mode
> 89da8bc588 NEWS: Add the 2.38.1 bug list
> d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in link map
> 750f19526a elf: Remove unused l_text_end field from struct link_map
> a3189f66a5 elf: Always call destructors in reverse constructor order (bug 30785)
> 7ae211a01b elf: Do not run constructors for proxy objects
> 92201f16cb libio: Fix oversized __io_vtables
> 5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64
> 
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index a907444f50..f5ebbb2ee6 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.38/master"
>  PV = "2.38+git"
> -SRCREV_glibc ?= "1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1"
> +SRCREV_glibc ?= "0e1ef6779a90bc0f8a05bc367796df2793deecaa"
>  SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
>  
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
> -- 
> 2.39.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188300): https://lists.openembedded.org/g/openembedded-core/message/188300
> Mute This Topic: https://lists.openembedded.org/mt/101614685/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

