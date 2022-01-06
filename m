Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A008C433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 00:26:33 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.2128.1641428791781745069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 16:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id o1so1489447uap.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 16:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANHynJN/5CiNNZrB0udxo3urEK/c5B/ja9XAWc6Zba0=;
        b=wh82MYeukMRUnXxzZMiCxknQZWDwhPCW3m85XxL3+91+bMU8MKBpJPv5K6Rfw1Ej4e
         HVfSlVi6+Ee9kkkK5ktUbJI/JGUmllxBgSg15pRL4g4AzV8P02Bx8C3ra0ZPvdBNeGRJ
         8Jjrrqmme4Y7zrQmLKPtJiJgzVPsKYUpmqMWZq3KCN+cKU0fmZ9rB4DzMBUbi5Y+3MQl
         yCix3uEGXOEOaT8SnOMc7OfUo0VJ0kVo++RErdSAKOSqQu3+13cTx8eKF3JmhovfSVqK
         PvUGYVJEpoDl3y7kVwyFqfrbwT55VhWw996fA/GtylGRoW8ojmKGnK9NaGp+pSVOi7nX
         jxjQ==
X-Gm-Message-State: AOAM5315XH49TUoatoA5s0GLXgSKXCzbZohfHArqnIcYtzObzU/0aUIZ
	k5iyilaoEcZIS9t3gd6tDJvVOQI6JHH0f/UZ
X-Google-Smtp-Source: 
 ABdhPJynZtdt2lV/ohVMz5bl4OQIleLHNheCUAiSGLWFDx0f0Ymi6F63mrRYhKoxID0G2d5ATrzocg==
X-Received: by 2002:a67:cd82:: with SMTP id r2mr17838820vsl.49.1641428790638;
        Wed, 05 Jan 2022 16:26:30 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id t3sm299687vsl.25.2022.01.05.16.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 16:26:30 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] [DNM] e2fsprogs: upgrade 1.46.4 -> 1.46.5
Date: Wed,  5 Jan 2022 21:25:35 -0300
Message-Id: <20220106002535.658797-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106002535.658797-1-otavio@ossystems.com.br>
References: <20220106002535.658797-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 00:26:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160221

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
The ptest is failing[1]; I didn't spot anything obvious and couldn't
reproduce the error in my NixOS host (ended sending the update so it
also runs on their CI - https://github.com/NixOS/nixpkgs/pull/153660).

 1. https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2963/steps/12/logs/stdio

I need someone to help on this so I'd like to ask for the patch to not
be merged as it has known issues.

Changes in v2:
- remove patch headers
- avoid changing not required patches

 ...ct_io-expect-correct-expected-output.patch | 69 -------------------
 ...2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} |  9 +--
 2 files changed, 3 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} (94%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
deleted file mode 100644
index f198df83eb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From ea5adf259e01c790f9ba69d6fe88d691de410b6f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 22 Aug 2021 14:37:32 +0200
-Subject: [PATCH] tests/u_direct_io/expect: correct expected output
-
-This is likely the right fix, but upstream needs to confirm.
-
-Upstream-Status: Inappropriate [issue reported https://github.com/tytso/e2fsprogs/issues/80]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/u_direct_io/expect | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/tests/u_direct_io/expect b/tests/u_direct_io/expect
-index b0cdc730..830cbd75 100644
---- a/tests/u_direct_io/expect
-+++ b/tests/u_direct_io/expect
-@@ -19,8 +19,8 @@ Filesystem OS type:       Linux
- Inode count:              32768
- Block count:              32768
- Reserved block count:     1638
--Overhead clusters:        5131
--Free blocks:              27631
-+Overhead clusters:        6155
-+Free blocks:              26607
- Free inodes:              32757
- First block:              0
- Block size:               4096
-@@ -29,27 +29,29 @@ Reserved GDT blocks:      7
- Blocks per group:         32768
- Fragments per group:      32768
- Inodes per group:         32768
--Inode blocks per group:   1024
-+Inode blocks per group:   2048
- Flex block group size:    16
- Mount count:              0
- Check interval:           15552000 (6 months)
- Reserved blocks uid:      0
- Reserved blocks gid:      0
- First inode:              11
--Inode size:	          128
-+Inode size:	          256
-+Required extra isize:     32
-+Desired extra isize:      32
- Journal inode:            8
- Default directory hash:   half_md4
- Journal backup:           inode blocks
- Directories:              2
-  Group  0: block bitmap at 9, inode bitmap at 25, inode table at 41
--           27631 free blocks, 32757 free inodes, 2 used directories
-+           26607 free blocks, 32757 free inodes, 2 used directories
- e2fsck -fn -N test_filesys $LOOP
- Pass 1: Checking inodes, blocks, and sizes
- Pass 2: Checking directory structure
- Pass 3: Checking directory connectivity
- Pass 4: Checking reference counts
- Pass 5: Checking group summary information
--test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
-+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
- Exit status is 0
- e2fsck -fn -N test_filesys $TMPFILE
- Pass 1: Checking inodes, blocks, and sizes
-@@ -57,5 +59,5 @@ Pass 2: Checking directory structure
- Pass 3: Checking directory connectivity
- Pass 4: Checking reference counts
- Pass 5: Checking group summary information
--test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
-+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
- Exit status is 0
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
similarity index 94%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index f42cefcaf9..68b8531565 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -4,14 +4,11 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-tests-u_direct_io-expect-correct-expected-output.patch \
+           file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
+           file://quiet-debugfs.patch \
            "
 
-SRC_URI:append:class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-                                file://quiet-debugfs.patch \
-"
-
-SRCREV = "849005eac51ea2097bd9e5f2b0adc16b53c5486d"
+SRCREV = "02540dedd3ddc52c6ae8aaa8a95ce75c3f8be1c0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.34.0


