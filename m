Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F16CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 19:02:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.21233.1756926140517922787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 12:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HFrcfAD8;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so2058885e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756926139; x=1757530939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKjLPtRAxU9NTXgH6wHeMmDfVmB4fs/y0EhXKD1ZvpE=;
        b=HFrcfAD8Wjb1OO3naeyaonMZuJ367cwVzXs68pZf3UKfmKPURjHDQtA7CwVArVI0nK
         1WpXmULlo5LWhEsSqvskbXF+hXgyzzOfrUYrN+uEOf1wPalniBumnUDh2vg4V/wqD3JV
         Oi4RCdGA/JPLzwKGhwUoHeW1Z9mw5lgk5JZ+HHYvsJ1GMK0+fn85xMDOThC333cfN6Uc
         tPC1Kdz5pWGvRlFVmx3+XeMKnmmGbdWbH70HWKjmbUmllEuSnpc1XepV4yi2S/cnnhpZ
         sVbEF2L+NTehba/7muMV6o/hhFuDF6t42cdgAt7ELQlnmbNgh+BfXMqAy7Z1OCLDYptH
         Htvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756926139; x=1757530939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKjLPtRAxU9NTXgH6wHeMmDfVmB4fs/y0EhXKD1ZvpE=;
        b=cmUR31Tx0Gfmt15T9yI++CH+k9iU2ngCmkYacl49bzYqmEF1loj+j7iCRdOyBNBpXa
         /4VUCsHtBk8zmxsCpBpAEPJpJPSwGETz1bs4MRtYg3sqBkpL2Hz9Tf14gYykprTwk8mp
         Y0KRISMl4umM2jlt046Xpr3vPojcphmkAb85wvhUi6CUHXcke7omPWHuXoZh8r4Mcsok
         55/ZErk7qxZV5vKDIoHSOWDBRPtrEPsucyXzkQss/CEbHn/wCsPh2sl+4FgFwmV7Dhp8
         KexhnlzzVh6uxT9E2e9yIUwH8OvKj+ep/V5OLhyhJH7x1YgiYUap3FgbxFMtaLkxNuaC
         nVsw==
X-Gm-Message-State: AOJu0YxQvMZBTw7zAZDP66ZxQ0DTekwp7btHdKRlrUVJRZQPCkXvWsIM
	zISs4u3QZHhgbkBLOvZGYBh8maYkx2OVJLWZo6RIyZ2UuncLB5vWnHtSY5YKDlxt
X-Gm-Gg: ASbGncsXHII6/fbs0udB2Lwqj4AMBWD9a8vla328HeqIo197EWXf6Ej6ki8TLhE/BGs
	cUgoVNzOCgwE/+quvnKweitHc/6bcbVCEPRVlyIn+Udl1qwrUuxBoYd+Qx5RCCsWnUUFqi553IN
	4n1xEe0VWrd9cwS2tsVjgJUA2B6txzwL+wH/ep/rmIEHVhyOT4k+wtMhusSw8RGF1WaGPfk9oAZ
	IRebZUTKuVzsCd5QGICVFybuZIy1v8hhFXsSBnxYy3srcejZ+4kQryQpHCBGrG7EqxIapfhNMwI
	ZWr5kZmjfZYY+fqloPJtlEa8zx7h6O8im/ITPr0iPfRfOxv06emRUYQY05h199M9J9NJY1oVyhr
	/w55lzjVMRI5xOsyy+pML7P9aKk6p1js=
X-Google-Smtp-Source: AGHT+IFmGzT5hrWXnO3paga7+uqp6FwdGFz5rkGKrDyk+VN9MWYzx+mgtUKm/IXssXP7QRJnZRFJJA==
X-Received: by 2002:a05:6000:23c3:b0:3da:37de:a3c0 with SMTP id ffacd0b85a97d-3da37dea865mr3497920f8f.15.1756926138455;
        Wed, 03 Sep 2025 12:02:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d1007c0dc8sm22942936f8f.53.2025.09.03.12.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 12:02:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH v3] pinentry: upgrade 1.3.1 -> 1.3.2
