Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311A0C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 22:08:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.84.1639087724434988359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 14:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HUNznec1;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id u17so12122202wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 14:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eIzH3dMsSJe/P9J9CpzcnPWPs+zefIeq6obecCEeXXY=;
        b=HUNznec1BoXh1bhEjdmoxtbdUmDttGgHYfs1yhuCqNadoFD3EgWwKKKjpAyiK2refD
         /jpfj4AG3nYRR7/BXm0CHGuFTNdQoTDBA3f1/fDSgagmV/y7sQFe2bY+mY08/gxzs6kp
         0XDGcxmzCaFSVgEC9i3sy59uT1m5y9k5n9Klg9I90Fj5QT9+KNtmJWueSS4Rxa0kchGJ
         KZhWH0686NAhQEjl2mjd8RnF5iEGrhLVPqe9uP/hH6AdVPUfNgZm5fQbM+/t9ybpbDv3
         dD4V/2DFLAOYmx2vRzctFl/ksgpXSIhmkFgsmmh1oWD8sUMmMZ1E18qzEC/Wm0Mv9mYd
         FbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eIzH3dMsSJe/P9J9CpzcnPWPs+zefIeq6obecCEeXXY=;
        b=ORUaVt8AjHlpBBoHU9iEEhzzZqk1KWOG09ZkBfA+sYizidtz03JuswdBVotdvjTb45
         2cjt/6TWkMiaBuaR0GkvF1HPvnHvsPvI6gPLDfarROP2XRefWkYkMXKKaVv1FXXup8Hd
         giIsqHUq/hIKO4UtV2paUbREKJ32zEmKiUyzO9hTIuRoLWy+hrjHnsbb7kOsJSY0iCqB
         AaVh8zRNA+Zlg65SxfWxc4O4/aO6nnV3jWLevlRnUnNHIC9vG1pQtQGGbPvIK/DkypK3
         CWPaotk8cBACnyBV7zbagjga6E4FUAB5BD2qUkpKnYbRwtHWSqs8WJJMRp2WK5+mL1Iu
         aaCQ==
X-Gm-Message-State: AOAM531Y8jC6eakbvlu/R+uHP/j5hj0RJLJECGTls158rg4SrLy8hjgl
	7Fw/0qr4LXO5PaXKyzU22o9hdnAvEt2edkh1y74=
X-Google-Smtp-Source: 
 ABdhPJxL3th4Z17KN59N693aGU75Xl9bRXXuIGBkM5du8X47vATwnaeA7RgpxDjRHVit6jnAv/n7YuVO3RomjzZ7zB8=
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr10014372wri.195.1639087722926;
 Thu, 09 Dec 2021 14:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20211209204417.3924102-1-JPEWhacker@gmail.com>
 <0784B528-B0F6-4BF6-A0FA-0F69B97441EC@0leil.net>
In-Reply-To: <0784B528-B0F6-4BF6-A0FA-0F69B97441EC@0leil.net>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 9 Dec 2021 16:08:31 -0600
Message-ID: 
 <CAJdd5GZAwWsFPwpdHWpKmUqNeYFGM+LKwkLB2h6tsZA_ACvr8Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] webkitgtk: Add packageconfig for libsoup2
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 22:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159483

On Thu, Dec 9, 2021 at 3:55 PM Quentin Schulz <foss+yocto@0leil.net> wrote:
>
> Hi Joshua,
>
> On December 9, 2021 9:44:17 PM GMT+01:00, Joshua Watt <JPEWhacker@gmail.com> wrote:
> >Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
> >Including libsoup2 and libsoup3 in the same process can cause strange
> >runtime failures, and the latest release of each major version will
> >cause the process to exit if either if both are detected on process
> >startup.
> >
> >The default is changed from libsoup3 back to libsoup2. Most GNOME
> >packages are still using libsoup2, and a large number of these pull in
> >webkitgtk either directly or indirectly. If webkitgtk uses libsoup3,
> >this causes all of these packages to fail at startup. It appears that
> >most GNOME packages will have to switch to libsoup3 when they transition
> >to GTK4.
> >
> >Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >---
> > meta/recipes-sato/webkit/webkitgtk_2.34.2.bb | 6 ++++--
> > 1 file changed, 4 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> >index 413e0cdf92..279e260441 100644
> >--- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> >+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> >@@ -38,12 +38,12 @@ DEPENDS = " \
> >           atk \
> >           libwebp \
> >           gtk+3 \
> >-          libsoup \
> >           libxslt \
> >           libtasn1 \
> >           libnotify \
> >           gstreamer1.0 \
> >           gstreamer1.0-plugins-base \
> >+          ${@bb.utils.contains("PACKAGECONFIG", "soup2", "libsoup-2.4", "libsoup", d)} \
> >           "
> >
> > PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> >@@ -52,6 +52,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
> >                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
> >                    enchant \
> >                    libsecret \
> >+                   soup2 \
> >                   "
> >
> > PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
> >@@ -70,6 +71,7 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
> > PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
> > PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
> > PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
> >+PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,,"
> >
>
> What about leveraging package conflicts in PACKAGECONFIG?
>
> e.g.:
> PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup"
> PACKAGECONFIG[soup] = ",,libsoup,,,soup2"
> ?
> No need for the check on PACKAGECONFIG in depends then.

Ya, the weird part there is that if you want libsoup3, you *must* put
"soup" in PACKAGECONFIG *and* remove soup2, otherwise libsoup won't be
added to DEPENDS and the build fails.

>
> > # webkitgtk is full of /usr/bin/env python, particular for generating docs
> > do_configure[postfuncs] += "setup_python_link"
> >@@ -124,7 +126,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
> > SECURITY_CFLAGS:remove:aarch64 = "-fpie"
> > SECURITY_CFLAGS:append:aarch64 = " -fPIE"
> >
> >-FILES:${PN} += "${libdir}/webkit2gtk-4.1/injected-bundle/libwebkit2gtkinjectedbundle.so"
> >+FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
> >
>
> Was this change suppose to make it in this commit?

Yes. The minor version of the library changes based on libsoup3 (4.1)
vs. libsoup2 (4.0)

>
> Cheers,
> Quentin
>
> > RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
> >

