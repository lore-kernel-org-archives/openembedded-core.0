Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.2965.1614026379953723628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 12:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PkCR+6an;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id x198so6258541vsc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 12:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=591j6duAmnKA4T9TMqrQcGyhDegJOHqD/iINcrhrmvY=;
        b=PkCR+6anXy62gbreHmteBQka7TNTgyyoNi24Z2gZ+xXBQ1nVcl5Hi+e8obaMqoTCB3
         kivXggmqMPO3pL44kqZTNrtZ+eVvyuu6uMW2XNuJR8Hy4+0GkWu6sHm0Kg91OMDOEg0W
         nFyCobdmN8LC0svVgxfJDoVXj2kXHT/hHXaRJUeZlKodfUsKG3bavOXUnfU2USQnAp8T
         dzH/L41wKz+sZLywU3y45opdG1/g7g1Q+2miBvMc1y2x+DwwRn1Rm/zVMtQyrOz+U5VF
         AHasjGQ9jeQPoHL8xDVqEIFWxyr0lEMjGNrBvfquggnX7ot3ubGc9kULErmp7cR7A+3O
         FQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=591j6duAmnKA4T9TMqrQcGyhDegJOHqD/iINcrhrmvY=;
        b=G2RvPMo6zqT/chBR2Nch4nysVNuCoA/AxsEzc3Ep3MgU8O+pirQtOe7uxU8J3+oSja
         JI0IH4SYZUe5zyfm2EaIfofSSmiLydUKDwZp7ZBTtAF6xPXIdLeRod+0k4Rr9z2GqNwq
         9Fc7o2BetaXvqTJVNWAM/wU/ipYT5Y09JoyoNbracbCgPaNG3JO3XUvEx3wqEBuQAM3f
         7eycOHDQq1gtIYLJhZ/q4Eq/jEdaptQY1j2w5G34gyiS8TNiPwBt/bmJYm6N1dRM+QJC
         30VJGsygyJZ14zkt7x2QuxhBeroZgCSKOMFF1Swk7m9ML3e+EV9CR6/HGtQG073pJic7
         ogQw==
X-Gm-Message-State: AOAM530rCinFynj/VUx9VCGLWDmeR2u6Nw1Pw329ZULApU+iuFTSfxiY
	nBaZYjDaaVhAxtT/uov//ncc6VORufx78FHeN1g=
X-Google-Smtp-Source: ABdhPJwAf0M8Z4XTOrjvLCkR6xJ5YdmDUolflQ+GnmTorSmK62v+1Cf/mIYPLfEh7y70CmhyO3vyGZr13/1F8RJMFI8=
X-Received: by 2002:a67:2d07:: with SMTP id t7mr162032vst.20.1614026379118;
 Mon, 22 Feb 2021 12:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20210214084905.3353606-1-raj.khem@gmail.com> <54bd9d57-d197-7a67-6793-8b0800715362@windriver.com>
In-Reply-To: <54bd9d57-d197-7a67-6793-8b0800715362@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Feb 2021 21:39:27 +0100
Message-ID: <CANNYZj95gnx7fvXZ-Ox3ic47zDxavKHE2yg_bVVTHBgTrBcTnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: Update to 1.15.8
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc4ceb05bbf2cc29"

--000000000000fc4ceb05bbf2cc29
Content-Type: text/plain; charset="UTF-8"

This may take time to prepare, and freeze is getting close, so I'd rather
take the minor update now.

Alex

