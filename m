Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E487C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 17:38:44 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.33335.1635701922884085889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 10:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oHaOjbPe;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id f1so13932523qto.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 10:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bLi/vOls/z7nS3eGqX7rMELjorn1NNYYz1JfosiuO3Y=;
        b=oHaOjbPewdxWJS6SYDiV7CTfI9quVitSVdlcmjmiNSIuawMfuX3FHeCLjkRwg22Haa
         k1bybemHXkxKo0Y0lYLIvDkp+aGkGt6z2i97HawIdn5LAbNdP1iDSNw1wQ57qdBKI7gl
         wtqGlCaFthrlK8+WuRHDK0/yhs6c/aZdV5kI4yFjgirDAB54MA/UPYd1aI4zaLNubB8a
         k5zQapT3EPCHOJVfdOk8jI0KjvPU8Eyo9zUUluYQ+kaxSmXLo7khBnptGRQ+ryi0Gi+I
         2T2rRSwDZfPzLKgFMstBH2GyVYwmqkw2c3dtKytjORnq8utXSKV2Y4cKaDxCcKTn7VI2
         Wuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLi/vOls/z7nS3eGqX7rMELjorn1NNYYz1JfosiuO3Y=;
        b=TeC+dfRQ4STOxljohTQmX6OmqNY2yBEhkJzsev8tdzBtfF6+wvLfSNDuJ0KBNBb26B
         JvEq4lLXSYII0rM6XzJALvWDgS9CElx/upl38X+0LRntK0dlCfq63ylDOWjUoyuE0b2t
         qsRxZwGXmLt33H19quZksiBwiTtSg8xvBFhQ30bqYSdqKyks713SjvrDKE4ZDyQR8mlo
         ydwa3DioQYV86+xmvppm3qupUkERmHNSVAqzMTIfS/OebzsElnaUgl4gD8nI1kfuXMCP
         odKBuLptJakqnPBEFCH3a+6bYYOwSHxL+O5NwVwNJFy3H6j9lhNmqf2Wfj+Obtsw0dxB
         4feA==
X-Gm-Message-State: AOAM532NBAP8s1GE9EiVe41R2Zo3aEoa8AVaheFbEk1A50hpZBdMtw+F
	ivDwooTh4YNpT1/we/21eqI+7FL9x6yH3YfpaSgWQGjj
X-Google-Smtp-Source: 
 ABdhPJw1r6z6IRmioyMWJVUUhMwCYulcfku2oZ1/BXQHpvrCjYfeBohztc76P/svCyCiiWOd0iLqnoEdGBKCdR/u98Q=
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr25731000qtk.227.1635701921940;
 Sun, 31 Oct 2021 10:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211031172946.3481648-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211031172946.3481648-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Oct 2021 10:38:31 -0700
Message-ID: 
 <CAMKF1sq6C0OOCH+9ff_ebp4Wqd9diA0x3c=fAJ_1D=64nX06jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libgfortran: Set GFORTRAN
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000004061605cfa98829"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 17:38:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157689

--00000000000004061605cfa98829
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 31, 2021 at 10:29 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The libgfortran configure sets FC to be $GFORTRAN. We did used to patch
> that out but rather than carry a patch to gcc, just set GFORTRAN as
> needed.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/libgfortran.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/libgfortran.inc
> b/meta/recipes-devtools/gcc/libgfortran.inc
> index 344ec5e21ef..e810146d4d1 100644
> --- a/meta/recipes-devtools/gcc/libgfortran.inc
> +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> @@ -5,6 +5,11 @@ EXTRA_OECONF_PATHS = "\
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>  "
>
> +# An arm hard float target like raspberrypi4 won't build
> +# as CFLAGS don't make it to the fortran compiler otherwise
> +# (the configure script sets FC to $GFORTRAN unconditionally)
> +export GFORTRAN = "${FC}"
> +


Is this something we will need for general Fortran programs too now ?

>
>  do_configure () {
>         for target in libbacktrace libgfortran
>         do
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157688):
> https://lists.openembedded.org/g/openembedded-core/message/157688
> Mute This Topic: https://lists.openembedded.org/mt/86722000/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000004061605cfa98829
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Oct 31, 2021 at 10:29 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The libgfortr=
an configure sets FC to be $GFORTRAN. We did used to patch<br>
that out but rather than carry a patch to gcc, just set GFORTRAN as<br>
needed.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/gcc/libgfortran.inc | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devto=
ols/gcc/libgfortran.inc<br>
index 344ec5e21ef..e810146d4d1 100644<br>
--- a/meta/recipes-devtools/gcc/libgfortran.inc<br>
+++ b/meta/recipes-devtools/gcc/libgfortran.inc<br>
@@ -5,6 +5,11 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TARGET} \<br>
=C2=A0&quot;<br>
<br>
+# An arm hard float target like raspberrypi4 won&#39;t build<br>
+# as CFLAGS don&#39;t make it to the fortran compiler otherwise<br>
+# (the configure script sets FC to $GFORTRAN unconditionally)<br>
+export GFORTRAN =3D &quot;${FC}&quot;<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Is this somethi=
ng we will need for general Fortran programs too now ?</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex" dir=3D"auto"><br>
=C2=A0do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for target in libbacktrace libgfortran<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157688): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157688" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157688</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86722000/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86722000/1997914</a><br>
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

--00000000000004061605cfa98829--

