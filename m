Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A21C54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 16:19:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.1127.1724775540389665872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 09:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=V5FJGnzZ;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so4680681b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724775539; x=1725380339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfufQ2QGDwY/h5pDKOv0Wg5C1x7v9S6i699VJZrsFXo=;
        b=V5FJGnzZjwEP+koamS47oWjqooVYcJt9C4Jt7FCTc5CeVQOT3gIiHS1SErOTQJ/pVx
         +aY8g0SjMQ1JdQdFbxOTL+MhZUXwY93cwh4qiewKPf3GGy4u8b2a93EVZ4Lr0riA1QcP
         IJ52FmrPFaEqSNJvBqsn3Fm6zwThPAoVgaTUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775539; x=1725380339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfufQ2QGDwY/h5pDKOv0Wg5C1x7v9S6i699VJZrsFXo=;
        b=ThGTYQcVwhdfX752tbVO0SOn6ZFc9RiYJFX5K7HMnvI9G9+W8WtuxQO3wKTnJ1220H
         f6v+peXKVKAVD/7AWayqyipfBwc1frECFb3q2Ejmtwrcs+ElPF0COMSkdjLZyFd7Xl1G
         XDFUS/0YYJbFAxS6ww2ekvFVRy4jyfRyzvf5r6y6NHjHVoqIUfxsXus23VIzb8mywXZA
         HstDfK1COMf1ZmngSg1jmGzzQbaLyYnLNgbGUKNL9bN0jewr2q23g8CY976nUvCUCzyQ
         Jd4HEDG+uG8Rwon+mTyQOdp+Lx9VyVMKlK1WwsR924ClEnay0qBxYVOjB4WZY7q/tVrs
         WaJw==
X-Gm-Message-State: AOJu0YyKfRANtFRdHVxjtWyIi5G8v4G+cqoCQWm2hrdoKj9jV+N/rUKP
	TTbPQxOVxwOfXupAW/M8eSBVbMF42P4VTulgswcXdpykSbdmkkT/813I71mUjihN1QbpiNOnlnM
	d
X-Google-Smtp-Source: AGHT+IFoxPLFlV7zhy4lcJpXeNAWsfoRGr+oEVC/ukGkpatD8uxFs6aPBCDO2YjqWqRPrmPavmIgRQ==
X-Received: by 2002:a05:6300:42:b0:1c3:a63a:cf04 with SMTP id adf61e73a8af0-1cc89d4dccemr16355892637.20.1724775539285;
        Tue, 27 Aug 2024 09:18:59 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.47.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714400a5111sm7426309b3a.45.2024.08.27.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:18:59 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] vim: Upgrade 9.1.0114 -> 9.1.0698
Date: Tue, 27 Aug 2024 21:48:44 +0530
Message-Id: <20240827161844.89562-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 16:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203851

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE-fix for CVE-2024-41957, CVE-2024-41965, CVE-2024-43374, CVE-2024-43790 and CVE-2024-43802

Changes between 9.1.0114 -> 9.1.0698
====================================
https://github.com/vim/vim/compare/v9.1.0114...v9.1.0698

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
index 071deed338..11daa900d2 100644
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
+PV .= ".0698"
+SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


