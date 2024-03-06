Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F674C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:20:19 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.10463.1709727611305426351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vo+S9um6;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d3fae963a8so13059901fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709727609; x=1710332409; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/owUdEDz+SKryQ0PFgMVEY/9rNarkXlm+Ok54PvWb0=;
        b=Vo+S9um68SE++o1B1T0QDYq+GbCvqrzpEjpcjcuY+V3jdFOcpMXw4DHU9P4K31MDJK
         JQwe19TsZWDb1GIWehRPTfI0v9lKql+ZRX9fUpCCzdrd0CopraPgFEl1aQus33iCzzir
         hnDJDDM7+sgUOuh81moynRO7Xq/+iljpEXHWWHlyYFF8jCUIAmb/3i7EdJjQSNQKQ1mY
         Voj1iipLXP73Tozk4WLn7oDEJJGFWmxz2QEgwKEBOnMyVZMPhGjTXzaLMsjZFE/YZqiT
         fvR0ZaHKKqccdmu1JwROV3PpnLWTQ0U/gvYj8jDVpqrpcxWz4djrT/NqWk6IZ8l8pmuw
         dHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727609; x=1710332409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/owUdEDz+SKryQ0PFgMVEY/9rNarkXlm+Ok54PvWb0=;
        b=S0dHxbMUpNfghdB6hwVaRNNlr+cQQ4T+bU8FtObkuBp2Ng+Akez58HDVmcpTWmPGCB
         /DzwlSZkR9OEnSvSbLNdds6FGsqFLk8Nul1rphcMl7P/waKWLC9Ulh/KK3+m94b4fUpD
         IH6kiP3QlpWKms1DudBI5HECvVvTeazcHxduBkhcH56yqbtd46Pw7PTjYN33vhhcLOBj
         wTVxg5jAcsOuCkHoFzJu19crG557LwUI9pzpVLD5Zd4o9KAKTTAMJY0obuM75HvyzrG3
         LOVnI529t/oxJ0TYmSzgXrGlPSqp1gz1AgEcNZwBa2dzER8Ae+CFG9qDOlzxTL1P88RZ
         /pAA==
X-Gm-Message-State: AOJu0YxNDTPR47X4wuqa435ux9O0g2R4ukPtsPjKKq5jsc8UanTcYwZg
	0JMhFShvvlI/SGke/pYaV761J3i5Fzj9+Wtdcz8zwtvScc2esiW3KEBOL1remsKm1uFM0iIYSDB
	8jsUXF5HfmpJSenzXDXca0kR1/yo=
X-Google-Smtp-Source: AGHT+IGwbdHWB/jLhD84EddsM2cpaF42474FurpYiO69aG0UQ0NyasKTfy9qXLvY3wfPiHnXiL1fsWKm031/hmdZ8Ew=
X-Received: by 2002:ac2:4a67:0:b0:513:572f:88f0 with SMTP id
 q7-20020ac24a67000000b00513572f88f0mr2619338lfp.41.1709727609068; Wed, 06 Mar
 2024 04:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20240229051156.3731622-1-raj.khem@gmail.com>
In-Reply-To: <20240229051156.3731622-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Mar 2024 13:19:57 +0100
Message-ID: <CANNYZj8tsW7dQEFSFsdkBdVmiENSJAR0pBGCS_rsW9BkXcFtaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: Update to 18.1.0 RC4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196671

The final release is now out, please update to:
https://github.com/llvm/llvm-project/tags

Alex

On Thu, 29 Feb 2024 at 06:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> This is last milestone before final release
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index 40103a94aea..111fb07fac9 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -24,7 +24,7 @@ MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
>  LLVM_RELEASE = "${PV}"
>
>  BRANCH = "release/${MAJOR_VERSION}.x"
> -SRCREV = "0d656f0f12d447ac0e197618a0d25495d66388d1"
> +SRCREV = "461274b81d8641eab64d494accddc81d7db8a09e"
>  SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
>             file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
>             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
> @@ -148,6 +148,7 @@ FILES:${PN}-bugpointpasses = "\
>
>  FILES:${PN}-libllvm = "\
>      ${libdir}/libLLVM-${MAJOR_VERSION}.so \
> +    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
>  "
>
>  FILES:${PN}-liblto += "\
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196412): https://lists.openembedded.org/g/openembedded-core/message/196412
> Mute This Topic: https://lists.openembedded.org/mt/104638745/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

