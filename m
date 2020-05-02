Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.11713.1588449250756665166
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 12:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dW98fnJY;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id g13so16020923wrb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKL//NNJUSobaf1OE18CBuVzmzr1E3Gr6CjYsCBCToM=;
        b=dW98fnJYBymVvQ0HHvFPJUB9u8moO2C7vuSHB7Pk8drcv10mZxEN76JXOLC75NjWEa
         7Z94Wa7lq+aOOgQbNDqU8pIg2W1pnImtmTaXJaKXe6gxrgI1StFQ9dCJ2rHMvMCAo6EV
         zCljJi1wxRi5XW/IK9auTSI4y5ilKarp9A5XIQJNpmBrlJ9J4sN8mAMIdjCpPGIb2M8q
         WyOTUyLqC9kxw/hJtcFi7l+gozcoH9x8CvNV54RfI9RWTVbPFGdBbHGjOTIO1cK46H7F
         CQBjVRGqs3bMsh/RxUowgywY7uhFe+PgM9kaiYfJUV7wHapkl2nVvUILepwcRRLOAxjm
         wKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKL//NNJUSobaf1OE18CBuVzmzr1E3Gr6CjYsCBCToM=;
        b=VbwopXs7RNNwerLW6O79aCaNJCY5D9s2WMrACcgmz0j9p+X/1VI38gXGIP/TcVDGwq
         UFMugjaZQGIx7pWXnegO3coOsUxPqZ893kT9dx8BVADSpmQqIQRluOWv9XSjgM3wMlfm
         MGQxqPFr6h4W3RfcSp6pKcT/eXO1Oif815YqeSdK7GEAN8/vRNnAfFspTwAcNS24LANK
         xy7NWi/IOssJ4GKcH2dvYKHFxLpuT8cO5xcyTNsb2YrNbltBVPMEXvmuRZWGJQZD2Dgt
         rafCSZtZ3LKkeZKpkLIsdE5yxfwIblEhX27WyhKD8JpxobLg4X304hfWrZI9Bck+2u81
         KqHw==
X-Gm-Message-State: AGi0PuZP048/iH+7kK4ofDrHUO8elO0tVXmMSkHbHtTwsqSN0VTt9Kiw
	wPiY/z/c8Qe7eGT4NuXX+SCRsstE
X-Google-Smtp-Source: APiQypJRPrQUGm7HkNDfCqPXt7Y+c9L4v2Bn2Prj/wHyKXEvamj0MbysnYnj+XnNbkayTURFbSskQg==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr2905557wrq.96.1588449248579;
        Sat, 02 May 2020 12:54:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h6sm5276149wmf.31.2020.05.02.12.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 12:54:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] coreutils: update to 8.32
