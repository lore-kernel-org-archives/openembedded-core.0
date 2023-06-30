Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E053DEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 15:55:18 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.16184.1688140508766963353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 08:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=obrsUqG9;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7918b56b1e1so787001241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688140508; x=1690732508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=biZ3JV/FNVVRcoEHB5SSvaahwlDXMoJczwz154/GKsY=;
        b=obrsUqG9qXXkaQJQr+5AXGtT+ay2yGyp67uuUNnozdTsh3qKzqLBJyPRo8tCnvzkfO
         UoG5rEW0Y7cauIpk4wGrmtVQ1pvr01FrMySk6aOAwMTskj0O56dqd9dAWPbAzUq0ob+j
         zDX846TuxVi8wobsqPGIWBNnezKGN/21TBlCUmQRk9TQmgTzq6/76cQ7Lxk1QHufGfl0
         UwnevRfy9TQAwU9t9jEKkXxRxTtERv41oqfAj9F8srQ7NHJO69E0oDM41nVy09NK1ExZ
         i0O4YfgHadZcuSo0D1tCqN4BmT+fDRhBEpOFUCrXlcHg1jknsHkFMgCYBKocNFuvh9WS
         m3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688140508; x=1690732508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biZ3JV/FNVVRcoEHB5SSvaahwlDXMoJczwz154/GKsY=;
        b=dLqeB9UCxV8FOi3boGKJf4o97LPyllvrUloMB3ZsCagoWWy4K1el80CauT3Tuiphro
         wxevK4BtkOUP61+u6Drp88pW/6vByjVfFYEuB8wuFDAQaRyF/MxTD9qnn808DQt+ewz3
         dL5UgD6Dy0+VXjYBV2x3tprD6Q7/SnP1oXVkyR75zE2njsRlVInaXsiPNDwKCfnCDPfo
         NPbUrtNFUVCDUW0pQhRsquaFF3jpem9/GakDqcQxDLdWWmyDw980ZQGL1z74nV9Kum04
         0SuZyY4yoeXx2s78PS1zNBttsGC6jCFPPVBX+z2617UwL4shpPGXo2zwGzRwXlG7rUvt
         cvuA==
X-Gm-Message-State: ABy/qLbFbrIzW8a4bLctIP61PAWWgYTPXqTRD0hNLrfg0AugJtzratzJ
	2iHbGZndBb3slAtRvH9ur7zbf+ajJC34z5Fn2Effvh1LWI/dsg==
X-Google-Smtp-Source: APBJJlG6wGswYih11KaZY84ykWkLkfPc8TimS22ImylmvJ++HUYmBbO9J0ruXmukQEiZEV0aeKRITyN6SgXwCsTfQ6M=
X-Received: by 2002:a67:fdcf:0:b0:443:6f2d:d44a with SMTP id
 l15-20020a67fdcf000000b004436f2dd44amr2203439vsq.2.1688140507827; Fri, 30 Jun
 2023 08:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230630154912.3630297-1-jose.quaresma@foundries.io>
In-Reply-To: <20230630154912.3630297-1-jose.quaresma@foundries.io>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 30 Jun 2023 16:54:57 +0100
Message-ID: <CANPvuRmiGE58VewdOCuR+xbqVNBd1Lmoccy-0n-AcVrabGmFPg@mail.gmail.com>
Subject: Re: [PATCH] kernel-module-split add systemd modulesloaddir and
 modprobedir config
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000004cd45705ff5ad7d7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 15:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183705

--0000000000004cd45705ff5ad7d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Forgot the colon in "kernel-module-split:"
is it necessary to send a v2 for this?

Jose

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia sexta, 30/06/2023
=C3=A0(s) 16:49:

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes-recipe/kernel-module-split.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 0e4f9a6ec3..c1208d55e0 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -30,8 +30,8 @@ fi
>
>  PACKAGE_WRITE_DEPS +=3D "kmod-native depmodwrapper-cross"
>
> -modulesloaddir ??=3D "${sysconfdir}/modules-load.d"
> -modprobedir ??=3D "${sysconfdir}/modprobe.d"
> +modulesloaddir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
> +modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${nonarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"
>
>  KERNEL_SPLIT_MODULES ?=3D "1"
>  PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
> --
> 2.34.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004cd45705ff5ad7d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>Forgot the colon in &quot;kernel-module-split:&=
quot;=C2=A0<div>is it necessary to send a v2 for this?<br><br>Jose</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jos=
e Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gma=
il.com</a>&gt; escreveu no dia sexta, 30/06/2023 =C3=A0(s) 16:49:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Jose Quare=
sma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">jos=
e.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-module-split.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass<br>
index 0e4f9a6ec3..c1208d55e0 100644<br>
--- a/meta/classes-recipe/kernel-module-split.bbclass<br>
+++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
@@ -30,8 +30,8 @@ fi<br>
<br>
=C2=A0PACKAGE_WRITE_DEPS +=3D &quot;kmod-native depmodwrapper-cross&quot;<b=
r>
<br>
-modulesloaddir ??=3D &quot;${sysconfdir}/modules-load.d&quot;<br>
-modprobedir ??=3D &quot;${sysconfdir}/modprobe.d&quot;<br>
+modulesloaddir ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;systemd&#39;, &#39;${nonarch_libdir}&#39;, &#39;${sysconfdir}&#39;, d=
)}/modules-load.d&quot;<br>
+modprobedir ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;systemd&#39;, &#39;${nonarch_base_libdir}&#39;, &#39;${sysconfdir}&#39;,=
 d)}/modprobe.d&quot;<br>
<br>
=C2=A0KERNEL_SPLIT_MODULES ?=3D &quot;1&quot;<br>
=C2=A0PACKAGESPLITFUNCS =3D+ &quot;split_kernel_module_packages&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--0000000000004cd45705ff5ad7d7--

