Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.248.1585601806326103333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 13:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nX3XGitz;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id g24so6866150uan.10
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 13:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30IzMOxn7Xux2Lky2llfBxamBrlER7d0eri7w6hWDVg=;
        b=nX3XGitzPQK9qSfwI2JlYSvLcSBuuoCl+7SgAPDrKQjtP2DJ316MVhZLg35x9NuUii
         VteiSR6yrocuvgBQyGda5TMDZoyuEnDtYCgP+lq23ZXy8wTiAWvGezmElAj7keMKHP+N
         ogA8lbM2NE6cF3W+HDJJCX6fq+BmmLfVWoy6lFtN79D5mGmbMfflbYxyN3Oo7dN/1x4w
         LYRv1GFH4/+XpR6cbEMHyZ1S4IA9GcFn9q1T1lIBOo2pE5/Dpcwf+WVIKm0TTgt3LEF4
         JsSM2awd85gd6ZWbUb/Upq+khWb+W5Ha/G9KzZwTEN1gkqCopTmyT8dJedM0znIXuXue
         3IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30IzMOxn7Xux2Lky2llfBxamBrlER7d0eri7w6hWDVg=;
        b=dsxGcK2K2ilVb/FY0cv+H7KrstGaK9bDLN0xbarxEAnv64Lo/nuyD6V7eyuDv6YuiT
         69djRpRd6LvUCYukLAMQLzQUjrN81JQ/2IY2jBsHZ1bNi5LvAL8QHcFGAfHkVc8ZFj4b
         adKE+RPKnbpCoRGcT62fXi90uFZvm93jedJHuzR7exlmlOMelgTgCus8tuHLprRK6ajx
         qdYwhny+3ldPLORRuEJGSvfVFkuHiBufRBxfC74BIWqpVIi6yP2SQGZCulD5cFuALCqM
         IhGahj6OXi0OxQ/kilT2sF4W7SrNdm+bzS86qhV6DuIezP9qXdnbcue5tWb2bemzJnL5
         Y+2A==
X-Gm-Message-State: AGi0PubgU4vGbtMyEtD5SC7cMyTOn6eCA4r5owit410JR2dtqIIpr3CV
	yWZoGGWHWBQ/9ebH4rFK6AI6fjF2nPNTpthTwts=
X-Google-Smtp-Source: APiQypJo6nxn+BEvG9Ara+QZRaCdTEljArTkSyJeMRCny797r2A/L97rBMV6tSVuZ2Kmi9aE3hIaQgeJXtZkHRTXtKs=
X-Received: by 2002:ab0:718b:: with SMTP id l11mr10316613uao.100.1585601805419;
 Mon, 30 Mar 2020 13:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200330094111.979870-1-matthias.schoepfer@googlemail.com>
 <CANNYZj8X=mLp4M0oAcq8PjDFMFV+9zUmNUcCJsrQv7-Pm+F-kg@mail.gmail.com> <8385350d-69a5-60aa-3a24-5e6e644f691b@googlemail.com>
In-Reply-To: <8385350d-69a5-60aa-3a24-5e6e644f691b@googlemail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 30 Mar 2020 22:56:34 +0200
Message-ID: <CANNYZj-VnhisVxLEmRRtk02n+VYRnW4b3W0BdXfNE-v5WzX2Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: fixing bpo-36852 patch for builds on i686 architecture
To: =?UTF-8?Q?Matthias_Sch=C3=B6pfer?= <matthias.schoepfer@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005e090305a218b0b3"

--0000000000005e090305a218b0b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, I didn't notice it modifies an existing patch. No problem then.

Alex

On Mon, 30 Mar 2020 at 15:24, Matthias Sch=C3=B6pfer <
matthias.schoepfer@googlemail.com> wrote:

