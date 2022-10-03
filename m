Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F5FC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 01:35:17 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web09.14361.1664760908173494612
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 18:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XftZJOcL;
 spf=pass (domain: gmail.com, ip: 209.85.160.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-127dca21a7dso11439735fac.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 18:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=D0RYNZFErQc4OITig6ty3l1+/zrtKyJDizfKfmgm6K4=;
        b=XftZJOcL0XSU+2Td+Wz9kAJesHtx9/sEXh7c/R2TmIYM9WEywFst+3k1AP/K59CwS/
         4qLSo8/jrQ6Dr24Iv65o0FMtniTOpHh2y7urj974YH7sS6w9Mts2wCr89qcSlBLvUBNa
         XUvgBZsYo4gyuKq9t8c6P/pAbvJejD9+Hwv7z24/uC51dghFmz6cGvDGRfQmwJbl28gM
         RPN4xe98loqf6UCx5qIxDN6xnycEv4kWSl4pVvdRs9PwPAB6/CH0AkH8j7ABfMXLk6/f
         of62eJSuSfbPPYQ7S6in+/Fx4Eq1NeDf7ioyjiecoJ4oWiDY0/pTmjBEE3KQa70LuJDs
         UIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=D0RYNZFErQc4OITig6ty3l1+/zrtKyJDizfKfmgm6K4=;
        b=LPFrbh9THv3yHeFL8sdvVOq1S5PTc/w/+eCznM8KlE8r8L0N5qlL+bpcf6KtowGCLt
         YPu5W7glfqYJJa10OejVrc49S6g6WbKz4E93sQqg9mjjp3edKMSxiDfbPnT8gc55+SSN
         3yhjM0PBlWpEI/Hqzzxj5LNElJDXi/kcUOp0/cU9FPXwHv7mO+Wp9UR3xyEF0updDeT8
         zkvrlBggAiZNLtOtQJC+9zRwMMK8Iq2v2VmjdCcyGWxDF3FM7l1VhudNvfa/gqmbs89J
         VFz5aw+s5KSH5Mys2dC2kA5FBJ8jq8GdsAvAD97iElBOHKxtnLGdvcq1TdM8voeY9QQD
         5Kvg==
X-Gm-Message-State: ACrzQf26WpLdOkak/o28xwJjLlUHWnDOb+W1cca6Hb7zy7JIcHNTZexP
	xDAxVOckBBXqqMThB1Nln41ok/3xxKj6xwUiYBw=
X-Google-Smtp-Source: 
 AMsMyM7JD3op2A96KiDep18w6V2+ech9zmvEx2zT/YDU0tDjzLERx9BAnYtAh4tTUGGc+9h66eTrdSeZlY+7bIge9BE=
X-Received: by 2002:a05:6871:1d4:b0:12d:6e53:d053 with SMTP id
 q20-20020a05687101d400b0012d6e53d053mr3968655oad.241.1664760907428; Sun, 02
 Oct 2022 18:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221003004959.1317009-1-jdmason@kudzu.us>
In-Reply-To: <20221003004959.1317009-1-jdmason@kudzu.us>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 2 Oct 2022 21:34:56 -0400
Message-ID: 
 <CADkTA4MVSO+VEPm32G=r07YKTsCSXB_zzuviy5S_uitdXcO65g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add efi entry for machine features
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 01:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171358

Looks good to me!

Bruce

On Sun, Oct 2, 2022 at 8:50 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> EFI has kernel features when need to be enabled for it to boot.  Add the
> existing kernel config fragment to the kernel config if this machine
> feature is enabled.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 7ea661e138d9..091003ed8299 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -33,6 +33,7 @@ KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
>
>  KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
>
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171357): https://lists.openembedded.org/g/openembedded-core/message/171357
> Mute This Topic: https://lists.openembedded.org/mt/94082000/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

