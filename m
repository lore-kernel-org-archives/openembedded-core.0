Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAC071C1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 02:39:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v190so12672352wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 19:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QPJmrRhUsBf4YYbHla7CJbU+YDErITGXdV8bCifA6yc=;
	b=ZbWtGpPpjGBz1+JYYIDoZKIpC0tpd76Eark2MRUQLJ0GwMci5xWtiyTTclmMw8Gq0I
	tYSuTf2NPnLakHKyF9ZM7Iws2j/bWXPUeYXEyjGXpLvo1ybFSb2IQLuZY357xvoC8fQe
	yt2qgq/JU44X52gcefkkI1jgd17EJD4zagLQEw7AYXZnVrkpo3DtEziIFLwF/jvF/zN6
	dErml6TheTE1P+L3iG68Tf4xNKeMco677U58312/ueHETNPE+h0KnpQ9fLmBCm9YTVhh
	FcVRizJZsbMlkrNFEapvuUmtX/wAYkk8ud7DgQ81/O1+gqWRAkC6aIW0y+HUwkVtvrHk
	FqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QPJmrRhUsBf4YYbHla7CJbU+YDErITGXdV8bCifA6yc=;
	b=DcNNXhvoI86NeN91usj7aWtl6n9HneGk2s+XDlHaP0ni783G1u57Qgp1hEbxf3k1Sv
	uH/0jpPdewluJPfVsLy3PsEy+438PVkroRmqZwGPOHooRi5lRb4QZEssvUQwHuAUdnhu
	5neqob7wT4vLjbpjolAX4Ree2WKHLeoZJJqJOejKHuDwUT+z8Y6/JELmJCQHGtwhM6o7
	iJ4tBB91QLduJTtG0J+rp17n/CnF7r8NRaxAOKLO1tbYqiDC7uYCTmj3GV/LLUBXHPCg
	VMFDAkAc8WPpBT54llgUXyqWvdmiF1gLWx/X7RB1OxJdySnY9icGKvlJNyj7RnNCz+hF
	7GxQ==
X-Gm-Message-State: AFeK/H2Ln1b+Pa6D7qCLD7cBpijmV4akCNL5JtFyGQLJYsAiyU6zt5uyorOSHlfoAiy+og==
X-Received: by 10.28.66.11 with SMTP id p11mr13318369wma.38.1489459197718;
	Mon, 13 Mar 2017 19:39:57 -0700 (PDT)
Received: from localhost.localdomain ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	y1sm13442467wme.15.2017.03.13.19.39.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Mar 2017 19:39:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 19:39:48 -0700
Message-Id: <1489459188-15332-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] pinentry: update to 1.0.0
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
X-List-Received-Date: Tue, 14 Mar 2017 02:39:58 -0000

From: Armin Kuster <akuster@mvista.com>

add pkg-config support for libassuan and gpg-error
updated config options

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../pinentry/pinentry-1.0.0/gpg-error_pkconf.patch | 100 ++++++++++++++
 .../pinentry-1.0.0/libassuan_pkgconf.patch         | 153 +++++++++++++++++++++
 .../{pinentry_0.9.2.bb => pinentry_1.0.0.bb}       |  22 +--
 3 files changed, 265 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-support/pinentry/pinentry-1.0.0/gpg-error_pkconf.patch
 create mode 100644 meta/recipes-support/pinentry/pinentry-1.0.0/libassuan_pkgconf.patch
 rename meta/recipes-support/pinentry/{pinentry_0.9.2.bb => pinentry_1.0.0.bb} (63%)

