Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4704FC433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 18:40:52 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.13251.1641494451240795034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 10:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qbzaI3Mo;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id r139so3547967qke.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/ns7krGj7ZqnetQsVooH7ca3V04D8i0wJWmbPL+wi60=;
        b=qbzaI3Mo2jO5njlW4Nh4EmEepCqtdYjTaizenuOCJMN4fe3A0ZwLaGBXPZiYoA5xg5
         Mh0yWHSusL8vYFdCOg1pDPL36hSVgcBn16gI+GV5i1rupYfxNRUXG4KHcZ+OSkivXl70
         1Qr54nqAb4MWVC93MiDYaWUoP4ntWzfP8dwZuaCH/ktK8Lg+ro0SACGmjlVUtm0lWHcC
         y5CyxWipGw1jhmsLqkNM9fPivWOuuassmbrov9kfkH98WeX9+0knoMZhtpYHY0tb4uDd
         L3K9KUiDVHNDyBXg3xntdtyGaUX+/rKVBgr7a4qa2zBaLxF3rRXSvF1E23P9YqQmFLzz
         7e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/ns7krGj7ZqnetQsVooH7ca3V04D8i0wJWmbPL+wi60=;
        b=IykMDQYPyV8jHPloBQoH2mxvie7vsVoRP/OL/xD1OnXBMmAzrEjUfqnX3t/XMC3/0S
         JctwqxkONzjmQRj/WlWU54ThejqK12gfpzXsd610rAKnQdArgytM99L4KefS8keUSQEQ
         ooMiOaH6DL+ktKDq+Ba0va3+l602R7kgcAJwQJgUl2ka6oYhU0SQWdnW/MsYy3QFJnwS
         T6JIzMpIcsaL6ly7gIpVSK7smN3JPLFxQCGMuDD8Q8oz0wHXHbh6/MpaGfiDDO1X3mwJ
         vwxkYp1sG3WRukRYWKMmjR7yDVGb68gpW3sl15boyM1vZMY61xCEJFPxb8kl5Cv/S/eW
         oODA==
X-Gm-Message-State: AOAM532aOcY+sux+5DAF/LjQYgB0hClTs0/BvWOrZbXStS9gLLXL+i2s
	Da1tt/UH2N7rR4GJRTO/XAnsnvh9HVsHw3wgd+Q=
X-Google-Smtp-Source: 
 ABdhPJzt9OxxRdrA8+r2OC/xEjtHt+heLSdTK8vWpYwv4n6XqQl4o75q9C9+ZBZl2/pghqgDjg6tr13IsBYEs3EKvY8=
X-Received: by 2002:a05:620a:11b8:: with SMTP id
 c24mr39748641qkk.227.1641494450153;
 Thu, 06 Jan 2022 10:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20220104151132.908591-1-schnitzeltony@gmail.com>
In-Reply-To: <20220104151132.908591-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jan 2022 10:40:24 -0800
Message-ID: 
 <CAMKF1spBSAH7tG4r7rQ+xn400qgs_sKnGnKxYkqf_Mz7H0s0-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libsdl2: Move to CMake build
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 18:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160240

This fails to configure with clang, perhaps it should not be using
cmake module for detecting libunwind ?

https://errors.yoctoproject.org/Errors/Details/621554/

On Tue, Jan 4, 2022 at 7:12 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
> v1->v2:
>     * Fix '=3D=3D' typo - Thanks Jacob!
>     * remove autotools patch
>
>  .../libsdl2/libsdl2/more-gen-depends.patch    | 60 -------------------
>  .../libsdl2/libsdl2_2.0.18.bb                 | 51 ++++++----------
>  2 files changed, 19 insertions(+), 92 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/more-gen-depend=
s.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch=
 b/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
> deleted file mode 100644
> index 8ca52ebde7..0000000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From e0f4b6d18ce6f025c78773e909b9c395ad833c7a Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Mon, 29 Jul 2019 08:38:32 +0800
> -Subject: [PATCH] configure: fix dependencies
> -
> -Many source files include e.g. wayland-protocols.h which should be found=
 in the
> -sysroot but SDL wants to build its own headers from the XML definitions.
> -
> -However the rules to generate those headers are only dependencies of the
> -top-level libSDL2.la object so can be built in parallel with the rest of=
 the
> -objects, which can lead to interesting errors if the header is parsed by=
 the
