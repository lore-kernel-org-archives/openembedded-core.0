Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.7715.1614526645036063834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kzgUGCGc;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id do6so23545395ejc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TaGDbTQOZStQyUbpdr5ww906WvQkvrSAkgl9pC+b5SU=;
        b=kzgUGCGcPkHjeR+JV/NwMh6mAkgi86p5fOQ79YgdUPz3I6CciR85GruXxzt1shipbh
         0i6+43//csOUZe+OvGUVsk50eHyvmd+RcHZjO7NaSnL+skuQH5gWHEc/sRwKCVvtqbuB
         cjghVWpE7LlhElc0DBPWbOO/o8UhoJ3AUmDUjnlhtdCK3BtwXXsrsQ5na9fD0jTUEseE
         S9G9GbzM/ZV70NMWnJSkU9xpxAO1IfNGAcv/Z0nSS0NM0AdZXqABpxj+NU5fz8BxGhAT
         ylINC/ls/rqCuMIsSuB28/Hwz/xnXoI+W7e3fdwh1vG5RuejMSk2V7SvtB/0V+mOBSNE
         IkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TaGDbTQOZStQyUbpdr5ww906WvQkvrSAkgl9pC+b5SU=;
        b=q38VgiTBN5ommCVPKtCjxSsHIjXTJzVpxr8kDTwoLqCYWoK1BOrJhb7A6OGIMrXacl
         qmFI4KbdxueIF0alL4k7A6LdqVuc8DPcbUAqM3f4pr9TKN9FqU1AdT5fYPnZ9ONHzlw3
         gY9+B2xyKKuMon5NrVLBl/4Ti5MJ0zagcR9xRYcRx2QNJ/XYjeUXqmaDR6X+s3wjllOO
         Fr9J8aA+HxCzRp6uYw1jn6nqCBBZLP9NXoqdySnc7574+9bBeqjPF/cwm9Ivc/WHu4Cy
         iDkoUtgdy5bmkmPPx5AT2dS4stF2vnxnd9QBG1KeQcpVe0LCFxJOOoiruH14x+i0hqs3
         uBjw==
X-Gm-Message-State: AOAM531N88q/2cJ71SJ5TA+p3K9NM4feBaGoM/f31lOBB33LNckTZ0kt
	Ty9P3o6ZuLuxIUlUi7pxKK8cAwjM3SJ8AQ==
X-Google-Smtp-Source: ABdhPJww0PeaTe5/yPW974Q5Of/UZAQan45NdKVBtxnSavxx5tLbXGRBeBhYbGV+VJjp20DjQXUMLg==
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr12376445ejc.176.1614526643537;
        Sun, 28 Feb 2021 07:37:23 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:23 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/24] pinentry: update 1.1.0 -> 1.1.1
