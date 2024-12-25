Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287A4E7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 10:32:54 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web11.5493.1735122772325005459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Dec 2024 02:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=KIPrhObi;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.194, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1735122770; x=1735727570; i=marcel@ziswiler.com;
	bh=85VbO4Q0YclKpsxfQnOaChkDnA+v9ei688C+xV16FGI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KIPrhObi1hT+B/Y78B9SpyOkWFp9upkp+sIkuRh6T3G88W9fZ2A5OT+2OT5BC5Fl
	 HYi5gtxUnAkSUTGcv6gKT5qC4/z19KJla9QRC3kg08LEmRa5/lGqXWAjY8S2gD8bN
	 sOf2qPu1QSQ+xQqfTt0px89EGCoxmo8Va/zcOqq0lq8ZVdvwct7y7U0qPxwa1z6xT
	 N4muMhmSbtNbVjvHOzdBGhHFSvsZgAowAtbGfYFUnazNIYrjui+aIDbNl/wSvY+xC
	 me/EQmay7EU+IXBkvvioBLbo0565/h/7lItj79lax7N13E5nqUmw3Q4/kXsQIrOqm
	 DmzGx0gLgdoFIDEPoQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from toolbox ([213.55.189.214]) by mrelay.perfora.net (mreueus004
 [74.208.5.2]) with ESMTPSA (Nemesis) id 1M4aZ0-1tQwOV2rcE-00688N; Wed, 25 Dec
 2024 11:32:50 +0100
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2] gettext: upgrade 0.22.5 -> 0.23
Date: Wed, 25 Dec 2024 11:32:18 +0100
Message-ID: <20241225103244.3514559-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oPnX2hP5LsL8aFpPSziWioJyYqQ4UgLMC6TW1hpUBKT/hxkK5hu
 +uRDaS+0zk023EuDwtOJ+LYXJMh04jdaPRAXwut8AIYP3WoPwnHhBXzcfYtib5D77lyHuzF
 thjfQHHJeTqbDjLeD75AM+Sv8Y/NSVaFyFA/s5Sszak0T+D9HfvBodT1bfHrAGsLAHSeSJ6
 wce/XNRvjwxHUV0VRRB0g==
UI-OutboundReport: notjunk:1;M01:P0:Nnc0p6hJCQ8=;CvJzLRy+Leip0eJJ7KTxZovN4Ie
 QcgKfck0qfyTjf+Boi1354DH/GjK4PsFBpi2voiX98kPfX+4SCRiKqObfqPbegX3PkXQW5d08
 VDAQEYIKjtMCt6ga8a8BFXmLmg7gJHmu9cynmk4A/6xUaNrDNL0pzcJ6U6oNgly5P6XodGErH
 TDk8A6lZ6j/Sj5J8hCe+2rKyJkANN/FEOjL5ZlhBY14q+0ZY2AHzDrzHzTwaE+cz9dzIBc0ZG
 aQ8re2LnjAnlF+HH83wJVdvCFLohddBQSTOrhauvVeev2h8ja26YxCPP/WBvjw4Ei5n8loHBM
 ZG38HJoG8aEFYpYE+DWvYmqJ/q4bUBV9CeOUPkAqnQfGq0nGaiq7PqNT8IIfwnMt7uakCnyY8
 54JjNwTrNgpCmwgL7FnmUsNKEbps60AsJhhMEtQWGVaMaKnnNWdahFO0qFQL9A+H8HBOQdQH+
 GRKDLM/uQPzGtMnbNv098gqd//lOZRp2OJB6p5eRU9QK3AoylkIFoQLfJBMd2UVnI8HkUFS/x
 lk48+mnyIfJynVQs+AbZHm2lRSXMCQcVU+KPr1p6we4YXq3IG/9ikwvDsANSGXi1frJ1sP9ok
 v3wSMoug+bqxnYwoWakV3BeF9Uvf/K4kBxdqXRQuCYbGZ35MTl5lmqN67pS4z5Q2U+LnFxguC
 vorjjZyeLVJjAar4ZBELZBcAk/mjG/HrtBVYG/MizZNWkq2zSlVYQLb2wq1aL94tUUkodo9gy
 9vWLojQaBLVPA/H0ktRs2qMwR9VdaZD4SoygYSU5AmZGhfn9e7daV1033mxCjqfaTDcGs+W48
 sApMifjj0bldtht29X4a/Wky/xm1pLIXLaLmLwB3OG/759cqlw5lF/CGUiuht6l7uPAJCuvS6
 7ri5/JOhlfoJ3WvleS5VQENcXTMK8bptwhcgk/r/qwPcSFovF6oLmrNOqEqI2cpPCyli/Uxpt
 cuI48hWEltteQYHBVUjerwwRvn16eMAxNZHWFmgTxulh3oGakiglMk8pSxtsEO+Sa5T2dF6gt
 HHFY4uTEEauWcjG1Spo5FnyxW3YWDbtkN59XO5C
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 10:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209074

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
=2D--

