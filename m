Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B0DC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 21:40:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.4048.1642455635460203787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 13:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ei7VwgG6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso967117wma.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 13:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kHkdWwhLOYP3267q36TnFUOxcTtb8HajjgxI4+PZFV4=;
        b=Ei7VwgG6AH6kkAYwllZRBZebT2f4tkpH2pDcAfI3bCcaoPZfSViKv5DbbW/KD3/VP0
         jSQeylGk7/BGWezDeElY/q43qbN/01wgcW6KCg5OsivAJfvk9I5dewXQ+R7d6Z/oYAJY
         Y1Onbe5EJMuQVJg9aA+KqBnC87x3tcbL1qOyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kHkdWwhLOYP3267q36TnFUOxcTtb8HajjgxI4+PZFV4=;
        b=GdxUx3sq2g0owsZRQO8gWdHPdK6E++y4HKr6zr9HKYg8oEU6AoA2Br1aa/7UrpZ6RW
         PQsiuTRD8nIfOJ3rpOCXlI0l0JUax2DKY6GRULcLGcjXL9Sma099f+3A9S2ZhpGv99zo
         PBCFIbGqRiCyVByy4I0KBjG7p8YF+tGS8tNSMH0iNp8amDf9dL3thCe3MtV/Aw8tFZta
         WHzeAAkJkZLkIp4On0yzNj836wSJ/udn4y8pVmW2WjV5ljsTaNsVPNHS5VsQ5iQy2D4g
         1KdVUnI+1IBt40wC+6N+EUPMHCoLgmirkksoQv8ktPUFZmfIBuV+RO65icNqbtKAW8qP
         xzsg==
X-Gm-Message-State: AOAM5339oC67MzRAJn1F7XONHoxGXD4CCAF5BinzvXLaxH9+5FMztV5y
	gdDfADPW2EXBJtZeRrpac+Vdlw==
X-Google-Smtp-Source: 
 ABdhPJw8sVDLUoMLMRiMQUaoGM4prvN2CtA+bm2zvYGsSanL4WSPHNv1npwUN77FRVlSG4IWUvhBHQ==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr21244430wrq.529.1642455633581;
        Mon, 17 Jan 2022 13:40:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cdb:ba2:df58:76a3?
 ([2001:8b0:aba:5f3c:cdb:ba2:df58:76a3])
        by smtp.gmail.com with ESMTPSA id p4sm454066wmq.40.2022.01.17.13.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 13:40:33 -0800 (PST)
Message-ID: 
 <ab81feefb0379950fa021df081e94a9cbf83fa15.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 5.15.1 -> 5.16
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Mon, 17 Jan 2022 21:40:31 +0000
In-Reply-To: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
References: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 21:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160663

On Mon, 2022-01-17 at 22:30 +0800, wangmy wrote:
> Changelog:
> =========
>  - rescue: new subcommand clear-uuid-tree to fix failed mount due to bad uuid
>    subvolume keys, caught by tree-checker
>  - fi du: skip inaccessible files
>  - prop: properly resolve to symlink targets
>  - send, receive: fix crash after parent subvolume lookup errors
>  - build:
>    fix build on 5.12+ kernels due to changes in linux/kernel.h
>    fix build on musl with old kernel headers
>  - other:
>    error handling fixes, cleanups, refactoring
>    extent tree v2 preparatory work
>    lots of RST documentation updates (last release with asciidoc sources),
>    https://btrfs.readthedocs.io
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ools-include-linux-const.h-to-fix-build-with-.patch | 10 ++++------
>  .../{btrfs-tools_5.15.1.bb => btrfs-tools_5.16.bb}     |  2 +-
>  2 files changed, 5 insertions(+), 7 deletions(-)
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.15.1.bb => btrfs-tools_5.16.bb} (98%)
> 
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> index be942388a5..bd69bfc9cd 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> @@ -1,4 +1,4 @@
> -From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00 2001
> +From 1c9cc81ec72876a5351e3083552b9985eeb6c091 Mon Sep 17 00:00:00 2001
>  From: Bruce Ashfield <bruce.ashfield@gmail.com>
>  Date: Fri, 18 Jun 2021 11:10:36 -0400
>  Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
> @@ -21,22 +21,20 @@ exists, and is valid to include.
>  Upstream-Status: Inappropriate [mips64 + musl + libc-headers]
>  
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +
>  ---
>   kerncompat.h | 1 +
>   1 file changed, 1 insertion(+)
>  
>  diff --git a/kerncompat.h b/kerncompat.h
> -index df167fe6..254235bd 100644
> +index 6ca1526e..15995bb4 100644
>  --- a/kerncompat.h
>  +++ b/kerncompat.h
>  @@ -30,6 +30,7 @@
>   #include <linux/types.h>
> - #include <linux/kernel.h>
> + #include <linux/const.h>
>   #include <stdint.h>
>  +#include <linux/const.h>
>   
>   #include <features.h>
>   
> --- 
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
> similarity index 98%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
> index 3cf216724e..4c358a248b 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.15.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
>             file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
>             "
> -SRCREV = "c0ad9bde429196db7e8710ea1abfab7a2bca2e43"
> +SRCREV = "8ad326b2f28c044cb6ed9016d7c3285e23b673c8"
>  S = "${WORKDIR}/git"
>  
>  PACKAGECONFIG ??= " \

This didn't work when it was last sent and still doesn't:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4646
https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/4914
https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2590
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/4624
https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/3508
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4616
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4631
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4583
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4583

Seems to be something centos host specific.

Cheers,

Richard



