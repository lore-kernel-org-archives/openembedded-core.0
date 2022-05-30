Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777A4C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:41:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.33672.1653892883522843511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AmqMc3QZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892881; i=@fujitsu.com;
	bh=bJGXk+WIk/ZQ+RfEeHBzE9htg9doj59Hd+6BYiQv0aE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AmqMc3QZ/GnCAK4/7cz4nG/+tzuDiYN0NmqLbgXF1ZMz5xJdSOIsmBD927hXomzXz
	 7DrSnFjLbrWaGKD+n96hLaffBycNqNxx9YNCLyclAiwxUtU+EtQvCd4zs/ZrBuUFCt
	 kSVghXvj7PGQTZ1QbQmYDoWYD9aorFVDpPZq9PpC4hD1Ybi8awmpVqDvmNx+Ak7ab3
	 O/yXC84mhynjcIFMxAttxokNWqa6updMLTmO/0grf1lW8qwRUFaxi80rBBDLJIXa2B
	 3lu3D8VjOo9P9Xgd4eRoIsAQ0jGQc5x/0ynyWISkcyELs4xZeT04JfyO0l9mDnwUS3
	 vb/EZmJX+9y4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRWlGSWpSXmKPExsViZ8OxWVcwfUq
  SwZtXmhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bU55fZCo4YVUx+0MPYwHhIp4uRi0NI4AGj
  xM5bp5khnDNMEqs2TGOCcPYwSkw/3MPWxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAnYSlz9MYAGxWQRUJT4cO8EMYvMKOElMbHjICGJLCChITHn4HizOKeAsse/wBTBbCK
  hm4b3PUPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hqb6xqaGeklVukm6qWW6panFpfoArnlxXqpxcV6
  xZW5yTkpenmpJZsYgWGcUqy6aAfj/lU/9Q4xSnIwKYnynlWdnCTEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgjc+eUqSkGBRanpqRVpmDjCmYNISHDxKIrxLEoDSvMUFibnFmekQqVOM9hwf/1zcy8
  yxc8tlIDl19r/9zBzLQaQQS15+XqqUOO/5RKA2AZC2jNI8uKGwFHCJUVZKmJeRgYFBiKcgtSg
  3swRV/hWjOAejkjDvrVSgKTyZeSVwu18BncUEdBY300SQs0oSEVJSDUwrK2z+HdU1Y7S+FZyQ
  uaJe+c2/WZamcjMbk5Xmi5y7Mfd89pPI44fXVf++OVHI2lt9/kc2k5MmlnvLhM7tv9h/zr7Ur
  6zu5MFO/zotVcu7v7YceFBvLdLP9IfR/PyyE3+83UNcOLat2uQya214ZYn7nMtzHeoUptU4Bk
  2MTs9q7S45uUrL5QWjDuPDGU/T5+XJ/+zJceqpXHlA+pxzlr9WhPGb9oI/SoLFezYtZJswUyG
  ItXa69YofGx6JPj58kecQ06Hle/q7osM3XPm+X8ZhRu6tb13LPyoyz351x7QozNh+ucW9xoTn
  6TyaCop+9r+myTyq02SLDBN+UGxtIpfwr1jw2OK+qc7/3lr0dyixFGckGmoxFxUnAgCqpAKif
  AMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1653892881!17101!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5547 invoked from network); 30 May 2022 06:41:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:41:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 308D6813
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 067EC80B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:41:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.16.2 -> 5.18
Date: Mon, 30 May 2022 14:40:48 +0800
Message-ID: <1653892850-23554-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
References: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:41:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166266

lzo-option.patch
removed since it's included in 5.18.

Changelog:
==========
fixes:
    dump-tree: don't print traling zeros in checksums
    recognize paused balance as exclusive operation state, allow to start device add
    convert: properly initialize target filesystem label
    mkfs: don't create free space bitmaps for empty filesystem
