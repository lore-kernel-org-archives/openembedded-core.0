Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52433C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 13:08:46 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web12.10395.1660309723746585115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UkQJ7u1H;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id o184so1056096oif.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=/xJHVZci2r4HbdHu9QClY64SmBr+Mp61GThJi5x98E4=;
        b=UkQJ7u1HfRi/zcnXlWw0u/dppnjSe7BDRDWciXwTI0ILIs8q9As2VEqVfSkscvpgc/
         bPDnQ4/xT9YN9VN4g7ccvr4CK/sFiCp0sTG+nFD8xiANhPL08h3QBwk8N8uD8ozrwwxP
         09cbgMjC+5mBygRXLga0fn19hzTVgdGChtrNUZQRM4Fdyh/x9pFT6iJcc7PvK89XM4oO
         o58oIby/paFRBZCtXqxtUPZSm2rKgCssn5qjVw845VgjLRTD18ycZiltcA+6lDWtRP7E
         fs1mAW1UWGE2asGwFodDp85daMjnC09G50wRsX4/EN3sf9Jkl3rwRq/Wy+mr9xvKQ6xt
         Uw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/xJHVZci2r4HbdHu9QClY64SmBr+Mp61GThJi5x98E4=;
        b=agXH2dnloXUiwd7bAvI0GxpY6bJsvFXW007UrAAq5AkuIG1qy+hlr8UC4z5ER3lkAM
         IUybXrBbyylR14PCFe/ZxuwM9rK9W5eKTGMpaHz7tAoJByGZJ2LollESUrVxi/icPUe8
         HVGNqNYaUR1cSKTnCFEW13eK0Qe8nat/vToAPVNat+Udrg17dsO2sd36+yZCmqwLxcnA
         8IaOYjw+ZibyRmD4KkZtnyWAl8lH1KIOHntvwY/HPqXXiaZGEA71KM3DtQTFjvXgqJQa
         HlfztdKNm8q8RCcZ+gyxg1oD7X4k81wPFTBEZKvhHpe3KrwPK25J7H4GE1bNxfAmhWCq
         75oA==
X-Gm-Message-State: ACgBeo1TWYRMDhIBjGApnZt6fwKCwIczgJVqPa/deyb2ftfM3kX3zSxM
	NMwt+jIyTFc6SS9Vs4xZ8yMbUTJhWMkWsIcL3lM=
X-Google-Smtp-Source: 
 AA6agR4Gf0/oeNsodiYeCwQkm/BigIoQ5q1FDW04bXcYzWtmCiwx2l9+kalYVt3daB24/uZKUyxSTFj0jADYLwXsISI=
X-Received: by 2002:a05:6808:199d:b0:343:290a:9f4c with SMTP id
 bj29-20020a056808199d00b00343290a9f4cmr5479374oib.6.1660309723059; Fri, 12
 Aug 2022 06:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220812112643.2168104-1-jose.quaresma@foundries.io>
In-Reply-To: <20220812112643.2168104-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Aug 2022 09:08:31 -0400
Message-ID: 
 <CADkTA4MY94LwgAop_DyMOwrMoZbV0q5Um_9ZuhRMf58yVFpVKw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto: adds a space when append to
 KERNEL_EXTRA_ARGS
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 13:08:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169283

On Fri, Aug 12, 2022 at 7:27 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index cabc8f4975..7ea661e138 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -60,7 +60,7 @@ do_install:append(){
>  KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
>
>  KERNEL_DEBUG_OPTIONS ?= "stack"
> -KERNEL_EXTRA_ARGS:append:x86-64 = "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
> +KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"

The space would be intentional, as :append doesn't add one (or maybe
I'm not seeing the removed space with the small font I'm currently
reading this with).

Was it causing a problem ?

Bruce

>
>  do_devshell:prepend() {
>      # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169281): https://lists.openembedded.org/g/openembedded-core/message/169281
> Mute This Topic: https://lists.openembedded.org/mt/92977591/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