On Mon, 22 Feb 2021 at 21:18, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2021-02-14 3:49 a.m., Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
> >   ...{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >   rename meta/recipes-devtools/go/{go-binary-native_1.15.6.bb =>
> go-binary-native_1.15.8.bb} (83%)
> >
> > diff --git a/meta/recipes-devtools/go/go-1.15.inc
> b/meta/recipes-devtools/go/go-1.15.inc
> > index abe74e5eb7..7c8190f68c 100644
> > --- a/meta/recipes-devtools/go/go-1.15.inc
> > +++ b/meta/recipes-devtools/go/go-1.15.inc
> > @@ -1,7 +1,7 @@
> >   require go-common.inc
> >
> >   GO_BASEVERSION = "1.15"
>
> Khem,
>
> go-1.16 was released on: 2021/02/16
>    https://golang.org/doc/devel/release.html#go1.16
>
> Should we update for oe-core-3.3?
>
> ../Randy
>
> > -PV = "1.15.6"
> > +PV = "1.15.8"
> >   FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> >
> >   LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > @@ -16,4 +16,4 @@ SRC_URI += "\
> >       file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> >       file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> >   "
> > -SRC_URI[main.sha256sum] =
> "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
> > +SRC_URI[main.sha256sum] =
> "540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2"
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
> b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> > similarity index 83%
> > rename from meta/recipes-devtools/go/go-binary-native_1.15.6.bb
> > rename to meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> > index 622557ad2b..df697e2781 100644
> > --- a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
> > +++ b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> >   PROVIDES = "go-native"
> >
> >   SRC_URI = "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}
> "
> > -SRC_URI[go_linux_amd64.sha256sum] =
> "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844"
> > -SRC_URI[go_linux_arm64.sha256sum] =
> "f87515b9744154ffe31182da9341d0a61eb0795551173d242c8cad209239e492"
> > +SRC_URI[go_linux_amd64.sha256sum] =
> "d3379c32a90fdf9382166f8f48034c459a8cc433730bc9476d39d9082c94583b"
> > +SRC_URI[go_linux_arm64.sha256sum] =
> "0e31ea4bf53496b0f0809730520dee98c0ae5c530f3701a19df0ba0a327bf3d2"
> >
> >   UPSTREAM_CHECK_URI = "https://golang.org/dl/"
> >   UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> >
> >
> >
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> 
>
>

--000000000000fc4ceb05bbf2cc29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This may take time to prepare, and freeze is getting =
close, so I&#39;d rather take the minor update now.</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Mon, 22 Feb 2021 at 21:18, Randy MacLeod &lt;<a href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2021-02-=
14 3:49 a.m., Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/go/go-1.15.inc=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 =
++--<br>
&gt;=C2=A0 =C2=A0...{<a href=3D"http://go-binary-native_1.15.6.bb" rel=3D"=
noreferrer" target=3D"_blank">go-binary-native_1.15.6.bb</a> =3D&gt; <a hre=
f=3D"http://go-binary-native_1.15.8.bb" rel=3D"noreferrer" target=3D"_blank=
">go-binary-native_1.15.8.bb</a>} | 4 ++--<br>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-bin=
ary-native_1.15.6.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native=
_1.15.6.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.15.8.bb" rel=3D=
"noreferrer" target=3D"_blank">go-binary-native_1.15.8.bb</a>} (83%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devt=
ools/go/go-1.15.inc<br>
&gt; index abe74e5eb7..7c8190f68c 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.15.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.15.inc<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 =C2=A0require go-common.inc<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0GO_BASEVERSION =3D &quot;1.15&quot;<br>
<br>
Khem,<br>
<br>
go-1.16 was released on: 2021/02/16<br>
=C2=A0 =C2=A0<a href=3D"https://golang.org/doc/devel/release.html#go1.16" =
rel=3D"noreferrer" target=3D"_blank">https://golang.org/doc/devel/release.h=
tml#go1.16</a><br>
<br>
Should we update for oe-core-3.3?<br>
<br>
../Randy<br>
<br>
&gt; -PV =3D &quot;1.15.6&quot;<br>
&gt; +PV =3D &quot;1.15.8&quot;<br>
&gt;=C2=A0 =C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${G=
O_BASEVERSION}:&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb=
7b26d2c5e4e7b4e0dd74707&quot;<br>
&gt; @@ -16,4 +16,4 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-cmd-go-make-GOROOT-precious-by-=
default.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-use-GOBUILDMODE-to-set-buildmod=
e.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[main.sha256sum] =3D &quot;890bba73c5e2b19ffb1180e385ea225059=
eb008eb91b694875dd86ea48675817&quot;<br>
&gt; +SRC_URI[main.sha256sum] =3D &quot;540c0ab7781084d124991321ed1458e479=
982de94454a98afab6acadf38497c2&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-nat=
ive_1.15.6.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.15.6=
.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.15.=
8.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.15.8.bb</a><b=
r>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-nati=
ve_1.15.6.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.15.6.=
bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native=
_1.15.8.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.15.8.bb=
</a><br>
&gt; index 622557ad2b..df697e2781 100644<br>
&gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.1=
5.6.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.15.6.bb</a>=
<br>
&gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.1=
5.8.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.15.8.bb</a>=
<br>
&gt; @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d495=
0ecb7b26d2c5e4e7b4e0dd74707&quot;<br>
&gt;=C2=A0 =C2=A0PROVIDES =3D &quot;go-native&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$=
%7BPV%7D.$%7BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_G=
OTUPLE%7D" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go=
${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&q=
uot;<br>
&gt; -SRC_URI[go_linux_amd64.sha256sum] =3D &quot;3918e6cc85e7eaaa6f859f1b=
dbaac772e7a825b0eb423c63d3ae68b21f84b844&quot;<br>
&gt; -SRC_URI[go_linux_arm64.sha256sum] =3D &quot;f87515b9744154ffe31182da=
9341d0a61eb0795551173d242c8cad209239e492&quot;<br>
&gt; +SRC_URI[go_linux_amd64.sha256sum] =3D &quot;d3379c32a90fdf9382166f8f=
48034c459a8cc433730bc9476d39d9082c94583b&quot;<br>
&gt; +SRC_URI[go_linux_arm64.sha256sum] =3D &quot;0e31ea4bf53496b0f0809730=
520dee98c0ae5c530f3701a19df0ba0a327bf3d2&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.or=
g/dl/" rel=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot=
;<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+=
)+)\.linux&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000fc4ceb05bbf2cc29--
