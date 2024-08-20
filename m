Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359C0C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 09:22:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.14471.1724145715238889307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 02:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CKrWtUw/;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d3da054f7cso3084524a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 02:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724145714; x=1724750514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yzvaeWjG25kwsVtYWxKPeU2i5Yr7EuPHjBbNNLbCVQ=;
        b=CKrWtUw/CRiro7NfP99NH4AvJse09UzTkVAIWbYUuDyOBtYLIOt0Qkjaw6T0tuvdDc
         ln6EWxM5RFz3AmiS7QHg0XafQx6qupYRTOL04j533xb9jkFL+c9PZgE122oYkjygSSNW
         oHKLpq7xujz6gc7uWjNwKfDP3z1nquLf5LfXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724145714; x=1724750514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yzvaeWjG25kwsVtYWxKPeU2i5Yr7EuPHjBbNNLbCVQ=;
        b=IItxbJjyBUuS9hkyqRkSZpqip+9Imuzo/Zkz5ieWXBCRpidzYBah9UahPf6TY+HrLJ
         kTS7LdjbhedsVG64cs6stneUV5v8LzzgqTfJbXxM6llVvac0GI2PGfmateAaq/GSmeLk
         FBvp1vBgLIO7ZFfWgFueqeu/La2gEuo8Gq/3eU1WXtab3UIKj+d2VFy2KJkMPHaNe83V
         hJuH2dEMp9BE1bIgEMzOM+5ljJLkMf3sfjkfrStiJ/Z0LutfzDylOwBYlp7dim91JRlY
         tWy2Wg1KdmIIHi8Ui1g00pANCmtg6RvngG1yhpPfbZ4/RBHz4Id7WeIVYKOrl+zGOxv2
         jwIw==
X-Gm-Message-State: AOJu0YxJPqL7w5eF8wKSUFwWXlYl6R5GYUXaHgY9+zBQlUztt+9o1HSC
	q0e/HFLQTRj2vKDQW6e7VS8WRYh50w/VpTI5Ybsu4FjCSbi8MDSyXng8Rh4lYD1y/tCNodiCuiJ
	R
X-Google-Smtp-Source: AGHT+IEnyqU/yzVD6wYnRS4N+pu3UIKMT8H9L7WkBBmsf7njBBt5bSiMFDJ/ssAbRTET707lX2eqjA==
X-Received: by 2002:a17:90a:8a02:b0:2c8:87e:c2d9 with SMTP id 98e67ed59e1d1-2d3e03e89dcmr13382936a91.39.1724145714229;
        Tue, 20 Aug 2024 02:21:54 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.46.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d451f70dabsm3176406a91.39.2024.08.20.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 02:21:53 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][scarthgap][PATCH] vim: Upgrade 9.1.0114 -> 9.1.0682
Date: Tue, 20 Aug 2024 14:51:42 +0530
Message-Id: <20240820092142.200691-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 09:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203553

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE-fix for CVE-2024-41957, CVE-2024-41965 and CVE-2024-43374

Changes between 9.1.0114 -> 9.1.0682
====================================
https://github.com/vim/vim/compare/v9.1.0114...v9.1.0682

Note:
====
Removed patch "vim-add-knob-whether-elf.h-are-checked.patch" as libelf checks are removed from configure.ac as per
commit https://github.com/vim/vim/commit/1acc67ac4412aa9a75d1c58ebf93f2b29585a960

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 ...m-add-knob-whether-elf.h-are-checked.patch | 39 -------------------
 meta/recipes-support/vim/vim.inc              |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch

diff --git a/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
deleted file mode 100644
index 5284ba45b6..0000000000
--- a/meta/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 38de4bccdb8a861ffdd447f12fdab19d6d852c02 Mon Sep 17 00:00:00 2001
-From: Chong Lu <Chong.Lu@windriver.com>
-Date: Tue, 26 Jun 2018 17:34:15 +0800
-Subject: [PATCH] vim: add knob whether elf.h are checked
-
-Previously, it still was checked when there was no elf library in sysroots directory.
-Add knob to decide whether elf.h are checked or not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-Index: git/src/configure.ac
-===================================================================
---- git.orig/src/configure.ac
-+++ git/src/configure.ac
-@@ -3264,11 +3264,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [in
- 	AC_MSG_RESULT(no))
- 
- dnl Checks for header files.
-+AC_MSG_CHECKING(whether or not to look for elf.h)
-+AC_ARG_ENABLE(elf-check,
-+        [  --enable-elf-check      If elfutils, check for elf.h [default=no]],
-+        , enable_elf_check="no")
-+AC_MSG_RESULT($enable_elf_check)
-+if test "x$enable_elf_check" != "xno"; then
- AC_CHECK_HEADER(elf.h, HAS_ELF=1)
- dnl AC_CHECK_HEADER(dwarf.h, SVR4=1)
- if test "$HAS_ELF" = 1; then
-   AC_CHECK_LIB(elf, main)
- fi
-+fi
- 
- AC_HEADER_DIRENT
- 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e5dcd00c96..5225513d9d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -14,13 +14,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d1a651ab770b45d41c0f8cb5a8ca930e"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
-           file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0114"
-SRCREV = "fcaed6a70faf73bff3e5405ada556d726024f866"
+PV .= ".0682"
+SRCREV = "cb90ea9cba6f033fe141db0e466fb4117f28402b"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


