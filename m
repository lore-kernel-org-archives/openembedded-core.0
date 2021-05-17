Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.16063.1621238848368944845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 01:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G73Q0fpy;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id p17so281587uaw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qKScywrUWZnC9jZsdRKMv98hTzwv10H4zURebSiUh9E=;
        b=G73Q0fpyLZojcuk26tAMw1iYC8XmD0FRHv694G27XLGRpm29ftF8cW6Hmbj0l+YSmK
         WhmP6OqwsHw01goS0mI5tfubN3FDvX25w/SByjSfDyS+q5F9t6tzA1se6VOiVEwj5T1D
         CsJhjLFZH85jInX7Q8oHWJNX/6wMM77usm2a1x2+3bQRX+LLmCz6OI9e66HAscGcb1i0
         zS5UpWB3hnOg7Al/ZIzId+B3uquDdmwslHUAU9eDQLPkruHGrt2QCPgyqds68bJTJs/2
         OnJtXRea7094uswugLRzGu6g7/oJn7xNIK6BUZiYnHGmVRUS3R52+9D5DnRgS9W29Af6
         QZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKScywrUWZnC9jZsdRKMv98hTzwv10H4zURebSiUh9E=;
        b=QEjWTssXUb2ouFrTLF4aQjrhlJNWt40mssnfqxj3+5iJC9Fg9wRbYY5iWH84yBEfpq
         7+aDr5SHglKJZtAEJEDHcNsJ2LonzW9lbUJlyphI7hfKN4w0vp2AqsPzPbkDKlITCk6A
         QO/BTfi4s2t5/StaV1UnKdsegJ08rlCvww+MnsT7eW1lXXJtZYgkaBMnSBUXDCMjM8EZ
         63DatGjxGIgM+GSplbbdLb1fkQI4xqveMtkFjXtREAwmtIdNs2plVGN7v9m0XWzIl5bg
         m6bAO1+9zGA3RipF45StU6hewPkXRkh0Lbzs6q1+i65pO+G9Cm9fTHwzJszJ0qjeLq23
         ii/Q==
X-Gm-Message-State: AOAM533pELHXB/Q97V6caa/q4fH1yey7Xe2i60l4kmnj0zAC1xMMQqSn
	3r6NRHPgMf0F+HpMStM6tMNqdL0jjrgJ+PnbtF8=
X-Google-Smtp-Source: ABdhPJzyKdKEXc6WleoM/CfuAWbZ12mUrrr9iq240fAJtEzrMppq4s2HCzx+jZuTRxYFa3j54pyVbm4nph3c+uX467g=
X-Received: by 2002:ab0:77c1:: with SMTP id y1mr51759193uar.89.1621238847490;
 Mon, 17 May 2021 01:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 10:07:15 +0200
Message-ID: <CANNYZj-EA8WJoysLgVwaXbg2GTAygXxQDjkA_k2vL5433NSt-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/27] libxcrypt-compat: upgrade 4.4.19 -> 4.4.20
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000099ccf405c28215fd"

--00000000000099ccf405c28215fd
Content-Type: text/plain; charset="UTF-8"

The main libxcrypt recipe was overlooked?

Alex

