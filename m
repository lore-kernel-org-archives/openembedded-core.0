Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.1516.1616102534637413917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 14:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IAyg81CC;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w18so8482465edc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 14:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LCLZY3AJ4vQjVbanSpJLH24xeZpnQ8X/XOhKaypXoOY=;
        b=IAyg81CCJaE8p+8XFyl3LsUWUACb+AUGtp58mlLti5SIyZSF+KWJAbbgkVAeAfwS8S
         z1TPjEvUr1R75U2Y8uFP1PJRcfVWGeaUZTesQUZRCeM19eVMPFyof2YDNtTgyMlILcq9
         F1X+W+8eWuVbMhZB0VzeXcUS4XgvRle5TkDmDHro0un5vPqfGuvdlJDc7BISHVMr6xCG
         dmk7VmoF7vQL+5WONgtH64bIW/BHKPpIy+PtOKOPaBPZDTNqW0sBHDhS+pQc/J1UqE+u
         Eoj2DyAAesY3kcRRGaSfPwQxylhPuxkaL/M/61QZJcNRUiXbZ1uQp54LcrT8ukrLMnwG
         dWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCLZY3AJ4vQjVbanSpJLH24xeZpnQ8X/XOhKaypXoOY=;
        b=DJzapL9DJNRI04mIFcY0hN6SxI9SbTzkofoMWtjoWtRUoAnRiDYEm45BQsi9OVsTrE
         ESYrNp+MEzAOKVOaLsTDW2swrpkLD6av7EU0Ydjh0438inT3617h7mmcp4RQLN2GYlwf
         +uF5/QWa8uW9ddLGVlaBVxaKO5xlK1pi4/BSpVo6YT0P3NCYx4MGeLQtiZKLckGGkoPa
         Wk4g3J1iU6/sdvjFgYq0DiE1unhu5jM1m3wh7E5BCd7zmqouaClGwmEQys8lxPmIiKz3
         Pl4tWGnKgys0GGsZSdtOsIU9yyMBq+aqqLFqE74khIeGflsBH9VWbxH2L4OG6xDu6LmS
         Ihbw==
X-Gm-Message-State: AOAM531bmBBEaAFGZV2BzyaIi700PW2PEdcQHxfxgAMGyf19cw3pqQ+k
	OaSgBRY76omOtxbnzHcqyl+HTP/khjrZlJByhEU=
X-Google-Smtp-Source: ABdhPJxwI9h2UsI11FVib8lEqOpm8HFP5APv0AbdxZsUbzVMf0js3EhguL2yN7GgnBJRSjqUd/vOehCukyCRHeLyNmM=
X-Received: by 2002:a05:6402:1115:: with SMTP id u21mr6049675edv.383.1616102533040;
 Thu, 18 Mar 2021 14:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210318105712.545356-1-alex.kanavin@gmail.com>
In-Reply-To: <20210318105712.545356-1-alex.kanavin@gmail.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Thu, 18 Mar 2021 14:22:01 -0700
Message-ID: <CABcZAN=8Nj5K4P8VdSBmNr2Mor3-ZsXx7L3E8iTnSWnrQJvmwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcrypt: fix sporadic failures in nativesdk-libxcrypt-compat
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000670b2205bdd63163"

--000000000000670b2205bdd63163
Content-Type: text/plain; charset="UTF-8"

If it's been reported upstream, is Inappropriate the correct upstream
status here?

