Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E854DC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 19:10:36 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.5099.1716837029523992373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 12:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihrxGST1;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d1b806acb8so64328b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 12:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716837029; x=1717441829; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdNA8Dj/JpYihi+E9Ishgocwgu++ts2JrVde6egzGHI=;
        b=ihrxGST1UPR7oNutb6j9k+qPMyyCiJuEeIEBQaY1iF7SsZQ+3k1w86RL/nwwqzTyNy
         RJ47az0cV+SMIZPxmNP97yfPgW3vrStaaJ/xyvz6KTvV/0cD6fRBAmkT5g3MJ06zKkyw
         yZntGYcpuGezRA6qLUDkKwCAFW6GnErwvTcp73AJOkTCZ6VRBPcmjFGCXJCJJNFKohGJ
         iW+17cuILofj4SQJvnoyBYTx1srrToPmHfDI1vny12XMeNN0qDhUsbaUoe+Z0BzHLtML
         E6kfh1hSTr+bX90sdrHgeyPnhDuMGRXjNo8B2G6at6fhFKoFd9q/LJAXu46oEre+wg1S
         dDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716837029; x=1717441829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdNA8Dj/JpYihi+E9Ishgocwgu++ts2JrVde6egzGHI=;
        b=aJUuk0+xyZdCsrpYULxL0XdlXT+o/y00GK934wqlkHnJ8tAEBjfCbsN8qximEBFhCX
         w4LB5G+j8Ax50werSHcM4/jykmCr03HxVxuYNwdqrLtgyOsbfDp+ibx94xPcaPz1caA3
         W1k0XZieb3a5DMr0va69dYGDYF50nkk6im1nlBJfiuUwqkYESNiDtA56PcMq2oDKjOg4
         AN6UnBmWpLOuk8byNB7fyiBBOunFawoev2kYfh0FNQ3OMv8SeFatN5mof7mHaedB0qEr
         ajH1Ixm7v1CH0JcpahPCqkqcGsBvfZCvrzWEysoYcM9kHlQUcsvGfl5rdWs3Wj4bKq8h
         HQew==
X-Gm-Message-State: AOJu0YzwRt9SKR/eUyAtQqcSeh6ucfLjBiUx8lzRe9b5TnOxipzK+1MT
	awzF47Wop2Lnakhw9ghdbSOFxyyB58L22Zcs3Ud3DgzOiV9BOalkh2E6+IWBjNEumIg0as1mz+u
	814xTFF3JQjMgT4mY3Vkn+xU9Vzw=
X-Google-Smtp-Source: AGHT+IFG5xaGeVMKEJG/lxB6+WZaUaAh/BgNivdR/GoYdh8WFTtVIVccset+pQGYTcEWVcG3dAMssHfJyJ7T+8jwc2w=
X-Received: by 2002:a05:6808:4cf:b0:3c8:2fec:c83e with SMTP id
 5614622812f47-3d1a7d28724mr10247942b6e.53.1716837028742; Mon, 27 May 2024
 12:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240527181214.1778037-1-alex.kanavin@gmail.com> <20240527181214.1778037-7-alex.kanavin@gmail.com>
In-Reply-To: <20240527181214.1778037-7-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2024 12:10:01 -0700
Message-ID: <CAMKF1sr3rzt545xOEiukEpVPGPxyQ_VX+scB8gzySuP6tbuGMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/13] icu: upgrade 74-2 -> 75-1
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 19:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199934

On Mon, May 27, 2024 at 11:12=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> License-update: copyright years
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb      | 3 +++
>  meta/recipes-support/icu/{icu_74-2.bb =3D> icu_75-1.bb} | 6 +++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/icu/{icu_74-2.bb =3D> icu_75-1.bb} (95%)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb b/meta/reci=
pes-graphics/harfbuzz/harfbuzz_8.5.0.bb
> index 97efc56c646..6b0eb120461 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
> @@ -32,6 +32,9 @@ PACKAGES =3D+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
>
>  LEAD_SONAME =3D "libharfbuzz.so"
>
> +# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671 is resolv=
ed
> +EXTRA_OEMESON +=3D "-Dcpp_std=3Dc++17"

GCC 13+ and clang16+ defaults to c++17, so I wonder why it does not work he=
re.

> +
>  do_install:append() {
>      # If no tools are installed due to PACKAGECONFIG then this directory=
 might
>      # still be installed, so remove it to stop packaging warnings.
> diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/=
icu/icu_75-1.bb
> similarity index 95%
> rename from meta/recipes-support/icu/icu_74-2.bb
> rename to meta/recipes-support/icu/icu_75-1.bb
> index 8352bf2a5b4..14fbf31de57 100644
> --- a/meta/recipes-support/icu/icu_74-2.bb
> +++ b/meta/recipes-support/icu/icu_75-1.bb
> @@ -78,7 +78,7 @@ FILES:libicuio =3D "${libdir}/libicuio.so.*"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> -LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D08dc3852df8fffa807301902ad=
899ff8"
> +LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D9cf7c317c3f2a0962437465a90=
22dbe9"
>
>  def icu_download_version(d):
>      pvsplit =3D d.getVar('PV').split('-')
> @@ -111,8 +111,8 @@ SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
>  SRC_URI:append:class-target =3D "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[code.sha256sum] =3D "68db082212a96d6f53e35d60f47d38b962e9f9d207a=
74cfac78029ae8ff5e08c"
> -SRC_URI[data.sha256sum] =3D "c28c3ca5f4ba3384781797138a294ca360988d43226=
74ad4d51e52f5d9b0a2b6"
> +SRC_URI[code.sha256sum] =3D "cb968df3e4d2e87e8b11c49a5d01c787bd13b954528=
0fc6642f826527618caef"
> +SRC_URI[data.sha256sum] =3D "a5104212dc317a64f9b035723ea706f2f4fd5a0f37b=
7923fae7aeb9d1d0061b1"
>
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/release-(?P<pver>(?!.+rc).+)"
>  GITHUB_BASE_URI =3D "https://github.com/unicode-org/icu/releases"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199924): https://lists.openembedded.org/g/openembedde=
d-core/message/199924
> Mute This Topic: https://lists.openembedded.org/mt/106334732/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

