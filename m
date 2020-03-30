Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.46613.1585561394988692024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 02:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kmgm/cwJ;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id x206so10588603vsx.5
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gq/oelJhqoO+KaDhXyQghtRAmFVM+aPiTPo2cCAARoQ=;
        b=Kmgm/cwJpsZaKAA2WPcPNp1UXPiUjIFgnS2Q8Fo0MaZ9aEi/TvgXxfm5ksjjSGzcMg
         R6oAu5EPAacTXNWXAzH/udI7MKhcBY3Petw9HhBQlzQHMyKHx2hZlG9ESb91r4IQxbTm
         S9gCSni/A9FabM2F8p50CVEOpG1YzHYuUlMX5TFl6A7C3Q7PY+qfuo1p8SJw/IYz0kKU
         hS1mkruqpl88rWJmTOTgJYx/NXqUy4v9u62UuJu0m2/OtBaod+UU63/YRb6dB+yK89Py
         c5kWwF1J7nibrb667J2ed1Tv1i/MMrqaFW8o1gCqqGdJH30+UyubedI5GXbhcG5U8ZAl
         OqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gq/oelJhqoO+KaDhXyQghtRAmFVM+aPiTPo2cCAARoQ=;
        b=gc3KUd6oQorv37UKnAwkWsaC/tcfShmHuJVp0QPK2PVmScuT6zY3ud2HaMfKGNWReE
         scCzsMHYK1IZA1vFllsPTfB9fxp51QrTSAhaVbNfrANJRNWr6B5IHs1JdGmxTWGI7tAO
         y6G2Mf1Ylc8zocGn88gUOMOmaPWLJoTkIjn0M5UzxFH1Um9UrUP8F5ZnOKgZBPWRplc8
         b9p9mqBwUGzwaPp3chfCt2aaVyW78lfLHIHR1VLi4W6xG83UpsrjSgYbHvFV0QwWarOY
         Nxjo7AO697Ho8HT0i0Lgm4DwDCaZgwpgCBFNNrbkUvFGYURvOQl4WBMcsRazKG9bwA0M
         zT2Q==
X-Gm-Message-State: AGi0PuZ/SHpX8thZpkTrwA8hqhn3sNoPygyqexA61qBwV2R05jvp0XR6
	mIEg8ZmMgv47u00i2bU6nppclLzGX46m7h1yqNY=
X-Google-Smtp-Source: APiQypI79u9q6AfK3hd83J8GrP42IoTBvrAuCnOh/WigpFsvIYAswe67I4jb1ZIGw7R6spLuZR9maeCAwC7CeZmxN6I=
X-Received: by 2002:a05:6102:31b7:: with SMTP id d23mr7497545vsh.25.1585561394174;
 Mon, 30 Mar 2020 02:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200330094111.979870-1-matthias.schoepfer@googlemail.com>
In-Reply-To: <20200330094111.979870-1-matthias.schoepfer@googlemail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 30 Mar 2020 11:43:03 +0200
Message-ID: <CANNYZj8X=mLp4M0oAcq8PjDFMFV+9zUmNUcCJsrQv7-Pm+F-kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: fixing bpo-36852 patch for builds on i686 architecture
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ab5f2a05a20f4799"

--000000000000ab5f2a05a20f4799
Content-Type: text/plain; charset="UTF-8"

The patch is not added to the recipe (please test the build after you do
that).

Alex

On Mon, 30 Mar 2020 at 11:41, Matthias Schoepfer via Lists.Openembedded.Org
<matthias.schoepfer=googlemail.com@lists.openembedded.org> wrote:

> From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>
> The original patch "bpo-36852: proper detection of mips architecture
> for soft float" uses AC_CANONICAL_TARGET to determine the platform
> triplet. While AC_CANONICAL_TARGET exports i686 as target_cpu, gcc
> is using i386 instead. We fall back here to i386, as it is conform
> to the previous behavior.
>
> Upstream Status: Submitted [https://github.com/python/cpython/pull/13196]
>
> Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> ---
>  ...-detection-of-mips-architecture-for-.patch | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> index fe0aa8aabe..c4fae09a5b 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> @@ -1,4 +1,4 @@
> -From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 2001
> +From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001
>  From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>  Date: Fri, 31 May 2019 15:34:34 +0200
>  Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
> @@ -13,15 +13,16 @@ to do this in a more autoconf/autotools manner.
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
>  Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>
> +%% original patch:
> 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
>  ---
> - configure.ac | 171 +++++----------------------------------------------
> - 1 file changed, 17 insertions(+), 154 deletions(-)
> + configure.ac | 175 +++++++--------------------------------------------
> + 1 file changed, 21 insertions(+), 154 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 0f85486..0ca7e24 100644
> +index ede710e..bc81b0b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -704,160 +704,23 @@ fi
> +@@ -710,160 +710,27 @@ fi
>   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
>   AC_SUBST(MULTIARCH)
>
> @@ -193,9 +194,16 @@ index 0f85486..0ca7e24 100644
>  +      PLATFORM_TRIPLET=vxworks
>  +      ;;
>  +     *)
> -+      PLATFORM_TRIPLET=${target_cpu}-${target_os}
> ++        if test "${target_cpu}" != "i686"; then
> ++              PLATFORM_TRIPLET=${target_cpu}-${target_os}
> ++      else
> ++              PLATFORM_TRIPLET=i386-${target_os}
> ++      fi
>  +      ;;
>  +esac
>
>   if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
>     if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
> +--
> +2.24.1
> +
> --
> 2.24.1
>
> 
>

