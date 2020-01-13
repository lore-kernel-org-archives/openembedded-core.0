Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 683B97FC9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 00:52:50 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id o18so3343369qvf.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 16:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8zUPU61SEN7lx/iKRl5icIcr5TUzMMJGtSnXf+kxah0=;
	b=OVUBvMnGhuyAU2ctqVtN5KD7ENkq5l20ZWBgxNHqAX2KQZV26xWgXiAyJ2iI0Cm49B
	NL3tFha7mEA8oKPcM6oRCEznZP8Q0xsRzGCVHvvNWIDxEbetqyEQBjL2kuKyfImZkD18
	KrWEArDW9xtR93ekzaSSb8+V+bKDFhDmjFELZka7q0VhwLhVXnyLq4GuBdG0EUiSbELq
	I+ap/R/F4q+mooWRETnGF0KpYj+uNxT2PFG0lTnb+VCr+bTLIozG8A7vuAd08C5+IKUE
	h++3aR0dOeHSB0rp8bPBtIffNP/WhnruhoubEqcbG0urdmcxNx44yUTGU53Tn7UtVUIZ
	S5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8zUPU61SEN7lx/iKRl5icIcr5TUzMMJGtSnXf+kxah0=;
	b=PYU5sE81hKV1+4CxgkX1Xp2A+ch5DBYie2ZeG4BCB60F49sMOpdNiA4dkJt9WtlO01
	PFaJy85lU4axpPxDGTnLs+dutprxTBCF6k6iw/8atMM7Z2ia0MNOKFFW4labOw1luzxC
	KxCw11a4V7//jAkQfBPmm1T2dU16RoTnQSwzFQcpsLMDSoUJJ6kZoByripYNcWIBlpiy
	pZ/jub1LH1DpZggRxJaCysvHMf6+KYb+hbtnDzZwslKit+nHPnh3gmNnRtRjgaGc745w
	EHFaZJh5+Er5NBAT07UrdwZCwkJaOFW1jzDmS+uRQ/Ngc1vp56EG2dwheZ33udjUexNX
	1jAw==
X-Gm-Message-State: APjAAAUDSZGnCkMTmPyIaY2s6prYr/r+YT0LxgitVE3xnTyL66DxuzK7
	0qx4nV4XS4EqJmE0Tf/eS29+tXKb1k8f1XwvKjQ=
X-Google-Smtp-Source: APXvYqxWgl48RDBwPUqBzsnRiFWn1Dk4bh75WrIE77IdciiesBuvHCW88JaaxyLrezHv3qo0n4t4+KYk9chO0dmvY2c=
X-Received: by 2002:ad4:4389:: with SMTP id s9mr8950425qvr.99.1578876770892;
	Sun, 12 Jan 2020 16:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<20200112135954.23868-4-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-4-crg7475@mailbox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Jan 2020 16:52:24 -0800
Message-ID: <CAMKF1sr_1aR_JZdxfxwO1TzE81E6W9YU_d_08+=DBX=KcniYHA@mail.gmail.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gstreamer1.0-plugins-good: Transition to meson based builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jan 2020 00:52:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 12, 2020 at 6:33 AM Carlos Rafael Giani <crg7475@mailbox.org> wrote:
>
> * Removed autotools/M4 related patch
>   0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch.
>
> * gtk-doc support is handled here, not in gstreamer1.0-plugins-common.inc,
>     since unlike with autotools, only some plugin set packages use gtk-doc.
>
> * zlib is no longer optional, and glib anyway depends on zlib, therefore
>     it gets added to the DEPENDS list.
>
> * gettext handling now part of gstreamer1.0-plugins-common.inc.
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  .../gstreamer1.0-plugins-good_1.16.1.bb       | 79 +++++++++----------
>  1 file changed, 38 insertions(+), 41 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> index 0fa7b86ffe..a6eb9986dd 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> @@ -1,8 +1,7 @@
> -require gstreamer1.0-plugins.inc
> +require gstreamer1.0-plugins-common.inc
>
>  SRC_URI = " \
>              https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
> -            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>              "
>
>  SRC_URI[md5sum] = "515987ee763256840a11bd8ea098f2bf"
> @@ -15,42 +14,41 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                      file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
>                      file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
>
> -DEPENDS += "gstreamer1.0-plugins-base libcap"
> +DEPENDS += "gstreamer1.0-plugins-base libcap zlib"
>  RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
>  RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
>
> -inherit gettext
> -
>  PACKAGECONFIG ??= " \
>      ${GSTREAMER_ORC} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
> -    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 zlib \
> +    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
>  "
>
>  X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
> +X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
> +X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"
>
> -PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
> -PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
> -PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
> -PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
> -PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
> -PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
> -PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
> -PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
> -PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
> -PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
> -PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
> -PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
> -PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
> -PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
> -PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
> -PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
> -PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
> -PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst_v4l2"
> -PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
> -PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
> -PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
> -PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
> +PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
> +PACKAGECONFIG[cairo]      = "-Dcairo=enabled,-Dcairo=disabled,cairo"
> +PACKAGECONFIG[dv1394]     = "-Ddv1394=enabled,-Ddv1394=disabled,libiec61883 libavc1394 libraw1394"
> +PACKAGECONFIG[flac]       = "-Dflac=enabled,-Dflac=disabled,flac"
> +PACKAGECONFIG[gdk-pixbuf] = "-Dgdk-pixbuf=enabled,-Dgdk-pixbuf=disabled,gdk-pixbuf"
> +PACKAGECONFIG[gtk]        = "-Dgtk3=enabled,-Dgtk3=disabled,gtk+3"
> +PACKAGECONFIG[gudev]      = "-Dv4l2-gudev=enabled,-Dv4l2-gudev=disabled,libgudev"
> +PACKAGECONFIG[jack]       = "-Djack=enabled,-Djack=disabled,jack"
> +PACKAGECONFIG[jpeg]       = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
> +PACKAGECONFIG[lame]       = "-Dlame=enabled,-Dlame=disabled,lame"
> +PACKAGECONFIG[libpng]     = "-Dpng=enabled,-Dpng=disabled,libpng"
> +PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-utils"
> +PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
> +PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
> +PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
> +PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
> +PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
> +PACKAGECONFIG[v4l2]       = "-Dv4l2=enabled -Dv4l2-probe=true,-Dv4l2=disabled -Dv4l2-probe=false"
> +PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-Dvpx=disabled,libvpx"
> +PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
> +PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>
>  # qt5 support is disabled, because it is not present in OE core, and requires more work than
>  # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
> @@ -58,19 +56,18 @@ PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
>  # in a gstreamer1.0-plugins-good bbappend).
>
>  EXTRA_OECONF += " \
> -    --enable-oss \
> -    --disable-aalib \
> -    --disable-aalibtest \
> -    --disable-directsound \
> -    --disable-libcaca \
> -    --disable-libdv \
> -    --disable-oss4 \
> -    --disable-osx_audio \
> -    --disable-osx_video \
> -    --disable-qt \

Dont disable it explicitly, meta-qt5 will has a packageconfig for it.

> -    --disable-shout2 \
> -    --disable-twolame \
> -    --disable-waveform \
> +    -Daalib=disabled \
> +    -Ddirectsound=disabled \
> +    -Ddv=disabled \
> +    -Dlibcaca=disabled \
> +    -Doss=enabled \
> +    -Doss4=disabled \
> +    -Dosxaudio=disabled \
> +    -Dosxvideo=disabled \
> +    -Dqt=disabled \
> +    -Dshout2=disabled \
> +    -Dtwolame=disabled \
> +    -Dwaveform=disabled \
>  "
>
>  FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

