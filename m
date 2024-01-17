Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB474C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 17:20:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.9223.1705511994486309823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 09:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=W8IQWA7l;
 spf=pass (domain: snapchat.com, ip: 209.85.218.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28da6285c1so2025157766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705511993; x=1706116793; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=za9qtzo3wRtOlZzRcui9Lzdcq36JF/J0F00VokYxm6w=;
        b=W8IQWA7ls3X0Vqsx29+cpgnxXxykQr4MFMXZTx0DwXRHO7iRxN2z2JezRE7Lju8/7N
         SkbCiLtpaVIUOTlTEFRnq5HzX38v4uzFfENsb1BJXapsaBtxka3Swh9rUJEmqRX2Dkb6
         ylWKaxQ6bF0lkZcWtGp4M+fkiTlmbZJibST+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705511993; x=1706116793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=za9qtzo3wRtOlZzRcui9Lzdcq36JF/J0F00VokYxm6w=;
        b=DWWAXyE+p1Y3sajxHykJ/sl3nyYBh7iNISe7nj2/p2S92XS/5WBA6jYpuc9bRLLr9j
         UTD3HqYlyKk/t/s4huuOp+WNEh12ODIaPh7QmrpAH+QT/hBNpXGccBqNs3z2HrHxUqy9
         pmnqgGNWMUk+ZDBvH+aY0wfSwNwj1gtfoPnPNHGUNCSXQWeV2NdzRQBXW8UCSidcxTpD
         GOG9rSkjU0+YUFCCdzBsgNWnXPIGLPTDn/IAP4A/s6WK9A41q+q59Py8FrzQIkqbsvRD
         bcGkd8B8AGQsLgY7t32q/3x3+PdAm6eDtHKHF2/abQEsdpsriX+cnRQwVxb7+KPFvE9w
         y6mQ==
X-Gm-Message-State: AOJu0YwOVaJvZMI+4wqeJgq+CWQKOqk6xzpLcI0dWrlDhdtu/AZM1ujS
	unIHck+qc8TpzWqoHlw3ezUGWyjSAMmwy43nm/P3upKTkHfEIw==
X-Google-Smtp-Source: AGHT+IEDwMSPWzHNSaquGlS1u095XYnDhbOpT425RWD4qbAeHoL5tEv5bRnWCRvJiPpLnQu1hq+7T3ikYL2s6Pfa+88=
X-Received: by 2002:a17:906:bf4c:b0:a2e:b3d1:6fb3 with SMTP id
 ps12-20020a170906bf4c00b00a2eb3d16fb3mr1553325ejb.14.1705511992727; Wed, 17
 Jan 2024 09:19:52 -0800 (PST)
MIME-Version: 1.0
References: <20240117150720.3585669-1-ross.burton@arm.com> <20240117150720.3585669-2-ross.burton@arm.com>
In-Reply-To: <20240117150720.3585669-2-ross.burton@arm.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Wed, 17 Jan 2024 18:19:41 +0100
Message-ID: <CAHUKmYZVhp9gsE0xoe0sZqgxuh8ayJhUz70Wo_0UefcLfD1+uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] libunwind: merge .inc and .bb
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007cf018060f27745e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 17:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193938

--0000000000007cf018060f27745e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
I thought the main reason of having .inc files was to have a stable git
history, since the bb files get constantly renamed with each update? There
are many recipes using a split .inc file without a need for it, so I
assumed this is the standard codestyle of poky? Is it not the case?

Etienne

