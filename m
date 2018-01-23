Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 56057787CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:45:48 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id p139so1250321itb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RG/Dvkf7cwasgMZbIRw+l1dIRdDPA3LW1UkSwYij1uA=;
	b=lGm9Vc2ZUIlgJ9+ZBF2tm5Nk2b+/4CXYd4lvCE+x8lFMp1SlxiqJhiQxA3BAVM4tgs
	XUSs982I7K2TYEcETHPQy5/C3tJUozbkHk/u2db52AKIM4nudV1roQHd7zce7XynwKko
	x46EOr2E1D1n+t11RQfgdBXaUahmBUuEHZW8+faf6ZpV3q9Rw3Js0gDJGzKvGVXIHfsg
	iXV83RX/t9SSkajOuVvjIRlFpUK0ZCxh4QYiayjA4egD2rIN7fx/zo9wgQuUkbrj9GMR
	dsmqQpMbnLsNLHlhEVBrTw2CdkIYuI3THEwdsrAEcy1vR44LVmZke3KakSGXfShmKK5W
	kbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RG/Dvkf7cwasgMZbIRw+l1dIRdDPA3LW1UkSwYij1uA=;
	b=uC3uxrld5WgfCTTMv4M1AXoZVZXZbHq/vlraQR56BSXveBWVKFIXmWhHWOWSM6pSJu
	/UWEPVcIx4mRC6+sK5igpqa5i8E1x+0oOeRQSlDX4sX4wUvyo0PMXv5TNzm672WTn6iH
	6DA76eJO2CtNzgsQBw/BcNBMcchCWhBRsC33AoNUKh4Bc2Oc5l+Fc5xeWOEHT1xxL6hO
	AEd7jUOKxlLRwj/H30vPyJ+EXEiE0PlzQ3qnHieBXPc3zKGbe/t4xFElnpBkUiZWkEcr
	pTJHJUThETwuEg4R1ZarEN9HZqH2Hmhanglfrl/eSYr0aNx4FPB9XxmEWaQ1SNL+wMUl
	5vLw==
X-Gm-Message-State: AKwxyteWD/5n2aHys4PPYJD19sJAXC9L17q0Wms/nZ+IMLj2U79nRzAo
	9AHJ/+V+tTQDv04m1x/uU0PobKFhCsj2rUFiy5vdGA==
X-Google-Smtp-Source: AH8x2262m6R6ippYdURDMpEsKekylTqE7vtILvSw7qzThJoCtkdurZrbNkm52CFbLfCyego+Yrh9FMDHX8tVEyr84T4=
X-Received: by 10.36.86.20 with SMTP id o20mr3937083itb.53.1516718749499; Tue,
	23 Jan 2018 06:45:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 23 Jan 2018 06:45:29 -0800 (PST)
In-Reply-To: <1516716352-32735-5-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
	<1516716352-32735-5-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jan 2018 14:45:29 +0000
Message-ID: <CAJTo0LakAyNOdEqvS5ZQid3qaB=bzYGt2yqJgyK-K9SAkT=bEQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] pango: upgrade to version 1.41.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 14:45:48 -0000
Content-Type: multipart/alternative; boundary="001a1144d5ea49fc430563729a63"

--001a1144d5ea49fc430563729a63
Content-Type: text/plain; charset="UTF-8"

This also inherits upstream-version-is-even so this is a development
snapshot.

Ross

On 23 January 2018 at 14:05, Maxin B. John <maxin.john@intel.com> wrote:

