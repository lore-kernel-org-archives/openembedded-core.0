Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8CAC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 20:03:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.23071.1661198627521450949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 13:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SSeeu6ek;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id z25so16815988lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 13:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=d4qMK9FOQDzMP4UEDT+3yI/9Q/C7doNjKjlmKQc7g20=;
        b=SSeeu6ekLcphtIGxHTuQTsEh7CIv8tAmiX423i7okF8oIdqwIri2AiTYfHZO3VaUeh
         IF0b6tr+FJInfeP656RS0ab7BWuyvNsBsuJutCJ/LZoDcKqYqGRLtj5BQL/Oh+p39I+P
         RsR4RumF7BAqctj8iK6dcgyaWMj6fvq3kksTXq/WgSG/2s6aWSU1hWkH5093NK8FoVGO
         5zBIaJ9IVwLF3o3iwxJMweAJp8YLwqDUCUiH2OPdyWDEqx1IW19sxNSQ2elwcK5Y15aO
         jAGLN42E7E4YwHd/DWUzykbb5L/hBiiVuG4xraPXoP3YrmxeF7GTO+Uil7gm2SnUcdNb
         bvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=d4qMK9FOQDzMP4UEDT+3yI/9Q/C7doNjKjlmKQc7g20=;
        b=p6WezoT3AABS+bPY0UnRwgNK/Ri1uJOwJp8tXLPsbO601e/78+ODQkkv760q7f6stu
         PwZsu1gryZT0PU9htbYSJdkGcQwse+MrTbR79iLe/8EUuhA7VRA8sbkr5QLXjb2tocEF
         eQAZrG5PGOR9KNom5LAcAqyqxCvomVpcp3/2zme9XUKTVCv1/pxDmdYlgx3Irl4M7UZK
         /njMdtlWgOozk4K8frQCIeaA4w4ueD9UivIJN6zB9fXjoYqBxGnO6dMFMohd3zq3IhND
         2RzEogiT05AaYE1eHFcYChreahLJj2Uxbm+xvBkCVmI3hAA7nYW8eZzAdsYYoBFvNA7V
         FUFA==
X-Gm-Message-State: ACgBeo1PH3gAG+dDzTTWAv0OcPYD5e9P8Cdjs3VB9/+vtA18RcrBSMud
	7h56Xk+29WzhXjhqrC8RKO+MjFbBtmfchMmQolo=
X-Google-Smtp-Source: 
 AA6agR5Y2a1VLmy21vzG6Ei3LSDIB2Wyu9jNPfKk0DhLo/cEbe8CLbCW2xsJKmcd6V16oiMK+QhmOozXFty5OJi0jH8=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr7366251lfa.380.1661198625702; Mon, 22
 Aug 2022 13:03:45 -0700 (PDT)
MIME-Version: 1.0
References: 
 <PR2PR09MB310005D5AE7E68AD1153DBC2A8719@PR2PR09MB3100.eurprd09.prod.outlook.com>
In-Reply-To: 
 <PR2PR09MB310005D5AE7E68AD1153DBC2A8719@PR2PR09MB3100.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Aug 2022 22:03:33 +0200
Message-ID: 
 <CANNYZj-B1Hmgi+XwbbSRPmCyHg+R6ee_XjJpRS6Q2dYKVnXvWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3: add wrapper for native
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 20:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169683

This needs to be applied to python3-native/python3, not just to the
nativepython3 link to it. You can use 'create_wrapper' helper that was
written exactly for the purpose (see meta/ for examples).

Also, can the lookup in ~ be simply disabled at python3-native build time?

Alex

On Mon, 22 Aug 2022 at 21:57, Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> which makes sure to set PYTHONNOUSERSITE to prevent
> dynamically loading site packages from the host sided
> package dirs.
> In before when a module was using pluggy and/or
> importlib_metadata the host sided path ~./local/... was still
> part of the sys.path search tree and had priority over the
> recipe-sysroot-native, leading to host/workspace contamination
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-devtools/python/python3/nativepython3 | 2 ++
>  meta/recipes-devtools/python/python3_3.10.6.bb     | 9 ++++-----
>  2 files changed, 6 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3/nativepython3
>
> diff --git a/meta/recipes-devtools/python/python3/nativepython3 b/meta/recipes-devtools/python/python3/nativepython3
> new file mode 100644
> index 0000000000..0413e44e32
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/nativepython3
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +PYTHONNOUSERSITE=1 python3 $@
> \ No newline at end of file
> diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
> index f19cd50273..1121c17887 100644
> --- a/meta/recipes-devtools/python/python3_3.10.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.6.bb
> @@ -43,6 +43,7 @@ SRC_URI:append:class-native = " \
>             file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
>             file://12-distutils-prefix-is-inside-staging-area.patch \
>             file://0001-Don-t-search-system-for-headers-libraries.patch \
> +           file://nativepython3 \
>             "
>  SRC_URI[sha256sum] = "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3"
>
> @@ -153,11 +154,9 @@ do_install:append:class-native() {
>          for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
>                  sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>          done
> -        # Add a symlink to the native Python so that scripts can just invoke
> -        # "nativepython" and get the right one without needing absolute paths
> -        # (these often end up too long for the #! parser in the kernel as the
> -        # buffer is 128 bytes long).
> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +        # Create a wrapper for python3 in native environment
> +        # make sure that no host sided modules are inherited
> +        install -m 755 ${WORKDIR}/nativepython3 ${D}${bindir}/nativepython3
>
>          # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
>          # and the overhead in each recipe-sysroot-native isn't worth it, particularly
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169681): https://lists.openembedded.org/g/openembedded-core/message/169681
> Mute This Topic: https://lists.openembedded.org/mt/93189857/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