Date: Sun, 28 Feb 2021 16:36:55 +0100
Message-Id: <20210228153702.498275-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh xxx-config->pkg-config patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py     |   2 +-
 .../pinentry-1.1.0/gpg-error_pkconf.patch     | 100 ----------
 .../pinentry-1.1.1/gpg-error_pkconf.patch     | 177 ++++++++++++++++++
 .../libassuan_pkgconf.patch                   | 111 ++++++-----
 .../{pinentry_1.1.0.bb => pinentry_1.1.1.bb}  |   3 +-
 5 files changed, 243 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-support/pinentry/pinentry-1.1.0/gpg-error_pkconf.patch
 create mode 100644 meta/recipes-support/pinentry/pinentry-1.1.1/gpg-error_pkconf.patch
 rename meta/recipes-support/pinentry/{pinentry-1.1.0 => pinentry-1.1.1}/libassuan_pkgconf.patch (63%)
 rename meta/recipes-support/pinentry/{pinentry_1.1.0.bb => pinentry_1.1.1.bb} (90%)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 726daff7c6..8a10ff357b 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -167,7 +167,7 @@ class OEListPackageconfigTests(OEScriptTests):
     def test_packageconfig_flags_option_all(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
         expected_endlines = []
-        expected_endlines.append("pinentry-1.1.0")
+        expected_endlines.append("pinentry-1.1.1")
         expected_endlines.append("PACKAGECONFIG ncurses libcap")
         expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
         expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
diff --git a/meta/recipes-support/pinentry/pinentry-1.1.0/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.1.0/gpg-error_pkconf.patch
deleted file mode 100644
index 431edb0351..0000000000
--- a/meta/recipes-support/pinentry/pinentry-1.1.0/gpg-error_pkconf.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-Convert to pkg-config support to match changes done to 
-the gpg-error recipe for gpg-error.pc  generation.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: pinentry-1.0.0/m4/gpg-error.m4
-===================================================================
---- pinentry-1.0.0.orig/m4/gpg-error.m4
-+++ pinentry-1.0.0/m4/gpg-error.m4
-@@ -25,74 +25,12 @@ dnl config script does not match the hos
- dnl is added to the gpg_config_script_warn variable.
- dnl
- AC_DEFUN([AM_PATH_GPG_ERROR],
--[ AC_REQUIRE([AC_CANONICAL_HOST])
--  gpg_error_config_prefix=""
--  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
--  dnl since that is consistent with how our three siblings use the directory/
--  dnl package name in --with-$dir_name-prefix=PFX.
--  AC_ARG_WITH(libgpg-error-prefix,
--              AC_HELP_STRING([--with-libgpg-error-prefix=PFX],
--                             [prefix where GPG Error is installed (optional)]),
--              [gpg_error_config_prefix="$withval"])
--
--  dnl Accept --with-gpg-error-prefix and make it work the same as
--  dnl --with-libgpg-error-prefix above, for backwards compatibility,
--  dnl but do not document this old, inconsistently-named option.
--  AC_ARG_WITH(gpg-error-prefix,,
--              [gpg_error_config_prefix="$withval"])
--
--  if test x"${GPG_ERROR_CONFIG}" = x ; then
--     if test x"${gpg_error_config_prefix}" != x ; then
--        GPG_ERROR_CONFIG="${gpg_error_config_prefix}/bin/gpg-error-config"
--     else
--       case "${SYSROOT}" in
--         /*)
--           if test -x "${SYSROOT}/bin/gpg-error-config" ; then
--             GPG_ERROR_CONFIG="${SYSROOT}/bin/gpg-error-config"
--           fi
--           ;;
--         '')
--           ;;
--          *)
--           AC_MSG_WARN([Ignoring \$SYSROOT as it is not an absolute path.])
--           ;;
--       esac
--     fi
--  fi
--
--  AC_PATH_PROG(GPG_ERROR_CONFIG, gpg-error-config, no)
-+[
-   min_gpg_error_version=ifelse([$1], ,0.0,$1)
--  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
--  ok=no
--  if test "$GPG_ERROR_CONFIG" != "no" \
--     && test -f "$GPG_ERROR_CONFIG" ; then
--    req_major=`echo $min_gpg_error_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
--    req_minor=`echo $min_gpg_error_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
--    gpg_error_config_version=`$GPG_ERROR_CONFIG $gpg_error_config_args --version`
--    major=`echo $gpg_error_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
--    minor=`echo $gpg_error_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
--    if test "$major" -gt "$req_major"; then
--        ok=yes
--    else
--        if test "$major" -eq "$req_major"; then
--            if test "$minor" -ge "$req_minor"; then
--               ok=yes
--            fi
--        fi
--    fi
--  fi
-+  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
-   if test $ok = yes; then
--    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --cflags`
--    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --libs`
--    GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --cflags 2>/dev/null`
--    GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --libs 2>/dev/null`
--    AC_MSG_RESULT([yes ($gpg_error_config_version)])
-     ifelse([$2], , :, [$2])
--    gpg_error_config_host=`$GPG_ERROR_CONFIG $gpg_error_config_args --host 2>/dev/null || echo none`
-+    gpg_error_config_host=`$PKG_CONFIG --host gpg-error 2>/dev/null || echo none`
-     if test x"$gpg_error_config_host" != xnone ; then
-       if test x"$gpg_error_config_host" != x"$host" ; then
-   AC_MSG_WARN([[
-@@ -107,10 +45,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
-       fi
-     fi
-   else
--    GPG_ERROR_CFLAGS=""
--    GPG_ERROR_LIBS=""
--    GPG_ERROR_MT_CFLAGS=""
--    GPG_ERROR_MT_LIBS=""
-     AC_MSG_RESULT(no)
-     ifelse([$3], , :, [$3])
-   fi
diff --git a/meta/recipes-support/pinentry/pinentry-1.1.1/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.1.1/gpg-error_pkconf.patch
new file mode 100644
index 0000000000..537735dba8
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry-1.1.1/gpg-error_pkconf.patch
@@ -0,0 +1,177 @@
+From 7b60f1563ecdb7020c145de8a96cae1c0a66c595 Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster@mvista.com>
+Date: Fri, 2 Sep 2005 11:50:01 +0000
+Subject: [PATCH] Add gtk+, avahi, dbus-0.34 (.36 coming soon) and
+
+Convert to pkg-config support to match changes done to
+the gpg-error recipe for gpg-error.pc  generation.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ m4/gpg-error.m4 | 141 ++----------------------------------------------
+ 1 file changed, 4 insertions(+), 137 deletions(-)
+
+diff --git a/m4/gpg-error.m4 b/m4/gpg-error.m4
+index c9b235f..a4fd41c 100644
+--- a/m4/gpg-error.m4
++++ b/m4/gpg-error.m4
+@@ -25,141 +25,12 @@ dnl config script does not match the host specification the script
+ dnl is added to the gpg_config_script_warn variable.
+ dnl
+ AC_DEFUN([AM_PATH_GPG_ERROR],
+-[ AC_REQUIRE([AC_CANONICAL_HOST])
+-  gpg_error_config_prefix=""
+-  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
+-  dnl since that is consistent with how our three siblings use the directory/
+-  dnl package name in --with-$dir_name-prefix=PFX.
+-  AC_ARG_WITH(libgpg-error-prefix,
+-              AS_HELP_STRING([--with-libgpg-error-prefix=PFX],
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
+-  min_gpg_error_version=ifelse([$1], ,1.33,$1)
+-  ok=no
+-
+-  if test "$prefix" = NONE ; then
+-    prefix_option_expanded=/usr/local
+-  else
+-    prefix_option_expanded="$prefix"
+-  fi
+-  if test "$exec_prefix" = NONE ; then
+-    exec_prefix_option_expanded=$prefix_option_expanded
+-  else
+-    exec_prefix_option_expanded=$(prefix=$prefix_option_expanded eval echo $exec_prefix)
+-  fi
+-  libdir_option_expanded=$(prefix=$prefix_option_expanded exec_prefix=$exec_prefix_option_expanded eval echo $libdir)
+-
+-  if test -f $libdir_option_expanded/pkgconfig/gpg-error.pc; then
+-    gpgrt_libdir=$libdir_option_expanded
+-  else
+-    if crt1_path=$(${CC:-cc} -print-file-name=crt1.o 2>/dev/null); then
+-      if possible_libdir=$(cd ${crt1_path%/*} && pwd 2>/dev/null); then
+-        if test -f $possible_libdir/pkgconfig/gpg-error.pc; then
+-          gpgrt_libdir=$possible_libdir
+-        fi
+-      fi
+-    fi
+-  fi
+-
+-  if test "$GPG_ERROR_CONFIG" = "no" -a -n "$gpgrt_libdir"; then
+-    AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
+-    if test "$GPGRT_CONFIG" = "no"; then
+-      unset GPGRT_CONFIG
+-    else
+-      GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
+-      if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
+-        GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
+-        AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
+-        gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
+-      else
+-        unset GPGRT_CONFIG
+-      fi
+-    fi
+-  else
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-  fi
+-  if test "$GPG_ERROR_CONFIG" != "no"; then
+-    req_major=`echo $min_gpg_error_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+-    req_minor=`echo $min_gpg_error_version | \
+-               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
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
+-    if test -z "$GPGRT_CONFIG" -a -n "$gpgrt_libdir"; then
+-      if test "$major" -gt 1 -o "$major" -eq 1 -a "$minor" -ge 33; then
+-        AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
+-        if test "$GPGRT_CONFIG" = "no"; then
+-          unset GPGRT_CONFIG
+-        else
+-          GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
+-          if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
+-            GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
+-            AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
+-          else
+-            unset GPGRT_CONFIG
+-          fi
+-        fi
+-      fi
+-    fi
+-  fi
+-  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
++[
++  min_gpg_error_version=ifelse([$1], ,0.0,$1)
++  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
+   if test $ok = yes; then
+-    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG --cflags`
+-    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG --libs`
+-    if test -z "$GPGRT_CONFIG"; then
+-      GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG --mt --cflags 2>/dev/null`
+-      GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG --mt --libs 2>/dev/null`
+-    else
+-      GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG --variable=mtcflags 2>/dev/null`
+-      GPG_ERROR_MT_CFLAGS="$GPG_ERROR_CFLAGS${GPG_ERROR_CFLAGS:+ }$GPG_ERROR_MT_CFLAGS"
+-      GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG --variable=mtlibs 2>/dev/null`
+-      GPG_ERROR_MT_LIBS="$GPG_ERROR_LIBS${GPG_ERROR_LIBS:+ }$GPG_ERROR_MT_LIBS"
+-    fi
+-    AC_MSG_RESULT([yes ($gpg_error_config_version)])
+     ifelse([$2], , :, [$2])
+-    if test -z "$GPGRT_CONFIG"; then
+-      gpg_error_config_host=`$GPG_ERROR_CONFIG --host 2>/dev/null || echo none`
+-    else
+-      gpg_error_config_host=`$GPG_ERROR_CONFIG --variable=host 2>/dev/null || echo none`
+-    fi
++    gpg_error_config_host=`$PKG_CONFIG --host gpg-error 2>/dev/null || echo none`
+     if test x"$gpg_error_config_host" != xnone ; then
+       if test x"$gpg_error_config_host" != x"$host" ; then
+   AC_MSG_WARN([[
+@@ -174,10 +45,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
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
diff --git a/meta/recipes-support/pinentry/pinentry-1.1.0/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.1.1/libassuan_pkgconf.patch
similarity index 63%
rename from meta/recipes-support/pinentry/pinentry-1.1.0/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.1.1/libassuan_pkgconf.patch
index 11d564f35d..f4aec2d1c3 100644
--- a/meta/recipes-support/pinentry/pinentry-1.1.0/libassuan_pkgconf.patch
+++ b/meta/recipes-support/pinentry/pinentry-1.1.1/libassuan_pkgconf.patch
@@ -1,3 +1,8 @@
+From 26fb6c3faa27180c8ed9ada1728c3d8683a65f3a Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster@mvista.com>
+Date: Thu, 22 May 2014 10:50:00 +0100
+Subject: [PATCH] libassuan: Improve pkgconfig support
+
 Convert to pkg-config support to match changes done to
 the libassuan recipe for libassuan.pc generation.
 
@@ -5,55 +10,70 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
 
-Index: pinentry-1.0.0/m4/libassuan.m4
-===================================================================
---- pinentry-1.0.0.orig/m4/libassuan.m4
-+++ pinentry-1.0.0/m4/libassuan.m4
-@@ -13,34 +13,8 @@ dnl
+---
+ configure.ac    |  4 +--
+ m4/libassuan.m4 | 93 ++++---------------------------------------------
+ 2 files changed, 9 insertions(+), 88 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d8dcc0c..ca51766 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -267,8 +267,8 @@ if test "$have_libassuan" = "yes"; then
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
+diff --git a/m4/libassuan.m4 b/m4/libassuan.m4
+index df50484..2057412 100644
+--- a/m4/libassuan.m4
++++ b/m4/libassuan.m4
+@@ -15,30 +15,8 @@ dnl
  dnl Common code used for libassuan detection [internal]
  dnl Returns ok set to yes or no.
  dnl
 -AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
 -[ AC_REQUIRE([AC_CANONICAL_HOST])
 -  AC_ARG_WITH(libassuan-prefix,
--              AC_HELP_STRING([--with-libassuan-prefix=PFX],
+-              AS_HELP_STRING([--with-libassuan-prefix=PFX],
 -                             [prefix where LIBASSUAN is installed (optional)]),
 -     libassuan_config_prefix="$withval", libassuan_config_prefix="")
 -  if test x$libassuan_config_prefix != x ; then
--    libassuan_config_args="$libassuan_config_args --prefix=$libassuan_config_prefix"
 -    if test x${LIBASSUAN_CONFIG+set} != xset ; then
 -      LIBASSUAN_CONFIG=$libassuan_config_prefix/bin/libassuan-config
 -    fi
--  else
--    case "${SYSROOT}" in
--       /*)
--         if test -x "${SYSROOT}/bin/libassuan-config" ; then
--           LIBASSUAN_CONFIG="${SYSROOT}/bin/libassuan-config"
--         fi
--         ;;
--       '')
--         ;;
--        *)
--         AC_MSG_WARN([Ignoring \$SYSROOT as it is not an absolute path.])
--         ;;
--     esac
 -  fi
 -
--  AC_PATH_TOOL(LIBASSUAN_CONFIG, libassuan-config, no)
+-  use_gpgrt_config=""
+-  if test x"${LIBASSUAN_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    if $GPGRT_CONFIG libassuan --exists; then
+-      LIBASSUAN_CONFIG="$GPGRT_CONFIG libassuan"
+-      AC_MSG_NOTICE([Use gpgrt-config as libassuan-config])
+-      use_gpgrt_config=yes
+-    fi
+-  fi
+-  if test -z "$use_gpgrt_config"; then
+-    AC_PATH_PROG(LIBASSUAN_CONFIG, libassuan-config, no)
+-  fi
 -
 +AC_DEFUN([AM_PATH_LIBASSUAN_COMMON],
 +[
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
      req_libassuan_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -50,51 +24,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -48,58 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
  
 -  AC_MSG_CHECKING(for LIBASSUAN - version >= $min_libassuan_version)
 -  ok=no
--  if test "$LIBASSUAN_CONFIG" != "no" \
--     && test -f "$LIBASSUAN_CONFIG" ; then
+-  if test "$LIBASSUAN_CONFIG" != "no"; then
 -    req_major=`echo $min_libassuan_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
 -    req_minor=`echo $min_libassuan_version | \
@@ -61,7 +81,11 @@ Index: pinentry-1.0.0/m4/libassuan.m4
 -    req_micro=`echo $min_libassuan_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
 -
--    libassuan_config_version=`$LIBASSUAN_CONFIG --version`
+-    if test -z "$use_gpgrt_config"; then
+-      libassuan_config_version=`$LIBASSUAN_CONFIG --version`
+-    else
+-      libassuan_config_version=`$LIBASSUAN_CONFIG --modversion`
+-    fi
 -    major=`echo $libassuan_config_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
 -    minor=`echo $libassuan_config_version | \
@@ -95,21 +119,29 @@ Index: pinentry-1.0.0/m4/libassuan.m4
  
    if test $ok = yes; then
      if test "$req_libassuan_api" -gt 0 ; then
--      tmp=`$LIBASSUAN_CONFIG --api-version 2>/dev/null || echo 0`
+-      if test -z "$use_gpgrt_config"; then
+-        tmp=`$LIBASSUAN_CONFIG --api-version 2>/dev/null || echo 0`
+-      else
+-        tmp=`$LIBASSUAN_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-      fi
 +      tmp=`$PKG_CONFIG --variable=api_version libassuan 2>/dev/null || echo 0`
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -109,7 +43,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -114,11 +45,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  
    if test $ok = yes; then
      if test x"$host" != x ; then
--      libassuan_config_host=`$LIBASSUAN_CONFIG --host 2>/dev/null || echo none`
+-      if test -z "$use_gpgrt_config"; then
+-        libassuan_config_host=`$LIBASSUAN_CONFIG --host 2>/dev/null || echo none`
+-      else
+-        libassuan_config_host=`$LIBASSUAN_CONFIG --variable=host 2>/dev/null || echo none`
+-      fi
 +      libassuan_config_host=`$PKG_CONFIG --host libassuan 2>/dev/null || echo 0`
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -132,7 +66,7 @@ dnl Test whether libassuan has at least
+@@ -141,7 +68,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
  dnl used to test for features only available in newer versions.
  dnl
  AC_DEFUN([AM_CHECK_LIBASSUAN],
@@ -118,15 +150,15 @@ Index: pinentry-1.0.0/m4/libassuan.m4
    if test $ok = yes; then
      ifelse([$2], , :, [$2])
    else
-@@ -148,16 +82,10 @@ dnl                   [ACTION-IF-FOUND [
+@@ -157,16 +84,10 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
  dnl Test for libassuan and define LIBASSUAN_CFLAGS and LIBASSUAN_LIBS
  dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
 -[ _AM_PATH_LIBASSUAN_COMMON($1)
 +[ AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
--    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG $libassuan_config_args --cflags`
--    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG $libassuan_config_args --libs`
+-    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
+-    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
      ifelse([$2], , :, [$2])
    else
 -    LIBASSUAN_CFLAGS=""
@@ -136,18 +168,3 @@ Index: pinentry-1.0.0/m4/libassuan.m4
 -  AC_SUBST(LIBASSUAN_CFLAGS)
 -  AC_SUBST(LIBASSUAN_LIBS)
  ])
-Index: pinentry-1.0.0/configure.ac
-===================================================================
---- pinentry-1.0.0.orig/configure.ac
-+++ pinentry-1.0.0/configure.ac
-@@ -266,8 +266,8 @@ if test "$have_libassuan" = "yes"; then
-                      [version of the libassuan library])
- fi
- 
--COMMON_CFLAGS="$LIBASSUAN_CFLAGS $COMMON_CFLAGS"
--COMMON_LIBS="$LIBASSUAN_LIBS $COMMON_LIBS"
-+COMMON_CFLAGS="$LIBASSUAN_COMMON_CFLAGS $COMMON_CFLAGS"
-+COMMON_LIBS="$LIBASSUAN_COMMON_LIBS $COMMON_LIBS"
- 
- 
- dnl Checks for libsecmem.
diff --git a/meta/recipes-support/pinentry/pinentry_1.1.0.bb b/meta/recipes-support/pinentry/pinentry_1.1.1.bb
similarity index 90%
rename from meta/recipes-support/pinentry/pinentry_1.1.0.bb
rename to meta/recipes-support/pinentry/pinentry_1.1.1.bb
index d9ca0732f7..98577fe3ef 100644
--- a/meta/recipes-support/pinentry/pinentry_1.1.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.1.1.bb
@@ -16,8 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gpg-error_pkconf.patch \
 "
 
-SRC_URI[md5sum] = "3829315cb0a1e9cedc05ffe6def7a2c6"
-SRC_URI[sha256sum] = "68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570"
+SRC_URI[sha256sum] = "cd12a064013ed18e2ee8475e669b9f58db1b225a0144debdb85a68cecddba57f"
 
 inherit autotools pkgconfig
 
-- 
2.29.2

