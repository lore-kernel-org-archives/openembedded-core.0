Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1372C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:32:31 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.86442.1677490347210416633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jDhuaBwg;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id s8so3617822ilv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qvv5DAbyBgOo5VCDkWW3f6QDZoHSmvPdYAF1LbVCTUI=;
        b=jDhuaBwgXxRJcLLOZEyAKUxo2ypMfMMX97GsoctVajnI3Wyif+ic+y/QEzcJqjVwOq
         94SQr3gJhgxuDH9swloSPbJHUqQGkd95KlEHnI8BdZHoeKG1QFWJ9ltDkS2sYZ2VjHpU
         o6V5n7/uJBPcZ+9cM+94Q11gwS9oOcsHNWhU68GArq+iVCsz29VHmisZdGzujYKzYJUk
         7gWMPtnqOhuHk68HS6AyxHsipC6ldfrMoCj59m3pX3l9J/fTt5UIP/pwWaqfWu0rGfFh
         ZM1yZzlAG6VCEe3eVZOJhZmK+AwqYAztYBeASTU6zXTyHMdP1Rd8pizLwjYrxEtf9an9
         YFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qvv5DAbyBgOo5VCDkWW3f6QDZoHSmvPdYAF1LbVCTUI=;
        b=tA0yvNowO26UsNg9ZQn9Ud9YE4nH7Q/yatKiVmcVd9rxWdnLMT1R07nXyG883QrX2M
         yb6cnpD3cmuH03noYpjbTIcK3kS1cpKYXAY4WYyyCi7NFsXEPSoWMIn/ExzuWW1Blzw7
         I+oWYLhT8RVLdeedWwWF1/0xmQXdVfc7cQS4TX0bil6MjKcNSwis2gBgk+GcPMeH3fx4
         lRftxawpQ/y63fJu6HPqOlwczjo4sLbqR3IJ30POFOEj7eqq1t0xvRTXhkzShK0X/G5q
         sxsx1lISIE5m0uYMzIxc97iH/M/aROz8VW4zxj5i5RT9hx2nu8lcCSfybcDNrE5ytLwf
         M4TA==
X-Gm-Message-State: AO0yUKWaeqknfWJBXUR0XOvKrqykyzOE6T1/J16VwUpOVa0B1ZtGGXgn
	mkdmqR0Kl/71+YfWSxusYgH+/lSi7PY2jf97N7s=
X-Google-Smtp-Source: AK7set+KcbDXFBnjWkf1PqSXmZKCiXA3N6V7RtHheyUKONSF3r7v4ca05C/I1waUJQUtFg38R6CCDhL/D0fL4yNh6dY=
X-Received: by 2002:a05:6e02:961:b0:315:9a9a:2cd with SMTP id
 q1-20020a056e02096100b003159a9a02cdmr7789035ilt.4.1677490346402; Mon, 27 Feb
 2023 01:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-4-zboszor@gmail.com> <17479FC3A76A2964.29542@lists.openembedded.org>
In-Reply-To: <17479FC3A76A2964.29542@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 27 Feb 2023 09:32:14 +0000
Message-ID: <CAO5Uq5R0gJUJuE6kMfsPd4BT5Psy=nVPnLMuYbYVfH3OgC5rpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: alex.kiernan@gmail.com
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177784

On Mon, Feb 27, 2023 at 8:04 AM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Sun, Feb 26, 2023 at 5:08 AM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <z=
boszor@gmail.com> wrote:
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 89e2dc6e90..2fbc1f971e 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -46,6 +46,7 @@ PROVIDES =3D " \
> >      "
> >
> >  inherit meson pkgconfig python3native gettext features_check
> > +inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d=
)}
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> >
> > @@ -119,6 +120,13 @@ PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Dd=
isabled"
> >  OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', =
'-Dopencl-native=3Dtrue', '', d)}"
> >  PACKAGECONFIG[clover] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtru=
e ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libcl=
c spirv-tools"
> >
> > +# "rusticl" requires libclc and spirv-llvm-translator from meta-clang =
and spirv-tools from OE-Core
> > +PACKAGECONFIG[rusticl] =3D "-Dgallium-rusticl=3Dtrue -Drust_std=3D2021=
,-Dgallium-rusticl=3Dfalse,bindgen-cli-native libclc spirv-tools spirv-llvm=
-translator,libclc spirv-tools spirv-llvm-translator"
> > +
> > +# Building "rusticl" runs bindgen.
> > +# This setting is needed by bindgen to dlopen the correct libclang.
> > +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> > +
>
> Could that be part of a wrapper in the bindgen recipe?
>

Also, with this export, I don't believe you have a dependency on
anything from meta-clang (certainly you're not declaring it here
AFAICS).

> >  PACKAGECONFIG[broadcom] =3D ""
> >  PACKAGECONFIG[etnaviv] =3D ""
> >  PACKAGECONFIG[freedreno] =3D ""
> > @@ -197,6 +205,7 @@ DEV_PKG_DEPENDENCY =3D ""
> >  RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
> >
> >  RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'c=
lover', 'libclc spirv-tools', '', d)}"
> > +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'r=
usticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
> >
> >  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> >               libosmesa libosmesa-dev \
> > @@ -233,7 +242,7 @@ do_install:append () {
> >  # RPROVIDEs/RCONFLICTs on the generic libgl name.
> >  python __anonymous() {
> >      pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
> > -    if "clover" in pkgconfig:
> > +    if "clover" in pkgconfig or "rusticl" in pkgconfig:
> >          pkgconfig.append("opencl")
> >      suffix =3D ""
> >      if "-native" in d.getVar("PN"):
> > @@ -305,7 +314,7 @@ FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
> >  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
> >  FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
> >  FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
> > -FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/galli=
um-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
> > +FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.* ${libdir}/libRu=
sticlOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/m=
esa.icd ${sysconfdir}/OpenCL/vendors/rusticl.icd"
> >  FILES:libglapi =3D "${libdir}/libglapi.so.*"
> >  FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
> >  FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
> > @@ -319,7 +328,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
> >  FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES=
 ${libdir}/pkgconfig/glesv1*.pc"
> >  FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2=
 ${libdir}/pkgconfig/glesv2.pc"
> >  FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
> > -FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
> > +FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so ${libdir}/lib=
RusticlOpenCL.so"
> >  FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa=
.h ${libdir}/pkgconfig/osmesa.pc"
> >  FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxat=
racker.la \
> >                            ${includedir}/xa_tracker.h ${includedir}/xa_=
composite.h ${includedir}/xa_context.h \
> > --
> > 2.39.2
> >
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177775): https://lists.openembedded.org/g/openembedde=
d-core/message/177775
> Mute This Topic: https://lists.openembedded.org/mt/97240533/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

