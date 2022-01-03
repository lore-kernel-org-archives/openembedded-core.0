Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07245C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:23 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.30092.1641226761754689451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id de30so31818734qkb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=XH8FLQ8q5zq5P39oYSKHSY/BbB9rPmZ9/1qjuBrCavU=;
        b=uaVNGo7dhOAciXrmXFRNA55xntrcyP3IgqJf9hbgZVvd5vnV1vqqx+8QKuS/hmg5xF
         G1EBQl8TVh1QwyZlNHbGmJ4fYndn0PEdaVjME4QOmiefCgDDIGB4Nk15kUX1CUmLn0xU
         T5Aq1CO/RXBPbyYSTrIoSHkMuXTeQvkhQxah8johyvJwK32n6U6XgNavn/QfDM8uG35M
         kzUWGTYrjYhcgUxRHmWGtwWje7o9+DcxM/9Uh0+YkA+W8c5+MHaCbsPjuvTeRtu3RPbV
         jiXaXaiJwiD2IYBaxVVtTAPhVuSCgxXhSO2eai2eYx6r+7p/JBODF2WYeioeBrv5W4V+
         3lVQ==
X-Gm-Message-State: AOAM5330XvgQ2ednfc1nEQGY//A/XH6WSu1YC9rMKzeOZr49UpMd9Ymv
	gGK+Qzsct3omH4rgJE0e0k+aRXcOJOWazraK
X-Google-Smtp-Source: 
 ABdhPJwcGNs9K94DM9za2rOzt1QwqptJQsyopuKiZPbEahPH+1wmayvKxuQwGXeT4fmE+5oHRv7+iA==
X-Received: by 2002:a05:620a:371e:: with SMTP id
 de30mr33179634qkb.136.1641226760583;
        Mon, 03 Jan 2022 08:19:20 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 i7sm29692537qkn.0.2022.01.03.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:20 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 05/24] e2fsprogs: upgrade 1.46.4 -> 1.46.5
Date: Mon,  3 Jan 2022 13:18:35 -0300
Message-Id: <20220103161854.301148-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160122

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...ct_io-expect-correct-expected-output.patch | 69 -------------------
 ...-missing-check-for-permission-denied.patch |  3 +-
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  3 +-
 ...2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} |  9 +--
 4 files changed, 7 insertions(+), 77 deletions(-)
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index a4f98246bb..045ffa6086 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,7 +1,8 @@
-From f1e161a48f74b46ae3c99921971c4b5ae8d587c9 Mon Sep 17 00:00:00 2001
+From ad7f927c0d95fd461f45f478bbe6355b8df46eac Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
+Organization: O.S. Systems Software LTDA.
 
 If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied problem,
 then the get_dirlist() call will return EACCES. But the code in profile_init
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 41a4047622..6f3ad342cc 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,7 +1,8 @@
-From 550b5fbece84dde16ce9910c2cad390ea4a2f5d5 Mon Sep 17 00:00:00 2001
+From 5e5820fd214a0bc25907053ae6a76eb1ec493134 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
+Organization: O.S. Systems Software LTDA.
 
 When executing a script don't echo every command, as we do this for entire
 filesystems at rootfs time.
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