> Hi Alex,
>
> it is already added, it patches an existing patch. Please see
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtoo=
ls/python/python3_3.8.2.bb
>
> line 24.
>
> Or what am I missing here?!
>
> Regards,
>
>    Matthias
>
> On 3/30/20 11:43 AM, Alexander Kanavin wrote:
> > The patch is not added to the recipe (please test the build after you =
do
> > that).
> >
> > Alex
> >
> > On Mon, 30 Mar 2020 at 11:41, Matthias Schoepfer via
> > Lists.Openembedded.Org <http://Lists.Openembedded.Org>
> > <matthias.schoepfer=3Dgooglemail.com@lists.openembedded.org
> > <mailto:googlemail.com@lists.openembedded.org>> wrote:
> >
> >     From: Matthias Schoepfer <matthias.schoepfer@ithinx.io
> >     <mailto:matthias.schoepfer@ithinx.io>>
> >
> >     The original patch "bpo-36852: proper detection of mips architectu=
re
> >     for soft float" uses AC_CANONICAL_TARGET to determine the platform
> >     triplet. While AC_CANONICAL_TARGET exports i686 as target_cpu, gcc
> >     is using i386 instead. We fall back here to i386, as it is conform
> >     to the previous behavior.
> >
> >     Upstream Status: Submitted
> >     [https://github.com/python/cpython/pull/13196]
> >
> >     Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io
> >     <mailto:matthias.schoepfer@ithinx.io>>
> >     ---
> >       ...-detection-of-mips-architecture-for-.patch | 20
> +++++++++++++------
> >       1 file changed, 14 insertions(+), 6 deletions(-)
> >
> >     diff --git
> >
>  a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch
> >
>  b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch
> >     index fe0aa8aabe..c4fae09a5b 100644
> >     ---
> >
>  a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch
> >     +++
> >
>  b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch
> >     @@ -1,4 +1,4 @@
> >     -From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00
> 2001
> >     +From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00
> 2001
> >       From: Matthias Schoepfer <matthias.schoepfer@ithinx.io
> >     <mailto:matthias.schoepfer@ithinx.io>>
> >       Date: Fri, 31 May 2019 15:34:34 +0200
> >       Subject: [PATCH] bpo-36852: proper detection of mips architectur=
e
> >     for soft
> >     @@ -13,15 +13,16 @@ to do this in a more autoconf/autotools manner=
.
> >       Upstream-Status: Submitted
> >     [https://github.com/python/cpython/pull/13196]
> >       Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io
> >     <mailto:matthias.schoepfer@ithinx.io>>
> >
> >     +%% original patch:
> >     0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> >       ---
> >     - configure.ac <http://configure.ac> | 171
> >     +++++----------------------------------------------
> >     - 1 file changed, 17 insertions(+), 154 deletions(-)
> >     + configure.ac <http://configure.ac> | 175
> >     +++++++--------------------------------------------
> >     + 1 file changed, 21 insertions(+), 154 deletions(-)
> >
> >       diff --git a/configure.ac <http://configure.ac> b/configure.ac
> >     <http://configure.ac>
> >     -index 0f85486..0ca7e24 100644
> >     +index ede710e..bc81b0b 100644
> >       --- a/configure.ac <http://configure.ac>
> >       +++ b/configure.ac <http://configure.ac>
> >     -@@ -704,160 +704,23 @@ fi
> >     +@@ -710,160 +710,27 @@ fi
> >        MULTIARCH=3D$($CC --print-multiarch 2>/dev/null)
> >        AC_SUBST(MULTIARCH)
> >
> >     @@ -193,9 +194,16 @@ index 0f85486..0ca7e24 100644
> >       +      PLATFORM_TRIPLET=3Dvxworks
> >       +      ;;
> >       +     *)
> >     -+      PLATFORM_TRIPLET=3D${target_cpu}-${target_os}
> >     ++        if test "${target_cpu}" !=3D "i686"; then
> >     ++              PLATFORM_TRIPLET=3D${target_cpu}-${target_os}
> >     ++      else
> >     ++              PLATFORM_TRIPLET=3Di386-${target_os}
> >     ++      fi
> >       +      ;;
> >       +esac
> >
> >        if test x$PLATFORM_TRIPLET !=3D x && test x$MULTIARCH !=3D x; t=
hen
> >          if test x$PLATFORM_TRIPLET !=3D x$MULTIARCH; then
> >     +--
> >     +2.24.1
> >     +
> >     --
> >     2.24.1
> >
> >    =20
> >
>
>
> --
>
> Dr.-Ing. Matthias Schoepfer
> Mobile: +49 175 2062739
> email: matthias.schoepfer@googlemail.com
>

--0000000000005e090305a218b0b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I didn&#39;t notice it modifies an existing pa=
tch. No problem then.</div><div><br></div><div>Alex<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 30 Mar=
 2020 at 15:24, Matthias Sch=C3=B6pfer &lt;<a href=3D"mailto:matthias.schoe=
pfer@googlemail.com">matthias.schoepfer@googlemail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
it is already added, it patches an existing patch. Please see<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recip=
es-devtools/python/python3_3.8.2.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/p=
ython/python3_3.8.2.bb</a><br>
<br>
line 24.<br>
<br>
Or what am I missing here?!<br>
<br>
Regards,<br>
<br>
=C2=A0 =C2=A0Matthias<br>
<br>
On 3/30/20 11:43 AM, Alexander Kanavin wrote:<br>
&gt; The patch is not added to the recipe (please test the build after you=
 do <br>
&gt; that).<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Mon, 30 Mar 2020 at 11:41, Matthias Schoepfer via <br>
&gt; <a href=3D"http://Lists.Openembedded.Org" rel=3D"noreferrer" target=
=3D"_blank">Lists.Openembedded.Org</a> &lt;<a href=3D"http://Lists.Openemb=
edded.Org" rel=3D"noreferrer" target=3D"_blank">http://Lists.Openembedded.O=
rg</a>&gt; <br>
&gt; &lt;matthias.schoepfer=3D<a href=3D"mailto:googlemail.com@lists.opene=
mbedded.org" target=3D"_blank">googlemail.com@lists.openembedded.org</a> <b=
r>
&gt; &lt;mailto:<a href=3D"mailto:googlemail.com@lists.openembedded.org" t=
arget=3D"_blank">googlemail.com@lists.openembedded.org</a>&gt;&gt; wrote:<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Matthias Schoepfer &lt;<a href=3D"mailto:mat=
thias.schoepfer@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:matthias.schoepfer@it=
hinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The original patch &quot;bpo-36852: proper detecti=
on of mips architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0for soft float&quot; uses AC_CANONICAL_TARGET to d=
etermine the platform<br>
&gt;=C2=A0 =C2=A0 =C2=A0triplet. While AC_CANONICAL_TARGET exports i686 as=
 target_cpu, gcc<br>
&gt;=C2=A0 =C2=A0 =C2=A0is using i386 instead. We fall back here to i386, =
as it is conform<br>
&gt;=C2=A0 =C2=A0 =C2=A0to the previous behavior.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Upstream Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://github.com/python/cpython/pull=
/13196" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/cpyt=
hon/pull/13196</a>]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Matthias Schoepfer &lt;<a href=3D"m=
ailto:matthias.schoepfer@ithinx.io" target=3D"_blank">matthias.schoepfer@it=
hinx.io</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:matthias.schoepfer@it=
hinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...-detection-of-mips-architecture-for-.pat=
ch | 20 +++++++++++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 14 insertions(+), 6 deletio=
ns(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/python3/0001-bpo-36=
852-proper-detection-of-mips-architecture-for-.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/python/python3/0001-bpo-36=
852-proper-detection-of-mips-architecture-for-.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index fe0aa8aabe..c4fae09a5b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/python3/0001-bpo-36=
852-proper-detection-of-mips-architecture-for-.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/python/python3/0001-bpo-36=
852-proper-detection-of-mips-architecture-for-.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon=
 Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon=
 Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0From: Matthias Schoepfer &lt;<a href=3D"mai=
lto:matthias.schoepfer@ithinx.io" target=3D"_blank">matthias.schoepfer@ithi=
nx.io</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:matthias.schoepfer@it=
hinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Date: Fri, 31 May 2019 15:34:34 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Subject: [PATCH] bpo-36852: proper detectio=
n of mips architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0for soft<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -13,15 +13,16 @@ to do this in a more autoconf/=
autotools manner.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Upstream-Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://github.com/python/cpython/pull=
/13196" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/cpyt=
hon/pull/13196</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Matthias Schoepfer &lt;<a hr=
ef=3D"mailto:matthias.schoepfer@ithinx.io" target=3D"_blank">matthias.schoe=
pfer@ithinx.io</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:matthias.schoepfer@it=
hinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+%% original patch:<br>
&gt;=C2=A0 =C2=A0 =C2=A00001-bpo-36852-proper-detection-of-mips-architectu=
re-for-.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0- <a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt; | 171<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++---------------------------------------------=
-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 1 file changed, 17 insertions(+), 154 deletions(=
-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ <a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt; | 175<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++-------------------------------------------=
-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 21 insertions(+), 154 deletions(=
-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http=
://configure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</=
a>&gt; b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blan=
k">configure.ac</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://configure.ac" rel=3D"norefer=
rer" target=3D"_blank">http://configure.ac</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 0f85486..0ca7e24 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index ede710e..bc81b0b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://c=
onfigure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://c=
onfigure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -704,160 +704,23 @@ fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -710,160 +710,27 @@ fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 MULTIARCH=3D$($CC --print-multiarch 2&gt;/=
dev/null)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(MULTIARCH)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -193,9 +194,16 @@ index 0f85486..0ca7e24 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 PLATFORM_TRIPLET=3Dvx=
works<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 PLATFORM_TRIPLET=3D${target=
_cpu}-${target_os}<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;${targ=
et_cpu}&quot; !=3D &quot;i686&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 PLATFORM_TRIPLET=3D${target_cpu}-${target_os}<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 PLATFORM_TRIPLET=3Di386-${target_os}<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+esac<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test x$PLATFORM_TRIPLET !=3D x &amp;&am=
p; test x$MULTIARCH !=3D x; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test x$PLATFORM_TRIPLET !=3D x$M=
ULTIARCH; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.24.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.24.1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
<br>
<br>
-- <br>
<br>
Dr.-Ing. Matthias Schoepfer<br>
Mobile: +49 175 2062739<br>
email: <a href=3D"mailto:matthias.schoepfer@googlemail.com" target=3D"_bla=
nk">matthias.schoepfer@googlemail.com</a><br>
</blockquote></div>

--0000000000005e090305a218b0b3--
