Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FABCD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:27:04 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.2742.1712082422010714727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hc3xVLkA;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516b80252c5so1421730e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712082420; x=1712687220; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CGZd30KSALqRc4IoZNtgQq85iACH6euU55fhTQheUwo=;
        b=hc3xVLkAlJOWEvLe0G4o2cFBIn2yqz5BV6/ozazxv8nvlMOGPqsVj3RMhjbC0lHyLw
         aUp30hGIKD055+jOdFL1EGGC513mDLM6KAJV5YL3opiBq4zrZE3OvJzu+CzKS60kCNiT
         NIpTb7wDY4vj0nlGwqtv1/Njc3U8Pb2hFd9EBBAu3epU+wnKX3LzFHubnJthPK1H/zVI
         FrlzeouwaaiPv+xf9fUvqWtjIdH+3OGllXdHQ6AFTY2tgyP7D5JIVQiPgrjJIjCOUmBI
         v2CKpL/9jDg63NwKPtWH0nspdmfFrZ15gUS+IriHVuz7fT3zS7vP6TUgnkAzvpkdWma3
         Ue2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712082420; x=1712687220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGZd30KSALqRc4IoZNtgQq85iACH6euU55fhTQheUwo=;
        b=KS1ppoVX2IiqXQwdrYReucqXtZy3kXGccGw7j5drR85xj4YrHE6txRtjVcUsDgtnEo
         9+XRN959RcD8UNx+hHwYnjx6vvhtSiXVOg69u/3dwRUUDRnwBZHremeDqjDMOpVXG75G
         lkadfYacCf72czjSwx9+ujFHYYa+/8pkxdQZPVat2a23etsdJhbkFz0u0kSOW6tmqz+L
         fJlegNCvOIvFMOnZt59SS35H/rClkykmTMtpECTFa79bIB7ADmBCe1j1shi1HVIWU79/
         bwVmenzeXKLE9pb9dJ3L0qrTMSS+Y7FMR3fYEg9vvBFRZzaBVTI1hyVNGLF8ugwL0ior
         AivA==
X-Gm-Message-State: AOJu0YwpRcS1tF02P2o47icqf3H1BPKwS/btq/DjGnyV+5n7JVeS0TCB
	TPPQW8Wb5D9Sh14Nt5MssoJ1iMUqPssOd8nhDHLKmtsDlHekn9i/CStsaxmO7sfVoYBtZ1KsdQR
	sBPzqpERAS7IEU54l1FuR+wsvO9zjiAT5314=
X-Google-Smtp-Source: AGHT+IH/dWcOqlU/KMHh6WCIG5jve4c5zbykIKF0Z34UFWxTnPwhrJf7GKA8SbVTqiQ5UFSIVKDI06Pmz0KLujAeKF0=
X-Received: by 2002:ac2:46c6:0:b0:513:da24:19ff with SMTP id
 p6-20020ac246c6000000b00513da2419ffmr9322232lfo.38.1712082419986; Tue, 02 Apr
 2024 11:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240401071355.1702280-1-cordlandwehr@kde.org>
In-Reply-To: <20240401071355.1702280-1-cordlandwehr@kde.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Apr 2024 20:26:48 +0200
Message-ID: <CANNYZj_JJku5DvQXL3njGkR9h1SoBFA2W+b7yooMR9cXPNaiKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-good: Provide Qt6
 option for qmlgl
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 18:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197878

meson does have a way to specify whether native pkg-config should be
used (defaulting to cross), so I think this should rather be fixed in
gstreamer source, particularly its meson files?

Alex

On Mon, 1 Apr 2024 at 09:14, Andreas Cord-Landwehr <cordlandwehr@kde.org> wrote:
>
> Introduce PACKAGECONFIG option for Qt6 and provide meson cross-build
> file that helps meson to locate qt native binaries.
>
> Qt provides pkg-config files since Qt6.3+, but those files are not
> sufficient to detect native tools that are located in the
> recipe-sysroot-native location, because pkg-config does not know about
> the location of them. Thus, introduce a helper config that points mesons
> to those binaries.
>
> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> ---
>  .../gstreamer1.0-plugins-good_1.22.11.bb       | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
> index edd8609b7c..3b95bd6e46 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
> @@ -12,6 +12,17 @@ SRC_URI[sha256sum] = "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22fa
>
>  S = "${WORKDIR}/gst-plugins-good-${PV}"
>
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-qt6.cross <<EOF
> +[binaries]
> +qmake = '${STAGING_BINDIR_NATIVE}/qmake'
> +moc = '${STAGING_DIR_NATIVE}/usr/libexec/moc'
> +rcc = '${STAGING_DIR_NATIVE}/usr/libexec/rcc'
> +uic = '${STAGING_DIR_NATIVE}/usr/libexec/uic'
> +lrelease = '${STAGING_BINDIR_NATIVE}/lrelease'
> +EOF
> +}
> +
>  LICENSE = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                      file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
> @@ -35,7 +46,7 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
>  X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
>  X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"
>
> -QT5WAYLANDDEPENDS = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
> +QTWAYLANDDEPENDS = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
>
>  PACKAGECONFIG[asm]        = "-Dasm=enabled,-Dasm=disabled,nasm-native"
>  PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
> @@ -52,7 +63,8 @@ PACKAGECONFIG[libpng]     = "-Dpng=enabled,-Dpng=disabled,libpng"
>  PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-utils"
>  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
>  PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
> -PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> +PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
> +PACKAGECONFIG[qt6]        = "-Dqt6=enabled,-Dqt6=disabled,qtbase qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
>  PACKAGECONFIG[soup2]      = "-Dsoup=enabled,,libsoup-2.4,,,soup3"
>  PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup,,,soup2"
>  PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
> @@ -78,4 +90,6 @@ EXTRA_OEMESON += " \
>      -Dwaveform=disabled \
>  "
>
> +MESON_CROSS_FILE:class-target:append = "${@bb.utils.contains('PACKAGECONFIG', 'qt6', ' --cross ${WORKDIR}/meson-qt6.cross', '', d)}"
> +
>  FILES:${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
> --
> 2.40.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197673): https://lists.openembedded.org/g/openembedded-core/message/197673
> Mute This Topic: https://lists.openembedded.org/mt/105259530/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

