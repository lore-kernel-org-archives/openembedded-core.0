Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DF6C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 15:58:11 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.54752.1739203089791677349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 07:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GSiKKHdZ;
 spf=pass (domain: snapchat.com, ip: 209.85.208.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so5372063a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739203088; x=1739807888; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0s9VaoGe8yWvFyxmSuBON50kMiJIFO9bAfJrDFLVQHk=;
        b=GSiKKHdZ4a6FNArd4twVwSXCo/ttOMXLP50rePekOP0oXQWFIKjhXu2zXJkTC7iXfC
         jehSPsUWQ0x+Zhzfhi/EPsmI8SKrm+tjhuYe2f9r8AxMumWR4oNrY9T8a42M8wCyuxw1
         7IkdKoP+9+iOTDjBS6/DrEyIO9QVvZzdfJJyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203088; x=1739807888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s9VaoGe8yWvFyxmSuBON50kMiJIFO9bAfJrDFLVQHk=;
        b=VUjur9/DVrpl/qubFDWe1MazYJVprPQ7vkJLQaHD8AmjSdjOgn+2r2HGOGfYCM9VZ2
         NPehYzWb8OFrStc4hRavLiAA61zwtrZDGRhwgIfROJmSJII2OvK7X3ove/vfL6QDa5G5
         sOwYlqSwpwp1Tj5M/DdCX8uArky/xXmTTqrccwGQ82Z96NHYawb3SB+eEiFgkSoA5OVI
         Lrt8hsverIx7ZasB26pjrtPdjKHEUmMyyoVtC6TVlF5LwKxP4pBOrM9ZgpaNlxZHiJ9o
         flm4xSfONbaYakNais8VuP50LOQ1thTzP0sI02REc4OBMVRTqHn3t/k14yuIlGYdneMD
         5qTA==
X-Gm-Message-State: AOJu0YxePcYlx0JiEw3FNdcCnA2LoKd2h1C2o7xNKMaX4G3GwXA6MD6j
	F9vp89xH96ynW+1BwGxOU1ecinlD8Z9JTh7/7lGS7ZpTk5t4uwdY/7f/6EnG8adUhLbRJrtP3Ic
	+jTLJQAvtcZK/7c1rcTsSwWxlvJW0fVn/RH8JIg==
X-Gm-Gg: ASbGncs6Yq0+iGIglhBUUu7aciyqAXnqPRIEiTX0NMINcK0pVNdpVQne4c9Iqp9bShl
	JG8vGLFTex/vvMeTm37nibArqUdxbnuA56VjztrsdqVGy+OIfxeJu6L/W92L+HQOIHl+7dGl7
X-Google-Smtp-Source: AGHT+IErnKMVcsBJ7bqWg8aPOZI4+4/MQnhTFSaf0KGAJZv/3O2Tvb/I6beAUWjY1F68hHUQsjj4W7Q5PG0EKFYJxvc=
X-Received: by 2002:a17:907:980d:b0:ab6:b9c0:1ea2 with SMTP id
 a640c23a62f3a-ab789b1f985mr1366026566b.25.1739203086615; Mon, 10 Feb 2025
 07:58:06 -0800 (PST)
MIME-Version: 1.0
References: <1822E38F637F1A4A.703@lists.openembedded.org>
In-Reply-To: <1822E38F637F1A4A.703@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 10 Feb 2025 16:57:55 +0100
X-Gm-Features: AWEUYZktu2Ybs3MM1clJ5SHdP3z6HMK6IYGIsWBhdxskMADbIXyts2SlMFXvAMU
Message-ID: <CAHUKmYbj+aHD2+YeS5xDzxexR+M=yjQb-_UaE3Qyqb2PVZ3_zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb-cross: remove duplicated PACKAGECONFIG
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002bac99062dcbc64c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 15:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211100

--0000000000002bac99062dcbc64c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I was hesitating a bit for this patch: typically when building gdb-cross
there is no space constraint on the host where gdb-cross runs (a desktop PC
/ laptop, etc), so we could keep the separated definition of PACKAGECONFIG,
and enable xz and minidebuginfod for gdb-cross per default and avoid
requiring a rebuild of gdb-cross depending on which DISTRO_FEATURES is
enabled.

This is especially true because when debugging with gdb-cross, a lot of
libraries can get loaded, and the error message indicating the lack of lzma
support / minidebuginfo is easy to miss, and gdb even reports that symbols
are loaded when using "info sharedlibrary", because minidebuginfo symbols
are not the "main" symbols, making it even more confusing.

On the other hand there are corner-cases where gdb-cross runs on some kind
of embedded X86 SBC / mini-pc, and where there could be some size
constraints.

What do you think?

=C3=89tienne

On Mon, Feb 10, 2025 at 4:50=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Duplicating the PACKAGECONFIG variable in gdb-cross and gdb-common makes
> it easy to forget updating one definition without updating the other.
> However at the moment there is no need for two different definitions.
>
> xz is also useful for gdb-cross when minidebuginfo is enabled, so it also
> needs
> to be in the definition of PACKAGECONFIG in gdb-cross.inc
>
> Let's remove the definition from gdb-cross.inc to make maintenance easier=
.
> This enables xz for gdb-cross as side-effect.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc
> b/meta/recipes-devtools/gdb/gdb-cross.inc
> index 399f4bba97a..4f16deabe3e 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
> @@ -5,7 +5,6 @@ DEPENDS =3D "expat-native gmp-native mpfr-native
> ncurses-native flex-native bison-
>  inherit python3native pkgconfig
>
>  # Overrides PACKAGECONFIG variables in gdb-common.inc
> -PACKAGECONFIG ??=3D "python readline ${@bb.utils.filter('DISTRO_FEATURES=
',
> 'debuginfod', d)}"
>  PACKAGECONFIG[python] =3D
> "--with-python=3D${PYTHON},--without-python,python3-native"
>  PACKAGECONFIG[readline] =3D
> "--with-system-readline,--without-system-readline,readline-native"
>  PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod,
> elfutils-native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211099):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_211099&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DoSIbflHDGXCKOEtGdeTw0NoVMfB4MNzVnlH24PhVxHu1FqyeKZyzmE5d8tWFu1Uh&s=3DuEf=
_KRP3T_J05Xw0q-gEJ9Hfy-sKi3qFqRvO-r5Pb9E&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_111104210_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DoSIbflHDGXCKO=
EtGdeTw0NoVMfB4MNzVnlH24PhVxHu1FqyeKZyzmE5d8tWFu1Uh&s=3DZRFn5FiVLbIlO9SBIRG=
TceI69NCc5GtUrsR7CQ_ikd0&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DoSIbfl=
HDGXCKOEtGdeTw0NoVMfB4MNzVnlH24PhVxHu1FqyeKZyzmE5d8tWFu1Uh&s=3DyqZIDTsDedhs=
AzvWHG7pwQTpvDNru18T6BiYoUkVgt0&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002bac99062dcbc64c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>I was hesitating a bit for this patch: typically wh=
en building gdb-cross there is no space constraint on the host where gdb-cr=
oss runs (a desktop PC / laptop, etc), so we could keep the separated defin=
ition of PACKAGECONFIG, and enable xz and minidebuginfod for gdb-cross per =
default and avoid requiring a rebuild of gdb-cross depending on which DISTR=
O_FEATURES is enabled.<br><br>This is especially true because when debuggin=
g with gdb-cross, a lot of libraries can get loaded, and the error message =
indicating the lack of lzma support / minidebuginfo is easy to miss, and gd=
b even reports that symbols are loaded when using &quot;info sharedlibrary&=
quot;, because minidebuginfo symbols are not the &quot;main&quot; symbols, =
making it even more confusing.<br><br>On the other hand there are corner-ca=
ses where gdb-cross runs on some kind of embedded X86 SBC / mini-pc, and wh=
ere there could be some size constraints.<br><br>What do you think?<br><br>=
=C3=89tienne</div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10, 2025 at 4:50=E2=80=AFPM E=
tienne Cordonnier via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembe=
dded.org">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Etienne Cordonnier &lt;<a hr=
ef=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</=
a>&gt;<br>
<br>
Duplicating the PACKAGECONFIG variable in gdb-cross and gdb-common makes<br=
>
it easy to forget updating one definition without updating the other.<br>
However at the moment there is no need for two different definitions.<br>
<br>
xz is also useful for gdb-cross when minidebuginfo is enabled, so it also n=
eeds<br>
to be in the definition of PACKAGECONFIG in gdb-cross.inc<br>
<br>
Let&#39;s remove the definition from gdb-cross.inc to make maintenance easi=
er.<br>
This enables xz for gdb-cross as side-effect.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gdb/gdb-cross.inc | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtool=
s/gdb/gdb-cross.inc<br>
index 399f4bba97a..4f16deabe3e 100644<br>
--- a/meta/recipes-devtools/gdb/gdb-cross.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc<br>
@@ -5,7 +5,6 @@ DEPENDS =3D &quot;expat-native gmp-native mpfr-native ncurs=
es-native flex-native bison-<br>
=C2=A0inherit python3native pkgconfig<br>
<br>
=C2=A0# Overrides PACKAGECONFIG variables in gdb-common.inc<br>
-PACKAGECONFIG ??=3D &quot;python readline ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;, &#39;debuginfod&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;--with-python=3D${PYTHON},--without-p=
ython,python3-native&quot;<br>
=C2=A0PACKAGECONFIG[readline] =3D &quot;--with-system-readline,--without-sy=
stem-readline,readline-native&quot;<br>
=C2=A0PACKAGECONFIG[debuginfod] =3D &quot;--with-debuginfod, --without-debu=
ginfod, elfutils-native&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211099): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_21=
1099&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DoSIbflHDGXCKOEtGde=
Tw0NoVMfB4MNzVnlH24PhVxHu1FqyeKZyzmE5d8tWFu1Uh&amp;s=3DuEf_KRP3T_J05Xw0q-gE=
J9Hfy-sKi3qFqRvO-r5Pb9E&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_211099&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DoSIbflHDGXCKOEtGdeTw0NoVMfB4MNzVnlH24PhVxHu1FqyeKZyzmE5d8tWFu1=
Uh&amp;s=3DuEf_KRP3T_J05Xw0q-gEJ9Hfy-sKi3qFqRvO-r5Pb9E&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_111104210_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DoSIbflHDGXCKOEtGdeTw0NoVMfB4MNzVnlH24PhVxHu1Fq=
yeKZyzmE5d8tWFu1Uh&amp;s=3DZRFn5FiVLbIlO9SBIRGTceI69NCc5GtUrsR7CQ_ikd0&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_111104210_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DoSIbflHDGXCKOEtGdeTw0NoVMfB4MNz=
VnlH24PhVxHu1FqyeKZyzmE5d8tWFu1Uh&amp;s=3DZRFn5FiVLbIlO9SBIRGTceI69NCc5GtUr=
sR7CQ_ikd0&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DoSIbflHDGXCKOEtGdeTw0NoVMfB4MNzVnlH24PhVxHu=
1FqyeKZyzmE5d8tWFu1Uh&amp;s=3DyqZIDTsDedhsAzvWHG7pwQTpvDNru18T6BiYoUkVgt0&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DoSIbflHDGXCKOEtGdeTw=
0NoVMfB4MNzVnlH24PhVxHu1FqyeKZyzmE5d8tWFu1Uh&amp;s=3DyqZIDTsDedhsAzvWHG7pwQ=
TpvDNru18T6BiYoUkVgt0&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002bac99062dcbc64c--

