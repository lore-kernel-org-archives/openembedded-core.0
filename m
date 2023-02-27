Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B90EC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:04:11 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.85438.1677485048691702151
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DrErNbUt;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id m22so1830523ioy.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 00:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SMjhVdQJXIBW8yszqi/AyW2ll6SInQ36PklmaVrR6k=;
        b=DrErNbUtvyb/bxSODPJ7gzajUXEl6M2kuJAZ7R8c1DUCx9s7BQnmP9nt9AlE78iBKF
         utRSWAka02YqR7GuEoPGKSB5SnYWuHLjteFSJxmMj/zGkklLBfgnRgQD5ihR8ux/c4Yw
         wOh+M+DYaiabT8t2jXLaG8fbGHWNoWQozUkkH/gLNx+2vp3kco8qgAtdzd05XwW7blQF
         mwYeBI1x1iSereF3h8gNbrFC7tgEbnEqyyTmDar3WRyfgz6CVNxs7f0c9e0iKp/NWCbv
         NCevunqobsrYTLkOnpxDVIY3Fkv77HMLeV1ZcdQxCxMbqRVtBNnM5LDEHH/vol8y093L
         Pn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SMjhVdQJXIBW8yszqi/AyW2ll6SInQ36PklmaVrR6k=;
        b=LMYPWlgjNZdpaOWLOGfyPpoT8bnk6yGjMLKtVa7fCtlpA1ECcqQhd8AI7BPsDEmFbg
         OXROQytMdN7DL2aSHS1T0HS9DYAP+k51zA0deoBvjT2Uu4X9pqsVwe32M32uK1YbCf/b
         cpORVjCZBLvFClLZah10fvuSnhHdf0GWsxcY5nt6gEixqWPQ1yjV1+KoyvJE3VCG6poI
         H7TgTx7zZ/lcQSQMNnKGTRAJ/GJyyaVie7EbBuWAZm/Yv+aIb+eXj/uYTOVxpJwgmFbh
         Xqjb7oMjJ6Yhb89WCoUxASlNkNioBoxSmUMexAYq8m4p3IU58cnBB3XMJ+y9DNet7/cR
         IhdQ==
X-Gm-Message-State: AO0yUKXpP+cbH3PuMqqlxD3gg0HK1oErWXR/uQ/f2AGhL0Gn6TdeOCxl
	MmWp/XCm/WUMzWJ429KCtB1GfS5cHQX70srsyEA5J7s7
X-Google-Smtp-Source: AK7set8TvZhZ03i8/LbCBwdUclAarr8MSvcGQFr6sG/fKxX2qGjdRj6XQKNwLgoqRLI4dayUO9h2EMaC289/6JXQPK0=
X-Received: by 2002:a6b:b211:0:b0:745:b287:c281 with SMTP id
 b17-20020a6bb211000000b00745b287c281mr5488885iof.2.1677485047873; Mon, 27 Feb
 2023 00:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-4-zboszor@gmail.com>
In-Reply-To: <20230226050814.929055-4-zboszor@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 27 Feb 2023 08:03:54 +0000
Message-ID: <CAO5Uq5Qcyr4tywhEgJbFeONrrQW-W10i5Bp7iGHph0xGBeznUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177775

On Sun, Feb 26, 2023 at 5:08 AM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbo=
szor@gmail.com> wrote:
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 89e2dc6e90..2fbc1f971e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -46,6 +46,7 @@ PROVIDES =3D " \
>      "
>
>  inherit meson pkgconfig python3native gettext features_check
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d)}
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> @@ -119,6 +120,13 @@ PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddis=
abled"
>  OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-=
Dopencl-native=3Dtrue', '', d)}"
>  PACKAGECONFIG[clover] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc =
spirv-tools"
>
> +# "rusticl" requires libclc and spirv-llvm-translator from meta-clang an=
d spirv-tools from OE-Core
> +PACKAGECONFIG[rusticl] =3D "-Dgallium-rusticl=3Dtrue -Drust_std=3D2021,-=
Dgallium-rusticl=3Dfalse,bindgen-cli-native libclc spirv-tools spirv-llvm-t=
ranslator,libclc spirv-tools spirv-llvm-translator"
> +
> +# Building "rusticl" runs bindgen.
> +# This setting is needed by bindgen to dlopen the correct libclang.
> +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> +

Could that be part of a wrapper in the bindgen recipe?

>  PACKAGECONFIG[broadcom] =3D ""
>  PACKAGECONFIG[etnaviv] =3D ""
>  PACKAGECONFIG[freedreno] =3D ""
> @@ -197,6 +205,7 @@ DEV_PKG_DEPENDENCY =3D ""
>  RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
>
>  RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'clo=
ver', 'libclc spirv-tools', '', d)}"
> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'rus=
ticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
>
>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libosmesa libosmesa-dev \
> @@ -233,7 +242,7 @@ do_install:append () {
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
>  python __anonymous() {
>      pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
> -    if "clover" in pkgconfig:
> +    if "clover" in pkgconfig or "rusticl" in pkgconfig:
>          pkgconfig.append("opencl")
>      suffix =3D ""
>      if "-native" in d.getVar("PN"):
> @@ -305,7 +314,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>  FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
>  FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
> -FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium=
-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
> +FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/libRust=
iclOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mes=
a.icd ${sysconfdir}/OpenCL/vendors/rusticl.icd"
>  FILES:libglapi =3D "${libdir}/libglapi.so.*"
>  FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
>  FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
> @@ -319,7 +328,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
>  FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES $=
{libdir}/pkgconfig/glesv1*.pc"
>  FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
>  FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
> -FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
> +FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so ${libdir}/libRu=
sticlOpenCL.so"
>  FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h=
 ${libdir}/pkgconfig/osmesa.pc"
>  FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
>                            ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \
> --
> 2.39.2
>


--=20
Alex Kiernan