On Thu, Mar 18, 2021 at 3:57 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...e.ac-do-not-use-compute-symver-floor.patch | 32 +++++++++++++++++++
>  meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch
>
> diff --git
> a/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch
> b/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch
> new file mode 100644
> index 0000000000..4e6b427104
> --- /dev/null
> +++
> b/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch
> @@ -0,0 +1,32 @@
> +From b28bb856ccebe8fded51d11362bf5920699eed59 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 18 Mar 2021 10:52:13 +0000
> +Subject: [PATCH] configure.ac: do not use compute-symver-floor
> +
> +This script (newly introduced in 4.4.18) sporadically fails, without
> +failing configure(), which has been reported at
> +https://github.com/besser82/libxcrypt/issues/123
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + configure.ac | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 45b91b4..f3ba945 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -426,11 +426,7 @@ if test x$enable_shared != xyes; then
> enable_obsolete_api=0; fi
> + # need to be binary backward compatible with.
> + if test $enable_obsolete_api = 1; then
> +   AC_MSG_CHECKING([minimum symbol version to use for compatibility
> symbols])
> +-  SYMVER_FLOOR=$(
> +-    $PERL ${srcdir}/build-aux/compute-symver-floor \
> +-      ${srcdir}/lib/libcrypt.minver $host_os $host_cpu \
> +-    2>&AS_MESSAGE_LOG_FD
> +-  )
> ++  SYMVER_FLOOR=GLIBC_2.0
> +   AC_MSG_RESULT([$SYMVER_FLOOR])
> +   case "$SYMVER_FLOOR" in
> +     ERROR)
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> b/meta/recipes-core/libxcrypt/libxcrypt.inc
> index e9f968b556..b5ca863d54 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =
> "file://LICENSING;md5=bd5d9777dfe7076c4f2928f12fed226a \
>
>  inherit autotools pkgconfig
>
> -SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}
> <http://github.com/besser82/libxcrypt.git;branch=$%7BSRCBRANCH%7D>"
> +SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}
> <http://github.com/besser82/libxcrypt.git;branch=$%7BSRCBRANCH%7D> \
> +           file://0001-configure.ac-do-not-use-compute-symver-floor.patch
> \
> +           "
>  SRCREV = "94d84f92ca123d851586016c4678eb1f21c19029"
>  SRCBRANCH ?= "develop"
>
> --
> 2.29.2
>
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000670b2205bdd63163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If it&#39;s been reported upstream, is Inappropriate the c=
orrect upstream status here?</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 18, 2021 at 3:57 AM Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">S=
igned-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0...e.ac-do-not-use-compute-symver-floor.patch | 32 +++++++++++++++++=
++<br>
=C2=A0meta/recipes-core/libxcrypt/libxcrypt.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 4 ++-<br>
=C2=A02 files changed, 35 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-core/libxcrypt/libxcrypt-compat/0001=
-configure.ac-do-not-use-compute-symver-floor.patch<br>
<br>
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.a=
c-do-not-use-compute-symver-floor.patch b/meta/recipes-core/libxcrypt/libxc=
rypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch<br>
new file mode 100644<br>
index 0000000000..4e6b427104<br>
--- /dev/null<br>
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-no=
t-use-compute-symver-floor.patch<br>
@@ -0,0 +1,32 @@<br>
+From b28bb856ccebe8fded51d11362bf5920699eed59 Mon Sep 17 00:00:00 2001<br=
>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 18 Mar 2021 10:52:13 +0000<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a>: do not use compute-symver-floor<br>
+<br>
+This script (newly introduced in 4.4.18) sporadically fails, without<br>
+failing configure(), which has been reported at<br>
+<a href=3D"https://github.com/besser82/libxcrypt/issues/123" rel=3D"noref=
errer" target=3D"_blank">https://github.com/besser82/libxcrypt/issues/123</=
a><br>
+<br>
+Upstream-Status: Inappropriate<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> | 6 +-----<br>
+ 1 file changed, 1 insertion(+), 5 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D=
"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
+index 45b91b4..f3ba945 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a><br>
+@@ -426,11 +426,7 @@ if test x$enable_shared !=3D xyes; then enable_obsol=
ete_api=3D0; fi<br>
+ # need to be binary backward compatible with.<br>
+ if test $enable_obsolete_api =3D 1; then<br>
+=C2=A0 =C2=A0AC_MSG_CHECKING([minimum symbol version to use for compatibi=
lity symbols])<br>
+-=C2=A0 SYMVER_FLOOR=3D$(<br>
+-=C2=A0 =C2=A0 $PERL ${srcdir}/build-aux/compute-symver-floor \<br>
+-=C2=A0 =C2=A0 =C2=A0 ${srcdir}/lib/libcrypt.minver $host_os $host_cpu \<=
br>
+-=C2=A0 =C2=A0 2&gt;&amp;AS_MESSAGE_LOG_FD<br>
+-=C2=A0 )<br>
++=C2=A0 SYMVER_FLOOR=3DGLIBC_2.0<br>
+=C2=A0 =C2=A0AC_MSG_RESULT([$SYMVER_FLOOR])<br>
+=C2=A0 =C2=A0case &quot;$SYMVER_FLOOR&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0ERROR)<br>
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core=
/libxcrypt/libxcrypt.inc<br>
index e9f968b556..b5ca863d54 100644<br>
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSING;md5=3Dbd5d9777=
dfe7076c4f2928f12fed226a \<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/besser82/libxcrypt.g=
it;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">github.c=
om/besser82/libxcrypt.git;branch=3D${SRCBRANCH}</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/besser82/libxcrypt.g=
it;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">github.c=
om/besser82/libxcrypt.git;branch=3D${SRCBRANCH}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-do-not-=
use-compute-symver-floor.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;94d84f92ca123d851586016c4678eb1f21c19029&quot;<br>
=C2=A0SRCBRANCH ?=3D &quot;develop&quot;<br>
<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000670b2205bdd63163--
