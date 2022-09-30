Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99816C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:57:15 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web08.340.1664560628238320658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y4enh1VW;
 spf=pass (domain: gmail.com, ip: 209.85.166.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id a4so2560205ilj.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fu6iKxPXjfZTmFNQNLrfFy5aXSYWyM9+AAPoOjGRwBU=;
        b=Y4enh1VWrUx5baP5PCbFRSv5SiqmZh6Q35ImgESGjBhQyggakA3nHiDQwSDVvBP228
         7eyNE5ImaEXnLhnEbFfgPCASyfox0t341Z8p6ztfPRbHO/ig5D7dJoZ0xE4SP9A5umT6
         KXyV3gkY8sdmPtplI8dSmFgTMq5v8aRbyfUnVxwJYr2ZJqB/s3pM/GjWXSoT9w9GmzZr
         xX8/lSxfRRy1dEE1bbjkEz784lL0cQpalvs6POXtfrP1l8mxZh8+g/uhuV1XYPT16I2k
         aiNwHRTkEc5AdMrKSZzPg3JQc3p1i6vlKeV/5jRWjrQAWufD3zyVKg9ryRfko4tlLXKg
         OuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fu6iKxPXjfZTmFNQNLrfFy5aXSYWyM9+AAPoOjGRwBU=;
        b=PpHVPv96k654ycGh3Mq45/VUtguZjBb33E/kSXbeH5yVd5Cm0Lqi9O9jUN6GQDHzkZ
         CcVvSWkK1tHtzgpOtAKmlCP4CSiT7Vw8w5WvXtGusw6UV4VNEwM4cWy3pxYugrtDT4Dh
         /tsNy4orWp4QzZtTpOKTM/xnSiaDpHAG4/nqtpQ0Ww2q9b9WlcrNGbA7VN0mGRMKkdSH
         lLmhAXAtim296X8HdwaimjetzR9TexyBWpFJQEGZ69qk1my3FlID5TvWWKZNhV48ebbK
         xxeSeqzMkfiSkkxErj+9CiFz4vjYwpHuCzJdXZcbHLMmTU5VFipTbvHXVa31Mn93Ohrj
         pUYw==
X-Gm-Message-State: ACrzQf1+q831rYPnb35XD6YznDRExEa0GsxtRie1RTkF3lq3Wi8QOzIz
	hVlIVJVBycEa2W9xnFTxi0uIZjYk6wN0cB0AFrM=
X-Google-Smtp-Source: 
 AMsMyM55kjUh79DSgx7AjLW5NWifHpkwL2gOZUYW2cyXNDrSxxKA3k2Ao7W/RoD18noLJAETpa4tpVXjGVy4iK6YQEY=
X-Received: by 2002:a92:da4b:0:b0:2f1:525a:90e7 with SMTP id
 p11-20020a92da4b000000b002f1525a90e7mr4936210ilq.307.1664560627590; Fri, 30
 Sep 2022 10:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
In-Reply-To: <20220930175440.2168008-1-jose.quaresma@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Sep 2022 19:56:56 +0200
Message-ID: 
 <CANNYZj-15uhYQwhU95q0Yr=FcX_qGhWj5Vy=7qFdqyJ4QfSsww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] go: drop patch to make content based hash
 generation less pedan
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:57:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171238

You need to remove the actual patch, and run the reproducibility test.

Alex

On Fri, 30 Sept 2022 at 19:55, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> With patch in place I have see some build issues mainly in meta-virtualization
> with ti am62xx-evm, am64xx-evm and riscv64 machines.
>
> All the mahines fails to build the following recipes:
>
> | Summary: 5 tasks failed:
> |  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/runc/runc-opencontainers_git.bb:do_compile
> |  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/skopeo/skopeo_git.bb:do_compile
> |  /srv/oe/build/conf/../../layers/meta-lmp/meta-lmp-base/recipes-support/fioconfig/fioconfig_git.bb:do_compile
> |  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/docker/docker-ce_git.bb:do_compile
> |  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/containerd/containerd-opencontainers_git.bb:do_compile
> | Summary: There were 8 ERROR messages, returning a non-zero exit code.
>
> And all of them fails with the same issue:
>
> | panic: runtime error: index out of range [0] with length 0
> |
> | goroutine 6688 [running]:
> | cmd/go/internal/work.(*Builder).buildActionID(0xc0000030e0, 0xc000172a00)
> |       /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:281 +0x2425
> | cmd/go/internal/work.(*Builder).build(0xc0000030e0, {0xc000000238?, 0x0?}, 0xc000172a00)
> |       /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:478 +0x199
> | cmd/go/internal/work.(*Builder).Do.func2({0xb2e4f0, 0xc000000238}, 0xc000172a00)
> |       /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:139 +0x5fc
> | cmd/go/internal/work.(*Builder).Do.func3()
> |       /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:201 +0xb9
> | created by cmd/go/internal/work.(*Builder).Do
> |       /srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:187 +0x3f5
> | make: *** [Makefile:244: bin/containerd] Error 2
> | make: *** Waiting for unfinished jobs....
>
> Without this patch everithing look good.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-devtools/go/go-1.19.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devtools/go/go-1.19.inc
> index f733a807b4..355a82eb9f 100644
> --- a/meta/recipes-devtools/go/go-1.19.inc
> +++ b/meta/recipes-devtools/go/go-1.19.inc
> @@ -5,7 +5,6 @@ FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>
>  SRC_URI += "\
> -    file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
>      file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
>      file://0004-ld-add-soname-to-shareable-objects.patch \
>      file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171233): https://lists.openembedded.org/g/openembedded-core/message/171233
> Mute This Topic: https://lists.openembedded.org/mt/94022663/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