Date: Sat,  2 May 2020 21:53:52 +0200
Message-Id: <20200502195352.17279-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200502195352.17279-1-alex.kanavin@gmail.com>
References: <20200502195352.17279-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years, http changed to https
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...8.31-behavior-on-removed-directories.patch | 99 +++++++++++++++++++
 .../coreutils/fix-selinux-flask.patch         | 13 +--
 .../remove-usr-local-lib-from-m4.patch        | 23 +++--
 .../strtod_fix_clash_with_strtold.patch       | 56 -----------
 .../{coreutils_8.31.bb => coreutils_8.32.bb}  | 14 +--
 5 files changed, 128 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
 rename meta/recipes-core/coreutils/{coreutils_8.31.bb => coreutils_8.32.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch b/meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
new file mode 100644
index 0000000000..fa900e3a76
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
@@ -0,0 +1,99 @@
+From 7c273e5c6041f8c70f73f5b280fbb8f27d9b5a36 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 5 Mar 2020 17:25:29 -0800
+Subject: [PATCH] ls: restore 8.31 behavior on removed directories
+
+* NEWS: Mention this.
+* src/ls.c: Do not include <sys/sycall.h>
+(print_dir): Don't worry about whether the directory is removed.
+* tests/ls/removed-directory.sh: Adjust to match new (i.e., old)
+behavior.
+
+Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/10fcb97bd728f09d4a027eddf8ad2900f0819b0a]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/ls.c                      | 22 ----------------------
+ tests/ls/removed-directory.sh | 10 ++--------
+ 2 files changed, 2 insertions(+), 30 deletions(-)
+
+diff --git a/src/ls.c b/src/ls.c
+index 637fe7a..0111f49 100644
+--- a/src/ls.c
++++ b/src/ls.c
+@@ -49,10 +49,6 @@
+ # include <sys/ptem.h>
+ #endif
+ 
+-#ifdef __linux__
+-# include <sys/syscall.h>
+-#endif
+-
+ #include <stdio.h>
+ #include <assert.h>
+ #include <setjmp.h>
+@@ -2895,7 +2891,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
+   struct dirent *next;
+   uintmax_t total_blocks = 0;
+   static bool first = true;
+-  bool found_any_entries = false;
+ 
+   errno = 0;
+   dirp = opendir (name);
+@@ -2971,7 +2966,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
+       next = readdir (dirp);
+       if (next)
+         {
+-          found_any_entries = true;
+           if (! file_ignored (next->d_name))
+             {
+               enum filetype type = unknown;
+@@ -3017,22 +3011,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
+           if (errno != EOVERFLOW)
+             break;
+         }
+-#ifdef __linux__
+-      else if (! found_any_entries)
+-        {
+-          /* If readdir finds no directory entries at all, not even "." or
+-             "..", then double check that the directory exists.  */
+-          if (syscall (SYS_getdents, dirfd (dirp), NULL, 0) == -1
+-              && errno != EINVAL)
+-            {
+-              /* We exclude EINVAL as that pertains to buffer handling,
+-                 and we've passed NULL as the buffer for simplicity.
+-                 ENOENT is returned if appropriate before buffer handling.  */
+-              file_failure (command_line_arg, _("reading directory %s"), name);
+-            }
+-          break;
+-        }
+-#endif
+       else
+         break;
+ 
+diff --git a/tests/ls/removed-directory.sh b/tests/ls/removed-directory.sh
+index e8c835d..fe8f929 100755
+--- a/tests/ls/removed-directory.sh
++++ b/tests/ls/removed-directory.sh
+@@ -26,20 +26,14 @@ case $host_triplet in
+   *) skip_ 'non linux kernel' ;;
+ esac
+ 
+-LS_FAILURE=2
+-
+-cat <<\EOF >exp-err || framework_failure_
+-ls: reading directory '.': No such file or directory
+-EOF
+-
+ cwd=$(pwd)
+ mkdir d || framework_failure_
+ cd d || framework_failure_
+ rmdir ../d || framework_failure_
+ 
+-returns_ $LS_FAILURE ls >../out 2>../err || fail=1
++ls >../out 2>../err || fail=1
+ cd "$cwd" || framework_failure_
+ compare /dev/null out || fail=1
+-compare exp-err err || fail=1
++compare /dev/null err || fail=1
+ 
+ Exit $fail
diff --git a/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
index 9d1ae55d47..173a57925b 100644
--- a/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
+++ b/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
@@ -1,4 +1,4 @@
-From a1d360509fa3a4aff57eedcd528cc0347a87531d Mon Sep 17 00:00:00 2001
+From 7e20a7242ba2657f73311bbf5278093da67f0721 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 16 Sep 2014 01:59:08 -0700
 Subject: [PATCH] gnulib-comp.m4: selinux/flask.h should respect to
@@ -13,20 +13,20 @@ compilation terminated.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- m4/gnulib-comp.m4 |    2 +-
+ m4/gnulib-comp.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/m4/gnulib-comp.m4 b/m4/gnulib-comp.m4
-index 472d3a0..5f09734 100644
+index dead90e..0abf0bd 100644
 --- a/m4/gnulib-comp.m4
 +++ b/m4/gnulib-comp.m4
