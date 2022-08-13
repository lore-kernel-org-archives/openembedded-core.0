Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5218CC00140
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 02:41:41 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web09.1284.1660358496014164430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 19:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=agPVdoz/;
 spf=pass (domain: gmail.com, ip: 209.85.219.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id o15so4031319yba.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 19:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FwqPB+BUJ/o3YogjFEjTBsvJCSnhrJcmOJ/ceGIxCjA=;
        b=agPVdoz/iqN8ZI0gKTbyTg5ONSrx+QzMs4yjYe3qvUu4lx9eV9i9CfTnM1eSJdWr80
         sj7toS6by9KEJLQRYEfBJ/Jl/mqtuUtDkjPDrARGVEz7/NcNNtxVUGKQR6HnmGI+2N17
         XfK+yYpQpm5Fng8AdjhaNnve2iWqsxBuHQ42h3dEWjpGM2bunbUmOA12g4rEcfB+GiiY
         uG/yLt1u8L26kWr3Cg2wKvfYo8w5vpAkqU7D9Vs7sYQhc12qKTFcF3e4xR8R4m8r/pqj
         UkKdNRekR7Kt7gxllYkzH/sqw3gYWK1R3c52BRqc2mSEM5mtBUYYQIr1uQ0WQkUkvCuy
         14gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FwqPB+BUJ/o3YogjFEjTBsvJCSnhrJcmOJ/ceGIxCjA=;
        b=hpshGyQKn3VV3jjGl/aMyF8l5kJsXWpep6k5bAwyLhg1NprTtg4fJaO7NuiemTr7BF
         Il/2E8qxvF1dn4ULhehJoUK4WUi1tABFee58ya8xiDD/9tEyXW9Ix8Mk2HP5QvKtCWN7
         TYje5YEu9FShQuY0W6hZTdxZnYEhOSoAlQ/lwUTGTd5WFNAcqZhVPJgiCUz3aRh6xsf+
         lBIZ+teppc/1XrDWt51Hkrl8u7AtgtImEKplnIPO/eWj/qD8GVindeQJhKcf0eOLohx2
         9G3uxfCdDVV8lJgy0GITx4qpESvO0FIuuz/Yo0nZFtTDM9v7UeO6L+d3wPQ7dz7OLH6v
         y50A==
X-Gm-Message-State: ACgBeo0bsDAn1M/9FO6VL3Q/bpk8UL/3JDOf6Amj9zhHufEISDS57vy5
	mxI+mv/bOGpKeKybq4CPU7PGElGUDwrE8hu5agM=
X-Google-Smtp-Source: 
 AA6agR5jpX6V2n8rYu35hpdzQiUFE5ZzL/iIf3v/t9hu4iBHdRwwZkM7vu0fmnsgjXLs5vX+mc6b+rLnSja/eg+mqdU=
X-Received: by 2002:a5b:ad0:0:b0:671:76b7:95 with SMTP id
 a16-20020a5b0ad0000000b0067176b70095mr5616696ybr.295.1660358495061;
 Fri, 12 Aug 2022 19:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220812215736.10309-1-mhalstead@linuxfoundation.org>
In-Reply-To: <20220812215736.10309-1-mhalstead@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Aug 2022 19:41:08 -0700
Message-ID: 
 <CAMKF1sqY4=8V+9druVDTPsMYXKANY7apP6+AuHdenNQvGX7TPA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] uninative: Upgrade to 3.7 with glibc 2.36
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 02:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169295

Thanks this works well on my Archlinux which really needed it bad.

On Fri, Aug 12, 2022 at 2:58 PM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
> index 411fe45a24..7012db441b 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -6,10 +6,10 @@
>  # to the distro running on the build machine.
>  #
>
> -UNINATIVE_MAXGLIBCVERSION = "2.35"
> -UNINATIVE_VERSION = "3.6"
> +UNINATIVE_MAXGLIBCVERSION = "2.36"
> +UNINATIVE_VERSION = "3.7"
>
>  UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
> -UNINATIVE_CHECKSUM[aarch64] ?= "d64831cf2792c8e470c2e42230660e1a8e5de56a579cdd59978791f663c2f3ed"
> -UNINATIVE_CHECKSUM[i686] ?= "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa638d74961330cdb8de34ca3b"
> -UNINATIVE_CHECKSUM[x86_64] ?= "9bfc4c970495b3716b2f9e52c4df9f968c02463a9a95000f6657fbc3fde1f098"
> +UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
> +UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
> +UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169294): https://lists.openembedded.org/g/openembedded-core/message/169294
> Mute This Topic: https://lists.openembedded.org/mt/92989931/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