On Wed, Jan 17, 2024 at 4:07=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> From: Ross Burton <ross.burton@arm.com>
>
> There's no need to these to be split, so merge them together.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/libunwind/libunwind.inc  | 23 ---------------
>  .../libunwind/libunwind_1.6.2.bb              | 28 +++++++++++++++++--
>  2 files changed, 25 insertions(+), 26 deletions(-)
>  delete mode 100644 meta/recipes-support/libunwind/libunwind.inc
>
> diff --git a/meta/recipes-support/libunwind/libunwind.inc
> b/meta/recipes-support/libunwind/libunwind.inc
> deleted file mode 100644
> index bf74f9fa3c7..00000000000
> --- a/meta/recipes-support/libunwind/libunwind.inc
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "Library for obtaining the call-chain of a program"
> -DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to
> determine the call-chain of a program"
> -HOMEPAGE =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.nongnu.org_libu=
nwind&d=3DDwIFAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI=
_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&s=3DlWmWqF8G-xAViw4gogbniL5C4TmmC_Z-U_7q3yH=
JJe8&e=3D
> "
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d80c8ed4062b8339b715f90fa68c=
c9f"
> -DEPENDS +=3D "libatomic-ops"
> -DEPENDS:append:libc-musl =3D " libucontext"
> -
> -inherit autotools multilib_header
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[lzma] =3D "--enable-minidebuginfo,--disable-minidebuginfo,=
xz"
> -PACKAGECONFIG[latexdocs] =3D "--enable-documentation,
> --disable-documentation, latex2man-native"
> -
> -EXTRA_OECONF:arm =3D "--enable-debug-frame"
> -EXTRA_OECONF:armeb =3D "--enable-debug-frame"
> -EXTRA_OECONF:aarch64 =3D "--enable-debug-frame"
> -
> -do_install:append () {
> -       oe_multilib_header libunwind.h
> -}
> -
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> index d67862608c1..650e2c9ec40 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> @@ -1,4 +1,10 @@
> -require libunwind.inc
> +SUMMARY =3D "Library for obtaining the call-chain of a program"
> +DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to
> determine the call-chain of a program"
> +HOMEPAGE =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.nongnu.org_libu=
nwind&d=3DDwIFAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI=
_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&s=3DlWmWqF8G-xAViw4gogbniL5C4TmmC_Z-U_7q3yH=
JJe8&e=3D
> "
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d80c8ed4062b8339b715f90fa68c=
c9f"
> +DEPENDS +=3D "libatomic-ops"
> +DEPENDS:append:libc-musl =3D " libucontext"
>
>  SRC_URI =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download.savannah.n=
ongnu.org_releases_libunwind_libunwind-2D-24-257BPV-257D.tar.gz&d=3DDwIFAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2W=
JLwYJEhK9Xwt3l&s=3DDzppDAaiQpwcwHtq6BJCCnV8IRnwe8BOlE-V1z_AkfA&e=3D
> \
>             file://0003-x86-Stub-out-x86_local_resume.patch \
> @@ -11,15 +17,31 @@ SRC_URI:append:libc-musl =3D "
> file://musl-header-conflict.patch"
>
>  SRC_URI[sha256sum] =3D
> "4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976"
>
> +inherit autotools multilib_header
> +
> +COMPATIBLE_HOST:riscv32 =3D "null"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[lzma] =3D "--enable-minidebuginfo,--disable-minidebuginfo,=
xz"
> +PACKAGECONFIG[latexdocs] =3D "--enable-documentation,
> --disable-documentation, latex2man-native"
> +
> +EXTRA_OECONF:arm =3D "--enable-debug-frame"
> +EXTRA_OECONF:armeb =3D "--enable-debug-frame"
> +EXTRA_OECONF:aarch64 =3D "--enable-debug-frame"
> +
>  EXTRA_OECONF:append:libc-musl =3D " --disable-documentation --disable-te=
sts
> --enable-static"
>
>  #
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__errors.yoctoproject=
.org_Errors_Details_20487_&d=3DDwIFAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DP8pttzCM0snL=
4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&s=3DSKDMc7SnpmHxBq9SlF=
gKMBVybrXAwMHEjQ5vnXg4nAA&e=3D
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>  ARM_INSTRUCTION_SET:armv5 =3D "arm"
>
> -COMPATIBLE_HOST:riscv32 =3D "null"
> -
>  LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
,
> 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
>
>  SECURITY_LDFLAGS:append:libc-musl =3D " -lssp_nonshared"
>  CACHED_CONFIGUREVARS:append:libc-musl =3D " LDFLAGS=3D'${LDFLAGS} -lucon=
text'"
> +
> +do_install:append () {
> +       oe_multilib_header libunwind.h
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193920):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_193920&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&s=3DrRL=
XP74Dh2XnyVmQM6aYtOyPF2ZlWsMFKlYfrMUmt34&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103787498_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DP8pttzCM0snL4=
m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&s=3D_OPUyWCjt0FVC1ckEUV=
57eYVcd3jh3-hCZLg-paODBw&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DP8pttz=
CM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&s=3DzMPlfcTWwai5=
6yU_5P41Df59-erBRGJVEKyunoV5CS4&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007cf018060f27745e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<br>I thought the main reason of having .inc files=
 was to have a stable git history, since the bb files get constantly rename=
