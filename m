Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.3987.1588240724013452290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oj7WPgeg;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id g13so6083247wrb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2POHei1JdhTC7JNTnVQU7woHUnW0cny7DiJIpfhkvdk=;
        b=Oj7WPgegHuD0ucq0dhbflIQZXIu/MvlnPgZSWREqGMbe1QKMl0XlvJ/DPlctnhtwo9
         CgbNk9xZ+HN6eAU6DX6xYJ0HDGxKFlOEcrdv8sZGBXnDzZxHyg10o7+cuzyNm0IBtpX/
         8UGqsqsmslvuhrgdgKvywRTUPAQJgOqqI/2/iH+YjDsNW0Dxt1DbhR04GJOzBGWH+ywF
         zXQ+kafwaWVYVdH3yjJiarliJGfaLO9ruFQHZy98pX2LsyArkffXb09SaO9EiIcgV0Dl
         JK2slh2D3jWg0094kAI1trgHs2DCacVr9ZuXnrWoimFEsbvsBA+z/7FflN4wM4W7OyRt
         mxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2POHei1JdhTC7JNTnVQU7woHUnW0cny7DiJIpfhkvdk=;
        b=luI0qJe5+ixMzVGpWC9kIA4b5M7C/5jMMGhlNChZIMgp1gKbGAcOLlWcBLDRoG5485
         DBFadIrkHhfQXr/5WcL3YkVhOSlTGAyCDHrNrra99KqQTuEHUrd3M2t38hkJLUBoluA9
         z1SXDTuHapTk2rk2AY28o16SPwDnYzNqBcdUE8UKe6NZZGEG0WhEsArE9fqeOY2wa8wf
         5Nj+RDRW9Vlpx1/YyMjFOaTvHqdZUjRKc3vPDMeXkj2u73FwFUymukZnTHYZSGNUXgAI
         bCjBOx3IhsUit7zrir2fSNXAYWxxzmwOxhJsVpan5/RYMt1veQhUeVWqP9wSbLXLeALb
         +0uw==
X-Gm-Message-State: AGi0PuZ98nw+0xNmQau57zI295vX9IIrAWI7G55p8dVUcBKwE+afgHAj
	SFNSMr15NIsF2yin3ovPhPUIQYzn
X-Google-Smtp-Source: APiQypJmm5H5TaoQog4P45uwzEuLMvYphktglpwxKGr9Z28DdYKJxlISX5AsyR7W/oCep0PAODxU8A==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr3179487wrw.73.1588240722316;
        Thu, 30 Apr 2020 02:58:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/17] coreutils: update to 8.32
Date: Thu, 30 Apr 2020 11:58:12 +0200
Message-Id: <20200430095815.2824-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years, http changed to https
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../coreutils/fix-selinux-flask.patch         | 13 ++++-------
 .../remove-usr-local-lib-from-m4.patch        | 23 ++++++++++++++-----
 .../strtod_fix_clash_with_strtold.patch       | 10 +++-----
 .../{coreutils_8.31.bb => coreutils_8.32.bb}  | 11 +++++----
 4 files changed, 31 insertions(+), 26 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_8.31.bb => coreutils_8.32.bb} (95%)

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
index 77770093cd..fd629a5d2a 100644
--- a/meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
+++ b/meta/recipes-core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
@@ -1,4 +1,4 @@
-From 0562b040fa17f1722ba2b3096067b45d0582ca53 Mon Sep 17 00:00:00 2001
+From 134137671bd771bf0205b87a735c545dbcdbb4b3 Mon Sep 17 00:00:00 2001
 From: Paul Eggert <eggert@cs.ucla.edu>
 Date: Mon, 11 Mar 2019 16:40:29 -0700
 Subject: [PATCH] strtod: fix clash with strtold
@@ -14,12 +14,11 @@ Upstream-Status: Backport [rhel5]
 Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
 
 ---
- ChangeLog    |  9 +++++++++
  lib/strtod.c | 11 +++++------
- 2 files changed, 14 insertions(+), 6 deletions(-)
+ 1 file changed, 5 insertions(+), 6 deletions(-)
 
 diff --git a/lib/strtod.c b/lib/strtod.c
-index b9eaa51b4..69b1564e1 100644
+index b9eaa51..69b1564 100644
 --- a/lib/strtod.c
 +++ b/lib/strtod.c
 @@ -294,16 +294,15 @@ parse_number (const char *nptr,
@@ -51,6 +50,3 @@ index b9eaa51b4..69b1564e1 100644
 +    return minus_zero ();
    return negative ? -num : num;
  }
--- 
-2.20.1
-
diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
similarity index 95%
rename from meta/recipes-core/coreutils/coreutils_8.31.bb
rename to meta/recipes-core/coreutils/coreutils_8.32.bb
index 2b196b7512..70d02bbb07 100644
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
 
@@ -19,12 +20,12 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://disable-ls-output-quoting.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://run-ptest \
-          "
+           "
 
 SRC_URI_append_libc-musl = "file://strtod_fix_clash_with_strtold.patch"
 
-SRC_URI[md5sum] = "0009a224d8e288e8ec406ef0161f9293"
-SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
+SRC_URI[md5sum] = "022042695b7d5bcf1a93559a9735e668"
+SRC_URI[sha256sum] = "4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
-- 
2.26.1

