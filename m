Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7073CA0FEF
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:52:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.13717.1725022378531558107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 05:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k6AJd2xp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201ed196debso15262195ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725022378; x=1725627178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMKwOohO6ASflnu7jpAfzBqn6uUEJaH5jjxVRkBjIA4=;
        b=k6AJd2xplknvXRI7HdqZ1jPsDaiJxwnSiy7nPAeEU+W7xVKDcFjimEEobnQY4JQqIl
         7Qcb6WtFuBSZIPOAJJxPJjlzsViI6hRLrtO4aDLhvw63Gd4owsqafDIhe5CNkiEll4pG
         TDaef3O6zDHsuMAJxvaBbFfLeiJuVGLmVOxcUNeDM2iVMBmcu8+lkun5xhBqg6JmfduA
         EX4zLVRTecjR0+RYSBDOdwrRXIIKlhpr4gn9UzHcU1LwZEsCqWJyNv/Zt9EgBq9yo3WU
         SaTeeiYWFwcCSuffPEaNeOZ8GHRNp9AW69ucwgGPopzYK6XM8FKpbM6Yz63k7Ij4PIAJ
         xc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022378; x=1725627178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMKwOohO6ASflnu7jpAfzBqn6uUEJaH5jjxVRkBjIA4=;
        b=k8BzTkezur+Ev/j0Oz70KQnOr8SJTA6dJ4kGMa//EYEnqem6Dn/HVjg+6wTZqPdQwM
         Rt5+Enpe8RoGXFDIC0EmlytvpD5cQS6V2dsIRWmuudHm9ojSnTq/BY2cmQQNSmUQ1Cft
         DnKpK4P8+49KRxdWYrgd/yEFBEnk0utjYaWQZcRkvsGsANpQnHWSL9NCjsaIMnWiX3Jd
         tOPQgQ4dqclFMNTy770MmdMzn87x+EHdwmN8SMhwBepfZOtqx08rYrC2D3rddCQ9nQWX
         mBZpw+M9rUOwNUBm10hGpGOA7I3HbF5iIfCG6Aklj2wqwC1d7eW3bMyU7ZIfEjlnG3Ip
         4Jdg==
X-Gm-Message-State: AOJu0YzDgkKttGYvmomkpA2+UKfZDU8fhQogql8B7iFjW27hXdQv3hp4
	Mj6w8m8ojenwbXAOtCuAmIVBI+JAWAX1VgxIbWIMLo0N6iDoecwt2rJIaUA5bGhPo1Su1JY1xSU
	eq0k=
X-Google-Smtp-Source: AGHT+IGAjl9rwnUIEJ6u5VK5ndRgSOPzy6UZMA9ooQ7O6B3bWTYMJZherPyKUI5LLknuDSPHuo91+A==
X-Received: by 2002:a17:902:ec86:b0:205:3450:cdb4 with SMTP id d9443c01a7336-2053450d102mr8198375ad.4.1725022377647;
        Fri, 30 Aug 2024 05:52:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051554235bsm26295975ad.214.2024.08.30.05.52.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:52:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] vim: Upgrade 9.1.0114 -> 9.1.0682
Date: Fri, 30 Aug 2024 05:52:44 -0700
Message-Id: <3312a57ce631ea6235055b3d4b4ac31d06c8a2ae.1725022186.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725022186.git.steve@sakoman.com>
References: <cover.1725022186.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 12:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203963

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d2938e53cad5d9bf2e78a5403e9f9fab1db77b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 071deed338..f8ba37156a 100644
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


