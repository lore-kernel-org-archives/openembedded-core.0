Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ED1CCA486
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.31061.1654516898977599840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/Hz3uO0;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id m26so8128446wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FHQc3VPW0gxW8StppnEnkpB1VrU08bYdwQrYZorHlTY=;
        b=S/Hz3uO0IR47buwjw8KdNlTJsUJ7+Ja2S6g8C2VVCCWum4S6jDidOgCllrZmFX5jhf
         iGIxFXXVJVuOxgw49/sNBwBei2qS7Hnu2buFnnWGhttuNmBpYH0jHkEYQ8I3PAwajx86
         uB/UqawpW5e7S/Ruw7MbljYuy5QU/+SR6X0rEj64sUNyCiMkoPtF/AvaJ0dRoUixIKH0
         9aXiuiLNxT2pD6h4XNO+ZSbkkneKHjecUkL+3aV0cXBR8OL2VwJbg+TsP969pErgRXoY
         h6+kabuLS/KfxPmkvsQXXxmeQh2g7WzvDR5hNdxxAbM/Iw+ogMKIZwyU8gbzVrO5Lkff
         scAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FHQc3VPW0gxW8StppnEnkpB1VrU08bYdwQrYZorHlTY=;
        b=v7D8nbos4aVb4mlTvWRDfN9fFKl+1qRQalytyrRL+vBdPqzWs+p6Vgyjico3tsfCpU
         Q14uf40l7WpN4Z9sTne/r3TsszT5xt11CSG9x+aXVW4+kZ4h0PJfo5vvXAdd6vysmvXY
         Qa1RNr6WelsUr/onqLTBqD2FzwHxWAZjd/1SGV9ePjKwKlFlsiPAqtaY2fpojFmqaw7q
         Q3objFDmJiFPcRPb0uB8pjQydKEQxDasUKGOOPNRGV9IzP0mqBT4AP9bKk2b/GprUYcJ
         LkJFvz4lwafLrxg+qPVcT/MlO5kHKfRHpEKrSJh73heBUDGw35F+19jnNaBW5VylDQDc
         4TIA==
X-Gm-Message-State: AOAM530YugP3pTKt7oZE36Lwr+blSixpbUQmxYmKcNqOIkwCdOkgRaxi
	so6myKny9L7K86WvZSIVlcXd997NDBeckw==
X-Google-Smtp-Source: 
 ABdhPJzzVOpS10aXolmFylrrviLN8IsPia0zaXiDmzUrtozaMaG8CT59RdDbSF3X8W+gwJ1JvDffhQ==
X-Received: by 2002:adf:e186:0:b0:213:3b79:370d with SMTP id
 az6-20020adfe186000000b002133b79370dmr20077530wrb.151.1654516897520;
        Mon, 06 Jun 2022 05:01:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/21] btrfs-tools: update 5.16.2 -> 5.18
Date: Mon,  6 Jun 2022 14:01:13 +0200
Message-Id: <20220606120126.3381438-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166600

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../btrfs-tools/btrfs-tools/lzo-option.patch  | 126 ------------------
 ...fs-tools_5.16.2.bb => btrfs-tools_5.18.bb} |   5 +-
 2 files changed, 2 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.16.2.bb => btrfs-tools_5.18.bb} (95%)

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
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
index 88b5c6259c..f5120d3980 100644
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
@@ -28,7 +27,7 @@ PACKAGECONFIG ??= " \
     python \
     crypto-builtin \
 "
-PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
+PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, python3-sphinx-native"
 PACKAGECONFIG[programs] = "--enable-programs,--disable-programs"
 PACKAGECONFIG[convert] = "--enable-convert --with-convert=ext2,--disable-convert --without-convert,e2fsprogs"
 PACKAGECONFIG[zoned] = "--enable-zoned,--disable-zoned"
-- 
2.30.2