--000000000000ab5f2a05a20f4799
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch is not added to the recipe (please test the=
 build after you do that).</div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 3=
0 Mar 2020 at 11:41, Matthias Schoepfer via <a href=3D"http://Lists.Openemb=
edded.Org">Lists.Openembedded.Org</a> &lt;matthias.schoepfer=3D<a href=3D"m=
ailto:googlemail.com@lists.openembedded.org">googlemail.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.schoepfer@it=
hinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
<br>
The original patch &quot;bpo-36852: proper detection of mips architecture<=
br>
for soft float&quot; uses AC_CANONICAL_TARGET to determine the platform<br=
>
triplet. While AC_CANONICAL_TARGET exports i686 as target_cpu, gcc<br>
is using i386 instead. We fall back here to i386, as it is conform<br>
to the previous behavior.<br>
<br>
Upstream Status: Submitted [<a href=3D"https://github.com/python/cpython/p=
ull/13196" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/c=
python/pull/13196</a>]<br>
<br>
Signed-off-by: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.schoepfer=
@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
---<br>
=C2=A0...-detection-of-mips-architecture-for-.patch | 20 +++++++++++++----=
--<br>
=C2=A01 file changed, 14 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-de=
tection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/pyth=
on3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch<br>
index fe0aa8aabe..c4fae09a5b 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection=
-of-mips-architecture-for-.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection=
-of-mips-architecture-for-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 2001<br=
>
+From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.schoepfer@it=
hinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
=C2=A0Date: Fri, 31 May 2019 15:34:34 +0200<br>
=C2=A0Subject: [PATCH] bpo-36852: proper detection of mips architecture fo=
r soft<br>
@@ -13,15 +13,16 @@ to do this in a more autoconf/autotools manner.<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpy=
thon/pull/13196" rel=3D"noreferrer" target=3D"_blank">https://github.com/py=
thon/cpython/pull/13196</a>]<br>
=C2=A0Signed-off-by: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.sch=
oepfer@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br=
>
<br>
+%% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-f=
or-.patch<br>
=C2=A0---<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> | 171 +++++----------------------------------------------<br>
- 1 file changed, 17 insertions(+), 154 deletions(-)<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> | 175 +++++++--------------------------------------------<br>
+ 1 file changed, 21 insertions(+), 154 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
-index 0f85486..0ca7e24 100644<br>
+index ede710e..bc81b0b 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
-@@ -704,160 +704,23 @@ fi<br>
+@@ -710,160 +710,27 @@ fi<br>
=C2=A0 MULTIARCH=3D$($CC --print-multiarch 2&gt;/dev/null)<br>
=C2=A0 AC_SUBST(MULTIARCH)<br>
<br>
@@ -193,9 +194,16 @@ index 0f85486..0ca7e24 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 PLATFORM_TRIPLET=3Dvxworks<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0*)<br>
-+=C2=A0 =C2=A0 =C2=A0 PLATFORM_TRIPLET=3D${target_cpu}-${target_os}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;${target_cpu}&quot; !=3D &quot=
;i686&quot;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM_TRIPLET=3D${ta=
rget_cpu}-${target_os}<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM_TRIPLET=3Di386=
-${target_os}<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0+esac=C2=A0 <br>
<br>
=C2=A0 if test x$PLATFORM_TRIPLET !=3D x &amp;&amp; test x$MULTIARCH !=3D =
x; then<br>
=C2=A0 =C2=A0 if test x$PLATFORM_TRIPLET !=3D x$MULTIARCH; then<br>
+-- <br>
+2.24.1<br>
+<br>
-- <br>
2.24.1<br>
<br>
<br>
</blockquote></div>

--000000000000ab5f2a05a20f4799--
