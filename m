Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0700C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 10:00:11 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.20641.1633255206822086275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 03:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DcU7oirT;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id j5so53535786lfg.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 03:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a9Wm81IPX5JGSTOQ7dpk3g7NiGVpMGxdIdbSjhPca2E=;
        b=DcU7oirTrSN/0oZ20f4wAJ1yDZ5++fN12ls+a7XIi9swHiCHcF8xKrnlsuXQ8R9IEk
         mlUykj6e6dNZYUlDQVIxSJXYGspBCDbalPwPgVL031MLCoogOJ4UF9mRjP1Im8x7u/TU
         2DSm1WygxQxht92MyslA0zodPKjqD9cfKJQ6yyxsYpWSelXCQ4tgBfgtX8qRySzGtRGy
         pZZVqGgYZb3hC1QPi3w0ZwoqzyFWoM+Np1RW3HrNCMbSrKGnaKCn2ViHj6ISyUIXZFfL
         ltzNA6Po4M0BLy1Sk9dx4yx7WfaEYNb/mGIaWKP02X17s3h2sExbpxq6/8CEZ9sj1cLY
         fvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a9Wm81IPX5JGSTOQ7dpk3g7NiGVpMGxdIdbSjhPca2E=;
        b=UbokQO3qJegyfkFmRhuuNBUX9oOJpMYy4USkFKpf7+qGSEGJEDi4OpxQLKUjtvNdbE
         GIs0NWjy2aL57fRgONH7Lt9rCOoEPoxdNtOgE+EUmtoR3CewEZwSFunrkM2l8aWfi9cb
         pyYS0aoOzdifvdf8AxSyRy+nR9XVwJxeFT6Vp75WwR62X4/pHOUmxhhIKqT5A8DSmO6e
         I9tIHd0qob+qyfOCj65HN9M1pSjPrPyG4A3uf/u3AgZwdXuMoCi+mWmRiEAnn9ZXXoSt
         8a1yc/KIZNSNufrDK3EsRMutJ2yIzQPnQeuB058N5ZDa7KRd57FA3GeelkV7Y1dV/5Ok
         UZqw==
X-Gm-Message-State: AOAM531YTP3FoaptZefTMaQ2I4I71BXvO01Sav4r76avn1c+Ftb1znDL
	hb7LQC3ExAlXZMBR2F2kNe6fMGw7qnhbL51Zy3w=
X-Google-Smtp-Source: 
 ABdhPJyNouR33n5bcISIYZuswE1ljNYNdZouuwmZSLabmsKmzi0+R21agDpFmY95ZhhwmEEkfH+BZlfAgkcYJA+uXNE=
X-Received: by 2002:a05:6512:6d4:: with SMTP id
 u20mr8298226lff.106.1633255204717;
 Sun, 03 Oct 2021 03:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
 <20211002221803.2283254-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211002221803.2283254-4-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 3 Oct 2021 10:59:57 +0100
Message-ID: 
 <CANPvuRktteqc9ttumqAPR+iPFN=xibHMqoNEzfHKFiOwzGyU2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] abi_version/sstate: Bump HASH_VERSION and
 SSTATE_VERSION
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004e089905cd6fdcc2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 10:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156545

--0000000000004e089905cd6fdcc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia s=C3=A1=
bado,
2/10/2021 =C3=A0(s) 23:18:

> At this point the hash equivalence and sstate is 'junk' on the autobuilde=
r
> unforuntately due to the volume of fixes and also the volume of slighly
> not quite right patches tested during the development of the fixes.
>
> In order to try and help any remaining sanity I might have, bump the
> version numbers to start with a clean slate so we're working from a known
> good baseline rather than risk chasing phantom issues. For those
> upgrading, there wouldn't be much reuse anyway after the changes.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sstate.bbclass                          | 2 +-
>  meta/conf/abi_version.conf                           | 2 +-
>  meta/recipes-devtools/elfutils/elfutils_0.185.bb     | 1 -
>  meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 1 -
>  4 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 89e9f561787..06a722c735d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -1,4 +1,4 @@
> -SSTATE_VERSION =3D "3"
> +SSTATE_VERSION =3D "4"
>
>  SSTATE_MANIFESTS ?=3D "${TMPDIR}/sstate-control"
>  SSTATE_MANFILEPREFIX =3D
> "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
> diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> index 35faef9a368..515a6def405 100644
> --- a/meta/conf/abi_version.conf
> +++ b/meta/conf/abi_version.conf
> @@ -12,4 +12,4 @@ OELAYOUT_ABI =3D "14"
>  # a reset of the equivalence, for example when reproducibility issues
> break the
>  # existing match data. Distros can also append to this value for the sam=
e
> effect.
>  #
> -HASHEQUIV_HASH_VERSION  =3D "5"
> +HASHEQUIV_HASH_VERSION  =3D "7"
>

Why is it bumped to 7 instead of 6 ?


> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> index 9ea4de8e407..f4769e36328 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> @@ -34,7 +34,6 @@ SRC_URI[sha256sum] =3D
> "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10049a73da2a
>
>  # remove at next version upgrade or when output changes
>  PR =3D "r1"
> -HASHEQUIV_HASH_VERSION .=3D ".2"
>
>  inherit autotools gettext ptest pkgconfig
>
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> index 0dd18d7a068..62aa1b0e877 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> @@ -28,7 +28,6 @@ SRC_URI[sha256sum] =3D
> "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3
>
>  # remove at next version upgrade or when output changes
>  PR =3D "r1"
> -HASHEQUIV_HASH_VERSION .=3D ".1"
>
>  RECIPE_NO_UPDATE_REASON =3D "6.04-pre3 is broken"
>  UPSTREAM_CHECK_URI =3D "https://www.zytor.com/pub/syslinux/"
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156542):
> https://lists.openembedded.org/g/openembedded-core/message/156542
> Mute This Topic: https://lists.openembedded.org/mt/86032667/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004e089905cd6fdcc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; e=
screveu no dia s=C3=A1bado, 2/10/2021 =C3=A0(s) 23:18:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">At this point the hash equivalence a=
nd sstate is &#39;junk&#39; on the autobuilder<br>
unforuntately due to the volume of fixes and also the volume of slighly<br>
not quite right patches tested during the development of the fixes.<br>
<br>
In order to try and help any remaining sanity I might have, bump the<br>
version numbers to start with a clean slate so we&#39;re working from a kno=
wn<br>
good baseline rather than risk chasing phantom issues. For those<br>
upgrading, there wouldn&#39;t be much reuse anyway after the changes.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/conf/abi_version.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a>=C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
=C2=A0meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.b=
b" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a> | 1 -<br>
=C2=A04 files changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 89e9f561787..06a722c735d 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -1,4 +1,4 @@<br>
-SSTATE_VERSION =3D &quot;3&quot;<br>
+SSTATE_VERSION =3D &quot;4&quot;<br>
<br>
=C2=A0SSTATE_MANIFESTS ?=3D &quot;${TMPDIR}/sstate-control&quot;<br>
=C2=A0SSTATE_MANFILEPREFIX =3D &quot;${SSTATE_MANIFESTS}/manifest-${SSTATE_=
MANMACH}-${PN}&quot;<br>
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf<br>
index 35faef9a368..515a6def405 100644<br>
--- a/meta/conf/abi_version.conf<br>
+++ b/meta/conf/abi_version.conf<br>
@@ -12,4 +12,4 @@ OELAYOUT_ABI =3D &quot;14&quot;<br>
=C2=A0# a reset of the equivalence, for example when reproducibility issues=
 break the<br>
=C2=A0# existing match data. Distros can also append to this value for the =
same effect.<br>
=C2=A0#<br>
-HASHEQUIV_HASH_VERSION=C2=A0 =3D &quot;5&quot;<br>
+HASHEQUIV_HASH_VERSION=C2=A0 =3D &quot;7&quot;<br></blockquote><div><br></=
div><div>Why is it bumped to 7 instead=C2=A0of 6 ?</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.18=
5.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a> b/meta/rec=
ipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" rel=3D"noreferr=
er" target=3D"_blank">elfutils_0.185.bb</a><br>
index 9ea4de8e407..f4769e36328 100644<br>
--- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a><br>
+++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a><br>
@@ -34,7 +34,6 @@ SRC_URI[sha256sum] =3D &quot;dc8d3e74ab209465e7f568e1b3bb=
9a5a142f8656e2b57d10049a73da2a<br>
<br>
=C2=A0# remove at next version upgrade or when output changes<br>
=C2=A0PR =3D &quot;r1&quot;<br>
-HASHEQUIV_HASH_VERSION .=3D &quot;.2&quot;<br>
<br>
=C2=A0inherit autotools gettext ptest pkgconfig<br>
<br>
diff --git a/meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04=
-pre2.bb" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a> b/=
meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.bb" rel=
=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a><br>
index 0dd18d7a068..62aa1b0e877 100644<br>
--- a/meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.b=
b" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a><br>
+++ b/meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.b=
b" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a><br>
@@ -28,7 +28,6 @@ SRC_URI[sha256sum] =3D &quot;4441a5d593f85bb6e8d578cf6653=
fb4ec30f9e8f4a2315a3d8f2d0a8b3<br>
<br>
=C2=A0# remove at next version upgrade or when output changes<br>
=C2=A0PR =3D &quot;r1&quot;<br>
-HASHEQUIV_HASH_VERSION .=3D &quot;.1&quot;<br>
<br>
=C2=A0RECIPE_NO_UPDATE_REASON =3D &quot;6.04-pre3 is broken&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.zytor.com/pub/sys=
linux/" rel=3D"noreferrer" target=3D"_blank">https://www.zytor.com/pub/sysl=
inux/</a>&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156542): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156542" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156542</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86032667/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86032667/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000004e089905cd6fdcc2--

