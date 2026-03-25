Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79518103A99B
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:20:09 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13961.1774405208828048080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T3O+3HG8;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82c20b9fb16so933583b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405208; x=1775010008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDA5gXyCYQXjLZM7BiWrsjUtWyDhx9nOdHJ5exglQAc=;
        b=T3O+3HG80a1PVNFQ9W+Vlvf48LUKxZ1+3Y9GtdFB3/XK9s+h1yX9Ii4BHs21DgjaMv
         I6ZsCKg6ukUuo8PABNQR/FiTlQJ3oc5G4WjzG+2ao6K3ZMLMkcS20T+sy2blkuTAV/pw
         JaqySIyy8NgtMaop4HUCgOJxntV3Wt3KSU7iZi7P+T6yj/UINIto2syrWBn24IrEN89d
         lJuJYdSvUGIUy3qBxDu9S9QDwPtGHs9GcVmJNCxR3ehuIfGKBA6vzNMjTe86YiE6z3P4
         G3Kg1niYG7oi/LhvBysuXKAe5DFyLwAjRGoeJQNqbsc/q3q1sGxqUExNMVs5lblIOYiS
         FEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405208; x=1775010008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDA5gXyCYQXjLZM7BiWrsjUtWyDhx9nOdHJ5exglQAc=;
        b=aktwED5nuh4YY12YLhv7LWgB2l3Zst1/DRCIONl8QUqUVzgtS6iSDbpLqZKNYX9gdf
         lmCIxSl8uyLOKz9NP3xoYxI6oPtojKqv7NCFN5V/mFKfwd83a9bQCLMixqTRMXK9OgQ1
         2TgF8X4X1Ru1UUCV7IRarDJ8f2Qkm0svWBxyeNc4J40PVxcpyNQeitfOd81t5mTJqA36
         T7/anO+5siMst8IY+42Uu7Tmwj/NAyFhZDCfhg7mWoaCvR35//G4wkSBvSwXoLOS22d/
         spz9IrUPi6RII031KsP+A2e7i6by4NA4Y8phJTVFY+W/ltW3wTUH9Yi84TZrPMnRoiM5
         coRw==
X-Gm-Message-State: AOJu0YycX7lA1aeOuEAF9GcoUTMTwfqbie1Oa6qL9ZRTiN4h5cHa1GOI
	4pAsnEET8hDIkewZrvH4x1dFHBqxq0laKagG+GbthHbbNbYjz0Cjg71m+kklBG5J
X-Gm-Gg: ATEYQzwehX2i1kbS/x8Y+U/xYKK5xJ1Dt4id06cQNmcsZ4B2JTt9coUTGxLKQBENSJj
	Vvfp125yWtnIJIApOdQaju/ZHZw0eqjHlOcYqGbmxRKQMqpzK8C6G9p17IvwsB68FK9IykoRopY
	Nwte8rOidqid8a8p9LrVuGPGGA0UIRcFxrZEG6Rl3R9LAl5hHVshsUYkOB//9gHiktNURdyiDGC
	sna5WsX5bCi9letwUvxwBEkLsiyhMoO8Dap8YgpIvMqr2p/D9YmtiH5C56Ef/fH0fgJgI910D7e
	WHmfvz3LIFLgebyEJSm+yI/9fRt3f6SotenouhcLtiN1S77rKpLXYoTlU4RwfigMS647xdesjdj
	0xzfikq2pUhCuXR3DHEmPxgRRQg/kHzXTKmm0a2D0rezKm6jtvZJRquCVM7ScFwla3+Ff/Ah2nW
	lQJyO/YzOIXAV6fsRova7Swvggrt3NaHRpYpc=
X-Received: by 2002:a05:6a00:3e05:b0:824:ae74:571f with SMTP id d2e1a72fcca58-82c6df9281cmr1759052b3a.40.1774405207914;
        Tue, 24 Mar 2026 19:20:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:20:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 11/12] e2fsprogs: upgrade 1.47.3 -> 1.47.4
Date: Wed, 25 Mar 2026 15:18:55 +1300
Message-ID: <20260325021856.4053666-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233849

From: Wang Mingyu <wangmy@fujitsu.com>

0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
removed since it's inclued in 1.47.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b14266b4c27e7e3f37a1057ab694c6b21b66b83a)

Release Notes:
https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.47.4.txt?h=v1.47.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 -------------------
 ...2fsprogs_1.47.3.bb => e2fsprogs_1.47.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.3.bb => e2fsprogs_1.47.4.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
deleted file mode 100644
index 1c578022fb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 30 Nov 2025 21:47:50 +0800
-Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
-
-Fixed:
-$ dd if=/dev/zero of=../image.ext4 bs=1M count=4k
-$ dd if=/dev/random of=../rootfs/largefile bs=1M count=3k
-$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
-__populate_fs: Ext2 file too big while writing file "largefile"
-mke2fs: Ext2 file too big while populating file system
-
-This was because the offset is overflow, use __u64 to fix the problem.
-
-Another code which uses ext2_off_t is copy_fs_verity_data(), but it only copies
-the metadata, so it should be enough large for it, just leave it there.
-
-Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- misc/create_inode.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 624efc03..14273534 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
- }
- #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
- 
--static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const char *buf, unsigned int n_bytes) {
-+static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *buf, unsigned int n_bytes) {
- 	errcode_t err = ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL);
- 	if (err)
- 		return err;
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
index 40658399d9..90f8f37b8e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
@@ -4,14 +4,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
+SRCREV = "ece89fac4603e400155b7bbf6326284f8511bca9"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \

