Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9A2C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:36:32 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.5027.1641292591827751912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 02:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MnBG5v+k;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so2670487pji.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 02:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ushGvEJgFrkw/nEevUjIGLHZNrfxuDhxnAuuz4H7EDo=;
        b=MnBG5v+kWGKnNzUn5tiEBQGgyDTvwUOjKE+El46LTzOZ3tjxZUYGkPODNw7U3qSM6I
         ASlTQY6vm2VLdSPs1zFwX/UL7l4w6T0cqh6Ls1Tp0jlBlWZ32Xsj9M27h7Da5vZczIH+
         3LxAgQTySgwE2McITzjElUV8LO/czA/BuyRn7oFPlU8cRkgFgn7J8V80tmJvB3QWphiu
         ZsTyYSbHwiJq+OzRRpyD/4Absvhpzk9N0RwuEMGDfYvqTFOiSF3uC7fTR0OxKgg+gUV1
         j8rVCcUFMyMD/0oQ3buG7q/XBMfMXx47rLqO4qd7vYhaz7tw3/wvxMPcsa90knFPQz88
         AkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=ushGvEJgFrkw/nEevUjIGLHZNrfxuDhxnAuuz4H7EDo=;
        b=mMZ1IHnZ121PCQHuOhMip8wjlShAJ4JpfYCcjOthkVOHXUyI4aV2xzd4iqVc6wlOsm
         JnpYIx3tqucAyMA9dxKadspTSgCtaFaAhwZAOIdVo6HbO4oeEnLNDi3ZHdPdysvvb4V2
         HHrnhhVb1DPwhz33qgCs+k0JG6y07Dw63wQCmMhNt3xL5PIiva8qAZjRmaLbes71vRZP
         oi+3OUdO6fAg39JhqsidwIICVA2D9L3k6KBM06vCJDDO8QAqiGSQZlFhWvUUysExdhT8
         cqyOwB2Furo5ya69na+BOelAPPOoqusODlVHtY47TV1JYHn1Yxub+QfqZ2qkR6zLcZ+Z
         Hbqw==
X-Gm-Message-State: AOAM53105e6dm8AXkibiHz+SCJffUoFiyrqF32aYW0dTCw85xWPY3COk
	/RMuV5/CVJdF6xQOlIUTLNydQQBPBUNb0jI66oqNWUvV
X-Google-Smtp-Source: 
 ABdhPJxTuaQZfHdjFuAtSXXR1N2lb468UYAOloNtExblA0B44ebVR+DdGLIYcWasC71ZWI9LFRKaFp587S7qGFTUjgI=
X-Received: by 2002:a17:902:e5c2:b0:149:3cd:ebf5 with SMTP id
 u2-20020a170902e5c200b0014903cdebf5mr48773284plf.1.1641292591037; Tue, 04 Jan
 2022 02:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20220104092100.91842-1-schnitzeltony@gmail.com>
In-Reply-To: <20220104092100.91842-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 4 Jan 2022 11:36:19 +0100
Message-ID: 
 <CALbNGRTPPYUu-533DpGJNvJH+NFg8g6Y725ZQ=stMoPTc6ffsg@mail.gmail.com>
Subject: Re: [PATCH] libsdl2: Move to CMake build
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 10:36:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160160

Please ignore - it went out too early

On Tue, Jan 4, 2022 at 10:21 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../libsdl2/libsdl2_2.0.18.bb                 | 47 +++++++------------
>  1 file changed, 18 insertions(+), 29 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.18.bb
> index 5e645b443c..d1af282a1c 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> @@ -24,20 +24,19 @@ S =3D "${WORKDIR}/SDL2-${PV}"
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
> @@ -52,27 +51,17 @@ PACKAGECONFIG ??=3D " \
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

