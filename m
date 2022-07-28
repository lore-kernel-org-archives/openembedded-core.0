Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79132C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 21:44:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.1159.1659044639333092753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 14:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V4NfZ2WO;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id m7so2437064qkk.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 14:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hvEJ489JLWQ3Ag05UZOv+4QFjx/+WgduDsG9ZqDyddw=;
        b=V4NfZ2WOvcG+Ts61i1wmHyhUjenD76F9Ljvu7AphBkInEfCVlXZPS89lFS5heXLxCW
         1SF+11/OtQaSXEK7t/YDQsVwdFFlbB+qBI8o47Pw7KZ2rx0hR4L6xdkMnsAhIlSMwKvf
         wlumPfIDtC8vT+Su/tB5Y9D8BC+oav8H2Iu1+NG6pSnZ59T3b6wO1nh05NG040VgI0ca
         X+KENd3XY76TMVgpTAMS3+6Gs9jXXmeQl31uoldSHSlLmV0eCWeCuGGKUGyqyS1K2FW+
         7QVHYz4NOjHGeF3XLr1mEN+Um2hhcamHCn0MZ/thjDlqWYSrMKwNIG4PpuUudD5X3qh1
         EjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hvEJ489JLWQ3Ag05UZOv+4QFjx/+WgduDsG9ZqDyddw=;
        b=N2XWvoEdrybE360VAHUEVMqO3MKmeajdAAouzAnOGmp16bBDLEmNLXW1/01/jVuJ3c
         6/KfK7sxLc8ufxNxABVMl+6Mx71gTo2yqEIRQOvJEbDVBfSTnIUGzNFdOTXdmhcts2gd
         tUa9qqXQechcy8Ra7Zo+LSYLYQ3HpBYN2enrAYvAykmHCmur+9l8eUGJChJslDmEYEdX
         35l97DPTIUIgVIc53v2fG4mZaRrXRBfooqy4HnaBLjBT1imhuG1uW4irmTKKzx3mvcpw
         fYf2gtRQTotq56luoUPcx08xb6ot6P3T3H/P1DZ0ecKge5xBtM5IR/x1jLeRQsvCb2Nd
         vLtQ==
X-Gm-Message-State: AJIora8YfFujvvvg2OoUrB0LdFFTNW/+Vqo1FS91EVKcdZJQvYp2iJYH
	bB51vBbIVVJRSBHn9WH11CS7qna236irlgF8xMQ=
X-Google-Smtp-Source: 
 AGRyM1sNQRCR4g1HkugP27ET0go4T3YOKsJZSs0NT3JakfVO+gECOYKHzyY1TPlbogBBfFNDNvvyGiHhFP5M7H5dQnI=
X-Received: by 2002:a05:620a:f85:b0:6b5:e2be:1d04 with SMTP id
 b5-20020a05620a0f8500b006b5e2be1d04mr700562qkn.72.1659044638221; Thu, 28 Jul
 2022 14:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114046.3529197-1-Martin.Jansa@gmail.com>
 <20220728114046.3529197-2-Martin.Jansa@gmail.com>
In-Reply-To: <20220728114046.3529197-2-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jul 2022 17:43:47 -0400
Message-ID: 
 <CAMKF1sou7imybgWnkyWVWhvy=PxPX0ihSxxV3EJwE8MqGEtv3w@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] bitbake.conf: introduce
 LINKER/BUILD_LINKER variables
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, petr.vorel@gmail.com
Content-Type: multipart/alternative; boundary="00000000000053e96805e4e46ea9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 21:44:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168620

--00000000000053e96805e4e46ea9
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 7:41 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * makes it a bit easier to replace ld with ld.bfd or some other
> implementation
>   in LD/BUILD_LD variables without changing this whole variable and without
>   depending on ld-is-gold to set ld symlink to preferred implementation (or
>   when we want to force different one for specific recipe, e.g. forcing bfd
>   where gold fails, like in ltp)


This is fixing bare ld calls but there are perhaps handful of recipes where
bare ld is used in most of the cases we rely on compiler driver to do the
linking and this confuses that use case.


