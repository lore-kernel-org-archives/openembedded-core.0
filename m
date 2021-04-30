Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.11222.1619788121197711617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 06:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lc7rjlhC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id f15-20020a05600c4e8fb029013f5599b8a9so1705509wmq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TsMT8YlSdXhrrHepkMQjQNBBDV8ifrE1xT/TY9gAh6U=;
        b=Lc7rjlhCh9+MEUx29BIObUA08UlOiz3qLRFJ9jjEv09+rOm+DH03OIbfsQmfVmYaPm
         m0y4iRS6r/rMBU1uQyd1gT8Gfh0Exe8XQZwY4N8g3ZC5gnsKZ8glp0zJULS6gkhSBiyx
         cd4uD+N3/YmrpQhPdHtx0aC4LGmc5saibWWGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TsMT8YlSdXhrrHepkMQjQNBBDV8ifrE1xT/TY9gAh6U=;
        b=nMOqgDmNA+SqADMhxdljttXHvX6xOzD1ZX/X1MibKFQkaIQh/Y+mtlWW007U4wKjTX
         zDoxDrr7xT0Pso3lpatUb7uOAGnIgLsSJvQDwxeX+7SGElDEppv0f8e0E6pKnK0fOZ/R
         AlXG2mSKC5nqcPe0WUTVhcARKh1y2nV81qy7zZwThb93B9gNbfgeDPjW+D9ev3BYaKf5
         ImtJ1/YILBhVV/LdApx4S/LHJBy6MjOy4scAVBtP4iXcm1Dk2dUr+GkCQeXgF5gR7Gfs
         D3KXoPeRjmww/WTIc8+1L2mlCZPl1inR5ZL/wUzXkml74w/D6bfpKe+Mky/W1SgyYdBT
         hHSQ==
X-Gm-Message-State: AOAM530SYR+UkE4VVepE1fBKAUmlNM2JE+NFHZ6KtL4zA9OkwQ7Rh/Gw
	TV0dk+N20kj46ePHrjYEHXm2FmU2WOFtvA==
X-Google-Smtp-Source: ABdhPJz70NFhZtXnhMBS/XZ9dfkLeHrhZGb4HKmrrLp/WPFF+X8jJDFnkhWFBtAPscT+2TV9HnPDcA==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr6150097wmh.184.1619788119304;
        Fri, 30 Apr 2021 06:08:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:38ed:4baa:ed1c:e489])
        by smtp.gmail.com with ESMTPSA id f6sm2208561wrt.19.2021.04.30.06.08.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 06:08:38 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version issues
Date: Fri, 30 Apr 2021 14:08:38 +0100
Message-Id: <20210430130838.1801707-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch upgrades to the 4.4.19 release and replaces a configure patch
from "libxcrypt: fix sporadic failures in nativesdk-libxcrypt-compat" with
a fix to avoid leading spaces in CFLAGS causing failures.

The license changed a few filenames listed in the license but the overall
license remains unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...e.ac-do-not-use-compute-symver-floor.patch | 32 -------------------
 .../libxcrypt/files/fix_cflags_handling.patch | 24 ++++++++++++++
 ...t_4.4.18.bb => libxcrypt-compat_4.4.19.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc     | 10 +++---
 ...ibxcrypt_4.4.18.bb => libxcrypt_4.4.19.bb} |  0
 5 files changed, 29 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.18.bb => libxcrypt-compat_4.4.19.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.18.bb => libxcrypt_4.4.19.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch b/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch
deleted file mode 100644
index 4e6b427104e..00000000000
--- a/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b28bb856ccebe8fded51d11362bf5920699eed59 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 18 Mar 2021 10:52:13 +0000
-Subject: [PATCH] configure.ac: do not use compute-symver-floor
-
-This script (newly introduced in 4.4.18) sporadically fails, without
-failing configure(), which has been reported at
-https://github.com/besser82/libxcrypt/issues/123
-
-Upstream-Status: Inappropriate
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 45b91b4..f3ba945 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -426,11 +426,7 @@ if test x$enable_shared != xyes; then enable_obsolete_api=0; fi
- # need to be binary backward compatible with.
- if test $enable_obsolete_api = 1; then
-   AC_MSG_CHECKING([minimum symbol version to use for compatibility symbols])
--  SYMVER_FLOOR=$(
--    $PERL ${srcdir}/build-aux/compute-symver-floor \
--      ${srcdir}/lib/libcrypt.minver $host_os $host_cpu \
--    2>&AS_MESSAGE_LOG_FD
--  )
-+  SYMVER_FLOOR=GLIBC_2.0
-   AC_MSG_RESULT([$SYMVER_FLOOR])
-   case "$SYMVER_FLOOR" in
-     ERROR)
diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
new file mode 100644
index 00000000000..273385db41b
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -0,0 +1,24 @@
+If you pass CFLAGS with a leading space, " " gets passed to popen and convinces
+gcc to try and open a file called " ". This results in a confusing error message
+like:
+
+x86_64-pokysdk-linux-gcc: error: : No such file or directory
+
+Avoid this by stripping empty elements out of CFLAGS.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: a/build-aux/compute-symver-floor
+===================================================================
+--- a/build-aux/compute-symver-floor
++++ b/build-aux/compute-symver-floor
+@@ -36,6 +36,8 @@ sub preprocessor_check {
+         die "C compiler not available\n" unless @CC;
+ 
+         @CFLAGS = sh_split($ENV{CFLAGS} // q{});
++        # Remove empty elements, particularly leading ones which cause issues with popen below
++        @CFLAGS = grep {$_} @CFLAGS;
+ 
+         # We call ensure_C_locale here, not from the main section,
+         # because this sub might not get called at all, in which
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.18.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.18.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.19.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index b5ca863d54b..694e55546f0 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,18 +3,18 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=bd5d9777dfe7076c4f2928f12fed226a \
+LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
-           file://0001-configure.ac-do-not-use-compute-symver-floor.patch \
-           "
-SRCREV = "94d84f92ca123d851586016c4678eb1f21c19029"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRCREV = "c79119414d7e30017d7b49566e7e4ea35112bdc8"
 SRCBRANCH ?= "develop"
 
+SRC_URI += "file://fix_cflags_handling.patch"
+
 PROVIDES = "virtual/crypt"
 
 FILES_${PN} = "${libdir}/libcrypt*.so.* \
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.19.bb
-- 
2.30.2

