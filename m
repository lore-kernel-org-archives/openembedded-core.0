Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCB3E7C4EC
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 18:10:58 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.787.1696443054400599210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 11:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZhhmjwu;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-57ddde51033so621965eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 11:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696443053; x=1697047853; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aF4k33cjYjDITrQndTngaoelHn59ZeFRyXFt55IEDU=;
        b=FZhhmjwuQeWm82hWwe7djEWNSTCVW9Hnev/trt52SDQHdMcfTpVMTpuZDtI9txoSIj
         pBknfbThBYeol15EWvafzpl6dW2wgQfQ2hMjxsYpRtLJ2AaDFVtT7ZQpZBSduoSmbfS6
         tdq0MBZKWqOFeM1S9Wxydb+5K+NIfo8E4gvheBfCTey8neEtZWmmvs0KIMOUK7KWB9aB
         mzrMiq5LNZaokS0QTGXnN4EIpgw46FLZg5c76udPEgmx9z3NsWnI3X2S1XRgv+/idmM7
         7Fbl7gmwwLyuTf8qtKbC5PnuOrwIT7KfWvdmJNqFgs3shvHJFHd2l63n9xUTr//lS9Gk
         0m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696443053; x=1697047853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aF4k33cjYjDITrQndTngaoelHn59ZeFRyXFt55IEDU=;
        b=kIctVx5YG1VBPVgP34aBoQqVYe9jXljiKKlBb46pVtnkktTECO11KxoHBSN3EBq/Pf
         0igOBoLlnuQMO1/05lGIRC7jfVtKKSMFOXaiqe322WYbl7jj1Vh3yhIgU/tEnCP+jm0E
         6XPoL+wl5qQZuFwHz/SZUJxpbLnnAR+UgxlvIyUttoid/pGDmKVvZAMgTgSiCLR5yXaL
         ivYSnRipbX57pPp/mx9eQrT5oeDLNwcv4AS3FwdcyKMzbNxq6JhxWRukfprSASKghcWU
         thdt6r2djv++gbb83tXxMPozWaneCR/kU0zNB1RNOEA8TalIXJuaOUX9VdTlCEYtn6qV
         YhAw==
X-Gm-Message-State: AOJu0YyhDtoum1gi1fDi/k0jJenUXFIPKKk/VTE0frQrkk84497H0kal
	Iu292o+pwMhUTv/L9naALTpGL3EkI1RS7Tzjd9o=
X-Google-Smtp-Source: AGHT+IEQ/g0MqjrW2MKdKp5tarSFbz2GDU7HXcxblL4snBnsxBuoj8IUfiH7dPy2JmgpU+mnudN1IrwZn0Pnl1kIoTQ=
X-Received: by 2002:a05:6870:9108:b0:1dd:354:3466 with SMTP id
 o8-20020a056870910800b001dd03543466mr235084oae.12.1696443053580; Wed, 04 Oct
 2023 11:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231004160911.3030063-1-cordlandwehr@kde.org>
In-Reply-To: <20231004160911.3030063-1-cordlandwehr@kde.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Oct 2023 11:10:27 -0700
Message-ID: <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 18:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188693

On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
<cordlandwehr@kde.org> wrote:
>
> Gstreamer release 1.22.0 introduced option for Qt6 API.
>
> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
2.5.bb
> index 93f0e76ee9..ca1e1d6046 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.=
bb
> @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libxfix=
es libxdamage"
>  X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Denabled -Dxi=
magesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
>  X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddisabled -=
Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
>
> -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayland"=
, "qtwayland", "", d)}"
> +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayland",=
 "qtwayland", "", d)}"
>
>  PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm-nat=
ive"
>  PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzip2"
> @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,-Dpng=3D=
disabled,libpng"
>  PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv4l2=
=3Ddisabled,v4l-utils"
>  PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mp=
g123"
>  PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
> -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase q=
tdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase q=
tdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
> +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,qtbase q=
tdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
>  PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup3"
>  PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
>  PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,spee=
x"
> @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
>  "
>
>  FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/*.prs"
> +
> +do_configure:prepend() {
> +    # provide path to qtwaylandscanner
> +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}

perhaps we should fix naitve qt6 to install qtwaylandscanner in native
bindir. Then we do not need this.

> +}
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188689): https://lists.openembedded.org/g/openembedde=
d-core/message/188689
> Mute This Topic: https://lists.openembedded.org/mt/101758538/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

