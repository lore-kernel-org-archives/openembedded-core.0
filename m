Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89619C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 12:52:54 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.21758.1709643169567799571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 04:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bn20ffzY;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-69012259657so24742176d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709643168; x=1710247968; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld236NQ7kwg/CX/3cBGypjtC1+v7YSzdOn7ZkW4d5ik=;
        b=bn20ffzYJVzUEAchBElNOlTtTyhRgG0QOZBMFOEI+xcGxEKDxtyBe0BO+fQDjzf1Yc
         IZC8D+7iZqvZMbqaLUE4HrU6moktpCByyOZIWRSMCeksAh20ALHEL1DiRlN+8huwa+4C
         TvvsHwjIa5h7IYSZgZc9v3VUcSuRvB6FbQSw4SKdOV4WZaLla3CBIuMJEiynwRx/4HzB
         qD2t1mQTF6LGVf15ut6m2K649Q/uDw0ljOJn6NoPbJ0UhFxcFdmjX68Bb/Lq6PR7p/QD
         mcF0eHQgJ8++3LTvrCQ1nWcHctsiG7kCGyoQUMmoqU4lAbo0fOm5TR3IVwRPPK+MGrg0
         23vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709643168; x=1710247968;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ld236NQ7kwg/CX/3cBGypjtC1+v7YSzdOn7ZkW4d5ik=;
        b=whUaHDuSaYfvuAV647Dfp8XzSJEBEJQuDQsH+2blNWusdQSL4b95sz93zyfd/SRPrk
         +H9iO6zo9vd3T/QBSLRSIgy4dDCe6eOYtZSVtBqQMexCpszrVWNqPz6tWVh1Wi+0mzxP
         DKftdFfY58WeAX06hnpmvisM9ZYYfpus+kXKuxylC0Keycjrqlf+VbObRHJkMbpe2VDG
         CN2reSkD2TXtKbIpZnb0O8dCR9pzzLzJJcOZVIESfL6owqh8UuphkJo7RXcZ1ejx3REz
         tnPu11AVVArOgtEV9thC0TPAYb0f1UyXD77nAFA8zb4+oJGJkLXEgECuea+KyIbjkIz3
         1gmg==
X-Gm-Message-State: AOJu0YxTYM2iR2pyvs8yc/N3AaQIlLk8s5DEvFesjSSO9jexXpvkWIYN
	O40DbkcVkrb4hpyN/aFk0Qxhxh3yscZCaXjdK9d2Q1fGZTEE0vJw
X-Google-Smtp-Source: AGHT+IEbQzfAp9OUB5UhNIbtBaLb+CyU5WP0PIR8s6yR9nbDdjeA2rdVlvbEMGqQax2bt0oRoQlSWA==
X-Received: by 2002:a0c:e2c7:0:b0:68f:501c:ea49 with SMTP id t7-20020a0ce2c7000000b0068f501cea49mr2018675qvl.36.1709643168486;
        Tue, 05 Mar 2024 04:52:48 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id nc8-20020a0562142dc800b006907904691dsm1939471qvb.17.2024.03.05.04.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:52:47 -0800 (PST)
Date: Tue, 5 Mar 2024 07:52:46 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bmaptool: now part of Yocto Project
Message-ID: <20240305125245.GA2252@localhost>
References: <20240304192558.27575-1-twoerner@gmail.com>
 <0e8ffac6e98c84bf7665acbbe33eef05742e8109.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e8ffac6e98c84bf7665acbbe33eef05742e8109.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 12:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196631

On Tue 2024-03-05 @ 11:59:17 AM, Richard Purdie wrote:
> On Mon, 2024-03-04 at 14:25 -0500, Trevor Woerner wrote:
> > The bmaptool (previously: bmap-tools, bmap-tool, bmaptool) has been moved
> > to be under the Yocto Project umbrella and is now hosted at:
> > 
> > 	github.com/yoctoproject/bmaptool
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  meta/classes-recipe/image_types.bbclass                   | 2 +-
> >  meta/classes-recipe/image_types_wic.bbclass               | 2 +-
> >  meta/conf/distro/include/maintainers.inc                  | 2 +-
> >  .../bmap-tools_git.bb => bmaptool/bmaptool_git.bb}        | 8 ++++----
> >  .../files/0001-BmapCopy.py-fix-error-message.patch        | 0
> >  ...0002-CLI.py-fix-block-device-udev-race-condition.patch | 0
> >  .../0003-BmapCopy.py-tweak-suggested-udev-rule.patch      | 0
> >  7 files changed, 7 insertions(+), 7 deletions(-)
> >  rename meta/recipes-support/{bmap-tools/bmap-tools_git.bb => bmaptool/bmaptool_git.bb} (78%)
> >  rename meta/recipes-support/{bmap-tools => bmaptool}/files/0001-BmapCopy.py-fix-error-message.patch (100%)
> >  rename meta/recipes-support/{bmap-tools => bmaptool}/files/0002-CLI.py-fix-block-device-udev-race-condition.patch (100%)
> >  rename meta/recipes-support/{bmap-tools => bmaptool}/files/0003-BmapCopy.py-tweak-suggested-udev-rule.patch (100%)
> 
> Thanks. Unfortunately this wasn't quite enough and caused a ton of
> build failures, it also needs:

Oops! Sorry about that.

> diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
> index 9282d36a4dc..76494e7fca4 100644
> --- a/meta/recipes-core/meta/wic-tools.bb
> +++ b/meta/recipes-core/meta/wic-tools.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>  
>  DEPENDS = "\
>             parted-native gptfdisk-native dosfstools-native \
> -           mtools-native bmap-tools-native grub-native cdrtools-native \
> +           mtools-native bmaptool-native grub-native cdrtools-native \
>             btrfs-tools-native squashfs-tools-native pseudo-native \
>             e2fsprogs-native util-linux-native tar-native erofs-utils-native \
>             virtual/${TARGET_PREFIX}binutils \
> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> index 2b90821b305..1a7c140fa6c 100644
> --- a/scripts/lib/wic/misc.py
> +++ b/scripts/lib/wic/misc.py
> @@ -25,7 +25,7 @@ from wic import WicError
>  logger = logging.getLogger('wic')
>  
>  # executable -> recipe pairs for exec_native_cmd
> -NATIVE_RECIPES = {"bmaptool": "bmap-tools",
> +NATIVE_RECIPES = {"bmaptool": "bmaptool",
>                    "dumpe2fs": "e2fsprogs",
>                    "grub-mkimage": "grub-efi",
>                    "isohybrid": "syslinux",
> 
> but I'll squash that into the patch.

Great, thanks!

