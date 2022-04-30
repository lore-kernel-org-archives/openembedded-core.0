Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBF1C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 18:08:20 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.25274.1651342092079332283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 11:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E06w3pFC;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2f863469afbso90317567b3.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yNS5ph6cTQ+dSLm9I8r3paS513evdDA0HcUsOm322a8=;
        b=E06w3pFCK/eNsNKCtYlrFGxjWwmULOZW+oka3cyFIrzq8VhrLLu6ZzGL6nu3dzeykw
         mCEuiRm3SNf/srFi5HYV/60s7DYaPFsdEqyeubvX6ZB75SkEZRZIOp87BehjLz9FOwhr
         W/itL/19iPlNwRcWxYFrshPEKnyaZ7e5Te6wSqKLYjqRkQoYixWKQvFFBiyAvk+iKJlg
         f9BpL0Hc4rZ31powFeJ942304gghevwQK1G7myaA3PTI4Nb/spIxyCLgUbmrwEsWJXcl
         CTmr4UtiivJPO7qDWFJ0meJanV13+7FSVcCof4LrHqMpUyIaJihL32uVBOg8ju3zSQrR
         97/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yNS5ph6cTQ+dSLm9I8r3paS513evdDA0HcUsOm322a8=;
        b=MUJA5OSDUSqpvSmkepzJlLkA6W/OW2S84T4bZyqpbh0Ie8TK4nzMHhMCAaLhQbDr1R
         t2ZOQJT5hhQzXBQWGscbymrjR4W2uCdulw0FUt6YE2ehODJQLgS+O0k4O3LwpOkz5T0w
         Lns5+QgYpLLddI3Xwv/wNFZZyN6NVnH1XAbmPEemxx21T+ehTsN/xBrns1rkPtFvboRF
         5WVVVl8ratRO/C7SgKOhahPEDSFz8m1Nhpx3rzQDLC3+GMM1cy4FdmtvrVI1CtiY7krf
         sEFlv0ez4xfKy5bw6q1D2cy05C40T5YC1RWO/kgqImGakax3UdDR44JPhjNQHUELdmnA
         0Y0g==
X-Gm-Message-State: AOAM530mIh9cqNef7wdpT39Uusa5UBtXzoufeZSu2E7pOwRb37QSTPXc
	Lmscl6TW/aIEXOAWHN1Wr6Efml+Miw+THLdMaRU=
X-Google-Smtp-Source: 
 ABdhPJzYf3B+qiV6v1O+ygxvPkaCutDJuXz+wMAUCk8t1lLQimMDtIX7mNJYHMD/Pg805Ry9g+Wnrb/mUKOG1ZTm/lc=
X-Received: by 2002:a0d:f406:0:b0:2f4:e5c2:90f0 with SMTP id
 d6-20020a0df406000000b002f4e5c290f0mr4925628ywf.407.1651342091169; Sat, 30
 Apr 2022 11:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220430132836.1034892-1-raj.khem@gmail.com>
In-Reply-To: <20220430132836.1034892-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 30 Apr 2022 14:08:00 -0400
Message-ID: 
 <CADkTA4N7jASBL=Qr670F9HkvSW8GGckR_dT2dWwoywbx-Q_srw@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Enable powerpc-debug fragment for ppc64 LE
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 18:08:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165072

On Sat, Apr 30, 2022 at 9:28 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> qemuppc64 is LE by default, this fixes kernel build for qemuppc64 with
> gcc12
>

Looks good to me.

Bruce

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 1 +
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> index b60f3e07738..3d3dad99b5a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -52,6 +52,7 @@ KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
> +KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> index 8bada989e54..7ccb13195f5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> @@ -64,6 +64,7 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " fe
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
>  KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
> +KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
>
>  INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
>
> --
> 2.36.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