> -compiler whilst it's being written by another process:
> -
> -| gen/wayland-client-protocol.h:3: error: unterminated #ifndef
> -|  #ifndef WAYLAND_CLIENT_PROTOCOL_H
> -
> -Solve this by adding more dependencies so the generated files are built =
before
> -the primary objects.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -[Moved to configure.ac]
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - configure.ac | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 9e782c6..997915a 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -4061,7 +4061,7 @@ DEPENDS=3D`echo $SOURCES | tr ' ' '\n'`
> - for EXT in asm cc m c S; do
> -     OBJECTS=3D`echo "$OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.'$EXT',$(o=
bjects)/\1.lo,g'`
> -     DEPENDS=3D`echo "$DEPENDS" | sed "s,^\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.=
$EXT\\$,\\\\
> --\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(objects)/.created\\\\
> -+\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(objects)/.created \\$(GEN_OBJECTS=
)\\\\
> -       \\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=3DCC --mode=3Dcompile \\$(CC) \=
\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g=
"`
> - done
> -
> -@@ -4078,14 +4078,14 @@ SDLMAIN_OBJECTS=3D`echo $SDLMAIN_SOURCES`
> - SDLMAIN_DEPENDS=3D`echo $SDLMAIN_SOURCES`
> - SDLMAIN_OBJECTS=3D`echo "$SDLMAIN_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)=
\.c,$(objects)/\1.lo,g'`
> - SDLMAIN_DEPENDS=3D`echo "$SDLMAIN_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[=
^ ]]*\\)\\.c,\\\\
> --\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created\\\\
> -+\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created \\$(GEN_OBJECTS)\\=
\\
> -       \\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=3DCC --mode=3Dcompile \\$(CC) \=
\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g=
"`
> -
> - SDLTEST_OBJECTS=3D`echo $SDLTEST_SOURCES`
> - SDLTEST_DEPENDS=3D`echo $SDLTEST_SOURCES`
> - SDLTEST_OBJECTS=3D`echo "$SDLTEST_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)=
\.c,$(objects)/\1.lo,g'`
> - SDLTEST_DEPENDS=3D`echo "$SDLTEST_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[=
^ ]]*\\)\\.c,\\\\
> --\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created\\\\
> -+\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created \\$(GEN_OBJECTS)\\=
\\
> -       \\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=3DCC --mode=3Dcompile \\$(CC) \=
\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g=
"`
> -
> - # Set runtime shared library paths as needed
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.18.bb
> index 5e645b443c..1e22a0593f 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> @@ -16,28 +16,25 @@ LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('P=
ACKAGECONFIG', 'arm-neon', 'f
>
>  PROVIDES =3D "virtual/libsdl2"
>
> -SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> -           file://more-gen-depends.patch \
> -"
> +SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
>
>  S =3D "${WORKDIR}/SDL2-${PV}"
>
>  SRC_URI[sha256sum] =3D "94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d=
4074eff95ee5711c"
>
> -inherit autotools lib_package binconfig-disabled pkgconfig
> +inherit cmake lib_package binconfig-disabled pkgconfig
>
>  BINCONFIG =3D "${bindir}/sdl2-config"
>
>  CVE_PRODUCT =3D "simple_directmedia_layer sdl"
>
> -EXTRA_OECONF =3D "--disable-oss --disable-esd --disable-arts \
> -                --disable-diskaudio --disable-nas --disable-esd-shared -=
-disable-esdtest \
> -                --disable-video-dummy \
> -                --disable-video-rpi \
> -                --enable-pthreads \
> -                --disable-rpath \
> -                --disable-sndio \
> -                --disable-fcitx --disable-ibus \
> +EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -DSDL_ARTS=3DOFF \
> +                 -DSDL_DISKAUDIO=3DOFF -DSDL_NAS=3DOFF -DSDL_ESD_SHARED=
=3DOFF \
> +                 -DSDL_DUMMYVIDEO=3DOFF \
> +                 -DSDL_RPI=3DOFF \
> +                 -DSDL_PTHREADS=3DON \
> +                 -DSDL_RPATH=3DOFF \
> +                 -DSDL_SNDIO=3DOFF \
>                  "
>
>  # opengl packageconfig factored out to make it easy for distros
> @@ -52,27 +49,17 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', =
'', d)} \
>      ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
>  "
> -PACKAGECONFIG[alsa]       =3D "--enable-alsa --disable-alsatest,--disabl=
e-alsa,alsa-lib,"
> -PACKAGECONFIG[arm-neon]   =3D "--enable-arm-neon,--disable-arm-neon"
> -PACKAGECONFIG[directfb]   =3D "--enable-video-directfb,--disable-video-d=
irectfb,directfb,directfb"
> -PACKAGECONFIG[gles2]      =3D "--enable-video-opengles,--disable-video-o=
pengles,virtual/libgles2"
> -PACKAGECONFIG[jack]       =3D "--enable-jack,--disable-jack,jack"
> -PACKAGECONFIG[kmsdrm]     =3D "--enable-video-kmsdrm,--disable-video-kms=
drm,libdrm virtual/libgbm"
> -PACKAGECONFIG[opengl]     =3D "--enable-video-opengl,--disable-video-ope=
ngl,virtual/libgl"
> -PACKAGECONFIG[pulseaudio] =3D "--enable-pulseaudio,--disable-pulseaudio,=
pulseaudio"
> -PACKAGECONFIG[wayland]    =3D "--enable-video-wayland,--disable-video-wa=
yland,wayland-native wayland wayland-protocols libxkbcommon"
> -PACKAGECONFIG[x11]        =3D "--enable-video-x11,--disable-video-x11,vi=
rtual/libx11 libxext libxrandr libxrender"
> +PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
> +PACKAGECONFIG[arm-neon]   =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF"
> +PACKAGECONFIG[directfb]   =3D "-DSDL_DIRECTFB=3DON,-DSDL_DIRECTFB=3DOFF,=
directfb,directfb"
> +PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
> +PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
> +PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
> +PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/libgl"
> +PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
> +PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
> +PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/li=
bx11 libxext libxrandr libxrender"
>
> -EXTRA_AUTORECONF +=3D "--include=3Dacinclude --exclude=3Dautoheader"
>  CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY"
>
> -do_configure:prepend() {
> -        # Remove old libtool macros.
> -        MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltve=
rsion.m4"
> -        for i in ${MACROS}; do
> -               rm -f ${S}/acinclude/$i
> -        done
> -        export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
> -}
> -
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160166): https://lists.openembedded.org/g/openembedde=
d-core/message/160166
> Mute This Topic: https://lists.openembedded.org/mt/88191395/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

