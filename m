Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC74C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 21:00:39 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.17481.1639083639219029970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 13:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YviTOJMM;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id j17so6597935qtx.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 13:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rE+Bt82N5D+BeD8/8U5TucsJMgrkqk8OfQaISu6sSGE=;
        b=YviTOJMM8VoqjtBdJq5gjEBX72h55cMXMfeg39JaqT/BYigwY4BdM0R/Vxpzd7NqU7
         UxqR/F6iqXPDi3wWB1q0ZKjokrsoST+RDVKkxowV+iG/qddz0cgqaLGCz1B2aTNtH23y
         1DqpISTUWbFVoVRL1oL3CVlIZQnUadvopLAn2x3fnoUAGKOGfDrPsbKgaxYzoVHgroUB
         Rt3NgBY2z/XB/5k2oZlhs+a3WdjVl5kZvqDvMOgga4YB7XGFX9blBhi9TrvaZttf7WtN
         vrzC6e8ARN9HGgUrO6vGiU5542MtkPKApEXvuvHlt5OvftwLqnwE56ZtLnEdg0XHfgdy
         6+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rE+Bt82N5D+BeD8/8U5TucsJMgrkqk8OfQaISu6sSGE=;
        b=ZE0PTzh3PYJp8SEDsuSStuBI27krEhHbXafK3Tgqc09xUAqOaCFiPkyQ/KiBiYKzev
         1zMVQhVKfX9JJKrGiiZfLquTyOz5fPTZBs7H1CfJhXy+dJM9KpGMhQCsVPt3DjXI1aXR
         l6PKGDX0O1c1lXtsajVpFdczUuZ/7RsmmCSH4F6NwoH0IXcZQHET+qGmJtdJCG6YqGR9
         dy5052RBGJMqxGurpkHXrxzXBln1xFnXGrzmmTSWhnEVx20ZUX3dT1/OO6DNIeUeCY2E
         AUOcFMHYRhy6ZANqcCfWrxOBUQVwksl0Pr9p480GmDqu593weRA1lqX2ByccIjkKwfkn
         cPFA==
X-Gm-Message-State: AOAM532IKPELiKrfz3042yGtsB6ikDkDsHP9FfNEbWXQ32cnRltIS1BO
	WFgxOMQ71YA0xfSXG79aoJq/VE8uSp9f8q5Y2/A=
X-Google-Smtp-Source: 
 ABdhPJw0tfv2PPAfkBlR9svhB9Hwk/wDEKGR4+tlRJkpnaFKmwVSuYIeOmMt16KCxKQka2AYgsuaKest54OmEdRaM2s=
X-Received: by 2002:ac8:7f4d:: with SMTP id
 g13mr21239448qtk.215.1639083638276;
 Thu, 09 Dec 2021 13:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20211209204417.3924102-1-JPEWhacker@gmail.com>
In-Reply-To: <20211209204417.3924102-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 13:00:12 -0800
Message-ID: 
 <CAMKF1sqa0QjJpe55-oCd0JYKXy4dNo=OShCbae2XsBd7Ub_5ag@mail.gmail.com>
Subject: Re: [OE-core][PATCH] webkitgtk: Add packageconfig for libsoup2
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 21:00:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159480

On Thu, Dec 9, 2021 at 12:44 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
> Including libsoup2 and libsoup3 in the same process can cause strange
> runtime failures, and the latest release of each major version will
> cause the process to exit if either if both are detected on process
> startup.
>
> The default is changed from libsoup3 back to libsoup2. Most GNOME
> packages are still using libsoup2, and a large number of these pull in
> webkitgtk either directly or indirectly. If webkitgtk uses libsoup3,
> this causes all of these packages to fail at startup. It appears that
> most GNOME packages will have to switch to libsoup3 when they transition
> to GTK4.
>

LGTM thanks for doing this, I was struggling through this as well, I
think having the option to
stay with soup2 for now is the best approach instead of boiling the ocean.

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.34.2.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> index 413e0cdf92..279e260441 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> @@ -38,12 +38,12 @@ DEPENDS = " \
>            atk \
>            libwebp \
>            gtk+3 \
> -          libsoup \
>            libxslt \
>            libtasn1 \
>            libnotify \
>            gstreamer1.0 \
>            gstreamer1.0-plugins-base \
> +          ${@bb.utils.contains("PACKAGECONFIG", "soup2", "libsoup-2.4", "libsoup", d)} \
>            "
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> @@ -52,6 +52,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
>                     enchant \
>                     libsecret \
> +                   soup2 \
>                    "
>
>  PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
> @@ -70,6 +71,7 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
>  PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
>  PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
>  PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> +PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,,"
>
>  # webkitgtk is full of /usr/bin/env python, particular for generating docs
>  do_configure[postfuncs] += "setup_python_link"
> @@ -124,7 +126,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
>  SECURITY_CFLAGS:remove:aarch64 = "-fpie"
>  SECURITY_CFLAGS:append:aarch64 = " -fPIE"
>
> -FILES:${PN} += "${libdir}/webkit2gtk-4.1/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
>
>  RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
>
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159477): https://lists.openembedded.org/g/openembedded-core/message/159477
> Mute This Topic: https://lists.openembedded.org/mt/87621243/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