d with each update? There are many recipes using a split .inc file without =
a need for it,=C2=A0so I assumed this is the standard codestyle of poky? Is=
 it not the case?<br><br>Etienne</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 17, 2024 at 4:07=E2=80=AFPM Ros=
s Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">=
ross.burton@arm.com</a>&gt;<br>
<br>
There&#39;s no need to these to be split, so merge them together.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libunwind/libunwind.inc=C2=A0 | 23 -------------=
--<br>
=C2=A0.../libunwind/<a href=3D"http://libunwind_1.6.2.bb" rel=3D"noreferrer=
" target=3D"_blank">libunwind_1.6.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 28 +++++++++++++++++--<br>
=C2=A02 files changed, 25 insertions(+), 26 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/libunwind/libunwind.inc<br>
<br>
diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-su=
pport/libunwind/libunwind.inc<br>
deleted file mode 100644<br>
index bf74f9fa3c7..00000000000<br>
--- a/meta/recipes-support/libunwind/libunwind.inc<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-SUMMARY =3D &quot;Library for obtaining the call-chain of a program&quot;<=
br>
-DESCRIPTION =3D &quot;a portable and efficient C programming interface (AP=
I) to determine the call-chain of a program&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttp-3A__www.nongnu.org_libunwind&amp;d=3DDwIFAg&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xw=
t3l&amp;s=3DlWmWqF8G-xAViw4gogbniL5C4TmmC_Z-U_7q3yHJJe8&amp;e=3D" rel=3D"no=
referrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dht=
tp-3A__www.nongnu.org_libunwind&amp;d=3DDwIFAg&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&a=
mp;s=3DlWmWqF8G-xAViw4gogbniL5C4TmmC_Z-U_7q3yHJJe8&amp;e=3D</a> &quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2d80c8ed4062b8339b715f90fa=
68cc9f&quot;<br>
-DEPENDS +=3D &quot;libatomic-ops&quot;<br>
-DEPENDS:append:libc-musl =3D &quot; libucontext&quot;<br>
-<br>
-inherit autotools multilib_header<br>
-<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-PACKAGECONFIG[lzma] =3D &quot;--enable-minidebuginfo,--disable-minidebugin=
fo,xz&quot;<br>
-PACKAGECONFIG[latexdocs] =3D &quot;--enable-documentation, --disable-docum=
entation, latex2man-native&quot;<br>
-<br>
-EXTRA_OECONF:arm =3D &quot;--enable-debug-frame&quot;<br>
-EXTRA_OECONF:armeb =3D &quot;--enable-debug-frame&quot;<br>
-EXTRA_OECONF:aarch64 =3D &quot;--enable-debug-frame&quot;<br>
-<br>
-do_install:append () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header libunwind.h<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.6=
.2.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.6.2.bb</a> b/meta/r=
ecipes-support/libunwind/<a href=3D"http://libunwind_1.6.2.bb" rel=3D"noref=
errer" target=3D"_blank">libunwind_1.6.2.bb</a><br>
index d67862608c1..650e2c9ec40 100644<br>
--- a/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.6.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libunwind_1.6.2.bb</a><br>
+++ b/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.6.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libunwind_1.6.2.bb</a><br>
@@ -1,4 +1,10 @@<br>
-require libunwind.inc<br>
+SUMMARY =3D &quot;Library for obtaining the call-chain of a program&quot;<=
br>
+DESCRIPTION =3D &quot;a portable and efficient C programming interface (AP=
I) to determine the call-chain of a program&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttp-3A__www.nongnu.org_libunwind&amp;d=3DDwIFAg&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xw=
t3l&amp;s=3DlWmWqF8G-xAViw4gogbniL5C4TmmC_Z-U_7q3yHJJe8&amp;e=3D" rel=3D"no=
referrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dht=
tp-3A__www.nongnu.org_libunwind&amp;d=3DDwIFAg&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&a=
mp;s=3DlWmWqF8G-xAViw4gogbniL5C4TmmC_Z-U_7q3yHJJe8&amp;e=3D</a> &quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2d80c8ed4062b8339b715f90fa=
68cc9f&quot;<br>
+DEPENDS +=3D &quot;libatomic-ops&quot;<br>
+DEPENDS:append:libc-musl =3D &quot; libucontext&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttp-3A__download.savannah.nongnu.org_releases_libunwind_libunwind-2D-=
24-257BPV-257D.tar.gz&amp;d=3DDwIFAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgG=
kICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP=
8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&amp;s=3DDzp=
pDAaiQpwcwHtq6BJCCnV8IRnwe8BOlE-V1z_AkfA&amp;e=3D" rel=3D"noreferrer" targe=
t=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download=
.savannah.nongnu.org_releases_libunwind_libunwind-2D-24-257BPV-257D.tar.gz&=
amp;d=3DDwIFAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8m=
Onj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&amp;s=3DDzppDAaiQpwcwHtq6BJCCnV8I=
Rnwe8BOlE-V1z_AkfA&amp;e=3D</a>=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-x86-Stub-out-x86_loca=
l_resume.patch \<br>
@@ -11,15 +17,31 @@ SRC_URI:append:libc-musl =3D &quot; file://musl-header-=
conflict.patch&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;4a6aec666991fb45d0889c44aede8ad6eb108071=
c3554fcdff671f9c94794976&quot;<br>
<br>
+inherit autotools multilib_header<br>
+<br>
+COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[lzma] =3D &quot;--enable-minidebuginfo,--disable-minidebugin=
fo,xz&quot;<br>
+PACKAGECONFIG[latexdocs] =3D &quot;--enable-documentation, --disable-docum=
entation, latex2man-native&quot;<br>
+<br>
+EXTRA_OECONF:arm =3D &quot;--enable-debug-frame&quot;<br>
+EXTRA_OECONF:armeb =3D &quot;--enable-debug-frame&quot;<br>
+EXTRA_OECONF:aarch64 =3D &quot;--enable-debug-frame&quot;<br>
+<br>
=C2=A0EXTRA_OECONF:append:libc-musl =3D &quot; --disable-documentation --di=
sable-tests --enable-static&quot;<br>
<br>
=C2=A0# <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__er=
rors.yoctoproject.org_Errors_Details_20487_&amp;d=3DDwIFAg&amp;c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwY=
JEhK9Xwt3l&amp;s=3DSKDMc7SnpmHxBq9SlFgKMBVybrXAwMHEjQ5vnXg4nAA&amp;e=3D" re=
l=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url=
?u=3Dhttp-3A__errors.yoctoproject.org_Errors_Details_20487_&amp;d=3DDwIFAg&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3F=
Jlan6TDSqW2WJLwYJEhK9Xwt3l&amp;s=3DSKDMc7SnpmHxBq9SlFgKMBVybrXAwMHEjQ5vnXg4=
nAA&amp;e=3D</a> <br>
=C2=A0ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
=C2=A0ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
<br>
-COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
-<br>
=C2=A0LDFLAGS +=3D &quot;-Wl,-z,relro,-z,now ${@bb.utils.contains(&#39;DIST=
RO_FEATURES&#39;, &#39;ld-is-gold&#39;, &#39; -fuse-ld=3Dbfd &#39;, &#39;&#=
39;, d)}&quot;<br>
<br>
=C2=A0SECURITY_LDFLAGS:append:libc-musl =3D &quot; -lssp_nonshared&quot;<br=
>
=C2=A0CACHED_CONFIGUREVARS:append:libc-musl =3D &quot; LDFLAGS=3D&#39;${LDF=
LAGS} -lucontext&#39;&quot;<br>
+<br>
+do_install:append () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header libunwind.h<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193920): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
3920&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5=
VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&amp;s=3DrRLXP74Dh2XnyVmQM6aY=
tOyPF2ZlWsMFKlYfrMUmt34&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_193920&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt=
3l&amp;s=3DrRLXP74Dh2XnyVmQM6aYtOyPF2ZlWsMFKlYfrMUmt34&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103787498_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6TDS=
qW2WJLwYJEhK9Xwt3l&amp;s=3D_OPUyWCjt0FVC1ckEUV57eYVcd3jh3-hCZLg-paODBw&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103787498_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhC=
rI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&amp;s=3D_OPUyWCjt0FVC1ckEUV57eYVcd3jh3-hC=
ZLg-paODBw&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5VJm8mOnj0IfhCrI_TI3FJlan6=
TDSqW2WJLwYJEhK9Xwt3l&amp;s=3DzMPlfcTWwai56yU_5P41Df59-erBRGJVEKyunoV5CS4&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DP8pttzCM0snL4m0mo5VJ=
m8mOnj0IfhCrI_TI3FJlan6TDSqW2WJLwYJEhK9Xwt3l&amp;s=3DzMPlfcTWwai56yU_5P41Df=
59-erBRGJVEKyunoV5CS4&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007cf018060f27745e--