restore: make lzo support build-time configurable, print supported compression in help text
update kernel-lib sources
other:
    documentation updates, finish conversion to RST, CHANGES and INSTALL could be included into RST
    fix build detection of experimental mode
    new tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/btrfs-tools/lzo-option.patch  | 126 ------------------
 ...fs-tools_5.16.2.bb => btrfs-tools_5.18.bb} |   3 +-
 2 files changed, 1 insertion(+), 128 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.16.2.bb => btrfs-tools_5.18.bb} (96%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.patch
deleted file mode 100644
index f4278a5c5d..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-Upstream-Status: Backport [https://github.com/kdave/btrfs-progs/commit/73545c1fe6304f08ab306b76d2bcacaf22a5e99a]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 4f4eafe8ebcc86f84f6c85a5c5814c430d8f190c Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 24 May 2022 13:44:29 +0100
-Subject: [PATCH] btrfs-progs: add option to disable LZO support
-
-LZO as a compression format is pretty archaic these days, there are
-better algorithsm in all metrics for compression and decompression, and
-lzo hasn't had a new release since 2017.
-
-Add an option to disable LZO (defaulting to enabled), and respect it in
-cmds/restore.c.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Makefile        |  2 +-
- Makefile.inc.in |  1 +
- cmds/restore.c  |  7 +++++++
- configure.ac    | 30 ++++++++++++++++++++----------
- 4 files changed, 29 insertions(+), 11 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index af4908f9..0e8e05f3 100644
---- a/Makefile
-+++ b/Makefile
-@@ -335,7 +335,7 @@ endif
- btrfs_convert_cflags = -DBTRFSCONVERT_EXT2=$(BTRFSCONVERT_EXT2)
- btrfs_convert_cflags += -DBTRFSCONVERT_REISERFS=$(BTRFSCONVERT_REISERFS)
- btrfs_fragments_libs = -lgd -lpng -ljpeg -lfreetype
--cmds_restore_cflags = -DBTRFSRESTORE_ZSTD=$(BTRFSRESTORE_ZSTD)
-+cmds_restore_cflags = -DBTRFSRESTORE_LZO=$(BTRFSRESTORE_LZO) -DBTRFSRESTORE_ZSTD=$(BTRFSRESTORE_ZSTD)
- 
- ifeq ($(CRYPTOPROVIDER_BUILTIN),1)
- CRYPTO_OBJECTS = crypto/sha224-256.o crypto/blake2b-ref.o
-diff --git a/Makefile.inc.in b/Makefile.inc.in
-index c995aef9..385b7ae1 100644
---- a/Makefile.inc.in
-+++ b/Makefile.inc.in
-@@ -16,6 +16,7 @@ BUILD_PROGRAMS = @BUILD_PROGRAMS@
- BUILD_SHARED_LIBRARIES = @BUILD_SHARED_LIBRARIES@
- BUILD_STATIC_LIBRARIES = @BUILD_STATIC_LIBRARIES@
- BTRFSCONVERT_EXT2 = @BTRFSCONVERT_EXT2@
-+BTRFSRESTORE_LZO = @BTRFSRESTORE_LZO@
- BTRFSCONVERT_REISERFS = @BTRFSCONVERT_REISERFS@
- BTRFSRESTORE_ZSTD = @BTRFSRESTORE_ZSTD@
- PYTHON_BINDINGS = @PYTHON_BINDINGS@
-diff --git a/cmds/restore.c b/cmds/restore.c
-index 5923d571..4dd79fce 100644
---- a/cmds/restore.c
-+++ b/cmds/restore.c
-@@ -25,8 +25,10 @@
- #include <fcntl.h>
- #include <sys/stat.h>
- #include <sys/types.h>
-+#if BTRFSRESTORE_LZO
- #include <lzo/lzoconf.h>
- #include <lzo/lzo1x.h>
-+#endif
- #include <zlib.h>
- #if BTRFSRESTORE_ZSTD
- #include <zstd.h>
-@@ -98,6 +100,10 @@ static inline size_t read_compress_length(unsigned char *buf)
- static int decompress_lzo(struct btrfs_root *root, unsigned char *inbuf,
- 			char *outbuf, u64 compress_len, u64 *decompress_len)
- {
-+#if !BTRFSRESTORE_LZO
-+	error("btrfs not compiled with lzo support");
-+	return -1;
-+#else
- 	size_t new_len;
- 	size_t in_len;
- 	size_t out_len = 0;
-@@ -156,6 +162,7 @@ static int decompress_lzo(struct btrfs_root *root, unsigned char *inbuf,
- 	*decompress_len = out_len;
- 
- 	return 0;
-+#endif
- }
- 
- static int decompress_zstd(const char *inbuf, char *outbuf, u64 compress_len,
-diff --git a/configure.ac b/configure.ac
-index d907636b..c1ad2c22 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -372,16 +372,26 @@ if ${PKG_CONFIG} udev --atleast-version 190; then
- fi
- AC_SUBST(UDEVDIR)
- 
--dnl lzo library does not provide pkg-config, let use classic way
--AC_CHECK_LIB([lzo2], [lzo_version], [
--	LZO2_LIBS="-llzo2"
--	LZO2_CFLAGS=""
--	LZO2_LIBS_STATIC="-llzo2"],[
--	AC_MSG_ERROR([cannot find lzo2 library])
--])
--AC_SUBST([LZO2_LIBS])
--AC_SUBST([LZO2_LIBS_STATIC])
--AC_SUBST([LZO2_CFLAGS])
-+AC_ARG_ENABLE([lzo],
-+	AS_HELP_STRING([--disable-lzo], [build without lzo support]),
-+	[], [enable_lzo=yes]
-+)
-+
-+if test "x$enable_lzo" = xyes; then
-+	dnl lzo library does not provide pkg-config, let use classic way
-+	AC_CHECK_LIB([lzo2], [lzo_version], [
-+		LZO2_LIBS="-llzo2"
-+		LZO2_CFLAGS=""
-+		LZO2_LIBS_STATIC="-llzo2"],[
-+		AC_MSG_ERROR([cannot find lzo2 library])
-+	])
-+	AC_SUBST([LZO2_LIBS])
-+	AC_SUBST([LZO2_LIBS_STATIC])
-+	AC_SUBST([LZO2_CFLAGS])
-+fi
-+
-+AS_IF([test "x$enable_lzo" = xyes], [BTRFSRESTORE_LZO=1], [BTRFSRESTORE_LZO=0])
-+AC_SUBST(BTRFSRESTORE_LZO)
- 
- dnl call PKG_INSTALLDIR from pkg.m4 to set pkgconfigdir
- m4_ifdef([PKG_INSTALLDIR], [PKG_INSTALLDIR], [AC_MSG_ERROR([please install pkgconf])])
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
similarity index 96%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
index 88b5c6259c..b83b4cd1b8 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
@@ -17,9 +17,8 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://lzo-option.patch \
            "
-SRCREV = "31458c9c81935abbed010221261897273a98d2c1"
+SRCREV = "f9e303584272b81b05b926a0cc9010f43af12a03"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


