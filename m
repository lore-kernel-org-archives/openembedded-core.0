Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF37ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 23:29:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.5114.1662161375255895410
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 16:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gVa9babs;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id p18so3274531plr.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rx1EnJqSdkLNQsj8rlBzcH2srE+8a4xql1QzT1LJJi4=;
        b=gVa9babsgmuz4K8rwE06rRZwgmUsFG+0rW1oC5SuDuiOFbDP9Sh6tVfThnYOiBWfsy
         Wf1/qX0vcXcp1g8GPgbppGF0JAAZAmxadoNVCZY1qM6LVbmFbIjltrUhc9dOORvOnwIZ
         GTYnH60UvKDdcGoI5joXekHoGQVnI4/qbYttKFUx6I7AmEzDf/OQmG/TzFlfJ9supZm4
         40QujYgYp8N8DtwlwN5XmBDpGK/xWZdBSgcDcrG+pdZnTGZGGVbeIl6U/1MVQA4KdCmO
         7eBQtt2ltshBaQi6TZZm4NWBoM7A+KmHNC0vaRFUWGCXvL0/37Jmz6KPapmepOg9tmV4
         Riow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rx1EnJqSdkLNQsj8rlBzcH2srE+8a4xql1QzT1LJJi4=;
        b=2GR/WlKh45U7T2m6PWQswLysQUyJeLTLiUsvwj1gf2lXfuKGqEBCUAaGHsrTRNQi34
         Gl//Rx1qH3lS1LiBqtZ5XldoGcBIB1L4i3wmsOkEBsTvBg34Q2kZYlaiL3SHuSy0iOly
         f/hfy4wwQkH/aLWOqba9RmZH9vfJAWkX9WVgmu4WUyytZnDDqwjcZpUHI+WlgC2pALnz
         UKsjiYMJzCHRLSPBX7J85anZcTNbkHueDdSEblTGsSFmP1QdHUZa5B2QuK/QtgQVc8jg
         nAy95zoJrkbB7L1GfGE/aTM6u9JeZHRf4ZsfKEnsdBP6Z5sf0hCLaffkyajFJQnj6NbM
         gVLg==
X-Gm-Message-State: ACgBeo29Bu6xYgI45IbEkcUknnpXzxLtaH+7N3leZGCMyMpkMusM/9JR
	gQEFD8AAt0sYSJcX8VlyVwiEwlb8MeILzldqjjI=
X-Google-Smtp-Source: 
 AA6agR4necGi7nAlE3eUeAgD3iZn5wJ50Nq+kIpK/56IAhalMkPH68xd9EcZMyvfSQP6bGh5x9nnyc7J+ULX/Q8Yyqk=
X-Received: by 2002:a17:902:7c94:b0:170:aed6:7e6c with SMTP id
 y20-20020a1709027c9400b00170aed67e6cmr36844871pll.10.1662161374660; Fri, 02
 Sep 2022 16:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220902163043.323903-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220902163043.323903-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Sep 2022 20:29:24 -0300
Message-ID: 
 <CADkTA4Mdtj=XZiD7HDw_KG64VHN7qBu4hVkVam4gYtx++VvjCQ@mail.gmail.com>
Subject: Re: [PATCH] kernel: Use consistent make flags for menuconfig
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 23:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170263

On Fri, Sep 2, 2022 at 1:30 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We're currently only passing in a subset of the kernel make flags to
> menuconfig. Fix this to be consistent with all the other kernel
> operations since these are becomming increasingly reliant on host
> compilers and flags and target toolchains as well.

Looks good to me!

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/kernel.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index e752874177e..fca673dd48d 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -650,7 +650,8 @@ addtask savedefconfig after do_configure
>
>  inherit cml1
>
> -KCONFIG_CONFIG_COMMAND:append = " PAHOLE=false LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
> +# Need LD, HOSTLDFLAGS and more for config operations
> +KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
>
>  EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
>
> --
> 2.34.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