Date: Wed,  3 Sep 2025 21:02:17 +0200
Message-ID: <20250903190217.1425062-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 19:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222881

Shortlog:

-qt: Replace icons for dark mode with 16x16 icons
-qt,qt5: Ensure that input field is large enough for generated password
-qt5: Add dark mode icon variants and detection
-Make Show/Hide Password functionality accessible
-qt5: Make Show/Hide Password functionality accessible
-m4: Update libassuan.m4.
-build: Remove defining GPG_ERR_ENABLE_ERRNO_MACROS.
-build: Fix warning about obsolete pinentry-emacs.
-curses: Factor out dialog release to separate function.
-qt: Add dark mode icon variants and detection
-m4: Update gpg-error.m4 and libassuan.m4.

Also: Simplify patch to find gpg-error with pkg-config

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---

v3: simplify gpg-error_pkconf.patch
v2: adapt selftest to the new version number

 meta/lib/oeqa/selftest/cases/oescripts.py     |   2 +-
 .../pinentry-1.3.1/gpg-error_pkconf.patch     | 224 ------------------
 .../0001-find-gpg-error-with-pkg-config.patch |  40 ++++
 .../libassuan_pkgconf.patch                   |  30 +--
 .../{pinentry_1.3.1.bb => pinentry_1.3.2.bb}  |   4 +-
 5 files changed, 54 insertions(+), 246 deletions(-)
 delete mode 100644 meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
 create mode 100644 meta/recipes-support/pinentry/pinentry/0001-find-gpg-error-with-pkg-config.patch
 rename meta/recipes-support/pinentry/{pinentry-1.3.1 => pinentry}/libassuan_pkgconf.patch (87%)
 rename meta/recipes-support/pinentry/{pinentry_1.3.1.bb => pinentry_1.3.2.bb} (89%)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 3f9899b289..64fb3f1a1d 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -151,7 +151,7 @@ class OEListPackageconfigTests(OESelftestTestCase):
     def test_packageconfig_flags_option_all(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
         expected_endlines = []
-        expected_endlines.append("pinentry-1.3.1")
+        expected_endlines.append("pinentry-1.3.2")
         expected_endlines.append("PACKAGECONFIG ncurses")
         expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
         expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
diff --git a/meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
deleted file mode 100644
index 863ba9e34b..0000000000
--- a/meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
+++ /dev/null
@@ -1,224 +0,0 @@
-From ccc3c6a8d469bbfa6717b970cfe70816c1fd545e Mon Sep 17 00:00:00 2001
-From: Armin Kuster <akuster@mvista.com>
-Date: Fri, 2 Sep 2005 11:50:01 +0000
-Subject: [PATCH] Add gtk+, avahi, dbus-0.34 (.36 coming soon) and
-
-Convert to pkg-config support to match changes done to
-the gpg-error recipe for gpg-error.pc  generation.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
----
- m4/gpg-error.m4 | 184 ++----------------------------------------------
- 1 file changed, 5 insertions(+), 179 deletions(-)
-
-diff --git a/m4/gpg-error.m4 b/m4/gpg-error.m4
-index 7fa52b1..c0784ed 100644
---- a/m4/gpg-error.m4
-+++ b/m4/gpg-error.m4
-@@ -15,188 +15,18 @@
- dnl
- dnl Find gpg-error-config, for backward compatibility
- dnl
--dnl _AM_PATH_POSSIBLE_GPG_ERROR_CONFIG
--AC_DEFUN([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG],[dnl
--  gpg_error_config_prefix=""
--  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
--  dnl since that is consistent with how our three siblings use the directory/
--  dnl package name in --with-$dir_name-prefix=PFX.
--  AC_ARG_WITH(libgpg-error-prefix,
--              AS_HELP_STRING([--with-libgpg-error-prefix=PFX],
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
--])
--
--dnl
--dnl Find gpgrt-config, which uses .pc file
--dnl (minimum pkg-config functionality, supporting cross build)
--dnl
--dnl _AM_PATH_GPGRT_CONFIG
--AC_DEFUN([_AM_PATH_GPGRT_CONFIG],[dnl
--  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$prefix/bin:$PATH])
--  if test "$GPGRT_CONFIG" != "no"; then
--    # Determine gpgrt_libdir
--    #
--    # Get the prefix of gpgrt-config assuming it's something like:
--    #   <PREFIX>/bin/gpgrt-config
--    gpgrt_prefix=${GPGRT_CONFIG%/*/*}
--    possible_libdir1=${gpgrt_prefix}/lib
--    # Determine by using system libdir-format with CC, it's like:
--    #   Normal style: /usr/lib
--    #   GNU cross style: /usr/<triplet>/lib
--    #   Debian style: /usr/lib/<multiarch-name>
--    #   Fedora/openSUSE style: /usr/lib, /usr/lib32 or /usr/lib64
--    # It is assumed that CC is specified to the one of host on cross build.
--    if libdir_candidates=$(${CC:-cc} -print-search-dirs | \
--          sed -n -e "/^libraries/{s/libraries: =//;s/:/\\
--/g;p;}"); then
--      # From the output of -print-search-dirs, select valid pkgconfig dirs.
--      libdir_candidates=$(for dir in $libdir_candidates; do
--        if p=$(cd $dir 2>/dev/null && pwd); then
--          test -d "$p/pkgconfig" && echo $p;
--        fi
--      done)
--
--      for possible_libdir0 in $libdir_candidates; do
--        # possible_libdir0:
--        #   Fallback candidate, the one of system-installed (by $CC)
--        #   (/usr/<triplet>/lib, /usr/lib/<multiarch-name> or /usr/lib32)
--        # possible_libdir1:
--        #   Another candidate, user-locally-installed
--        #   (<gpgrt_prefix>/lib)
--        # possible_libdir2
--        #   Most preferred
--        #   (<gpgrt_prefix>/<triplet>/lib,
--        #    <gpgrt_prefix>/lib/<multiarch-name> or <gpgrt_prefix>/lib32)
--        if test "${possible_libdir0##*/}" = "lib"; then
--          possible_prefix0=${possible_libdir0%/lib}
--          possible_prefix0_triplet=${possible_prefix0##*/}
--          if test -z "$possible_prefix0_triplet"; then
--            continue
--          fi
--          possible_libdir2=${gpgrt_prefix}/$possible_prefix0_triplet/lib
--        else
--          possible_prefix0=${possible_libdir0%%/lib*}
--          possible_libdir2=${gpgrt_prefix}${possible_libdir0#$possible_prefix0}
--        fi
--        if test -f ${possible_libdir2}/pkgconfig/gpg-error.pc; then
--          gpgrt_libdir=${possible_libdir2}
--        elif test -f ${possible_libdir1}/pkgconfig/gpg-error.pc; then
--          gpgrt_libdir=${possible_libdir1}
--        elif test -f ${possible_libdir0}/pkgconfig/gpg-error.pc; then
--          gpgrt_libdir=${possible_libdir0}
--        fi
--        if test -n "$gpgrt_libdir"; then break; fi
--      done
--    fi
--    if test -z "$gpgrt_libdir"; then
--      # No valid pkgconfig dir in any of the system directories, fallback
--      gpgrt_libdir=${possible_libdir1}
--    fi
--  else
--    unset GPGRT_CONFIG
--  fi
--
--  if test -n "$gpgrt_libdir"; then
--    GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
--    if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
--      GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
--      AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
--      gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
--    else
--      gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
--      unset GPGRT_CONFIG
--    fi
--  elif test "$GPG_ERROR_CONFIG" != "no"; then
--    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
--    unset GPGRT_CONFIG
--  fi
--])
--
--dnl AM_PATH_GPG_ERROR([MINIMUM-VERSION,
--dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
--dnl
--dnl Test for libgpg-error and define GPG_ERROR_CFLAGS, GPG_ERROR_LIBS,
--dnl GPG_ERROR_MT_CFLAGS, and GPG_ERROR_MT_LIBS.  The _MT_ variants are
--dnl used for programs requireing real multi thread support.
--dnl
- dnl If a prefix option is not used, the config script is first
- dnl searched in $SYSROOT/bin and then along $PATH.  If the used
- dnl config script does not match the host specification the script
- dnl is added to the gpg_config_script_warn variable.
- dnl
--AC_DEFUN([AM_PATH_GPG_ERROR],[dnl
--AC_REQUIRE([AC_CANONICAL_HOST])dnl
--AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
--AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
--  min_gpg_error_version=ifelse([$1], ,1.33,$1)
--  ok=no
--  if test "$GPG_ERROR_CONFIG" != "no"; then
--    req_major=`echo $min_gpg_error_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
--    req_minor=`echo $min_gpg_error_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
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
--  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
-+AC_DEFUN([AM_PATH_GPG_ERROR],
-+[
-+  min_gpg_error_version=ifelse([$1], ,0.0,$1)
-+  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
-   if test $ok = yes; then
--    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG --cflags`
--    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG --libs`
--    if test -z "$GPGRT_CONFIG"; then
--      GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG --mt --cflags 2>/dev/null`
--      GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG --mt --libs 2>/dev/null`
--    else
--      GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG --variable=mtcflags 2>/dev/null`
--      GPG_ERROR_MT_CFLAGS="$GPG_ERROR_CFLAGS${GPG_ERROR_CFLAGS:+ }$GPG_ERROR_MT_CFLAGS"
--      GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG --variable=mtlibs 2>/dev/null`
--      GPG_ERROR_MT_LIBS="$GPG_ERROR_LIBS${GPG_ERROR_LIBS:+ }$GPG_ERROR_MT_LIBS"
--    fi
--    AC_MSG_RESULT([yes ($gpg_error_config_version)])
-     ifelse([$2], , :, [$2])
--    if test -z "$GPGRT_CONFIG"; then
--      gpg_error_config_host=`$GPG_ERROR_CONFIG --host 2>/dev/null || echo none`
--    else
--      gpg_error_config_host=`$GPG_ERROR_CONFIG --variable=host 2>/dev/null || echo none`
--    fi
-+    gpg_error_config_host=`$PKG_CONFIG --host gpg-error 2>/dev/null || echo none`
-     if test x"$gpg_error_config_host" != xnone ; then
-       if test x"$gpg_error_config_host" != x"$host" ; then
-   AC_MSG_WARN([[
-@@ -211,10 +41,6 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
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
diff --git a/meta/recipes-support/pinentry/pinentry/0001-find-gpg-error-with-pkg-config.patch b/meta/recipes-support/pinentry/pinentry/0001-find-gpg-error-with-pkg-config.patch
new file mode 100644
index 0000000000..54c82350a2
--- /dev/null
+++ b/meta/recipes-support/pinentry/pinentry/0001-find-gpg-error-with-pkg-config.patch
@@ -0,0 +1,40 @@
+From 2e90424eb1518083133a79f2737152c83289bc99 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 3 Sep 2025 20:24:01 +0200
+Subject: [PATCH] find gpg-error with pkg-config
+
+This patch is a simplification of a previous patch, which
+added support to find gpg-error with pkg-config, adapted
+to the changes that are made to the gpg-error .pc file
+in its recipe.
+
+Instead of using upstream's custom solution from
+m4/gpg-error.m4 file, use just the standard pkg-config macro
+to see if gpg-error is present.
+
+This patch hasn't been submitted for upstream, due to their
+historical reluctance to accept such patches.[1]
+
+[1]: https://lists.gnupg.org/pipermail/gnupg-devel/2018-October/033985.html (whole thread)
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ec46162..2b2e16d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -238,8 +238,7 @@ dnl Checks for libgpg-error
+ NEED_GPG_ERROR_VERSION=1.16
+ have_gpg_error=no
+ 
+-AM_PATH_GPG_ERROR("$NEED_GPG_ERROR_VERSION",
+-                  have_gpg_error=yes,have_gpg_error=no)
++PKG_CHECK_MODULES([GPG_ERROR], [gpg-error >= $NEED_GPG_ERROR_VERSION], [have_gpg_error=yes], [have_gpg_error=no])
+ COMMON_CFLAGS="$GPG_ERROR_CFLAGS $COMMON_CFLAGS"
+ COMMON_LIBS="$GPG_ERROR_LIBS $COMMON_LIBS"
+ 
diff --git a/meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
similarity index 87%
rename from meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
index f2d50010c5..fbd370d9fd 100644
--- a/meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch
+++ b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
@@ -18,7 +18,7 @@ diff --git a/configure.ac b/configure.ac
 index 4944f7c..f03cbb7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -264,8 +264,8 @@ if test "$have_libassuan" = "yes"; then
+@@ -261,8 +261,8 @@ if test "$have_libassuan" = "yes"; then
                       [version of the libassuan library])
  fi
  
@@ -33,12 +33,13 @@ diff --git a/m4/libassuan.m4 b/m4/libassuan.m4
 index a2eb5d9..897f407 100644
 --- a/m4/libassuan.m4
 +++ b/m4/libassuan.m4
-@@ -15,30 +15,8 @@ dnl
+@@ -100,31 +100,8 @@ dnl
  dnl Common code used for libassuan detection [internal]
  dnl Returns ok set to yes or no.
  dnl
 -AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
--[ AC_REQUIRE([AC_CANONICAL_HOST])
+-[ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-  AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
 -  AC_ARG_WITH(libassuan-prefix,
 -              AS_HELP_STRING([--with-libassuan-prefix=PFX],
 -                             [prefix where LIBASSUAN is installed (optional)]),
@@ -66,7 +67,7 @@ index a2eb5d9..897f407 100644
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
      req_libassuan_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -48,59 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -134,59 +111,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
  
@@ -111,7 +112,7 @@ index a2eb5d9..897f407 100644
 -
 -  if test $ok = yes; then
 -    AC_MSG_RESULT([yes ($libassuan_config_version)])
--    AC_DEFINE(LIBASSUAN_API_REQUESTED, $req_libassuan_api, Requested API version for libassuan)
+-    AC_DEFINE_UNQUOTED(LIBASSUAN_API_REQUESTED, $req_libassuan_api, [Requested API version for libassuan])
 -  else
 -    AC_MSG_RESULT(no)
 -  fi
@@ -128,7 +129,7 @@ index a2eb5d9..897f407 100644
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -117,11 +47,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -203,11 +132,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  
    if test $ok = yes; then
      if test x"$host" != x ; then
@@ -141,7 +142,7 @@ index a2eb5d9..897f407 100644
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -144,7 +70,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
+@@ -230,7 +155,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
  dnl used to test for features only available in newer versions.
  dnl
  AC_DEFUN([AM_CHECK_LIBASSUAN],
@@ -150,21 +151,12 @@ index a2eb5d9..897f407 100644
    if test $ok = yes; then
      ifelse([$2], , :, [$2])
    else
-@@ -160,16 +86,10 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
+@@ -246,7 +171,7 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
  dnl Test for libassuan and define LIBASSUAN_CFLAGS and LIBASSUAN_LIBS
  dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
 -[ _AM_PATH_LIBASSUAN_COMMON($1)
 +[ AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
--    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
--    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
-     ifelse([$2], , :, [$2])
-   else
--    LIBASSUAN_CFLAGS=""
--    LIBASSUAN_LIBS=""
-     ifelse([$3], , :, [$3])
-   fi
--  AC_SUBST(LIBASSUAN_CFLAGS)
--  AC_SUBST(LIBASSUAN_LIBS)
- ])
+     LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
+     LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.2.bb
similarity index 89%
rename from meta/recipes-support/pinentry/pinentry_1.3.1.bb
rename to meta/recipes-support/pinentry/pinentry_1.3.2.bb
index 0fc652cdba..a5c8d2258a 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.2.bb
@@ -13,10 +13,10 @@ DEPENDS = "gettext-native libassuan libgpg-error"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libassuan_pkgconf.patch \
-           file://gpg-error_pkconf.patch \
+           file://0001-find-gpg-error-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04"
+SRC_URI[sha256sum] = "8e986ed88561b4da6e9efe0c54fa4ca8923035c99264df0b0464497c5fb94e9e"
 
 inherit autotools pkgconfig
 