> Remove backported patch:
>         0001-Drop-introspection-macros-from-acinclude.m4.patch
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  ...op-introspection-macros-from-acinclude.m4.patch | 120
> ---------------------
>  .../pango/{pango_1.40.12.bb => pango_1.41.0.bb}    |   5 +-
>  2 files changed, 2 insertions(+), 123 deletions(-)
>  delete mode 100644 meta/recipes-graphics/pango/
> pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
>  rename meta/recipes-graphics/pango/{pango_1.40.12.bb => pango_1.41.0.bb}
> (88%)
>
> diff --git a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
> b/meta/recipes-graphics/pango/pango/0001-Drop-introspection-
> macros-from-acinclude.m4.patch
> deleted file mode 100644
> index 9e1626e..0000000
> --- a/meta/recipes-graphics/pango/pango/0001-Drop-introspection-
> macros-from-acinclude.m4.patch
> +++ /dev/null
> @@ -1,120 +0,0 @@
> -From 867a512eddbeb1899d3e7096df3da1dd0ce3e7b7 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 23 Oct 2015 14:06:17 +0300
> -Subject: [PATCH] Drop introspection macros from acinclude.m4
> -
> -They take precendence over our customized macros, and so
> -introspection doesn't work correctly.
> -
> -Upstream-Status: Backport [upstream 5ccfe0]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - acinclude.m4 | 96 ------------------------------
> ------------------------------
> - 1 file changed, 96 deletions(-)
> -
> -diff --git a/acinclude.m4 b/acinclude.m4
> -index 8899c7c..48fd5d8 100644
> ---- a/acinclude.m4
> -+++ b/acinclude.m4
> -@@ -55,99 +55,3 @@ AC_DEFUN([JH_CHECK_XML_CATALOG],
> - ])
> -
> -
> --dnl REMOVE THIS WHEN introspection.m4 is widely available
> --dnl
> --dnl -*- mode: autoconf -*-
> --dnl Copyright 2009 Johan Dahlin
> --dnl
> --dnl This file is free software; the author(s) gives unlimited
> --dnl permission to copy and/or distribute it, with or without
> --dnl modifications, as long as this notice is preserved.
> --dnl
> --
> --# serial 1
> --
> --m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
> --[
> --    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
> --    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
> --    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
> --
> --    dnl enable/disable introspection
> --    m4_if([$2], [require],
> --    [dnl
> --        enable_introspection=yes
> --    ],[dnl
> --        AC_ARG_ENABLE(introspection,
> --                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/
> yes@:>@]],
> --                                 [Enable introspection for this build]),,
> --                                 [enable_introspection=auto])
> --    ])dnl
> --
> --    AC_MSG_CHECKING([for gobject-introspection])
> --
> --    dnl presence/version checking
> --    AS_CASE([$enable_introspection],
> --    [no], [dnl
> --        found_introspection="no (disabled, use --enable-introspection to
> enable)"
> --    ],dnl
> --    [yes],[dnl
> --        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
> --                         AC_MSG_ERROR([gobject-introspection-1.0 is not
> installed]))
> --        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
> --                         found_introspection=yes,
> --                         AC_MSG_ERROR([You need to have
> gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
> --    ],dnl
> --    [auto],[dnl
> --        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
> found_introspection=yes, found_introspection=no)
> --    ],dnl
> --    [dnl
> --        AC_MSG_ERROR([invalid argument passed to --enable-introspection,
> should be one of @<:@no/auto/yes@:>@])
> --    ])dnl
> --
> --    AC_MSG_RESULT([$found_introspection])
> --
> --    INTROSPECTION_SCANNER=
> --    INTROSPECTION_COMPILER=
> --    INTROSPECTION_GENERATE=
> --    INTROSPECTION_GIRDIR=
> --    INTROSPECTION_TYPELIBDIR=
> --    if test "x$found_introspection" = "xyes"; then
> --       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner
> gobject-introspection-1.0`
> --       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler
> gobject-introspection-1.0`
> --       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate
> gobject-introspection-1.0`
> --       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir
> gobject-introspection-1.0`
> --       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir
> gobject-introspection-1.0)"
> --       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags
> gobject-introspection-1.0`
> --       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
> --       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir
> gobject-introspection-1.0`/gobject-introspection-1.0/
> Makefile.introspection
> --    fi
> --    AC_SUBST(INTROSPECTION_SCANNER)
> --    AC_SUBST(INTROSPECTION_COMPILER)
> --    AC_SUBST(INTROSPECTION_GENERATE)
> --    AC_SUBST(INTROSPECTION_GIRDIR)
> --    AC_SUBST(INTROSPECTION_TYPELIBDIR)
> --    AC_SUBST(INTROSPECTION_CFLAGS)
> --    AC_SUBST(INTROSPECTION_LIBS)
> --    AC_SUBST(INTROSPECTION_MAKEFILE)
> --
> --    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" =
> "xyes")
> --])
> --
> --
> --dnl Usage:
> --dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
> --
> --AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
> --[
> --  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
> --])
> --
> --dnl Usage:
> --dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
> --
> --
> --AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
> --[
> --  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
> --])
> ---
> -2.1.4
> diff --git a/meta/recipes-graphics/pango/pango_1.40.12.bb
> b/meta/recipes-graphics/pango/pango_1.41.0.bb
> similarity index 88%
> rename from meta/recipes-graphics/pango/pango_1.40.12.bb
> rename to meta/recipes-graphics/pango/pango_1.41.0.bb
> index cbad9a9..726b8c4 100644
> --- a/meta/recipes-graphics/pango/pango_1.40.12.bb
> +++ b/meta/recipes-graphics/pango/pango_1.41.0.bb
> @@ -14,11 +14,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 3bf50002aefd002f49e7bb854063f7e7"
>  inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even
> gobject-introspection
>
>  SRC_URI += "file://run-ptest \
> -            file://0001-Drop-introspection-macros-from-acinclude.m4.patch
> \
>              file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
> \
>  "
> -SRC_URI[archive.sha256sum] = "75f1a9a8e4e2b28cbc078b50c1fa92
> 7ee4ded994d1ade97c5603e2d1f3161cfc"
> -SRC_URI[archive.md5sum] = "9aae7dd5ecc1c2ade4e6951b85004cee"
> +SRC_URI[archive.md5sum] = "f3c0d6931aefd40f5afac2566faf2717"
> +SRC_URI[archive.sha256sum] = "1f76ef95953dc58ee5d6a53e5f1cb6
> db913f3e0eb489713ee9266695cae580ba"
>
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv
> cairo harfbuzz"
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144d5ea49fc430563729a63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This also inherits upstream-version-is-even so this is a d=
evelopment snapshot.<div><br></div><div>Ross</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 23 January 2018 at 14:05, Maxin B=
. John <span dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=
=3D"_blank">maxin.john@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Remove backported patch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-Drop-introspection-<wbr>macros-from-acincl=
ude.m4.patch<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0...op-introspection-macros-<wbr>from-acinclude.m4.patch | 120 -------=
--------------<br>
=C2=A0.../pango/{<a href=3D"http://pango_1.40.12.bb" rel=3D"noreferrer" tar=
get=3D"_blank">pango_1.40.12.bb</a> =3D&gt; <a href=3D"http://pango_1.41.0.=
bb" rel=3D"noreferrer" target=3D"_blank">pango_1.41.0.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A02 files changed, 2 insertions(+), 123 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/pango/<wbr>pango/0001-Drop-i=
ntrospection-<wbr>macros-from-acinclude.m4.patch<br>
=C2=A0rename meta/recipes-graphics/pango/{<a href=3D"http://pango_1.40.12.b=
b" rel=3D"noreferrer" target=3D"_blank">p<wbr>ango_1.40.12.bb</a> =3D&gt; <=
a href=3D"http://pango_1.41.0.bb" rel=3D"noreferrer" target=3D"_blank">pang=
o_1.41.0.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-graphics/pango/<wbr>pango/0001-Drop-introspection=
-<wbr>macros-from-acinclude.m4.patch b/meta/recipes-graphics/pango/<wbr>pan=
go/0001-Drop-introspection-<wbr>macros-from-acinclude.m4.patch<br>
deleted file mode 100644<br>
index 9e1626e..0000000<br>
--- a/meta/recipes-graphics/pango/<wbr>pango/0001-Drop-introspection-<wbr>m=
acros-from-acinclude.m4.patch<br>
+++ /dev/null<br>
@@ -1,120 +0,0 @@<br>
-From 867a512eddbeb1899d3e7096df3da1<wbr>dd0ce3e7b7 Mon Sep 17 00:00:00 200=
1<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
-Date: Fri, 23 Oct 2015 14:06:17 +0300<br>
-Subject: [PATCH] Drop introspection macros from acinclude.m4<br>
-<br>
-They take precendence over our customized macros, and so<br>
-introspection doesn&#39;t work correctly.<br>
-<br>
-Upstream-Status: Backport [upstream 5ccfe0]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- acinclude.m4 | 96 ------------------------------<wbr>--------------------=
----------<br>
- 1 file changed, 96 deletions(-)<br>
-<br>
-diff --git a/acinclude.m4 b/acinclude.m4<br>
-index 8899c7c..48fd5d8 100644<br>
---- a/acinclude.m4<br>
-+++ b/acinclude.m4<br>
-@@ -55,99 +55,3 @@ AC_DEFUN([JH_CHECK_XML_<wbr>CATALOG],<br>
- ])<br>
-<br>
-<br>
--dnl REMOVE THIS WHEN introspection.m4 is widely available<br>
--dnl<br>
--dnl -*- mode: autoconf -*-<br>
--dnl Copyright 2009 Johan Dahlin<br>
--dnl<br>
--dnl This file is free software; the author(s) gives unlimited<br>
--dnl permission to copy and/or distribute it, with or without<br>
--dnl modifications, as long as this notice is preserved.<br>
--dnl<br>
--<br>
--# serial 1<br>
--<br>
--m4_define([_GOBJECT_<wbr>INTROSPECTION_CHECK_INTERNAL],<br>
--[<br>
--=C2=A0 =C2=A0 AC_BEFORE([AC_PROG_LIBTOOL],[$<wbr>0])dnl setup libtool fir=
st<br>
--=C2=A0 =C2=A0 AC_BEFORE([AM_PROG_LIBTOOL],[$<wbr>0])dnl setup libtool fir=
st<br>
--=C2=A0 =C2=A0 AC_BEFORE([LT_INIT],[$0])dnl setup libtool first<br>
--<br>
--=C2=A0 =C2=A0 dnl enable/disable introspection<br>
--=C2=A0 =C2=A0 m4_if([$2], [require],<br>
--=C2=A0 =C2=A0 [dnl<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_introspection=3Dyes<br>
--=C2=A0 =C2=A0 ],[dnl<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_ARG_ENABLE(introspection,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_HELP_ST=
RING([--enable-<wbr>introspection[=3D@&lt;:@no/auto/<wbr>yes@:&gt;@]],<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Enable introspection for this=
 build]),,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enable_introspection=3Dauto])=
<br>
--=C2=A0 =C2=A0 ])dnl<br>
--<br>
--=C2=A0 =C2=A0 AC_MSG_CHECKING([for gobject-introspection])<br>
--<br>
--=C2=A0 =C2=A0 dnl presence/version checking<br>
--=C2=A0 =C2=A0 AS_CASE([$enable_<wbr>introspection],<br>
--=C2=A0 =C2=A0 [no], [dnl<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 found_introspection=3D&quot;no (disabled, use=
 --enable-introspection to enable)&quot;<br>
--=C2=A0 =C2=A0 ],dnl<br>
--=C2=A0 =C2=A0 [yes],[dnl<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 PKG_CHECK_EXISTS([gobject-<wbr>introspection-=
1.0],,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AC_MSG_ERROR([gobject-<wbr>introspection-1.0 is not instal=
led]))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 PKG_CHECK_EXISTS([gobject-<wbr>introspection-=
1.0 &gt;=3D $1],<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0found_introspection=3Dyes,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AC_MSG_ERROR([You need to have gobject-introspection &gt;=
=3D $1 installed to build AC_PACKAGE_NAME]))<br>
--=C2=A0 =C2=A0 ],dnl<br>
--=C2=A0 =C2=A0 [auto],[dnl<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 PKG_CHECK_EXISTS([gobject-<wbr>introspection-=
1.0 &gt;=3D $1], found_introspection=3Dyes, found_introspection=3Dno)<br>
--=C2=A0 =C2=A0 ],dnl<br>
--=C2=A0 =C2=A0 [dnl<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([invalid argument passed to --en=
able-introspection, should be one of @&lt;:@no/auto/yes@:&gt;@])<br>
--=C2=A0 =C2=A0 ])dnl<br>
--<br>
--=C2=A0 =C2=A0 AC_MSG_RESULT([$found_<wbr>introspection])<br>
--<br>
--=C2=A0 =C2=A0 INTROSPECTION_SCANNER=3D<br>
--=C2=A0 =C2=A0 INTROSPECTION_COMPILER=3D<br>
--=C2=A0 =C2=A0 INTROSPECTION_GENERATE=3D<br>
--=C2=A0 =C2=A0 INTROSPECTION_GIRDIR=3D<br>
--=C2=A0 =C2=A0 INTROSPECTION_TYPELIBDIR=3D<br>
--=C2=A0 =C2=A0 if test &quot;x$found_introspection&quot; =3D &quot;xyes&qu=
ot;; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_SCANNER=3D`$PKG_<wbr>CONFIG --va=
riable=3Dg_ir_scanner gobject-introspection-1.0`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_COMPILER=3D`$PKG_<wbr>CONFIG --v=
ariable=3Dg_ir_compiler gobject-introspection-1.0`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_GENERATE=3D`$PKG_<wbr>CONFIG --v=
ariable=3Dg_ir_generate gobject-introspection-1.0`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_GIRDIR=3D`$PKG_<wbr>CONFIG --var=
iable=3Dgirdir gobject-introspection-1.0`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_TYPELIBDIR=3D&quot;$($<wbr>PKG_C=
ONFIG --variable=3Dtypelibdir gobject-introspection-1.0)&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_CFLAGS=3D`$PKG_<wbr>CONFIG --cfl=
ags gobject-introspection-1.0`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_LIBS=3D`$PKG_<wbr>CONFIG --libs =
gobject-introspection-1.0`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_MAKEFILE=3D`$PKG_<wbr>CONFIG --v=
ariable=3Ddatadir gobject-introspection-1.0`/<wbr>gobject-introspection-1.0=
/<wbr>Makefile.introspection<br>
--=C2=A0 =C2=A0 fi<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_<wbr>SCANNER)<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_<wbr>COMPILER)<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_<wbr>GENERATE)<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_GIRDIR)<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_<wbr>TYPELIBDIR)<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_CFLAGS)<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_LIBS)<br>
--=C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_<wbr>MAKEFILE)<br>
--<br>
--=C2=A0 =C2=A0 AM_CONDITIONAL(HAVE_<wbr>INTROSPECTION, test &quot;x$found_=
introspection&quot; =3D &quot;xyes&quot;)<br>
--])<br>
--<br>
--<br>
--dnl Usage:<br>
--dnl=C2=A0 =C2=A0GOBJECT_INTROSPECTION_CHECK([<wbr>minimum-g-i-version])<b=
r>
--<br>
--AC_DEFUN([GOBJECT_<wbr>INTROSPECTION_CHECK],<br>
--[<br>
--=C2=A0 _GOBJECT_INTROSPECTION_CHECK_<wbr>INTERNAL([$1])<br>
--])<br>
--<br>
--dnl Usage:<br>
--dnl=C2=A0 =C2=A0GOBJECT_INTROSPECTION_REQUIRE(<wbr>[minimum-g-i-version])=
<br>
--<br>
--<br>
--AC_DEFUN([GOBJECT_<wbr>INTROSPECTION_REQUIRE],<br>
--[<br>
--=C2=A0 _GOBJECT_INTROSPECTION_CHECK_<wbr>INTERNAL([$1], [require])<br>
--])<br>
---<br>
-2.1.4<br>
diff --git a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.12.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>pango_1.40.12.bb</a> b/meta/rec=
ipes-graphics/pango/<a href=3D"http://pango_1.41.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank"><wbr>pango_1.41.0.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">pa<wbr>ngo_1.40.12.bb</a><br>
rename to meta/recipes-graphics/pango/<a href=3D"http://pango_1.41.0.bb" re=
l=3D"noreferrer" target=3D"_blank">pa<wbr>ngo_1.41.0.bb</a><br>
index cbad9a9..726b8c4 100644<br>
--- a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.40.12.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>pango_1.40.12.bb</a><br>
+++ b/meta/recipes-graphics/pango/<a href=3D"http://pango_1.41.0.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>pango_1.41.0.bb</a><br>
@@ -14,11 +14,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>3b=
f50002aefd002f49e7bb854063f7<wbr>e7&quot;<br>
=C2=A0inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobjec=
t-introspection<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Drop-<wbr>introspect=
ion-macros-from-<wbr>acinclude.m4.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Enforce-<wbr>re=
creation-of-docs-pango.<wbr>types-it-is-build-c.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[archive.sha256sum] =3D &quot;<wbr>75f1a9a8e4e2b28cbc078b50c1fa92<w=
br>7ee4ded994d1ade97c5603e2d1f316<wbr>1cfc&quot;<br>
-SRC_URI[archive.md5sum] =3D &quot;<wbr>9aae7dd5ecc1c2ade4e6951b85004c<wbr>=
ee&quot;<br>
+SRC_URI[archive.md5sum] =3D &quot;<wbr>f3c0d6931aefd40f5afac2566faf27<wbr>=
17&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;<wbr>1f76ef95953dc58ee5d6a53e5f1cb6<w=
br>db913f3e0eb489713ee9266695cae5<wbr>80ba&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 glib-2.0-native fontconfig freetype virtua=
l/libiconv cairo harfbuzz&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.4.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1144d5ea49fc430563729a63--
