Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAE5C83F19
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:32:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.15222.1724938374314261783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mgCCqtgx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201df0b2df4so5119985ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938373; x=1725543173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMKwOohO6ASflnu7jpAfzBqn6uUEJaH5jjxVRkBjIA4=;
        b=mgCCqtgxpNb6eOvyQAxYAQL0fsuIZEBFPnyLKtIpDMUBWTVJ14u/lsuJQWa8IHkEHK
         6OSBWuMBusHVEeyhXZlbR6WsC5PMmab+s+U2VXsL1XxSBmcME21MrweEafkWmjDBjUIe
         f4mflAbFt5ZgMgZV9umqh8X2eoFwP/Oq6LP+t8jy5Lr+DW14YuzAe045HOv8Ibl4cGkw
         xhsD7zqfYjxzUx03mdqo99boPD+i34G7V+7tZS2RF/6wP+HhSVNJY2ehyMEPY+2V6VrT
         wDpGThrks9FpJYyQgxYhLO8/8sgIWFQBdLPWW8tEzYThf8TO1fSAq/9NPA7e//1j2Exq
         DtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938373; x=1725543173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMKwOohO6ASflnu7jpAfzBqn6uUEJaH5jjxVRkBjIA4=;
        b=R2c9k9pzz4aQFt3aVRa6wtgsAz73jVvMg4uRaPcFZJvGKpE34BeMRkwTiIkxeScLNq
         B8h+oShPChvc1TvlihcFRriDG2Eio5CziIOWS0fQX4v0gl+KQH9tXb4LUuHrEY6W2fGI
         d4iSEnYgwPrkP+UFXmHyNeFpxXxB46Asx12k5ET+kx+MHtbPMSkQXMQmi/1u+HfdybgI
         mRXCcB3/z96tc+ipAIaAKlCo9+blKURybAfoHDCl0x10Uab0RdGQlWvcppbJkAc2H372
         91bsv3BxpofQgNTjkSfK24aGS/M8Sd6SXvaES6F/EmHyEB9qkBPL8k0BbUTHgIttulCv
         rh/A==
X-Gm-Message-State: AOJu0YwwiPk6a4xRmowlfDQ+Ga23FsbqLPt7cYCucJUJkr2nDI96wk4b
	3iNhw/liEbFgW5JSsnzHVt+iqwaxonkH9pivg6uZfyYZRlGGGSuIzIxNAtKcZlS4Dj6zYOfqkx9
	ItRk=
X-Google-Smtp-Source: AGHT+IEbIohb6GQ0gvgmJnEq3+i42Xn8NDPpD/0mx+ZjcVXRbB3x7u1u8NAMkiA4nVnwDY0pA9ZZWg==
X-Received: by 2002:a17:903:41cc:b0:202:1547:66b2 with SMTP id d9443c01a7336-2050c3ab754mr24774235ad.28.1724938373471;
        Thu, 29 Aug 2024 06:32:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/12] vim: Upgrade 9.1.0114 -> 9.1.0682
Date: Thu, 29 Aug 2024 06:32:30 -0700
Message-Id: <ad71057a09ec6304cee3771122224af011ee9087.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203927

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