On Mon, 17 May 2021 at 00:33, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../libxcrypt/files/fix_cflags_handling.patch   | 17 +++++++++++++----
>  ...pat_4.4.19.bb => libxcrypt-compat_4.4.20.bb} |  0
>  meta/recipes-core/libxcrypt/libxcrypt.inc       |  2 +-
>  3 files changed, 14 insertions(+), 5 deletions(-)
>  rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.19.bb =>
> libxcrypt-compat_4.4.20.bb} (100%)
>
> diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
> b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
> index 5448fe0fa69..0772998c722 100644
> --- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
> +++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
> @@ -1,3 +1,8 @@
> +From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Fri, 30 Apr 2021 10:35:02 +0100
> +Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol
> version
> +
>  If you pass CFLAGS with a leading space, " " gets passed to popen and
> convinces
>  gcc to try and open a file called " ". This results in a confusing error
> message
>  like:
> @@ -9,8 +14,12 @@ Avoid this by stripping empty elements out of CFLAGS.
>  Upstream-Status: Submitted [
> https://github.com/besser82/libxcrypt/pull/126]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> -Index: a/build-aux/compute-symver-floor
> -===================================================================
> +---
> + build-aux/compute-symver-floor | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/build-aux/compute-symver-floor
> b/build-aux/compute-symver-floor
> +index 4ec82e1..8117342 100644
>  --- a/build-aux/compute-symver-floor
>  +++ b/build-aux/compute-symver-floor
>  @@ -36,6 +36,8 @@ sub preprocessor_check {
> @@ -20,5 +29,5 @@ Index: a/build-aux/compute-symver-floor
>  +        # Remove empty elements, particularly leading ones which cause
> issues with popen below
>  +        @CFLAGS = grep {$_} @CFLAGS;
>
> -         # We call ensure_C_locale here, not from the main section,
> -         # because this sub might not get called at all, in which
> +         # Remove empty elements, particularly leading ones which
> +         # cause issues with popen below.
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb
> b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
> similarity index 100%
> rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb
> rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> b/meta/recipes-core/libxcrypt/libxcrypt.inc
> index 694e55546f0..c16068c1614 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
>  inherit autotools pkgconfig
>
>  SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}
> <http://github.com/besser82/libxcrypt.git;branch=$%7BSRCBRANCH%7D>"
> -SRCREV = "c79119414d7e30017d7b49566e7e4ea35112bdc8"
> +SRCREV = "e73ff0137de5152e69e8abb0bd260541804dfe5a"
>  SRCBRANCH ?= "develop"
>
>  SRC_URI += "file://fix_cflags_handling.patch"
> --
> 2.30.2
>
>
> 
>
>

--00000000000099ccf405c28215fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The main libxcrypt recipe was overlooked?</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 17 May 2021 at 00:33, Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfounda=
tion.org</a>&gt;<br>
---<br>
=C2=A0.../libxcrypt/files/fix_cflags_handling.patch=C2=A0 =C2=A0| 17 +++++=
++++++++----<br>
=C2=A0...<a href=3D"http://pat_4.4.19.bb" rel=3D"noreferrer" target=3D"_bl=
ank">pat_4.4.19.bb</a> =3D&gt; <a href=3D"http://libxcrypt-compat_4.4.20.bb=
" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.20.bb</a>} |=C2=
=
=A0 0<br>
=C2=A0meta/recipes-core/libxcrypt/libxcrypt.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
=C2=A03 files changed, 14 insertions(+), 5 deletions(-)<br>
=C2=A0rename meta/recipes-core/libxcrypt/{<a href=3D"http://libxcrypt-comp=
at_4.4.19.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.19.=
bb</a> =3D&gt; <a href=3D"http://libxcrypt-compat_4.4.20.bb" rel=3D"norefer=
rer" target=3D"_blank">libxcrypt-compat_4.4.20.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b=
/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch<br>
index 5448fe0fa69..0772998c722 100644<br>
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch<br>
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch<br>
@@ -1,3 +1,8 @@<br>
+From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001<br=
>
+From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
+Date: Fri, 30 Apr 2021 10:35:02 +0100<br>
+Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol versi=
on<br>
+<br>
=C2=A0If you pass CFLAGS with a leading space, &quot; &quot; gets passed t=
o popen and convinces<br>
=C2=A0gcc to try and open a file called &quot; &quot;. This results in a c=
onfusing error message<br>
=C2=A0like:<br>
@@ -9,8 +14,12 @@ Avoid this by stripping empty elements out of CFLAGS.<br=
>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/besser82/l=
ibxcrypt/pull/126" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
besser82/libxcrypt/pull/126</a>]<br>
=C2=A0Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt;<br>
<br>
-Index: a/build-aux/compute-symver-floor<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+---<br>
+ build-aux/compute-symver-floor | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/build-aux/compute-symver-floor b/build-aux/compute-symver-fl=
oor<br>
+index 4ec82e1..8117342 100644<br>
=C2=A0--- a/build-aux/compute-symver-floor<br>
=C2=A0+++ b/build-aux/compute-symver-floor<br>
=C2=A0@@ -36,6 +36,8 @@ sub preprocessor_check {<br>
@@ -20,5 +29,5 @@ Index: a/build-aux/compute-symver-floor<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove empty elements, particularly l=
eading ones which cause issues with popen below<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 @CFLAGS =3D grep {$_} @CFLAGS;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We call ensure_C_locale here, not fro=
m the main section,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# because this sub might not get called=
 at all, in which<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove empty elements, particularly l=
eading ones which<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# cause issues with popen below.<br>
diff --git a/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compa=
t_4.4.19.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.19.b=
b</a> b/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compat_4.4.=
20.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.20.bb</a><=
br>
similarity index 100%<br>
rename from meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compat=
_4.4.19.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.19.bb=
</a><br>
rename to meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt-compat_4=
.4.20.bb" rel=3D"noreferrer" target=3D"_blank">libxcrypt-compat_4.4.20.bb</=
a><br>
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core=
/libxcrypt/libxcrypt.inc<br>
index 694e55546f0..c16068c1614 100644<br>
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSING;md5=3Dafed27=
a72ae2a8075978299eebaa1f5d \<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/besser82/libxcr=
ypt.git;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/besser82/libxcrypt.git;branch=3D${SRCBRANCH}</a>&quot;<br>
-SRCREV =3D &quot;c79119414d7e30017d7b49566e7e4ea35112bdc8&quot;<br>
+SRCREV =3D &quot;e73ff0137de5152e69e8abb0bd260541804dfe5a&quot;<br>
=C2=A0SRCBRANCH ?=3D &quot;develop&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://fix_cflags_handling.patch&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000099ccf405c28215fd--
