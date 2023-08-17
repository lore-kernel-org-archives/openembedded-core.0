Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B78C30620
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:25:49 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.189056.1692282345552014750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 07:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=N/5SUQDE;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3490cce329bso2590595ab.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692282345; x=1692887145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRQkXT0SOhwy0+7NX1gQCWpaZY8RSACC8wdE0KxOAy4=;
        b=N/5SUQDE9znSLw6sUmbiMGkjCWxRcd1GhpIIerDO1CTLlajwDJ2TkG1rQ+YOBJKboA
         /DOy1mOA6KNnAzyzG5MZXZasBHO6prqubo2AXqhQyHyCtRwGP9GHD8UsBGG56L9rKpoK
         c7LEf++0cq2T7VCGmBlIb9f48fZQXlu5eYYyqkmS4Bb8FbYowSSwYGMC/tjDsc8I8Q5I
         4RGC9icbkubt1b/O3rAdyn/6KsgxBQf2J5hF4GEpUPLerUey0z82M7NaBsAQ15nSYGDU
         sxVHx2XrlppvtWfhfVrHZTGqyt1bQ8nJzcMed22wAI1sHvwxFLHc4bCR4P5SRskTVXz2
         PHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692282345; x=1692887145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRQkXT0SOhwy0+7NX1gQCWpaZY8RSACC8wdE0KxOAy4=;
        b=ddZH7XNpnEKmnrn2t22EDeLQCWgwKWUF+rymSHJrcrbrlnAbrDs7MDHz07obbWC4BE
         okMJb1QmHvE3OryH3iMGC1SYo285XcG5Yz98LxrV+YUdJ63XbyqsC1wH2DxQAO1zHcam
         QR6wJRGaqhVGqhpe1DbEY3aGmzdjVnq9UL5p8ROIPcTdJAmKyZ9Dki9kJENQJLKMvYvT
         yXtkepoporl0RZGMxl2ufFYqbQun1Q2dyzdiQHwVMWxDy3p+T4R9/9JvWUZ9xwufZCHQ
         0tpGUyOZ9mCoSzHpz5/V01GrDS3+z2ypPg/PMrHPMdpe2VcxFpQW4nbST2p+vs04g4B2
         wMyg==
X-Gm-Message-State: AOJu0YxSuySJH5xlFzoR1PzjR4JXKBgile2RsUbu1YUlQmBqKUVngG+a
	pT5VCXIvdiFuxTtMIkDs0DV0TljWcfwAcflo1jc=
X-Google-Smtp-Source: AGHT+IH24AVK2pVBmLJAI95XUQbvmjlD4Xup6osgsLc7p33jf20Fi3r6s0gg47xm4CwoSSVfhA8NIdRdw16afEBguj4=
X-Received: by 2002:a05:6e02:1949:b0:34a:9320:b7c4 with SMTP id
 x9-20020a056e02194900b0034a9320b7c4mr4190891ilu.6.1692282344564; Thu, 17 Aug
 2023 07:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230817142349.4137947-1-jdmason@kudzu.us>
In-Reply-To: <20230817142349.4137947-1-jdmason@kudzu.us>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Aug 2023 10:25:33 -0400
Message-ID: <CADkTA4P7PhijpAHcCUsYQj-DHxsTF=2BFzFzOXn_vHHb-XK3UQ@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto-dev: correct qemuarmv5 device tree location
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 14:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186322

On Thu, Aug 17, 2023 at 10:23=E2=80=AFAM Jon Mason <jdmason@kudzu.us> wrote=
:
>
> In Linux kernel commit 724ba6751532055db75992fc6ae21c3e322e94a7
> all arm arch device tree files were moved into vendor directories
> (similar to what was being done in arm64).  This is causing the
> following error when building for qemuarmv5 with linux-yocto-dev:
>
> | make[2]: *** No rule to make target 'arch/arm/boot/dts/versatile-pb.dtb=
'.  Stop.
>
> Correcting the location to add the vendor directory of "arm" addresses
> the issue (and is what is being done for arm64 machines already).
>

Acked-by: Brue Ashfield <bruce.ashfield@gmail.com>

Looks good to me!

Bruce

> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-=
kernel/linux/linux-yocto-dev.bb
> index e695e2d83eac..fba603b0f2b8 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -51,7 +51,7 @@ DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dt=
-validation', '', 'python3-
>
>  COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qe=
mumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
>
> -KERNEL_DEVICETREE:qemuarmv5 =3D "versatile-pb.dtb"
> +KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc features/ta=
skstats/taskstats.scc"
> --
> 2.30.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