Changes in v2:
- Fix malformed diff lines by reverting to using patman for sending.
- Do not revert the rename of remove-potcdate.sin to remove-potcdate.sed
  as suggested by Alex.

 ...22.5.bb =3D> gettext-minimal-native_0.23.bb} |  2 +-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 ...t-env.in-do-not-add-C-CXX-parameters.patch |  4 +--
 ...1-intl-Fix-build-failure-with-make-j.patch | 35 -------------------
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  4 +--
 .../gettext/gettext/parallel.patch            | 10 +++---
 .../gettext/gettext/serial-tests-config.patch |  8 ++---
 .../gettext/gettext/use-pkgconfig.patch       | 16 ++++-----
 .../{gettext_0.22.5.bb =3D> gettext_0.23.bb}    |  3 +-
 9 files changed, 24 insertions(+), 60 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.5.bb =3D> g=
ettext-minimal-native_0.23.bb} (96%)
 delete mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-=
failure-with-make-j.patch
 rename meta/recipes-core/gettext/{gettext_0.22.5.bb =3D> gettext_0.23.bb}=
 (98%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb b/=
meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
similarity index 96%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
index 96acf9bb9fc6..e443b6b34fa0 100644
=2D-- a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
@@ -42,5 +42,5 @@ do_install () {
 	install -d ${D}${datadir}/gettext/po/
 	cp ${S}/build-aux/config.rpath ${D}${datadir}/gettext/
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
-	cp ${S}/gettext-runtime/po/remove-potcdate.sin ${D}${datadir}/gettext/po=
/
+	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po=
/
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-=
core/gettext/gettext-sources.inc
index fd05837528c8..9805b1d9074c 100644
=2D-- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] =3D "ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a9=
4cb6c8fa48996a0"
+SRC_URI[sha256sum] =3D "945dd7002a02dd7108ad0510602e13416b41d327898cf8522=
201bc6af10907a6"
diff --git a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add=
-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-init-env.=
in-do-not-add-C-CXX-parameters.patch
index 33d45a038cff..e7cb93d6e201 100644
=2D-- a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CX=
X-parameters.patch
+++ b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-=
parameters.patch
@@ -24,6 +24,6 @@ index cc84ffd..b69c990 100644
 -CFLAGS=3D"@CFLAGS@"
 -CXX=3D"@CXX@"
 -CXXFLAGS=3D"@CXXFLAGS@"
+ OBJC=3D"@OBJC@"
+ OBJCFLAGS=3D"@OBJCFLAGS@"
  CPPFLAGS=3D"@CPPFLAGS@"
- LDFLAGS=3D"@LDFLAGS@"
- LTLIBINTL=3D"@LTLIBINTL@"
diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure=
-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build=
-failure-with-make-j.patch
deleted file mode 100644
index 144259dd3f2f..000000000000
=2D-- a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with=
-make-j.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Tue, 12 Sep 2023 11:33:41 +0200
-Subject: [PATCH] intl: Fix build failure with "make -j".
-
-Reported by Christian Weisgerber <naddy@mips.inka.de> at
-<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
-
-* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gett=
extP.h
-and its subordinate includes.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=3Dgette=
xt.git;a=3Dcommit;h=3D97a6a63ad61949663283f5fad68c9d5fb9be1f15]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
=2D---
- gettext-runtime/intl/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Make=
file.am
-index da7abb758..9e56978bc 100644
=2D--- a/gettext-runtime/intl/Makefile.am
-+++ b/gettext-runtime/intl/Makefile.am
-@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.h=
 libgnuintl.h $(srcdir)/gmo
- ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(src=
dir)/gmo.h $(srcdir)/loadinfo.h
- plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
- plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
=2D-langprefs.lo:        ../config.h
=2D-log.lo:              ../config.h
-+langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(src=
dir)/gmo.h $(srcdir)/loadinfo.h
-+log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(src=
dir)/gmo.h $(srcdir)/loadinfo.h
- printf.lo:           ../config.h
- setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(src=
dir)/gmo.h $(srcdir)/loadinfo.h
- version.lo:          ../config.h libgnuintl.h
=2D--
-2.25.1
-
diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unse=
t-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint=
-3-unset-MAKEFLAGS.patch
index 94afb255c385..6aa1b7d8519b 100644
=2D-- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAK=
EFLAGS.patch
+++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEF=
LAGS.patch
@@ -16,10 +16,10 @@ diff --git a/gettext-tools/tests/autopoint-3 b/gettext=
-tools/tests/autopoint-3
 index bd3fbf3..380eaac 100755
 --- a/gettext-tools/tests/autopoint-3
 +++ b/gettext-tools/tests/autopoint-3
-@@ -131,6 +131,7 @@ test $? =3D 0 || { cat autopoint.err; Exit 1; }
- ${CONFIG_SHELL} ./configure >/dev/null 2>autpoint.err
+@@ -137,6 +137,7 @@ ${CONFIG_SHELL} ./configure >/dev/null 2>autopoint.er=
r
  test $? =3D 0 || { cat autopoint.err; Exit 1; }

+ : ${MAKE=3Dmake}
 +unset MAKEFLAGS
  ${MAKE} >/dev/null 2>autopoint.err
  test $? =3D 0 || { cat autopoint.err; Exit 1; }
diff --git a/meta/recipes-core/gettext/gettext/parallel.patch b/meta/recip=
es-core/gettext/gettext/parallel.patch
index 8ecba46fd0ac..22515c24ac4e 100644
=2D-- a/meta/recipes-core/gettext/gettext/parallel.patch
+++ b/meta/recipes-core/gettext/gettext/parallel.patch
@@ -1,4 +1,4 @@
-From 83333bc873c2655ff1de161f6b7db930f22f1cea Mon Sep 17 00:00:00 2001
+From f2455b7ab3826875d09eb3a11fbb830dd856f974 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Thu, 7 Jun 2012 16:37:01 -0700
 Subject: [PATCH] instal libgettextlib.a before removing it
@@ -15,12 +15,12 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 4 insertions(+)

 diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnulib-=
lib/Makefile.am
-index ab729cd..a0d713e 100644
+index a7fa494..4d0536a 100644
 --- a/gettext-tools/gnulib-lib/Makefile.am
 +++ b/gettext-tools/gnulib-lib/Makefile.am
-@@ -58,6 +58,10 @@ AM_CFLAGS =3D @WARN_CFLAGS@
- # Rules generated and collected by gnulib-tool.
- include Makefile.gnulib
+@@ -88,6 +88,10 @@ endif
+ libgettextlib_la_LIBADD       +=3D $(WOE32_LIBADD)
+ libgettextlib_la_DEPENDENCIES +=3D $(WOE32_LIBADD)

 +# defined in Makefile.gnulib but missing this dependency
 +#
diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch b=
/meta/recipes-core/gettext/gettext/serial-tests-config.patch
index 7d39d6086abc..3c354c21ff5b 100644
=2D-- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
+++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
@@ -1,4 +1,4 @@
-From aa8dfe0aafd0b53a6c5bac61b356ca92e1430a36 Mon Sep 17 00:00:00 2001
+From 111376001f75209d9342c8f2c6495c99a443da7f Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
 Date: Thu, 28 Jul 2016 12:36:15 +0800
 Subject: [PATCH] fix for ptest
@@ -15,7 +15,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)

 diff --git a/configure.ac b/configure.ac
-index f4e54ea..a47ff14 100644
+index 5106676..3114998 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext],
@@ -28,7 +28,7 @@ index f4e54ea..a47ff14 100644
  dnl Override automake's tar command used for creating distributions.
  am__tar=3D'${AMTAR} chf - --format=3Dustar --owner=3Droot --group=3Droot=
 "$$tardir"'
 diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
-index 126d069..aa23232 100644
+index e128f5b..9f7447c 100644
 --- a/gettext-runtime/configure.ac
 +++ b/gettext-runtime/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
@@ -41,7 +41,7 @@ index 126d069..aa23232 100644

  dnl Installation directories.
 diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
-index 3610ee3..6f56a23 100644
+index 034936c..d31decf 100644
 --- a/gettext-tools/configure.ac
 +++ b/gettext-tools/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/=
recipes-core/gettext/gettext/use-pkgconfig.patch
index ceb1856118a5..796b70005672 100644
=2D-- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 6aa1338b916fe72c200b6f160b934be15b6ff590 Mon Sep 17 00:00:00 2001
+From 54ae005d0258d1e2041304c5568de768ad8c3248 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
@@ -19,10 +19,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  3 files changed, 31 insertions(+), 286 deletions(-)

 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/=
libxml.m4
-index 0340490..0355388 100644
+index c7160d7..8e46cc7 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
  dnl   forces the use of the included or an external libxml.
  AC_DEFUN([gl_LIBXML],
  [
@@ -30,7 +30,7 @@ index 0340490..0355388 100644
    AC_REQUIRE([AM_ICONV_LINK])

    ifelse([$1], , [
-@@ -30,106 +31,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=3D
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" !=3D yes; then
@@ -142,10 +142,10 @@ index 0340490..0355388 100644
    ])
    AC_SUBST([LIBXML])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnuli=
b-local/m4/libglib.m4
-index dbc9eb8..136e512 100644
+index baa2cf4..b287c5b 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
-@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this not=
ice is preserved.
+@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this not=
ice is preserved.

  dnl From Bruno Haible.

@@ -266,10 +266,10 @@ index dbc9eb8..136e512 100644
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/l=
ibglib.m4
-index dbc9eb8..136e512 100644
+index baa2cf4..b287c5b 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
-@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this not=
ice is preserved.
+@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this not=
ice is preserved.

  dnl From Bruno Haible.

diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-co=
re/gettext/gettext_0.23.bb
similarity index 98%
rename from meta/recipes-core/gettext/gettext_0.22.5.bb
rename to meta/recipes-core/gettext/gettext_0.23.bb
index 0bf2a56e5fcf..181457f7716c 100644
=2D-- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.23.bb
@@ -28,7 +28,6 @@ SRC_URI +=3D " \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
-           file://0001-intl-Fix-build-failure-with-make-j.patch \
            "

 inherit autotools texinfo pkgconfig ptest
@@ -130,7 +129,7 @@ do_install:append:class-native () {
 	rm ${D}${datadir}/aclocal/*
 	rm ${D}${datadir}/gettext/config.rpath
 	rm ${D}${datadir}/gettext/po/Makefile.in.in
-	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
+	rm ${D}${datadir}/gettext/po/remove-potcdate.sed

         create_wrapper ${D}${bindir}/msgfmt \
                 GETTEXTDATADIR=3D"${STAGING_DATADIR_NATIVE}/gettext-${PV}=
/"
=2D-
2.47.1