diff --git a/meta/recipes-support/pinentry/pinentry-1.0.0/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.0.0/gpg-error_pkconf.patch
new file mode 100644
index 0000000..431edb0
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry-1.0.0/gpg-error_pkconf.patch
@@ -0,0 +1,100 @@
+Convert to pkg-config support to match changes done to 
+the gpg-error recipe for gpg-error.pc  generation.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: pinentry-1.0.0/m4/gpg-error.m4
+===================================================================
+--- pinentry-1.0.0.orig/m4/gpg-error.m4
++++ pinentry-1.0.0/m4/gpg-error.m4
+@@ -25,74 +25,12 @@ dnl config script does not match the hos
+ dnl is added to the gpg_config_script_warn variable.
+ dnl
+ AC_DEFUN([AM_PATH_GPG_ERROR],
+-[ AC_REQUIRE([AC_CANONICAL_HOST])
+-  gpg_error_config_prefix=""
+-  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
+-  dnl since that is consistent with how our three siblings use the directory/
+-  dnl package name in --with-$dir_name-prefix=PFX.
+-  AC_ARG_WITH(libgpg-error-prefix,
+-              AC_HELP_STRING([--with-libgpg-error-prefix=PFX],
+-                             [prefix where GPG Error is installed (optional)]),
+-              [gpg_error_config_prefix="$withval"])
+-
+-  dnl Accept --with-gpg-error-prefix and make it work the same as
+-  dnl --with-libgpg-error-prefix above, for backwards compatibility,
+-  dnl but do not document this old, inconsistently-named option.
+-  AC_ARG_WITH(gpg-error-prefix,,
+-              [gpg_error_config_prefix="$withval"])
+-
+-  if test x"${GPG_ERROR_CONFIG}" = x ; then
+-     if test x"${gpg_error_config_prefix}" != x ; then
+-        GPG_ERROR_CONFIG="${gpg_error_config_prefix}/bin/gpg-error-config"
+-     else
+-       case "${SYSROOT}" in
+-         /*)
+-           if test -x "${SYSROOT}/bin/gpg-error-config" ; then
+-             GPG_ERROR_CONFIG="${SYSROOT}/bin/gpg-error-config"
+-           fi
+-           ;;
+-         '')
+-           ;;
+-          *)
+-           AC_MSG_WARN([Ignoring \$SYSROOT as it is not an absolute path.])
+-           ;;
+-       esac
+-     fi
+-  fi
+-
+-  AC_PATH_PROG(GPG_ERROR_CONFIG, gpg-error-config, no)
++[
+   min_gpg_error_version=ifelse([$1], ,0.0,$1)
+-  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
+-  ok=no
+-  if test "$GPG_ERROR_CONFIG" != "no" \
+-     && test -f "$GPG_ERROR_CONFIG" ; then
+-    req_major=`echo $min_gpg_error_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_gpg_error_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG $gpg_error_config_args --version`
+-    major=`echo $gpg_error_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+-    minor=`echo $gpg_error_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
+-    if test "$major" -gt "$req_major"; then
+-        ok=yes
+-    else
+-        if test "$major" -eq "$req_major"; then
+-            if test "$minor" -ge "$req_minor"; then
+-               ok=yes
+-            fi
+-        fi
+-    fi
+-  fi
++  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
+   if test $ok = yes; then
+-    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --cflags`
+-    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --libs`
+-    GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --cflags 2>/dev/null`
+-    GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --libs 2>/dev/null`
+-    AC_MSG_RESULT([yes ($gpg_error_config_version)])
+     ifelse([$2], , :, [$2])
+-    gpg_error_config_host=`$GPG_ERROR_CONFIG $gpg_error_config_args --host 2>/dev/null || echo none`
++    gpg_error_config_host=`$PKG_CONFIG --host gpg-error 2>/dev/null || echo none`
+     if test x"$gpg_error_config_host" != xnone ; then
+       if test x"$gpg_error_config_host" != x"$host" ; then
+   AC_MSG_WARN([[
+@@ -107,10 +45,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+       fi
+     fi
+   else
+-    GPG_ERROR_CFLAGS=""
+-    GPG_ERROR_LIBS=""
+-    GPG_ERROR_MT_CFLAGS=""
+-    GPG_ERROR_MT_LIBS=""
+     AC_MSG_RESULT(no)
+     ifelse([$3], , :, [$3])
+   fi
diff --git a/meta/recipes-support/pinentry/pinentry-1.0.0/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.0.0/libassuan_pkgconf.patch
new file mode 100644
index 0000000..11d564f
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry-1.0.0/libassuan_pkgconf.patch
@@ -0,0 +1,153 @@
+Convert to pkg-config support to match changes done to
+the libassuan recipe for libassuan.pc generation.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: pinentry-1.0.0/m4/libassuan.m4
+===================================================================
+--- pinentry-1.0.0.orig/m4/libassuan.m4
++++ pinentry-1.0.0/m4/libassuan.m4
+@@ -13,34 +13,8 @@ dnl
+ dnl Common code used for libassuan detection [internal]
+ dnl Returns ok set to yes or no.
+ dnl
+-AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+-[ AC_REQUIRE([AC_CANONICAL_HOST])
+-  AC_ARG_WITH(libassuan-prefix,
+-              AC_HELP_STRING([--with-libassuan-prefix=PFX],
+-                             [prefix where LIBASSUAN is installed (optional)]),
+-     libassuan_config_prefix="$withval", libassuan_config_prefix="")
+-  if test x$libassuan_config_prefix != x ; then
+-    libassuan_config_args="$libassuan_config_args --prefix=$libassuan_config_prefix"
+-    if test x${LIBASSUAN_CONFIG+set} != xset ; then
+-      LIBASSUAN_CONFIG=$libassuan_config_prefix/bin/libassuan-config
+-    fi
+-  else
+-    case "${SYSROOT}" in
+-       /*)
+-         if test -x "${SYSROOT}/bin/libassuan-config" ; then
+-           LIBASSUAN_CONFIG="${SYSROOT}/bin/libassuan-config"
+-         fi
+-         ;;
+-       '')
+-         ;;
+-        *)
+-         AC_MSG_WARN([Ignoring \$SYSROOT as it is not an absolute path.])
+-         ;;
+-     esac
+-  fi
+-
+-  AC_PATH_TOOL(LIBASSUAN_CONFIG, libassuan-config, no)
+-
++AC_DEFUN([AM_PATH_LIBASSUAN_COMMON],
++[
+   tmp=ifelse([$1], ,1:0.9.2,$1)
+   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
+     req_libassuan_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
+@@ -50,51 +24,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+     min_libassuan_version="$tmp"
+   fi
+ 
+-  AC_MSG_CHECKING(for LIBASSUAN - version >= $min_libassuan_version)
+-  ok=no
+-  if test "$LIBASSUAN_CONFIG" != "no" \
+-     && test -f "$LIBASSUAN_CONFIG" ; then
+-    req_major=`echo $min_libassuan_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_libassuan_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
+-    req_micro=`echo $min_libassuan_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
+-
+-    libassuan_config_version=`$LIBASSUAN_CONFIG --version`
+-    major=`echo $libassuan_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+-    minor=`echo $libassuan_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
+-    micro=`echo $libassuan_config_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
+-
+-    if test "$major" -gt "$req_major"; then
+-        ok=yes
+-    else
+-        if test "$major" -eq "$req_major"; then
+-            if test "$minor" -gt "$req_minor"; then
+-               ok=yes
+-            else
+-               if test "$minor" -eq "$req_minor"; then
+-                   if test "$micro" -ge "$req_micro"; then
+-                     ok=yes
+-                   fi
+-               fi
+-            fi
+-        fi
+-    fi
+-  fi
+-
+-  if test $ok = yes; then
+-    AC_MSG_RESULT([yes ($libassuan_config_version)])
+-  else
+-    AC_MSG_RESULT(no)
+-  fi
++  PKG_CHECK_MODULES(LIBASSUAN_COMMON, [libassuan >= $min_libassuan_version libassuan], [ok=yes], [ok=no])
+ 
+   if test $ok = yes; then
+     if test "$req_libassuan_api" -gt 0 ; then
+-      tmp=`$LIBASSUAN_CONFIG --api-version 2>/dev/null || echo 0`
++      tmp=`$PKG_CONFIG --variable=api_version libassuan 2>/dev/null || echo 0`
+       if test "$tmp" -gt 0 ; then
+         AC_MSG_CHECKING([LIBASSUAN API version])
+         if test "$req_libassuan_api" -eq "$tmp" ; then
+@@ -109,7 +43,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+ 
+   if test $ok = yes; then
+     if test x"$host" != x ; then
+-      libassuan_config_host=`$LIBASSUAN_CONFIG --host 2>/dev/null || echo none`
++      libassuan_config_host=`$PKG_CONFIG --host libassuan 2>/dev/null || echo 0`
+       if test x"$libassuan_config_host" != xnone ; then
+         if test x"$libassuan_config_host" != x"$host" ; then
+   AC_MSG_WARN([[
+@@ -132,7 +66,7 @@ dnl Test whether libassuan has at least
+ dnl used to test for features only available in newer versions.
+ dnl
+ AC_DEFUN([AM_CHECK_LIBASSUAN],
+-[ _AM_PATH_LIBASSUAN_COMMON($1)
++[ AM_PATH_LIBASSUAN_COMMON($1)
+   if test $ok = yes; then
+     ifelse([$2], , :, [$2])
+   else
+@@ -148,16 +82,10 @@ dnl                   [ACTION-IF-FOUND [
+ dnl Test for libassuan and define LIBASSUAN_CFLAGS and LIBASSUAN_LIBS
+ dnl
+ AC_DEFUN([AM_PATH_LIBASSUAN],
+-[ _AM_PATH_LIBASSUAN_COMMON($1)
++[ AM_PATH_LIBASSUAN_COMMON($1)
+   if test $ok = yes; then
+-    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG $libassuan_config_args --cflags`
+-    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG $libassuan_config_args --libs`
+     ifelse([$2], , :, [$2])
+   else
+-    LIBASSUAN_CFLAGS=""
+-    LIBASSUAN_LIBS=""
+     ifelse([$3], , :, [$3])
+   fi
+-  AC_SUBST(LIBASSUAN_CFLAGS)
+-  AC_SUBST(LIBASSUAN_LIBS)
+ ])
+Index: pinentry-1.0.0/configure.ac
+===================================================================
+--- pinentry-1.0.0.orig/configure.ac
++++ pinentry-1.0.0/configure.ac
+@@ -266,8 +266,8 @@ if test "$have_libassuan" = "yes"; then
+                      [version of the libassuan library])
+ fi
+ 
+-COMMON_CFLAGS="$LIBASSUAN_CFLAGS $COMMON_CFLAGS"
+-COMMON_LIBS="$LIBASSUAN_LIBS $COMMON_LIBS"
++COMMON_CFLAGS="$LIBASSUAN_COMMON_CFLAGS $COMMON_CFLAGS"
++COMMON_LIBS="$LIBASSUAN_COMMON_LIBS $COMMON_LIBS"
+ 
+ 
+ dnl Checks for libsecmem.
diff --git a/meta/recipes-support/pinentry/pinentry_0.9.2.bb b/meta/recipes-support/pinentry/pinentry_1.0.0.bb
similarity index 63%
rename from meta/recipes-support/pinentry/pinentry_0.9.2.bb
rename to meta/recipes-support/pinentry/pinentry_1.0.0.bb
index d315a99..319acd3 100644
--- a/meta/recipes-support/pinentry/pinentry_0.9.2.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.0.0.bb
@@ -8,26 +8,28 @@ HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
-inherit autotools
+inherit autotools pkgconfig
 
-DEPENDS = "gettext-native"
+DEPENDS = "gettext-native libassuan libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
-SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://libassuan_pkgconf.patch \
+           file://gpg-error_pkconf.patch \
+"
 
-SRC_URI[md5sum] = "f51d454f921111b5156a2291cbf70278"
-SRC_URI[sha256sum] = "fd8bc1592ceb22bb492b07cb29b1b140bb882c859e6503b974254c0a4b4134d1"
+SRC_URI[md5sum] = "4a3fad8b31f9b4c5526c8837495015dc"
+SRC_URI[sha256sum] = "1672c2edc1feb036075b187c0773787b2afd0544f55025c645a71b4c2f79275a"
 
-EXTRA_OECONF = "--disable-rpath \
-		        --disable-dependency-tracking \
-               "
+EXTRA_OECONF = "--disable-rpath --disable-dependency-tracking \
+                --disable-pinentry-qt5  \
+"
 
 PACKAGECONFIG ??= "ncurses libcap"
 
 PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses"
 PACKAGECONFIG[libcap] = "--with-libcap, --without-libcap, libcap"
-PACKAGECONFIG[qt4] = "--enable-pinentry-qt4, --disable-pinentry-qt4, qt4-x11"
-PACKAGECONFIG[qt4_clipboard] = "--enable-pinentry-qt4-clipboard --enable-pinentry-qt4, --disable-pinentry-qt4-clipboard, qt4-x11"
+PACKAGECONFIG[qt] = "--enable-pinentry-qt, --disable-pinentry-qt, qt4-x11"
 PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0"
 
 #To use libsecret, add meta-gnome
-- 
2.7.4


