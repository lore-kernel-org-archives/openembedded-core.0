Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CC8C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 19:27:36 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.1258.1660332450504692933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 12:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nzRPC+BU;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id ha11so1854487pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 12:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rgZ0SsQ6Ug6tgKnpT2irs0guhfS0hihG7np+/i2nuNg=;
        b=nzRPC+BUSZj8ZyljapZbiFw7SP8/rMiQewuhazRDTbHPxPjU36Y1d4UPjewLOgvGAQ
         be6k7Q6LDleVx2ERg8/nKN2AeooMSJJHAS3YNQ7eE7JqJk07BmGBA631JdDu+hrGSP+2
         FwHLFPjAzrC8Mr3KY/e/JFhRXwuI4b7rDNA8Ref+n6ASUd1Qj023p+cYUyrElaKrhmgM
         R2bZi8tgLv1MBtnBjn5ilY6Hn3XxuVjFpqrt1cFTQY4iOZFsYdeAU1BdecZ/tXMBEPdi
         2VXWTO4gjr+P/hNrBixb+ZXMs+Yxcz/Qu9L/3X0RHGFW3/AKl5zaE9dNem8+prgCYQtM
         PqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rgZ0SsQ6Ug6tgKnpT2irs0guhfS0hihG7np+/i2nuNg=;
        b=AbRkGxxMed8mLDYRtdBZFb8we+oghZIHp4Ry5rxfWUb/ou99evN5ZULN9z4WPlZG/l
         aK7oJKR0Xuqt8Z8gIWqwsqRuv49NY4FNH87Kfs80pvdFhnz2cyIA9tOfPxGzKyqxkZ52
         QNtIBLpWR+nzngwWsUrqjQg4gSIVPc0iJl4GXsZlx8XuLmZpgNDw2rWl3IH6uH6bv2Vk
         dL+y9I/aUnsVOssea7uVu42xh5iIy8Y7KvYF9ZmDuMrwlAw9Exm2Q4LzjWJY175nFaMX
         NgO3gLrRZlnPB/5+ostMPQZRlxGvQXNAtonn45YYHGk6JWQFH4Cu5BSefcksj25JkYWA
         B/bA==
X-Gm-Message-State: ACgBeo3KYeouo6O4Ygd8T2JNbR+01MUObGa+75Lm18+NWKbmOX9U1tqJ
	cWRz2SM/+ozIyVQpdh84oyMttmlkaxU=
X-Google-Smtp-Source: 
 AA6agR6z7PIiHksoN1nVMQmAr93IOCfgzAw7CmS+gGSsqvjpPyLIyF4yBy+pEXBQ1AUT6zqABz2REw==
X-Received: by 2002:a17:903:110e:b0:171:5a95:a91d with SMTP id
 n14-20020a170903110e00b001715a95a91dmr3851384plh.3.1660332449447;
        Fri, 12 Aug 2022 12:27:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a623101000000b0052f1e061b21sm1965133pfx.66.2022.08.12.12.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 12:27:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Bump to latest 2.36 branch
Date: Fri, 12 Aug 2022 12:27:25 -0700
Message-Id: <20220812192725.2600254-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 19:27:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169290

Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...define-STRCPY-guard-in-strcpy-sse2.S.patch | 28 ----------------
 ...ace-strcpy-call-with-memcpy-BZ-29454.patch | 32 -------------------
 meta/recipes-core/glibc/glibc_2.36.bb         |  2 --
 4 files changed, 1 insertion(+), 63 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index f6cdbbf2414..74b48b05f48 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.36/master"
 PV = "2.36"
-SRCREV_glibc ?= "ac47d8f6cf9744139adb12f540fb9cc610cac579"
+SRCREV_glibc ?= "302bc33bc53c787da6e74162a7092e9c0fb964a8"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
deleted file mode 100644
index 2caff3a0d53..00000000000
--- a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1d4d09d9dff96f46674262534ce1f0e51a8252cb Mon Sep 17 00:00:00 2001
-From: Noah Goldstein <goldstein.w.n@gmail.com>
-Date: Sun, 7 Aug 2022 22:42:30 +0800
-Subject: [PATCH] x86: Fix `#define STRCPY` guard in strcpy-sse2.S
-
-`#ifndef STPCPY` is incorrect for checking if `STRCPY` is already
-defined.  It doesn't end up mattering as the whole check is
-guarded by `#if IS_IN (libc)` but is incorrect none the less.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=312ded0d6339e8c463d0395397b5825401b14f54]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/x86_64/multiarch/strcpy-sse2.S b/sysdeps/x86_64/multiarch/strcpy-sse2.S
-index e29b411314..d6b9bae5f8 100644
---- a/sysdeps/x86_64/multiarch/strcpy-sse2.S
-+++ b/sysdeps/x86_64/multiarch/strcpy-sse2.S
-@@ -22,7 +22,7 @@
- 
- # include <sysdep.h>
- 
--# ifndef STPCPY
-+# ifndef STRCPY
- #  define STRCPY __strcpy_sse2
- # endif
- 
diff --git a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
deleted file mode 100644
index a2c951ad936..00000000000
--- a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f0e36cf0b348dbc990af9f869196710ca89c28c2 Mon Sep 17 00:00:00 2001
-From: Noah Goldstein <goldstein.w.n@gmail.com>
-Date: Sun, 7 Aug 2022 23:54:19 +0800
-Subject: [PATCH] elf: Replace `strcpy` call with `memcpy` [BZ #29454]
-
-GCC normally does this optimization for us in
-strlen_pass::handle_builtin_strcpy but only for optimized
-build. To avoid needing to include strcpy.S in the rtld build to
-support the debug build, just do the optimization by hand.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=483cfe1a6a33d6335b1901581b41040d2d412511]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- elf/dl-cache.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index c02a95d9b5..03a6d236e8 100644
---- a/elf/dl-cache.c
-+++ b/elf/dl-cache.c
-@@ -513,8 +513,9 @@ _dl_load_cache_lookup (const char *name)
-      we are accessing. Therefore we must make the copy of the
-      mapping data without using malloc.  */
-   char *temp;
--  temp = alloca (strlen (best) + 1);
--  strcpy (temp, best);
-+  size_t best_len = strlen (best) + 1;
-+  temp = alloca (best_len);
-+  memcpy (temp, best, best_len);
-   return __strdup (temp);
- }
- 
diff --git a/meta/recipes-core/glibc/glibc_2.36.bb b/meta/recipes-core/glibc/glibc_2.36.bb
index 2db3994cf7b..6ccb392f090 100644
--- a/meta/recipes-core/glibc/glibc_2.36.bb
+++ b/meta/recipes-core/glibc/glibc_2.36.bb
@@ -51,8 +51,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
-           file://0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch \
-           file://0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.37.1


