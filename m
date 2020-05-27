Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web10.502.1590596040253527010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 09:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UiKc1VpK;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 21so6010924vkq.6
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vec5UIffMpcvw0QbhqsyK9SxooVohQAQhrl/W+etBBU=;
        b=UiKc1VpK9B2ihaJtudScGnVvo+LtATaIMLFvhL7M75vhY9uMAIk0hiy7FyyqKWl5u1
         5b4vJEDmkhBp5ol/fkTbHEB140Aq1GjhUpD5rZRQs2s1POoagcixeToZVRqtCVydigGj
         MONn4ucsrvjgMoWZqQvVw6NgHVu/NJXMNVXjECbye/B8DOHCqVVNp5gzlpAl0ldVdqVG
         1oWZUfMFQ11LgTOtxiwiXMFDXX2vXqVOaJPbYgfJF1UwpiaDLbjvW0TeRwnf4wICYW8B
         G8Oo8g6DGo7j3VxOMbcXOWrHaoxE5Tp6ZZ8we6o1NchM8qbsSF9RPxrXq6hTG8n6YLKw
         rxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vec5UIffMpcvw0QbhqsyK9SxooVohQAQhrl/W+etBBU=;
        b=LZQpV20eoFhxV71cCameoObRT9iDlOH/cT9IBm/V6xaznwhNpAQ4phGdFL3HM2aur9
         TCM51/IRhPbAsVGzEjzLxd9Y+7mARHjW9MfNbwAIWMqmxHpgBAZgn2zrcX5Zx2usHWrj
         aEDn/g6uQb4ftUrT3GaE5IwolL2hIMoMTSWYxlNIVqmaSIZ0y6XfsvyM0Ow9P7h0U/VQ
         n0f1RvMrR2hfJi8zS59C27iQY63eEgQy0MPo0Ab7KI6/7tj3xaRdrjL4QG2WCSMW3Rof
         oaGwk5kmWin4kwmMCnV944GvNdAeU8oTbCAQOQcaSOTvEyxBiiIz7jEgWtrbtGkVt5W5
         clvw==
X-Gm-Message-State: AOAM533393Ptwkzrh/JQ1FyOaXrHpe8jp32UBuNbQIv2WCDIO844UcFd
	s69Lox1fCn6S6f4PkVq6iPWaC3FOS5BKgBvVjBY=
X-Google-Smtp-Source: ABdhPJwwzZOiUV0rYc03KRf0A701ILXrWx0e8GoriENOaWtQYbvrbEtlK7QMvdGPlSXRGl1AWRk1f58BlWj2iHWcA84=
X-Received: by 2002:a1f:a3d8:: with SMTP id m207mr5665201vke.0.1590596039281;
 Wed, 27 May 2020 09:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <1590593511-63267-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1590593511-63267-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 27 May 2020 18:13:47 +0200
Message-ID: <CANNYZj8ftX7s5Quwcsp=3s6HuHfrEfofBTZwof9Y792tH7dWRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libksba: upgrade 1.3.5 -> 1.4.0
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e70fe505a6a37f32"

--000000000000e70fe505a6a37f32
Content-Type: text/plain; charset="UTF-8"

I believe we rely on this patch to ensure gnupg builds correctly; have you
checked that it doesn't regress?
I think you need to forward port the patch to new libksba unfortunately.

Alex

