Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD24BF5513C
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 10:15:11 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33418.1772964904370298168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 03:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tDuiqzIv;
 spf=pass (domain: konsulko.com, ip: 209.85.222.170, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd71fb9f06so109150585a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772964903; x=1773569703; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qk8ORN93XpCWR5r+9G5gQBIB+t68VBpbzQ9Gtyh8kD0=;
        b=tDuiqzIv5pDJgwxVFoftS8UGwjgbS5D0kygx+yiCvpCcSOC1Xvseh3EcrQ2LOjAf6V
         Ddlpo0KakPIforrt3dQdjIEdIsOj870yE6snkb2bHSamaXlA84GNngjBEC9ehb/jfmrY
         uBFT5RagY8ISWWjtTHuCArDqJC+GYjnxeEEA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772964903; x=1773569703;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qk8ORN93XpCWR5r+9G5gQBIB+t68VBpbzQ9Gtyh8kD0=;
        b=Y1vj+7wAOFacvY4u1Q+sb7FKrt2kv2KSol7UurTajv7LKPvo534ssigwzkWhbmpdQ9
         4Qi0yT8a6limxJMRL94YlAy4r2fR9FA5sQ2HbEsm0wrFiGrzCUt6xAvbNG5VFUubKWzn
         6TTOXgTfjJUpZZ9+J93nrsqKLYwNrUQBdctRlXykQCXtIVxxTFfPQNFj16ew+GK/IU7l
         ymAACPFSSO3N59/GiMrrw5iCHHTP+Xba0ILc17n0AF2h3OHdNB3UduUQRTB2pj9XuSJy
         9SLBRvTMSCm4yCfC5iadKuZjJPCKuwNaExol9L5H2viigsYuogyMwyvT4sMWSrJ7zlFH
         /jXw==
X-Gm-Message-State: AOJu0YwqUCdYBhB22Oz+5YjoxQkqzxIHsBzkqT0pOereRrivtnPyLjil
	Albrd4Rb04RmpxOwTh0+QVctX8ngZzzI34RdLYdIlyfy2Wp8RpxGM1K+WYxy5BXuUutQ32VIbSy
	vBc9y
X-Gm-Gg: ATEYQzx4/CYlIVGTOtjwd8QVXQAGhDMZos5TVJsum85YOwrsvVI2o0XZ1IGPydHhOZm
	BSQ0wtEwaTaE3vB9i101QCjAd13fDHoiXUTj/JzksE5aXKRJ0e8JsjO4Qs/n6I6SAkZe3MPXc/k
	Vj/4Q/xv/TL8FhRxVqkT9SGNK0Hq2AnvRm5bXwrMtR2hdkeDifmqukEnhXF4mm3OIm6uMqtOZPQ
	PDXR7ye2P+KWz95S/2KP059L4zoVa0Rgz06hMG3LfnF0jUQ/MI8rGN+J+PMpOKrCe9v2BJdKTF5
	RrQHdd5/uBJMA2G1z2cSb9MYzCLRvRJIt4NQs+ynghZVDJsRzuEJmLmj6+Swho2N8BC0tJTDjRq
	oWoV3hfkO4kijmiloNHJWh9MD8cDQ8Z64hfs6YJdRCE8AYK6+OZ8XBmqnGMaZDqFSJlwaIZKrAz
	pzyWmy+qjaltJ4HmldMU/NFxZuS8OzMWgVzeBBt8naKNdBxYEYHOS/v7YbVwqott5CbEl5/F0G9
	3ynE8Ca1b8igcSoeMrXT8smrMHIfhWuh7tvy3EkwXYO2+o=
X-Received: by 2002:a05:620a:4723:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cd6d4284b1mr1049650685a.38.1772964902913;
        Sun, 08 Mar 2026 03:15:02 -0700 (PDT)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f4a2fdasm472429585a.17.2026.03.08.03.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 03:15:02 -0700 (PDT)
Date: Sun, 8 Mar 2026 06:15:01 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [kirkstone][PATCH] u-boot: move CVE patch out of
 u-boot-common.inc
In-Reply-To: <189AD5370EA1E51F.2182444@lists.openembedded.org>
Message-ID: <733cc55c-75ff-8aed-60e8-333f80cc045d@konsulko.com>
References: <cover.1772963425.git.scott.murray@konsulko.com> <189AD5370EA1E51F.2182444@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 10:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232640

On Sun, 8 Mar 2026, Scott Murray via lists.openembedded.org wrote:

> Commit f5b980ad added CVE-2024-42040.patch to the base U-Boot
> SRC_URI in u-boot-common.inc as opposed to adding it in the
> u-boot recipe where all the other patch additions are. This
> breaks at least one downstream BSP that reuses u-boot-common.inc
> (meta-sifive), so move that patch addition to the recipe file
> with all the others.
>
> Signed-off-by: Scott Murray <scott.murray@konsulko.com>

Please ignore, I accidentally resent this.

Scott


> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc | 4 +---
>  meta/recipes-bsp/u-boot/u-boot_2022.01.bb | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index 7a63420642..d366f10398 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -14,9 +14,7 @@ PE = "1"
>  # repo during parse
>  SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
>
> -SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
> -           file://CVE-2024-42040.patch \
> -"
> +SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
>
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> index 0ff2477c39..f0ea3ef9e0 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> @@ -11,6 +11,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
>                     file://CVE-2022-30790.patch \
>                     file://CVE-2022-2347_1.patch \
>                     file://CVE-2022-2347_2.patch \
> +                   file://CVE-2024-42040.patch \
>                     file://CVE-2024-57254.patch \
>                     file://CVE-2024-57255.patch \
>                     file://CVE-2024-57256.patch \
>

