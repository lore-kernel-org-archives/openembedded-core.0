Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB63CC6FA82
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 07:49:30 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web12.3826.1663746565858293704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 00:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EhwbJFDZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-127dca21a7dso7844975fac.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PXPnSB68wDCnrgR34Mokymhee3fNB0vuSoEe86ouu/c=;
        b=EhwbJFDZvcR7sbXZmB6X8bFsfQMYHwdVuHd3IJP4o8tWqbfSsgjILhuyNlHQLhCK7X
         RQ0tj/vj+xbiYPYSty3ay81qkxpX3wqO7NRp+9STmlNu1ESvGuWLUopb+vkVU6QcjH7C
         GBl7BoVrfRhwa9UNamYoIVpxqnCwGiR6GLTubn87zi79h8lwJ2xjXxUcEf2wdLkeO4Ws
         3Tq2+tzKRzjDbYue2P6Plk4LGq0OrGgIswIvrzzWiuHrYvwy4UziU4qfFRlUaOlDKINc
         PgrsCa+NugvxYN8XPHaGCW2lUekwuzynyTrDTJ+H+8+wx9uLMVeTleQWYxkXeguFMxbz
         hrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PXPnSB68wDCnrgR34Mokymhee3fNB0vuSoEe86ouu/c=;
        b=PuSO/IPf6HkIYx28+QyJLWaYLLM7CrfgNUGCET9IjEB4Ni2ZFh0ES97wnCGQ9PEfX3
         INRinvN8MFyG3+wLEi6xgxXkv7HtV2isHD+y+9ztWMfy+C1PLP87lkd8aoj9fPqX9/bk
         7XN0+LBfEuoUUgMuy0w3eDReasyH1Tg1TKJtzfx/mdJDAlRso+mIMauqRZxgYRuqN5Nc
         FfuorNkEJfrjEZsKYpcGJU4+xPjIjr7AedZN1vswNq8uo9VOnrjQDrsJFQry3Q8PMxNT
         08SW2jRaBQr+V7f868g23cEBuN6OjMM/1QwrnjhVGfs+USxbV9Y8t7xMZATmVzcf8Hhx
         Dhlw==
X-Gm-Message-State: ACrzQf1zsaH0XOD5t/h/UovNt2y1KmdVTpiyS2MnVOGXL+WdA6TyFKb0
	CzyBzrn0GxhOQ2AJTE8dgVV9Nbe5iLja4+UBW10=
X-Google-Smtp-Source: 
 AMsMyM5V1BB1I5kpYwEeBjEpgbwBWYjfjAPj04o3N5erIqRcuaB/7y3dZ+xCQOVNDOSvuLmJteu50613/TlUl7NymrE=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr4194659oae.262.1663746565027; Wed, 21
 Sep 2022 00:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220921053109.10792-1-kai.kang@windriver.com>
In-Reply-To: <20220921053109.10792-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Sep 2022 03:49:14 -0400
Message-ID: 
 <CAMKF1spSdz4AhZXrv98hKTKRAR3Q+fWSe3dCr1OQ3hU9U-hr4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: only apply patch to fix ALWAYS_INLINE for
 native
To: kai <kai.kang@windriver.com>
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000013ba905e92b2fe9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 07:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170933

--000000000000013ba905e92b2fe9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 1:31 AM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
> required by target mesa any more. But it still fails to compile
> mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
> without this patch:


Perhaps add a comment on the recipe as well so we do not forget to remove
it when Ubuntu 18.04 is dropped in future

>
>
> | ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function
> =E2=80=98nir_opt_move_block=E2=80=99:
> | ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining
> failed in call to
>     always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call wi=
th a yet
> undetermined callee
> |  src_is_ssa(nir_src *src, void *state)
> |  ^~~~~~~~~~
>
> So only apply it for mesa-native.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index ea7ed4fd27..c306c6b726 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -22,8 +22,8 @@ SRC_URI =3D "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
>
> file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
>
> file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
> -
>  file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
>             "
> +SRC_URI:append:class-native =3D "
> file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
>
>  SRC_URI[sha256sum] =3D
> "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
>
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170930):
> https://lists.openembedded.org/g/openembedded-core/message/170930
> Mute This Topic: https://lists.openembedded.org/mt/93820842/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000013ba905e92b2fe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Sep 21, 2022 at 1:31 AM kai &lt;<a href=3D"mailto:k=
ai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" ta=
rget=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not<br>
required by target mesa any more. But it still fails to compile<br>
mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0<br>
without this patch:</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Perhaps add a comment on the recipe as well so we do not forget to remov=
e it when Ubuntu 18.04 is dropped in future=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
<br>
| ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=80=
=98nir_opt_move_block=E2=80=99:<br>
| ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining fail=
ed in call to<br>
=C2=A0 =C2=A0 always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function=
 call with a yet undetermined callee<br>
|=C2=A0 src_is_ssa(nir_src *src, void *state)<br>
|=C2=A0 ^~~~~~~~~~<br>
<br>
So only apply it for mesa-native.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index ea7ed4fd27..c306c6b726 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -22,8 +22,8 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-util-format-Check-for=
-NEON-before-using-it.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Revert-egl-wayland-de=
precate-drm_handle_format-and-d.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-swrast_kms-use-swkmsD=
RI2Extension-instead-of-driDRI2.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-nir-nir_opt_move-fix-=
ALWAYS_INLINE-compiler-error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI:append:class-native =3D &quot; file://0001-nir-nir_opt_move-fix-AL=
WAYS_INLINE-compiler-error.patch&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;22ced061eb9adab8ea35368246c1995c09723f3f=
71653cd5050c5cec376e671a&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170930): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170930" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170930</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93820842/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93820842/1997914</a><br>
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

--000000000000013ba905e92b2fe9--

