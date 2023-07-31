Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36A5C001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 07:59:15 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.2746.1690790353835156509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 00:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jnu1rjsg;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fdd14c1fbfso6631123e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690790352; x=1691395152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IlHH5Ba0/um4knZ8sMFTwZDJIO1St1zRaqJFAKV0b8=;
        b=jnu1rjsgPGu/zMlgPpafD3ZpLxcZQpRP48cRsmXTmZrxQovDXEXfC7f7OMnw/6PmlG
         l5z/L4lMeRSeufIc5VvD87luy+vYBp6IYTdPlzwa65uT/Ecy+MObkBMMbnCJZGcNOtn/
         8brhy121sLMWWvoMDNBFPEzim3pbzEHRPd3PeArEzVtkMVkjGiNOb/YkJdAb3eephOa9
         PKWmmNe3CtQ5/wVtcE5/m0VcNrDjYZtCy3KRfxY9LQXEkY35Zpo+2aDPsyT1OB02Gol6
         vv4hxkGDyJMaPs3XNnJQqiotdPnZcfHCB87T8KGbg6t2BQlPXXHc2yOjO/vYd21OGHUa
         K+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690790352; x=1691395152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IlHH5Ba0/um4knZ8sMFTwZDJIO1St1zRaqJFAKV0b8=;
        b=CIGpTsdLUBYBEU2VhnlI1+0+961iVYowbBAii6e4ISg5UlKVA3Ye2WOXZDNk3q14f6
         My2qj31zBojT7ZtVK4ysmJUK2rQR52hKuu1GtQ89r36MmaKKnwnUqsBW2xGDdaHa2+HS
         9Cg7XSvrmC9f2fcRoevHlTohmyHdk7CiKo5xbKEwg4kIKAKPF/fqDH0RdBWtVbOECC19
         novR5jq/ji6bd46BFxKgij832zQYjjHQB7aB23wEB9/So+eFF43TvS/Ga2O3m4KaXeRe
         05RPZ+IuP5U6IrnN+phRab+Y2Zchmqm3UUemT4DDSu+wDW/9q6J5SrfQBFEDtoOq/gfG
         K23w==
X-Gm-Message-State: ABy/qLbhjF1j7OxhbhiJggVwgwwiAoRD0rmfZbRg4lzGfdNM8bvAzU7g
	rm0lJao93B1GAMrmdxYQTsXuLgcLUeI=
X-Google-Smtp-Source: APBJJlE4IbDgJVP9pHR05v+H6g3QIsBx7Co72P14akySxRn/Eh6QLwy8CB0lShDfaYq5vfneV+OLDw==
X-Received: by 2002:a05:6512:401e:b0:4f8:67f0:7253 with SMTP id br30-20020a056512401e00b004f867f07253mr5501800lfb.49.1690790351512;
        Mon, 31 Jul 2023 00:59:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n7-20020a170906688700b0099bc2d1429csm5816128ejr.72.2023.07.31.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 00:59:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] util-linux: upgrade 2.38.1 -> 2.39.1
Date: Mon, 31 Jul 2023 09:59:03 +0200
Message-Id: <20230731075903.1003460-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 07:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185124

License-update: added bsd-2-clause
https://github.com/util-linux/util-linux/commit/faeb1b64b36ededd1a0b62555cad65f002d47ac6

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...2.38.1.bb => util-linux-libuuid_2.39.1.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   | 10 ++--
 .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
 ...configure.ac-Improve-check-for-magic.patch | 40 --------------
 .../util-linux/util-linux/run-ptest           | 10 +++-
 ...l-linux_2.38.1.bb => util-linux_2.39.1.bb} |  0
 6 files changed, 13 insertions(+), 100 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.1.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
 rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb => util-linux_2.39.1.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3868b1c41d3..99ce2a24b0a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,13 +6,13 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
 LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da
                     file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
                     file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
                     file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-"
+                    "
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -35,8 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-check-for-sys-pidfd.h.patch \
-           file://0001-configure.ac-Improve-check-for-magic.patch \
            "
 
-SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
+SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
deleted file mode 100644
index 19f57f14bc7..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2022 14:39:19 -0700
-Subject: [PATCH] check for sys/pidfd.h
-
-This header in newer glibc defines the signatures of functions
-pidfd_send_signal() and pidfd_open() and when these functions are
-defined by libc then we need to include the relevant header to get
-the definitions. Clang 15+ has started to error out when function
-signatures are missing.
-
-Fixes errors like
-misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_signal'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/1769]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac          | 1 +
- include/pidfd-utils.h | 4 +++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a511e93de..fd7d9245f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
- 	sys/mkdev.h \
- 	sys/mount.h \
- 	sys/param.h \
-+	sys/pidfd.h \
- 	sys/prctl.h \
- 	sys/resource.h \
- 	sys/sendfile.h \
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index eddede976..d9e33cbc5 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -4,8 +4,10 @@
- #ifdef HAVE_SYS_SYSCALL_H
- # include <sys/syscall.h>
- # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
-+#  ifdef HAVE_SYS_PIDFD_H
-+#   include <sys/pidfd.h>
-+#  endif
- #  include <sys/types.h>
--
- #  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
--- 
-2.37.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
deleted file mode 100644
index 00611fe5788..00000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
-From: Mateusz Marciniec <mateuszmar2@gmail.com>
-Date: Fri, 19 Aug 2022 14:47:49 +0200
-Subject: [PATCH] configure.ac: Improve check for magic
-
-Check whether magic.h header exists before defining HAVE_MAGIC.
-
-Despite library availability there still can be missing header.
-Current test doesn't cover that possibility which will lead compilation
-to fail in case of separate sysroot.
-
-Upstream-Status: Backport
-[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]
-
-Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
-Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index daa8f0dca..968a0daf0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
- )
- AS_IF([test "x$with_libmagic" = xno], [have_magic=no], [
-   AC_CHECK_LIB([magic], [magic_open], [
--    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
--    MAGIC_LIBS="-lmagic"
-+    AC_CHECK_HEADER(magic.h, [
-+      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
-+      MAGIC_LIBS="-lmagic"
-+    ])
-   ])
- ])
- AC_SUBST([MAGIC_LIBS])
--- 
-2.37.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 097107cd095..7b6b1d1dc2a 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -16,7 +16,15 @@ export PATH=$bindir/bin:$PATH
 # losetup tests will be skipped and/or fail otherwise
 modprobe loop
 
-./tests/run.sh --use-system-commands --parsable --show-diff | sed -u '{
+# required for mount/fallback test to pass
+# systemd does this by default, but ptest images do not use it
+# see https://man7.org/linux/man-pages/man7/mount_namespaces.7.html
+# for a long description of mount namespaces in Linux
+mount --make-shared /
+
+# lsfd/option-inet has races in the test script:
+# https://github.com/util-linux/util-linux/issues/2399
+./tests/run.sh --use-system-commands --parsable --show-diff --exclude=lsfd/option-inet | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.39.1.bb
-- 
2.30.2


