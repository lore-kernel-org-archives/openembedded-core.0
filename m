Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA6BE7718D
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 22:01:57 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.web10.23091.1734991311245023437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 14:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=pzPkDIgE;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.197, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1734991310; x=1735596110; i=marcel@ziswiler.com;
	bh=US7da8RzHpvLxDbAbkHmyBRl8ok5sfP2a6YnFrNRxQc=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Date:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pzPkDIgEvkOhT37Wbb4w34wEuIFqVSdrxm1b/MMm1tE9QeYbdE1qVq1OiSyTjaxy
	 ABtPDJ9HnutyQQU1/jfhxZHDTeNeT2ZYUuKSi2z8Jobw7V+H+0GrmXg/CVJRxgIWF
	 Hfb7v6BqGNPHFD8czFt+nhPMSUF3w+kEz7AaxYNdRy6j+ZAwFKavxWvU/McefFKRn
	 GYRr7qSIksfyH5MFLx518nBqSr6NBtYQeFw0JyMbRlO07EL8QrtcHsodWom4VRAp2
	 OhDCRiOdnF1lyivIosglVh8BJR7MKU1FXgcati4JQWhVh0qYEkmIm382kU61J17Zu
	 rKVnpYhtpyhHHxnY/A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.217.253] ([213.55.186.207]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MbfKV-1t8zto37Y5-00T0lS
 for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 23:01:50
 +0100
Message-ID: <c461d8b75ed8f72df198d9c95deb44589bff8dc3.camel@ziswiler.com>
Subject: [PATCH] gettext: upgrade 0.22.5 -> 0.23
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2024 23:01:46 +0100
References: <b046094a02d423bded4d88cd6edb72b74c254fde.camel@ziswiler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:og2EDaznytRF926RmZFv9/mSDmgDjyf86/VmJSTGMneloPAhrca
 Q31OEOZHpHmWm6wzKNBG3XXjhsd1LaMS7dhyR361RD4BZbd4+wuU4osV99Z4wL0DOzn1faR
 PaHvlAkVZoLEUbwDu8SaihD9mskUSdiinG1RhpAqas7RqizxsHxViZRDbKbY2O6WX6/+fLB
 2y4R9a74F7OY0tjW2pkwA==
UI-OutboundReport: notjunk:1;M01:P0:KZa3MOSF68E=;u3Gr1NPu3omXv96d3t68o2lYoBj
 BLGJCAzxGh51tfJdnV1V0q8vAqZbtUuzhOBxdZkwsNbMnn9OUPM7j9ufwKHmChwHfRh+3PNJx
 pSOLv+w2/M6jDo1Mx5Glgm8YrHsEeuFkifmz93EbtvWP94LAp0oo/CZ5B9it+U1CaLlsahz11
 xcpeaa/cZo1PihLe6uQd4XF1IlJ5S1jwJu2oJYpTvkjA/X2t4IdL6JbEiiRy92xXdi33rdV7e
 AMA2FZM+uenGZ61pcDndarRJjOUjUW+6LD2aE9qxIxAbM0y50/hDs0CXzS8wQJOk0+KzwsIFR
 /Ms+7EfRhOrewwhR9GZnrXR4cxQFZs55Xy+53oMDOp7yfACCHHgo/zkPYqYOIArYUoeHbNu3Q
 EYkB6quvJ3wNSjvZFsF+lnF5xNZxEY09DDoI4/I3JEXLZ0SechorqlJepL1fNVKshtI/5/3jq
 FWAMi6hMDD/gglWbwaDAccLlkIyG+tGUnkL/1jSaP2byMlhG1KYCf/gNNdaF6WsAA0WrHp5VJ
 HEErtOrXUeMKsBCBFEXLJASMOjR9iOYR9YJ3Bvr7mRRwLjJ3n24VY+tgJnXO86lxm+iCdVbVg
 idrCFGnmoy18CMKN6GNdaSz0u+aG+uKEuWXtNl+eLNQ1yjwHfMS6o2zKANAVMHmxCNp8NOzKo
 TXs2THXRXnnwDuUVMZo9izvQiMdaAvs/YFA4U9+1hZCW2Qtxphf08vDlmFh1fCsqDDd41b3pb
 oamVTz4ZUD8QH21a+wNsedojijXm20f60f2OWt5CrQnKXaJ7d9KVzKLN+anNHkua5XcilniQ6
 AJ3N/c7Tb3+7wNuKGqeVQ9NBI+ZAU3J2d5M8FkA7VBwJzMendeFOfs17qRzSyAx5qgRVDngVO
 PuuZKZe7RGGzt0D7c449Ta7vj/lufZjL6OVdhgGH9R4gYjmTQ/OqnBYPkcJV6wFmafTPDDO/d
 GhYSiptqH6oUGeI2Vlr+bCmlwg7qZ73o1fDk2zCTUNBqxBAqsI5qEEZUNQwjRnh1uJ9khuW88
 I9p7OiZb2UG/0tHPxMbRYtrIlZFahYxfJJGXsSo
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 22:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209053

From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] gettext: upgrade 0.22.5 -> 0.23
Date: 12/23/2024 09:30:24 PM

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
---
=C2=A0...22.5.bb =3D> gettext-minimal-native_0.23.bb} |=C2=A0 2 +-
=C2=A0meta/recipes-core/gettext/gettext-sources.inc |=C2=A0 2 +-
=C2=A0...t-env.in-do-not-add-C-CXX-parameters.patch |=C2=A0 4 +--
=C2=A0...1-intl-Fix-build-failure-with-make-j.patch | 35 ------------------=
-
=C2=A0...01-tests-autopoint-3-unset-MAKEFLAGS.patch |=C2=A0 4 +--
=C2=A0.../gettext/gettext/parallel.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++---
=C2=A0.../gettext/gettext/serial-tests-config.patch |=C2=A0 8 ++---
=C2=A0.../gettext/gettext/use-pkgconfig.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 16 ++++-----
=C2=A0.../{gettext_0.22.5.bb =3D> gettext_0.23.bb}=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +-
=C2=A09 files changed, 24 insertions(+), 60 deletions(-)
=C2=A0rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.5.bb =
=3D> gettext-minimal-native_0.23.bb} (94%)
=C2=A0delete mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-bu=
ild-failure-with-make-j.patch
=C2=A0rename meta/recipes-core/gettext/{gettext_0.22.5.bb =3D> gettext_0.23=
.bb} (98%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb b/m=
eta/recipes-core/gettext/gettext-
minimal-native_0.23.bb
similarity index 94%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
index 96acf9bb9f..ce18a3b0bc 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.23.bb
@@ -42,5 +42,5 @@ do_install () {
=C2=A0	install -d ${D}${datadir}/gettext/po/
=C2=A0	cp ${S}/build-aux/config.rpath ${D}${datadir}/gettext/
=C2=A0	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
-	cp ${S}/gettext-runtime/po/remove-potcdate.sin ${D}${datadir}/gettext/po/
+	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/=
remove-potcdate.sin
=C2=A0}
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-c=
ore/gettext/gettext-sources.inc
index fd05837528..9805b1d907 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
=C2=A0HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
=C2=A0SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
-SRC_URI[sha256sum] =3D "ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94=
cb6c8fa48996a0"
+SRC_URI[sha256sum] =3D "945dd7002a02dd7108ad0510602e13416b41d327898cf85222=
01bc6af10907a6"
diff --git a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-=
C-CXX-parameters.patch
b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-param=
eters.patch
index 33d45a038c..e7cb93d6e2 100644
--- a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-p=
arameters.patch
+++ b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-p=
arameters.patch
@@ -24,6 +24,6 @@ index cc84ffd..b69c990 100644
=C2=A0-CFLAGS=3D"@CFLAGS@"
=C2=A0-CXX=3D"@CXX@"
=C2=A0-CXXFLAGS=3D"@CXXFLAGS@"
+ OBJC=3D"@OBJC@"
+ OBJCFLAGS=3D"@OBJCFLAGS@"
=C2=A0 CPPFLAGS=3D"@CPPFLAGS@"
- LDFLAGS=3D"@LDFLAGS@"
- LTLIBINTL=3D"@LTLIBINTL@"
diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-=
with-make-j.patch b/meta/recipes-
core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
deleted file mode 100644
index 144259dd3f..0000000000
--- a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-ma=
ke-j.patch
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
-* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gette=
xtP.h
-and its subordinate includes.
-
-Upstream-Status: Backport
[https://git.savannah.gnu.org/gitweb/?p=3Dgettext.git;a=3Dcommit;h=3D97a6a6=
3ad61949663283f5fad68c9d5fb9be1f15]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- gettext-runtime/intl/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Makef=
ile.am
-index da7abb758..9e56978bc 100644
---- a/gettext-runtime/intl/Makefile.am
-+++ b/gettext-runtime/intl/Makefile.am
-@@ -387,8 +387,8 @@ dngettext.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo
- ngettext.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../config.h =
$(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- plural.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ..=
/config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
- plural-exp.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../config.h $(srcdir)/=
plural-exp.h
--langprefs.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../config.h
--log.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ../config.h
-+langprefs.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../config.h $(src=
dir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
-+log.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h =
$(srcdir)/loadinfo.h
- printf.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ..=
/config.h
- setlocale.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../config.h $(src=
dir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- version.lo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../conf=
ig.h libgnuintl.h
---=20
-2.25.1
-
diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset=
-MAKEFLAGS.patch b/meta/recipes-
core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
index 94afb255c3..6aa1b7d851 100644
--- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFL=
AGS.patch
+++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFL=
AGS.patch
@@ -16,10 +16,10 @@ diff --git a/gettext-tools/tests/autopoint-3 b/gettext-=
tools/tests/autopoint-3
=C2=A0index bd3fbf3..380eaac 100755
=C2=A0--- a/gettext-tools/tests/autopoint-3
=C2=A0+++ b/gettext-tools/tests/autopoint-3
-@@ -131,6 +131,7 @@ test $? =3D 0 || { cat autopoint.err; Exit 1; }
- ${CONFIG_SHELL} ./configure >/dev/null 2>autpoint.err
+@@ -137,6 +137,7 @@ ${CONFIG_SHELL} ./configure >/dev/null 2>autopoint.err
=C2=A0 test $? =3D 0 || { cat autopoint.err; Exit 1; }
=C2=A0=20
+ : ${MAKE=3Dmake}
=C2=A0+unset MAKEFLAGS
=C2=A0 ${MAKE} >/dev/null 2>autopoint.err
=C2=A0 test $? =3D 0 || { cat autopoint.err; Exit 1; }
diff --git a/meta/recipes-core/gettext/gettext/parallel.patch b/meta/recipe=
s-
core/gettext/gettext/parallel.patch
index 8ecba46fd0..22515c24ac 100644
--- a/meta/recipes-core/gettext/gettext/parallel.patch
+++ b/meta/recipes-core/gettext/gettext/parallel.patch
@@ -1,4 +1,4 @@
-From 83333bc873c2655ff1de161f6b7db930f22f1cea Mon Sep 17 00:00:00 2001
+From f2455b7ab3826875d09eb3a11fbb830dd856f974 Mon Sep 17 00:00:00 2001
=C2=A0From: Joe Slater <jslater@windriver.com>
=C2=A0Date: Thu, 7 Jun 2012 16:37:01 -0700
=C2=A0Subject: [PATCH] instal libgettextlib.a before removing it
@@ -15,12 +15,12 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
=C2=A0 1 file changed, 4 insertions(+)
=C2=A0
=C2=A0diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnu=
lib-lib/Makefile.am
-index ab729cd..a0d713e 100644
+index a7fa494..4d0536a 100644
=C2=A0--- a/gettext-tools/gnulib-lib/Makefile.am
=C2=A0+++ b/gettext-tools/gnulib-lib/Makefile.am
-@@ -58,6 +58,10 @@ AM_CFLAGS =3D @WARN_CFLAGS@
- # Rules generated and collected by gnulib-tool.
- include Makefile.gnulib
+@@ -88,6 +88,10 @@ endif
+ libgettextlib_la_LIBADD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D $(WOE32_=
LIBADD)
+ libgettextlib_la_DEPENDENCIES +=3D $(WOE32_LIBADD)
=C2=A0=20
=C2=A0+# defined in Makefile.gnulib but missing this dependency
=C2=A0+#
diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch b/=
meta/recipes-
core/gettext/gettext/serial-tests-config.patch
index 7d39d6086a..3c354c21ff 100644
--- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
+++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
@@ -1,4 +1,4 @@
-From aa8dfe0aafd0b53a6c5bac61b356ca92e1430a36 Mon Sep 17 00:00:00 2001
+From 111376001f75209d9342c8f2c6495c99a443da7f Mon Sep 17 00:00:00 2001
=C2=A0From: "Hongjun.Yang" <hongjun.yang@windriver.com>
=C2=A0Date: Thu, 28 Jul 2016 12:36:15 +0800
=C2=A0Subject: [PATCH] fix for ptest
@@ -15,7 +15,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
=C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
=C2=A0
=C2=A0diff --git a/configure.ac b/configure.ac
-index f4e54ea..a47ff14 100644
+index 5106676..3114998 100644
=C2=A0--- a/configure.ac
=C2=A0+++ b/configure.ac
=C2=A0@@ -22,7 +22,7 @@ AC_INIT([gettext],
@@ -28,7 +28,7 @@ index f4e54ea..a47ff14 100644
=C2=A0 dnl Override automake's tar command used for creating distributions.
=C2=A0 am__tar=3D'${AMTAR} chf - --format=3Dustar --owner=3Droot --group=3D=
root "$$tardir"'
=C2=A0diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure=
.ac
-index 126d069..aa23232 100644
+index e128f5b..9f7447c 100644
=C2=A0--- a/gettext-runtime/configure.ac
=C2=A0+++ b/gettext-runtime/configure.ac
=C2=A0@@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
@@ -41,7 +41,7 @@ index 126d069..aa23232 100644
=C2=A0=20
=C2=A0 dnl Installation directories.
=C2=A0diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
-index 3610ee3..6f56a23 100644
+index 034936c..d31decf 100644
=C2=A0--- a/gettext-tools/configure.ac
=C2=A0+++ b/gettext-tools/configure.ac
=C2=A0@@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/r=
ecipes-core/gettext/gettext/use-
pkgconfig.patch
index ceb1856118..796b700056 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 6aa1338b916fe72c200b6f160b934be15b6ff590 Mon Sep 17 00:00:00 2001
+From 54ae005d0258d1e2041304c5568de768ad8c3248 Mon Sep 17 00:00:00 2001
=C2=A0From: Ross Burton <ross.burton@intel.com>
=C2=A0Date: Tue, 23 Jan 2018 00:54:13 +0000
=C2=A0Subject: [PATCH] gettext: beat library detection into shape
@@ -19,10 +19,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
=C2=A0 3 files changed, 31 insertions(+), 286 deletions(-)
=C2=A0
=C2=A0diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib=
-m4/libxml.m4
-index 0340490..0355388 100644
+index c7160d7..8e46cc7 100644
=C2=A0--- a/gettext-tools/gnulib-m4/libxml.m4
=C2=A0+++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
=C2=A0 dnl=C2=A0=C2=A0 forces the use of the included or an external libxml=
.
=C2=A0 AC_DEFUN([gl_LIBXML],
=C2=A0 [
@@ -30,7 +30,7 @@ index 0340490..0355388 100644
=C2=A0=C2=A0=C2=A0 AC_REQUIRE([AM_ICONV_LINK])
=C2=A0=20
=C2=A0=C2=A0=C2=A0 ifelse([$1], , [
-@@ -30,106 +31,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
=C2=A0=C2=A0=C2=A0 INCXML=3D
=C2=A0=C2=A0=C2=A0 ifelse([$1], [yes], , [
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test "$gl_cv_libxml_use_included" !=3D ye=
s; then
@@ -142,10 +142,10 @@ index 0340490..0355388 100644
=C2=A0=C2=A0=C2=A0 ])
=C2=A0=C2=A0=C2=A0 AC_SUBST([LIBXML])
=C2=A0diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/g=
nulib-local/m4/libglib.m4
-index dbc9eb8..136e512 100644
+index baa2cf4..b287c5b 100644
=C2=A0--- a/libtextstyle/gnulib-local/m4/libglib.m4
=C2=A0+++ b/libtextstyle/gnulib-local/m4/libglib.m4
-@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this noti=
ce is preserved.
+@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this noti=
ce is preserved.
=C2=A0=20
=C2=A0 dnl From Bruno Haible.
=C2=A0=20
@@ -266,10 +266,10 @@ index dbc9eb8..136e512 100644
=C2=A0=C2=A0=C2=A0 AC_SUBST([LTLIBGLIB])
=C2=A0=C2=A0=C2=A0 AC_SUBST([INCGLIB])
=C2=A0diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-=
m4/libglib.m4
-index dbc9eb8..136e512 100644
+index baa2cf4..b287c5b 100644
=C2=A0--- a/libtextstyle/gnulib-m4/libglib.m4
=C2=A0+++ b/libtextstyle/gnulib-m4/libglib.m4
-@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this noti=
ce is preserved.
+@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this noti=
ce is preserved.
=C2=A0=20
=C2=A0 dnl From Bruno Haible.
=C2=A0=20
diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-cor=
e/gettext/gettext_0.23.bb
similarity index 98%
rename from meta/recipes-core/gettext/gettext_0.22.5.bb
rename to meta/recipes-core/gettext/gettext_0.23.bb
index 0bf2a56e5f..181457f771 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.23.bb
@@ -28,7 +28,6 @@ SRC_URI +=3D " \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://s=
erial-tests-config.patch=C2=A0\
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-tests-autopoint-3-unset-MAKEFLAGS.patch=C2=A0\
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-init-env.in-do-not-add-C-CXX-parameters.patch=C2=A0\
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-i=
ntl-Fix-build-failure-with-make-j.patch=C2=A0\
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
=C2=A0
=C2=A0inherit autotools texinfo pkgconfig ptest
@@ -130,7 +129,7 @@ do_install:append:class-native () {
=C2=A0	rm ${D}${datadir}/aclocal/*
=C2=A0	rm ${D}${datadir}/gettext/config.rpath
=C2=A0	rm ${D}${datadir}/gettext/po/Makefile.in.in
-	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
+	rm ${D}${datadir}/gettext/po/remove-potcdate.sed
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 create_wrapper ${D}${bindi=
r}/msgfmt \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 GETTEXTDATADIR=3D"${STAGING_DATADIR_NATIVE}/gettext-$=
{PV}/"
--=20
2.47.0