-@@ -1730,11 +1730,11 @@ AC_DEFUN([gl_INIT],
+@@ -1860,10 +1860,10 @@ AC_DEFUN([gl_INIT],
      AC_LIBOBJ([select])
    fi
    gl_SYS_SELECT_MODULE_INDICATOR([select])
 -  AC_CHECK_HEADERS([selinux/flask.h])
-   AC_LIBOBJ([selinux-at])
    gl_HEADERS_SELINUX_SELINUX_H
    gl_HEADERS_SELINUX_CONTEXT_H
    if test "$with_selinux" != no && test "$ac_cv_header_selinux_selinux_h" = yes; then
@@ -34,6 +34,3 @@ index 472d3a0..5f09734 100644
      AC_LIBOBJ([getfilecon])
    fi
    gl_SERVENT
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
index 2ef8a548ac..1a8a9b9983 100644
--- a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
@@ -1,3 +1,8 @@
+From a26530083a29eeee910bfd606ecc621acecd547a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Aug 2011 14:12:30 -0700
+Subject: [PATCH] coreutils: Fix build on uclibc
+
 We have problem using hardcoded directories like /usr/local here
 which will be checked for cross builds. This is a special case which
 is valid for AIX only. We do not have AIX as one of our supported
@@ -8,11 +13,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
 
-Index: coreutils-8.14/m4/getloadavg.m4
-===================================================================
---- coreutils-8.14.orig/m4/getloadavg.m4	2011-09-19 08:09:24.000000000 -0700
-+++ coreutils-8.14/m4/getloadavg.m4	2011-10-19 21:42:00.385533357 -0700
-@@ -41,16 +41,6 @@
+---
+ m4/getloadavg.m4 | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
+index 8e96965..63782a2 100644
+--- a/m4/getloadavg.m4
++++ b/m4/getloadavg.m4
+@@ -41,18 +41,6 @@ AC_CHECK_FUNC([getloadavg], [],
         [LIBS="-lutil $LIBS" gl_func_getloadavg_done=yes])
     fi
  
@@ -20,7 +29,9 @@ Index: coreutils-8.14/m4/getloadavg.m4
 -     # There is a commonly available library for RS/6000 AIX.
 -     # Since it is not a standard part of AIX, it might be installed locally.
 -     gl_getloadavg_LIBS=$LIBS
--     LIBS="-L/usr/local/lib $LIBS"
+-     if test $cross_compiling != yes; then
+-       LIBS="-L/usr/local/lib $LIBS"
+-     fi
 -     AC_CHECK_LIB([getloadavg], [getloadavg],
 -                  [LIBS="-lgetloadavg $LIBS" gl_func_getloadavg_done=yes],
 -                  [LIBS=$gl_getloadavg_LIBS])
diff --git a/meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch b/meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
deleted file mode 100644
index 77770093cd..0000000000
--- a/meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0562b040fa17f1722ba2b3096067b45d0582ca53 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 11 Mar 2019 16:40:29 -0700
-Subject: [PATCH] strtod: fix clash with strtold
-
-Problem reported for RHEL 5 by Jesse Caldwell (Bug#34817).
-* lib/strtod.c (compute_minus_zero, minus_zero):
-Simplify by remving the macro / external variable,
-and having just a function.  User changed.  This avoids
-the need for an external variable that might clash.
-
-Upstream-Status: Backport [rhel5]
-
-Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
-
----
- ChangeLog    |  9 +++++++++
- lib/strtod.c | 11 +++++------
- 2 files changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/lib/strtod.c b/lib/strtod.c
-index b9eaa51b4..69b1564e1 100644
---- a/lib/strtod.c
-+++ b/lib/strtod.c
-@@ -294,16 +294,15 @@ parse_number (const char *nptr,
-    ICC 10.0 has a bug when optimizing the expression -zero.
-    The expression -MIN * MIN does not work when cross-compiling
-    to PowerPC on Mac OS X 10.5.  */
--#if defined __hpux || defined __sgi || defined __ICC
- static DOUBLE
--compute_minus_zero (void)
-+minus_zero (void)
- {
-+#if defined __hpux || defined __sgi || defined __ICC
-   return -MIN * MIN;
--}
--# define minus_zero compute_minus_zero ()
- #else
--DOUBLE minus_zero = -0.0;
-+  return -0.0;
- #endif
-+}
- 
- /* Convert NPTR to a DOUBLE.  If ENDPTR is not NULL, a pointer to the
-    character after the last one used in the number is put in *ENDPTR.  */
-@@ -479,6 +478,6 @@ STRTOD (const char *nptr, char **endptr)
-   /* Special case -0.0, since at least ICC miscompiles negation.  We
-      can't use copysign(), as that drags in -lm on some platforms.  */
-   if (!num && negative)
--    return minus_zero;
-+    return minus_zero ();
-   return negative ? -num : num;
- }
--- 
-2.20.1
-
diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.31.bb
rename to meta/recipes-core/coreutils/coreutils_8.32.bb
index 2b196b7512..2422f8634e 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -5,8 +5,9 @@ every system."
 HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;beginline=1;endline=15;md5=c456f9896277a0543e3866777ccc0255"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://src/ls.c;beginline=1;endline=15;md5=b7d80abf5b279320fb0e4b1007ed108b \
+                    "
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
@@ -19,12 +20,11 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://disable-ls-output-quoting.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://run-ptest \
-          "
+           file://0001-ls-restore-8.31-behavior-on-removed-directories.patch \
+           "
 
-SRC_URI_append_libc-musl = "file://strtod_fix_clash_with_strtold.patch"
-
-SRC_URI[md5sum] = "0009a224d8e288e8ec406ef0161f9293"
-SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
+SRC_URI[md5sum] = "022042695b7d5bcf1a93559a9735e668"
+SRC_URI[sha256sum] = "4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
-- 
2.26.1