On Wed, 27 May 2020 at 17:32, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> ksba-add-pkgconfig-support.patch
> removed since it is not available in 1.4.0
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../libksba/ksba-add-pkgconfig-support.patch  | 152 ------------------
>  .../{libksba_1.3.5.bb => libksba_1.4.0.bb}    |   7 +-
>  2 files changed, 3 insertions(+), 156 deletions(-)
>  delete mode 100644
> meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
>  rename meta/recipes-support/libksba/{libksba_1.3.5.bb => libksba_1.4.0.bb}
> (78%)
>
> diff --git
> a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
> b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
> deleted file mode 100644
> index 5afe6de923..0000000000
> --- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
> +++ /dev/null
> @@ -1,152 +0,0 @@
> -Upstream-Status: Denied
> -
> -Add pkgconfig support to libksba.
> -This patch is rejected by upstream for the reason below:
> -They think pkgconfig adds no portability and maintaining them is not
> worthwhile.
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
> -Index: libksba-1.3.5/Makefile.am
> -===================================================================
> ---- libksba-1.3.5.orig/Makefile.am
> -+++ libksba-1.3.5/Makefile.am
> -@@ -20,6 +20,9 @@
> -
> - ACLOCAL_AMFLAGS = -I m4 -I gl/m4
> -
> -+pkgconfigdir = ${libdir}/pkgconfig
> -+pkgconfig_DATA = ksba.pc
> -+
> - # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
> - GITLOG_TO_CHANGELOG=gitlog-to-changelog
> -
> -Index: libksba-1.3.5/configure.ac
> -===================================================================
> ---- libksba-1.3.5.orig/configure.ac
> -+++ libksba-1.3.5/configure.ac
> -@@ -414,6 +414,7 @@ gl/Makefile
> - src/Makefile
> - src/ksba-config
> - src/versioninfo.rc
> -+ksba.pc
> - tests/Makefile
> - doc/Makefile
> - ])
> -Index: libksba-1.3.5/ksba.pc.in
> -===================================================================
> ---- /dev/null
> -+++ libksba-1.3.5/ksba.pc.in
> -@@ -0,0 +1,17 @@
> -+prefix=@prefix@
> -+exec_prefix=@exec_prefix@
> -+libdir=@libdir@
> -+includedir=@includedir@
> -+
> -+# API info
> -+api_version=@KSBA_CONFIG_API_VERSION@
> -+host=@KSBA_CONFIG_HOST@
> -+
> -+Name: ksba
> -+Description: Libksba provides an easy API to create and parse X.509 and
> CMS related objects
> -+Requires:
> -+Version: @VERSION@
> -+Libs: -L${libdir} -lksba
> -+Libs.private: -L${libdir} -lgpg-error
> -+Cflags: -I${includedir}
> -+
> -Index: libksba-1.3.5/src/ksba.m4
> -===================================================================
> ---- libksba-1.3.5.orig/src/ksba.m4
> -+++ libksba-1.3.5/src/ksba.m4
> -@@ -22,18 +22,7 @@ dnl with a changed API.
> - dnl
> - AC_DEFUN([AM_PATH_KSBA],
> - [AC_REQUIRE([AC_CANONICAL_HOST])
> -- AC_ARG_WITH(ksba-prefix,
> --            AC_HELP_STRING([--with-ksba-prefix=PFX],
> --                           [prefix where KSBA is installed (optional)]),
> --     ksba_config_prefix="$withval", ksba_config_prefix="")
> --  if test x$ksba_config_prefix != x ; then
> --     ksba_config_args="$ksba_config_args --prefix=$ksba_config_prefix"
> --     if test x${KSBA_CONFIG+set} != xset ; then
> --        KSBA_CONFIG=$ksba_config_prefix/bin/ksba-config
> --     fi
> --  fi
> -
> --  AC_PATH_PROG(KSBA_CONFIG, ksba-config, no)
> -   tmp=ifelse([$1], ,1:1.0.0,$1)
> -   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
> -      req_ksba_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
> -@@ -43,48 +32,13 @@ AC_DEFUN([AM_PATH_KSBA],
> -      min_ksba_version="$tmp"
> -   fi
> -
> --  AC_MSG_CHECKING(for KSBA - version >= $min_ksba_version)
> --  ok=no
> --  if test "$KSBA_CONFIG" != "no" ; then
> --    req_major=`echo $min_ksba_version | \
> --               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
> --    req_minor=`echo $min_ksba_version | \
> --               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
> --    req_micro=`echo $min_ksba_version | \
> --               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
> --    ksba_config_version=`$KSBA_CONFIG $ksba_config_args --version`
> --    major=`echo $ksba_config_version | \
> --               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
> --    minor=`echo $ksba_config_version | \
> --               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
> --    micro=`echo $ksba_config_version | \
> --               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
> --    if test "$major" -gt "$req_major"; then
> --        ok=yes
> --    else
> --        if test "$major" -eq "$req_major"; then
> --            if test "$minor" -gt "$req_minor"; then
> --               ok=yes
> --            else
> --               if test "$minor" -eq "$req_minor"; then
> --                   if test "$micro" -ge "$req_micro"; then
> --                     ok=yes
> --                   fi
> --               fi
> --            fi
> --        fi
> --    fi
> --  fi
> --  if test $ok = yes; then
> --    AC_MSG_RESULT([yes ($ksba_config_version)])
> --  else
> --    AC_MSG_RESULT(no)
> --  fi
> -+  PKG_CHECK_MODULES(KSBA, [ksba >= $min_ksba_version], [ok=yes], [ok=no])
> -+
> -   if test $ok = yes; then
> -      # Even if we have a recent libksba, we should check that the
> -      # API is compatible.
> -      if test "$req_ksba_api" -gt 0 ; then
> --        tmp=`$KSBA_CONFIG --api-version 2>/dev/null || echo 0`
> -+        tmp=`$PKG_CONFIG --variable=api_version ksba`
> -         if test "$tmp" -gt 0 ; then
> -            AC_MSG_CHECKING([KSBA API version])
> -            if test "$req_ksba_api" -eq "$tmp" ; then
> -@@ -97,10 +51,8 @@ AC_DEFUN([AM_PATH_KSBA],
> -      fi
> -   fi
> -   if test $ok = yes; then
> --    KSBA_CFLAGS=`$KSBA_CONFIG $ksba_config_args --cflags`
> --    KSBA_LIBS=`$KSBA_CONFIG $ksba_config_args --libs`
> -     ifelse([$2], , :, [$2])
> --    libksba_config_host=`$LIBKSBA_CONFIG $ksba_config_args --host
> 2>/dev/null || echo none`
> -+    libksba_config_host=`$PKG_CONFIG --variable=host ksba`
> -     if test x"$libksba_config_host" != xnone ; then
> -       if test x"$libksba_config_host" != x"$host" ; then
> -   AC_MSG_WARN([[
> -@@ -114,8 +66,6 @@ AC_DEFUN([AM_PATH_KSBA],
> -       fi
> -     fi
> -   else
> --    KSBA_CFLAGS=""
> --    KSBA_LIBS=""
> -     ifelse([$3], , :, [$3])
> -   fi
> -   AC_SUBST(KSBA_CFLAGS)
> diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb
> b/meta/recipes-support/libksba/libksba_1.4.0.bb
> similarity index 78%
> rename from meta/recipes-support/libksba/libksba_1.3.5.bb
> rename to meta/recipes-support/libksba/libksba_1.4.0.bb
> index 336d7f8177..f8ab472238 100644
> --- a/meta/recipes-support/libksba/libksba_1.3.5.bb
> +++ b/meta/recipes-support/libksba/libksba_1.4.0.bb
> @@ -16,11 +16,10 @@ BINCONFIG = "${bindir}/ksba-config"
>  inherit autotools binconfig-disabled pkgconfig texinfo
>
>  UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
> -SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> -           file://ksba-add-pkgconfig-support.patch"
> +SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
>
> -SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
> -SRC_URI[sha256sum] =
> "41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340"
> +SRC_URI[md5sum] = "4026f93b5589a00a4b59dbca3057cbb2"
> +SRC_URI[sha256sum] =
> "bfe6a8e91ff0f54d8a329514db406667000cb207238eded49b599761bfca41b6"
>
>  do_configure_prepend () {
>         # Else these could be used in preference to those in aclocal-copy
> --
> 2.17.1
>
>
>
> 
>

--000000000000e70fe505a6a37f32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I believe we rely on this patch to ensure gnupg build=
s correctly; have you checked that it doesn&#39;t regress?</div><div>I thin=
k you need to forward port the patch to new libksba unfortunately.</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 27 May 2020 at 17:32, Wang Mingyu &l=
t;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">ksba-add-pk=
gconfig-support.patch<br>
removed since it is not available in 1.4.0<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" ta=
rget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../libksba/ksba-add-pkgconfig-support.patch=C2=A0 | 152 -----------=
-------<br>
=C2=A0.../{<a href=3D"http://libksba_1.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">libksba_1.3.5.bb</a> =3D&gt; <a href=3D"http://libksba_1.4.0.b=
b" rel=3D"noreferrer" target=3D"_blank">libksba_1.4.0.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 =C2=A07 +-<br>
=C2=A02 files changed, 3 insertions(+), 156 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/libksba/libksba/ksba-add-pkg=
config-support.patch<br>
=C2=A0rename meta/recipes-support/libksba/{<a href=3D"http://libksba_1.3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">libksba_1.3.5.bb</a> =3D&gt; <a h=
ref=3D"http://libksba_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libksb=
a_1.4.0.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-suppo=
rt.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.=
patch<br>
deleted file mode 100644<br>
index 5afe6de923..0000000000<br>
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patc=
h<br>
+++ /dev/null<br>
@@ -1,152 +0,0 @@<br>
-Upstream-Status: Denied<br>
-<br>
-Add pkgconfig support to libksba.<br>
-This patch is rejected by upstream for the reason below:<br>
-They think pkgconfig adds no portability and maintaining them is not wort=
hwhile.<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
-<br>
-Index: libksba-1.3.5/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libksba-1.3.5.orig/Makefile.am<br>
-+++ libksba-1.3.5/Makefile.am<br>
-@@ -20,6 +20,9 @@<br>
- <br>
- ACLOCAL_AMFLAGS =3D -I m4 -I gl/m4<br>
- <br>
-+pkgconfigdir =3D ${libdir}/pkgconfig<br>
-+pkgconfig_DATA =3D ksba.pc<br>
-+<br>
- # (A suitable gitlog-to-changelog script can be found in GnuPG master.)<=
br>
- GITLOG_TO_CHANGELOG=3Dgitlog-to-changelog<br>
- <br>
-Index: libksba-1.3.5/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libksba-1.3.5.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer"=
 target=3D"_blank">configure.ac</a><br>
-+++ libksba-1.3.5/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
-@@ -414,6 +414,7 @@ gl/Makefile<br>
- src/Makefile<br>
- src/ksba-config<br>
- src/versioninfo.rc<br>
-+ksba.pc<br>
- tests/Makefile<br>
- doc/Makefile<br>
- ])<br>
-Index: libksba-1.3.5/<a href=3D"http://ksba.pc.in" rel=3D"noreferrer" tar=
get=3D"_blank">ksba.pc.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- /dev/null<br>
-+++ libksba-1.3.5/<a href=3D"http://ksba.pc.in" rel=3D"noreferrer" target=
=
=3D"_blank">ksba.pc.in</a><br>
-@@ -0,0 +1,17 @@<br>
-+prefix=3D@prefix@<br>
-+exec_prefix=3D@exec_prefix@<br>
-+libdir=3D@libdir@<br>
-+includedir=3D@includedir@<br>
-+<br>
-+# API info<br>
-+api_version=3D@KSBA_CONFIG_API_VERSION@<br>
-+host=3D@KSBA_CONFIG_HOST@<br>
-+<br>
-+Name: ksba<br>
-+Description: Libksba provides an easy API to create and parse X.509 and =
CMS related objects<br>
-+Requires:<br>
-+Version: @VERSION@<br>
-+Libs: -L${libdir} -lksba<br>
-+Libs.private: -L${libdir} -lgpg-error<br>
-+Cflags: -I${includedir}<br>
-+<br>
-Index: libksba-1.3.5/src/ksba.m4<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libksba-1.3.5.orig/src/ksba.m4<br>
-+++ libksba-1.3.5/src/ksba.m4<br>
-@@ -22,18 +22,7 @@ dnl with a changed API.<br>
- dnl<br>
- AC_DEFUN([AM_PATH_KSBA],<br>
- [AC_REQUIRE([AC_CANONICAL_HOST])<br>
-- AC_ARG_WITH(ksba-prefix,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_HELP_STRING([--with-ksba-pr=
efix=3DPFX],<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0[prefix where KSBA is installed (optional)]),<b=
r>
--=C2=A0 =C2=A0 =C2=A0ksba_config_prefix=3D&quot;$withval&quot;, ksba_conf=
ig_prefix=3D&quot;&quot;)<br>
--=C2=A0 if test x$ksba_config_prefix !=3D x ; then<br>
--=C2=A0 =C2=A0 =C2=A0ksba_config_args=3D&quot;$ksba_config_args --prefix=
=3D$ksba_config_prefix&quot;<br>
--=C2=A0 =C2=A0 =C2=A0if test x${KSBA_CONFIG+set} !=3D xset ; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 KSBA_CONFIG=3D$ksba_config_prefix/bin/ksba-c=
onfig<br>
--=C2=A0 =C2=A0 =C2=A0fi<br>
--=C2=A0 fi<br>
- <br>
--=C2=A0 AC_PATH_PROG(KSBA_CONFIG, ksba-config, no)<br>
-=C2=A0 =C2=A0tmp=3Difelse([$1], ,1:1.0.0,$1)<br>
-=C2=A0 =C2=A0if echo &quot;$tmp&quot; | grep &#39;:&#39; &gt;/dev/null 2&=
gt;/dev/null ; then<br>
-=C2=A0 =C2=A0 =C2=A0 req_ksba_api=3D`echo &quot;$tmp&quot;=C2=A0 =C2=A0 =
=C2=A0| sed &#39;s/\(.*\):\(.*\)/\1/&#39;`<br>
-@@ -43,48 +32,13 @@ AC_DEFUN([AM_PATH_KSBA],<br>
-=C2=A0 =C2=A0 =C2=A0 min_ksba_version=3D&quot;$tmp&quot;<br>
-=C2=A0 =C2=A0fi<br>
- <br>
--=C2=A0 AC_MSG_CHECKING(for KSBA - version &gt;=3D $min_ksba_version)<br>
--=C2=A0 ok=3Dno<br>
--=C2=A0 if test &quot;$KSBA_CONFIG&quot; !=3D &quot;no&quot; ; then<br>
--=C2=A0 =C2=A0 req_major=3D`echo $min_ksba_version | \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/\([[0-=
9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/&#39;`<br>
--=C2=A0 =C2=A0 req_minor=3D`echo $min_ksba_version | \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/\([[0-=
9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/&#39;`<br>
--=C2=A0 =C2=A0 req_micro=3D`echo $min_ksba_version | \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/\([[0-=
9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/&#39;`<br>
--=C2=A0 =C2=A0 ksba_config_version=3D`$KSBA_CONFIG $ksba_config_args --ve=
rsion`<br>
--=C2=A0 =C2=A0 major=3D`echo $ksba_config_version | \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/\([[0-=
9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/&#39;`<br>
--=C2=A0 =C2=A0 minor=3D`echo $ksba_config_version | \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/\([[0-=
9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/&#39;`<br>
--=C2=A0 =C2=A0 micro=3D`echo $ksba_config_version | \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/\([[0-=
9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/&#39;`<br>
--=C2=A0 =C2=A0 if test &quot;$major&quot; -gt &quot;$req_major&quot;; the=
n<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ok=3Dyes<br>
--=C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$major&quot; -eq &quot;$req_ma=
jor&quot;; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$minor&quot; -gt=
 &quot;$req_minor&quot;; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok=3Dyes<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;$mi=
nor&quot; -eq &quot;$req_minor&quot;; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
test &quot;$micro&quot; -ge &quot;$req_micro&quot;; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ok=3Dyes<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
--=C2=A0 =C2=A0 fi<br>
--=C2=A0 fi<br>
--=C2=A0 if test $ok =3D yes; then<br>
--=C2=A0 =C2=A0 AC_MSG_RESULT([yes ($ksba_config_version)])<br>
--=C2=A0 else<br>
--=C2=A0 =C2=A0 AC_MSG_RESULT(no)<br>
--=C2=A0 fi<br>
-+=C2=A0 PKG_CHECK_MODULES(KSBA, [ksba &gt;=3D $min_ksba_version], [ok=3Dy=
es], [ok=3Dno])<br>
-+<br>
-=C2=A0 =C2=A0if test $ok =3D yes; then<br>
-=C2=A0 =C2=A0 =C2=A0 # Even if we have a recent libksba, we should check =
that the<br>
-=C2=A0 =C2=A0 =C2=A0 # API is compatible.<br>
-=C2=A0 =C2=A0 =C2=A0 if test &quot;$req_ksba_api&quot; -gt 0 ; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp=3D`$KSBA_CONFIG --api-version 2&gt;/dev/=
null || echo 0`<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp=3D`$PKG_CONFIG --variable=3Dapi_version =
ksba`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;$tmp&quot; -gt 0 ; then<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([KSBA API versi=
on])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$req_ksba_api&quo=
t; -eq &quot;$tmp&quot; ; then<br>
-@@ -97,10 +51,8 @@ AC_DEFUN([AM_PATH_KSBA],<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0if test $ok =3D yes; then<br>
--=C2=A0 =C2=A0 KSBA_CFLAGS=3D`$KSBA_CONFIG $ksba_config_args --cflags`<br=
>
--=C2=A0 =C2=A0 KSBA_LIBS=3D`$KSBA_CONFIG $ksba_config_args --libs`<br>
-=C2=A0 =C2=A0 =C2=A0ifelse([$2], , :, [$2])<br>
--=C2=A0 =C2=A0 libksba_config_host=3D`$LIBKSBA_CONFIG $ksba_config_args -=
-host 2&gt;/dev/null || echo none`<br>
-+=C2=A0 =C2=A0 libksba_config_host=3D`$PKG_CONFIG --variable=3Dhost ksba`=
<br>
-=C2=A0 =C2=A0 =C2=A0if test x&quot;$libksba_config_host&quot; !=3D xnone =
; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test x&quot;$libksba_config_host&quot; !=3D=
 x&quot;$host&quot; ; then<br>
-=C2=A0 =C2=A0AC_MSG_WARN([[<br>
-@@ -114,8 +66,6 @@ AC_DEFUN([AM_PATH_KSBA],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 KSBA_CFLAGS=3D&quot;&quot;<br>
--=C2=A0 =C2=A0 KSBA_LIBS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0ifelse([$3], , :, [$3])<br>
-=C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0AC_SUBST(KSBA_CFLAGS)<br>
diff --git a/meta/recipes-support/libksba/<a href=3D"http://libksba_1.3.5.=
bb" rel=3D"noreferrer" target=3D"_blank">libksba_1.3.5.bb</a> b/meta/recipe=
s-support/libksba/<a href=3D"http://libksba_1.4.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libksba_1.4.0.bb</a><br>
similarity index 78%<br>
rename from meta/recipes-support/libksba/<a href=3D"http://libksba_1.3.5.b=
b" rel=3D"noreferrer" target=3D"_blank">libksba_1.3.5.bb</a><br>
rename to meta/recipes-support/libksba/<a href=3D"http://libksba_1.4.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">libksba_1.4.0.bb</a><br>
index 336d7f8177..f8ab472238 100644<br>
--- a/meta/recipes-support/libksba/<a href=3D"http://libksba_1.3.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">libksba_1.3.5.bb</a><br>
+++ b/meta/recipes-support/libksba/<a href=3D"http://libksba_1.4.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">libksba_1.4.0.bb</a><br>
@@ -16,11 +16,10 @@ BINCONFIG =3D &quot;${bindir}/ksba-config&quot;<br>
=C2=A0inherit autotools binconfig-disabled pkgconfig texinfo<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gnupg.org/download/i=
ndex.html" rel=3D"noreferrer" target=3D"_blank">https://gnupg.org/download/=
index.html</a>&quot;<br>
-SRC_URI =3D &quot;${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ksba-add-pkgconfig-suppor=
t.patch&quot;<br>
+SRC_URI =3D &quot;${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;8302a3e263a7c630aa7dea7d341f07a2&quot;<br>
-SRC_URI[sha256sum] =3D &quot;41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e533=
58e70d5f066d35c1a340&quot;<br>
+SRC_URI[md5sum] =3D &quot;4026f93b5589a00a4b59dbca3057cbb2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;bfe6a8e91ff0f54d8a329514db406667000cb207238e=
ded49b599761bfca41b6&quot;<br>
<br>
=C2=A0do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Else these could be used in preference to th=
ose in aclocal-copy<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e70fe505a6a37f32--
