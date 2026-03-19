Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDC0108E1DA
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:25:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7873.1773915947167019113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RG7I+rcG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915947; x=1805451947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qKuo9wDqfQd0AeMGC1PX3o6c3SJRdrmvkCTJMvNTpQs=;
  b=RG7I+rcG9qSvK2AvUfScSEJuRNr6v+J07hZrPQFtXmkQ4C/KewK0MD+h
   7fGC3HaRxYqQ4YsVTIrGczV1d9GB/V8i8DVoyuctGJGCgbdaieKJLnEFW
   K7tHypLsFqZm/U1cB0A1ai+m3dcaDfkTVgwFLu6Y4caoBT0OFJjQwRecr
   xz2yvDwMxqOUrBp6/mk8eiAdhcysM0z017EI7eBLUZyRQbFDTf5NqRmtD
   tklXtEAv5tMLgjiKIOwJn02cjLI6gC9HtDGzjRdyeeY6eowTO4JZX5IyG
   qHRaWrU7V7JdFxKoBC09g403yObp3oqD6rH4dKnj3SOcCwT9nWv0C9F/B
   A==;
X-CSE-ConnectionGUID: qPqiuR3vTquXwJKgRgAnhA==
X-CSE-MsgGUID: 0oDEHZqJRXSUoIU26qp9fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221829560"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221829560"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:08 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7D2191C166C7
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:08 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3179F1407352
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4237A101E529;
	Thu, 19 Mar 2026 10:14:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/40] e2fsprogs: upgrade 1.47.3 -> 1.47.4
Date: Thu, 19 Mar 2026 18:12:58 +0800
Message-ID: <20260319101332.2067-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233508

From: Wang Mingyu <wangmy@fujitsu.com>

0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
removed since it's inclued in 1.47.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
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
-- 
2.43.0