>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1d36aae8b3..1c2ebf333e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -553,7 +553,8 @@ export CC = "${CCACHE}${HOST_PREFIX}gcc
> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>  export CXX = "${CCACHE}${HOST_PREFIX}g++
> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>  export FC = "${CCACHE}${HOST_PREFIX}gfortran
> ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>  export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
> -export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
> +LINKER = "ld"
> +export LD = "${HOST_PREFIX}${LINKER}${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
>  export CCLD = "${CC}"
>  export AR = "${HOST_PREFIX}gcc-ar"
>  export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
> @@ -570,7 +571,8 @@ export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc
> ${BUILD_CC_ARCH}"
>  export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
>  export BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
>  export BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
> -export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
> +BUILD_LINKER = "ld"
> +export BUILD_LD = "${BUILD_PREFIX}${BUILD_LINKER} ${BUILD_LD_ARCH}"
>  export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
>  export BUILD_AR = "${BUILD_PREFIX}ar"
>  export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168601):
> https://lists.openembedded.org/g/openembedded-core/message/168601
> Mute This Topic: https://lists.openembedded.org/mt/92668261/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000053e96805e4e46ea9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 28, 2022 at 7:41 AM Martin Jansa &lt;<a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">* makes it a bit easier to replace ld wi=
th ld.bfd or some other implementation<br>
=C2=A0 in LD/BUILD_LD variables without changing this whole variable and wi=
thout<br>
=C2=A0 depending on ld-is-gold to set ld symlink to preferred implementatio=
n (or<br>
=C2=A0 when we want to force different one for specific recipe, e.g. forcin=
g bfd<br>
=C2=A0 where gold fails, like in ltp)</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">This is fixing bare ld calls but there are perhaps han=
dful of recipes where bare ld is used in most of the cases we rely on compi=
ler driver to do the linking and this confuses that use case.=C2=A0</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 1d36aae8b3..1c2ebf333e 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -553,7 +553,8 @@ export CC =3D &quot;${CCACHE}${HOST_PREFIX}gcc ${HOST_C=
C_ARCH}${TOOLCHAIN_OPTIONS}&quot;<br>
=C2=A0export CXX =3D &quot;${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOL=
CHAIN_OPTIONS}&quot;<br>
=C2=A0export FC =3D &quot;${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${=
TOOLCHAIN_OPTIONS}&quot;<br>
=C2=A0export CPP =3D &quot;${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_=
CC_ARCH}&quot;<br>
-export LD =3D &quot;${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}&q=
uot;<br>
+LINKER =3D &quot;ld&quot;<br>
+export LD =3D &quot;${HOST_PREFIX}${LINKER}${TOOLCHAIN_OPTIONS} ${HOST_LD_=
ARCH}&quot;<br>
=C2=A0export CCLD =3D &quot;${CC}&quot;<br>
=C2=A0export AR =3D &quot;${HOST_PREFIX}gcc-ar&quot;<br>
=C2=A0export AS =3D &quot;${HOST_PREFIX}as ${HOST_AS_ARCH}&quot;<br>
@@ -570,7 +571,8 @@ export BUILD_CC =3D &quot;${CCACHE}${BUILD_PREFIX}gcc $=
{BUILD_CC_ARCH}&quot;<br>
=C2=A0export BUILD_CXX =3D &quot;${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARC=
H}&quot;<br>
=C2=A0export BUILD_FC =3D &quot;${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC=
_ARCH}&quot;<br>
=C2=A0export BUILD_CPP =3D &quot;${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E&quo=
t;<br>
-export BUILD_LD =3D &quot;${BUILD_PREFIX}ld ${BUILD_LD_ARCH}&quot;<br>
+BUILD_LINKER =3D &quot;ld&quot;<br>
+export BUILD_LD =3D &quot;${BUILD_PREFIX}${BUILD_LINKER} ${BUILD_LD_ARCH}&=
quot;<br>
=C2=A0export BUILD_CCLD =3D &quot;${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}&quot;=
<br>
=C2=A0export BUILD_AR =3D &quot;${BUILD_PREFIX}ar&quot;<br>
=C2=A0export BUILD_AS =3D &quot;${BUILD_PREFIX}as ${BUILD_AS_ARCH}&quot;<br=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168601): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168601" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168601</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92668261/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92668261/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000053e96805e4e46ea9--

