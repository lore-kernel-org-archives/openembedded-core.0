Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D056ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 10:24:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.4720.1663755867693439000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 03:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e3ziygo0;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id t4so169936wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tkRxSMlrxmCjGEwaeav4nKCSVXxr3/xoy32BD30Tq7A=;
        b=e3ziygo0jEnQLlRMplXb5FzvjC4v9/zVEyox9BwKzOkQZQtIEWDxnd8jkbZKJGRrGb
         igruS4LcyocXmeYAa+F5gX7IYgXtvM1c/YP3QQpYqMKEiyv9VEYpohk+D7PrGX8cYTn2
         gldimFJV2mskWLPe1us4qCkGMEKw9mnaIeao2cGZlSoTqcxXUwzg8narG1Mo365KsFur
         mFC/WHxGQ6LwianCnlv0BRMg+TTeewN3czAj3aftxhvlsP9/nTipWHFrUiYwqbrBXIp2
         13OrsNRa9w0ADEGR6hAkVs6SddcyqmPaNlZln0TOa1mLq87Yf1Dzy6qp0QxR5TZNwX1o
         CkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tkRxSMlrxmCjGEwaeav4nKCSVXxr3/xoy32BD30Tq7A=;
        b=JU5b7mxm2Zqo2jd+NYUAF62ojFjTkRycFiWfNckQYPBIghkbZlM7Y7NwRAWuNeYFF1
         JX7k1vI4pkoamkj7PgJjFL3GfRWB0oT3y+Tq+XQMDDfroYDj8fY1RyyisIHj1L083o9j
         YAiafjJGY9Mtxx3jUichMy+OCzas9HSrtiH/nfoCwNSRA7ngqEiym6AxBIgFmdrBs/3F
         ey1L96FBwyEfGPE8OvUbSPmEa5uN1pPRdqL0M8x7rXcyylEuT9taozSdz54N9crWneGM
         9moW5Ku48GzE3bqieM0Dx0/MrUpSWm2uvvFrmaYcH5ZVtr4kCe59rJcXJ9zmXjqxgWlb
         eoBQ==
X-Gm-Message-State: ACrzQf1fRsEqJVIUZgJO8YUCiNS01NSm7Ta6YQKWDwhv+JYCUMGhG6R2
	XllgxCuv40h9xjgCw3e8tKFNnTYB1Ek29DnEfEc=
X-Google-Smtp-Source: 
 AMsMyM7lLXGVhs5ceTx4DQSqCPh9An+K1pQp7JR6yNLOH3FvoZ0yJ+O6bndtyV9OOibgFXV9fCBPyDe+ieF366OBcxo=
X-Received: by 2002:a05:600c:2646:b0:3b4:7640:3c1a with SMTP id
 6-20020a05600c264600b003b476403c1amr5510625wmy.2.1663755865718; Wed, 21 Sep
 2022 03:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220921053109.10792-1-kai.kang@windriver.com>
In-Reply-To: <20220921053109.10792-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Sep 2022 12:24:14 +0200
Message-ID: 
 <CA+chaQeeJb1HR-uDxG2=ga18OetwKw3Z-e7MKezDKLQbdW_ReQ@mail.gmail.com>
Subject: Re: [PATCH] mesa: only apply patch to fix ALWAYS_INLINE for native
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005e85a205e92d59fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 10:24:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170944

--0000000000005e85a205e92d59fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good that confirms what I was seeing earlier -
https://lists.openembedded.org/g/openembedded-core/message/169002

On Wed, Sep 21, 2022 at 7:31 AM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
> required by target mesa any more. But it still fails to compile
> mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
> without this patch:
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

--0000000000005e85a205e92d59fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good that confirms what I was seeing earlier - <a href=3D"=
https://lists.openembedded.org/g/openembedded-core/message/169002">https://=
lists.openembedded.org/g/openembedded-core/message/169002</a></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 21=
, 2022 at 7:31 AM &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" tar=
get=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not<br>
required by target mesa any more. But it still fails to compile<br>
mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0<br>
without this patch:<br>
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
</blockquote></div>

--0000000000005e85a205e92d59fe--

