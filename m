Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.29750.1622364264081103561
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 01:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GRpNYet5;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id x2so4478341vss.3
        for <Openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qVyGMvZb7LfopewMgkJ80kh4qr2O9FoViKoiCkrVnOg=;
        b=GRpNYet52rfvY80GGFBvw8MFGpxNWxTs38IZqeGZa2ABFufAVl7RmlR2nDsOQCdyjO
         3rgn3DXGv9BDtZMwBQqk/+//TZ8LjH3w8j3Z1e1TdUwBwNfxOwBjvCxamVhFHfTgnzJH
         UCvCHu8vT1TN51PHqdSlZDk4i1og/t1aKWeoIqrrwrHAVFT400r/1yGHrJgUjA5p45wj
         r+SzCNrrWQwQraAhw1b2hfA7Z+xgo0DBtNrBPn10aT7ofvL5sCGqpnVIppJxMT4opy9M
         LqRXYJR+bAyBEtD7ilN14I3JJv/eZKIJkgfh6l27duOeI+r5SGqcfgjNSfv2pCYiZ4pE
         Tacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qVyGMvZb7LfopewMgkJ80kh4qr2O9FoViKoiCkrVnOg=;
        b=eUR1e3AeTVinhl4iCCW1u/EB55+k8g1pwlDKo1Ua1hAbjZzchhEmxZPdVuUjeJaOHE
         cDaq08n8qRj8Alss/kxHfa9HbF7McnDtlr7oUTQuqi0eXyovPlz5491/xc/pyDsS/Fcj
         TS+8fZEBS8wqQPoW+bNFcNxZY7tqpKs+rSpgyID0QS8V955jCzrLUaQxxR1oVV0nbM06
         gxGx3S7rYFWz0a2W/2Hd0ujWLSAnAjC/71gVOSK7Qnd/o1wbb4Ie4kwZwr55gODPM0WC
         HIVcgv47ZSo72e+PEMiIdAXfsTSsAwgCTvRDAXFn3nAfbp1+jsJD8BOem95JmjIZp5Zn
         HW7Q==
X-Gm-Message-State: AOAM532Fe1eTkjLJkhtkJylqXwhvEfky+JGSR6HHiRdV/Ea0QBEDQFoD
	cERhjBfuX/CFQB+cw//M6x0COaPMZAoa3m1+Tmw=
X-Google-Smtp-Source: ABdhPJzA1Ds0rnWpyBar4Sl88XNRitEHYqoEWpUmWsvfYkSy2Bhpks8CgKJHztW+qePunY2nuXb0DUC0xn+Ub0Pnyqg=
X-Received: by 2002:a67:1502:: with SMTP id 2mr11571999vsv.54.1622364262937;
 Sun, 30 May 2021 01:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkP+bH=9Hd3uuE3qEMkf6Zy-rj9=kFZ+89spQ=jOwkm0huQ@mail.gmail.com>
In-Reply-To: <CABKMkP+bH=9Hd3uuE3qEMkf6Zy-rj9=kFZ+89spQ=jOwkm0huQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 30 May 2021 10:44:11 +0200
Message-ID: <CANNYZj8zYKmX83eex-QS7=6GEbABv=HwvcG0VW9gP4jGDx=L2Q@mail.gmail.com>
Subject: Re: [OE-core] [yocto][poky][master][PATCH} VirGL: depends on virtual/gbm
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000096b60c05c3881d4a"

--00000000000096b60c05c3881d4a
Content-Type: text/plain; charset="UTF-8"

This needs to be submitted using 'git send-email', rather than manually
copy pasted into the email body.

Alex

On Sat, 29 May 2021 at 02:44, Joel Winarske <joel.winarske@gmail.com> wrote:

> This addresses cases where the platform doesn't depend on Mesa.  The
> NVIDIA Tegra is one example.
>
> From 427d6248379bf37f5522d4bb1013b8c0b7a26b5b Mon Sep 17 00:00:00 2001
> From: Joel Winarske <joel.winarske@gmail.com>
> Date: Fri, 28 May 2021 12:10:46 -0700
> Subject: [PATCH] VirGL depends on gbm.h
>
> Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
> ---
>  meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
> b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
> index 3991895823..65bd1af942 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "https://virgil3d.github.io/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
>
> -DEPENDS = "libdrm virtual/libgl libepoxy"
> +DEPENDS = "libdrm virtual/libgl virtual/libgbm libepoxy"
>  SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
>  SRC_URI = "git://
> anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1 \
>             file://0001-meson.build-use-python3-directly-for-python.patch \
> --
> 2.30.2
>
>
>
> 
>
>

--00000000000096b60c05c3881d4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This needs to be submitted using &#39;git send-email&=
#39;, rather than manually copy pasted into the email body.</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, 29 May 2021 at 02:44, Joel Winarske &lt;<a =
href=3D"mailto:joel.winarske@gmail.com">joel.winarske@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr">This addresses cases where the platform doesn&#39;t depend on Mesa.=C2=
=
=A0 The NVIDIA Tegra is one example.<br><br>From 427d6248379bf37f5522d4bb1=
013b8c0b7a26b5b Mon Sep 17 00:00:00 2001<br>From: Joel Winarske &lt;<a href=
=
=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.=
com</a>&gt;<br>Date: Fri, 28 May 2021 12:10:46 -0700<br>Subject: [PATCH] Vi=
rGL depends on gbm.h<br><br>Signed-off-by: Joel Winarske &lt;<a href=3D"mai=
lto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.com</a>&=
gt;<br>---<br>=C2=A0meta/recipes-graphics/virglrenderer/<a href=3D"http://v=
irglrenderer_0.9.1.bb" target=3D"_blank">virglrenderer_0.9.1.bb</a> | 2 +-<=
br>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/=
meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0.9.1.b=
b" target=3D"_blank">virglrenderer_0.9.1.bb</a> b/meta/recipes-graphics/vir=
glrenderer/<a href=3D"http://virglrenderer_0.9.1.bb" target=3D"_blank">virg=
lrenderer_0.9.1.bb</a><br>index 3991895823..65bd1af942 100644<br>--- a/meta=
/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0.9.1.bb" t=
arget=3D"_blank">virglrenderer_0.9.1.bb</a><br>+++ b/meta/recipes-graphics/=
virglrenderer/<a href=3D"http://virglrenderer_0.9.1.bb" target=3D"_blank">v=
irglrenderer_0.9.1.bb</a><br>@@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"=
https://virgil3d.github.io/" target=3D"_blank">https://virgil3d.github.io/<=
/a>&quot;<br>=C2=A0LICENSE =3D &quot;MIT&quot;<br>=C2=A0LIC_FILES_CHKSUM =
=3D &quot;file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76db10&quot;<br>=
=C2=A0<br>-DEPENDS =3D &quot;libdrm virtual/libgl libepoxy&quot;<br>+DEPEN=
DS =3D &quot;libdrm virtual/libgl virtual/libgbm libepoxy&quot;<br>=C2=A0SR=
CREV =3D &quot;363915595e05fb252e70d6514be2f0c0b5ca312b&quot;<br>=C2=A0SRC_=
URI =3D &quot;git://<a href=3D"http://anongit.freedesktop.org/virglrenderer=
;branch=3Dbranch-0.9.1" target=3D"_blank">anongit.freedesktop.org/virglrend=
erer;branch=3Dbranch-0.9.1</a> \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://0001-meson.build-use-python3-directly-for-python.patch \<br>-- =
<br>2.30.2<br><br><br></div>
<br>
<br>
<br>
</blockquote></div>

--00000000000096b60c05c3881d4a--
