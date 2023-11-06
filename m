Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39399C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 12:28:00 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.53016.1699273674066510806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 04:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvGtk7rI;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c5056059e0so63384511fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 04:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699273672; x=1699878472; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lafx1iu8iA7ujO+Ye/tP7G4EJ7VgK70ikjN+/tFOdoY=;
        b=fvGtk7rIrT6yOiQa3jBla+u5F/SS6ZyQHe+0Nk69jbMjezEAapU+wYY/5s3v02AVtI
         Vbmy+jO4MkqiQfCirRlWwEJhQgiJA/X2U3mglrGXH7Q+672ssWGNpZ6X+5CZ2S8+vfwS
         r1Hr+ZWFidoRyZSxA1mQs3lfA/NWAD59IsSglU60rgRtNyKDEKfKg3pLaVbjxrxpwyPt
         WotLEDQ9DyOUaMiY6Bk0ieXxeCu2LMrf2T2KuNbjTLhUAvyN+pg20NEoycM4yI9uO+3H
         4Y99Fxli68cezv5SWl4xoR7xwbRIb+XDK8FQ47I4t+0a9LM2+8tcB6ourgTcunbc1xhr
         l1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699273672; x=1699878472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lafx1iu8iA7ujO+Ye/tP7G4EJ7VgK70ikjN+/tFOdoY=;
        b=uYiz7I0XfMaS1F8YSsg/kvDFUDF5knsZqaCcgfsUnyCioa8Y5Xxdo8sjwpZEKPjHAY
         oV7QR128tRKxkjt62Lc1tWXQ96AZ7y8UIzbJaggsRe9B0bVXTY+kSCY2QQEBJlNpR1dH
         Vutbw0f0JjNtTpZy2vRQAUr7eFHIqcOxTHU22071qDI/3RMlURzFIPrVsptPc34Isju1
         ajRtcLBW7px9/SD53V1L/ekUGhj4PucLbVQ8t48xkqogX8UTNpz17/tJP5iqU9r0xVyr
         D2VsI0wijYtGkIMZiP/unMwAU6AaAjcADlGkkV4jTCDy/E2Za8GXrlhpdLfWhS90X9QM
         Ku2A==
X-Gm-Message-State: AOJu0YxOnK4yF0lKJGaNk267+uKG6tnIoWIpcH79mwiDwLWkCBR60tXG
	lTmkNDPghok0YPiCTUQ68Rkk/3J4XZO5gyAw4lgLMMNW18Q=
X-Google-Smtp-Source: AGHT+IEyRQnqmXEyXeQD+/i7S35hIZT6W9U5J6fsBXA0/f25KyGnu3FE+4Yl5Io0Gh0MAEwRmE5c0jUmLiCOT4kE1us=
X-Received: by 2002:a05:651c:336:b0:2c5:15dc:ba99 with SMTP id
 b22-20020a05651c033600b002c515dcba99mr19753606ljp.51.1699273672092; Mon, 06
 Nov 2023 04:27:52 -0800 (PST)
MIME-Version: 1.0
References: <1699238045-2801-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1699238045-2801-1-git-send-email-qiutt@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Nov 2023 13:27:40 +0100
Message-ID: <CANNYZj9GOAJsD5mNGKb81T41aYCFEzfNCtiocDfFTFTdcfd=vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cairo: upgrade 1.16.0 -> 1.18.0
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190208

Thanks for working on this. Some comments below.

On Mon, 6 Nov 2023 at 03:34, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
> @@ -30,47 +30,28 @@ DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
>
>  SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
>             file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
> -           file://CVE-2018-19876.patch \
>             file://CVE-2019-6461.patch \
> -           file://CVE-2019-6462.patch \
> -           file://CVE-2020-35492.patch \

I think CVE-2019-6461.patch in particular can be dropped too:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6461
points to
https://gitlab.freedesktop.org/cairo/cairo/-/issues/352
which points to
https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/515
which is a part of 1.18.0.

Please include the links into the revised commit message.

> -SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
> -SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
> +SRC_URI[md5sum] = "3f0685fbadc530606f965b9645bb51d9"
> +SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"

md5sum can be dropped, as it hasn't been used by fetcher for a long time.

> -inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
> +inherit meson pkgconfig

All of the removed inherits need to be explained, or kept.
Particularly, upstream-version-is-even rule still applies, and gtk-doc
support should be kept as well:
https://gitlab.freedesktop.org/cairo/cairo/-/blob/master/meson_options.txt

> +EXTRA_OEMESON = "-Dglib=enabled -Dpng=enabled -Dfontconfig=enabled -Dzlib=enabled"

How were these picked? Should they be PACKAGECONFIG options, enabled by default?

>  MULTILIB_SCRIPTS = "${PN}-perf-utils:${bindir}/cairo-trace"

This implies that 'inherit multilib_script' should be kept too.

> -PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
> -PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
> -PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
> -PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
> -PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> -# trace is under GPLv3
> -PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"

Please mention that these options are all gone:
https://gitlab.freedesktop.org/cairo/cairo/-/blob/master/meson_options.txt

Alex

