Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.9685.1629636693681659215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AWhlpBUa;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so3657975wmh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a22it768Hvja74TfSZQyyciVkpmC9rqL9kKHmHgNRcM=;
        b=AWhlpBUa8cSbU4TBAPPTOEsxAO29N7M7olbw43DxF2DqX3QE0C2rnvI0hTMDZoGZ5V
         ImH/YarVcfCl0S//GVUnX30Mb1WJBebjoH3gCxtNJOFIxU5mcs+HPwpQSb/oLr1JMe8O
         yxtisE4DEDQQw220qhIgOsXMFlnQlnL03ZN80omVmmv00iDlhCyQbVsd84O8NEKwv/11
         pVnRQWy7PINP22xLXjG034O04FzIfigGtvjaJifY1ki09/+SrbdU9VDVpxljtErufEwZ
         PWBpELDaSGX7e2kmwvZCvXlxq8duJDB4/znVBY0ABYbCR+yUSej6kFu+w8vZlRWJZEhV
         vo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a22it768Hvja74TfSZQyyciVkpmC9rqL9kKHmHgNRcM=;
        b=BmqF4MZU6KlaUKyb9qWKmBtGgxehgmokwU+zMxiyGqcf6dT1VjeCdowAZJUXvAZRoJ
         KDQzwnY6tZKfQKQy9liV7225OTZJBPrsZ3gY2SirNoMWbt0B++FgnK6FpFTU+50hk9ek
         qKKx5MrcCDDDzRaGAIsRZ3B57MAdTiZ+UiRXyx0ZJooGrN1B6rDWgJHvenhEzZTWobh0
         cj78gyVxLV6FpaPs1+rMzyP9oLVk+1nqZ5/ZRAZpv7F4rCj8TKE5Y5W4FPFePzR+yUZA
         dJUkoxLyL4YHshFSa98XEtXr0/XV2bh+drhpNTkTLXmvxnAE5aopbHa32QyffYjw2Qn4
         zWrA==
X-Gm-Message-State: AOAM531rw+kq/DfBAHB3yAPoBoI57lk2cwbvhZ18Yt4+La1B6+lZEty1
	o63yak1lmVUbPR93nHmkQKdokqgGYotqtw==
X-Google-Smtp-Source: ABdhPJzTFGcjKjQx7DdhTyuzqp5bm2G0dLuRdwDYML8N3YL7vqSHa0dWxWUIoSOMCxrQ8ErPpKJrkg==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr11934839wmh.99.1629636692313;
        Sun, 22 Aug 2021 05:51:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/55] squashfs-tools: upgrade 4.4 -> 4.5
Date: Sun, 22 Aug 2021 14:50:39 +0200
Message-Id: <20210822125103.310416-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ols-fix-build-failure-against-gcc-10.patch | 45 -------------------
 ...e-of-INSTALL_DIR-for-symlink-targets.patch | 34 ++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |  8 ++--
 3 files changed, 38 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
deleted file mode 100644
index fc881862ea..0000000000
--- a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 94e1911ca24726b7cb3efe2f8b9eb7a784757e18 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Sun, 26 Jan 2020 18:35:13 +0000
-Subject: [PATCH] squashfs-tools: fix build failure against gcc-10
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On gcc-10 (and gcc-9 -fno-common) build fails as:
-
-```
-cc ... -o mksquashfs
-ld: read_fs.o:(.bss+0x0):
-  multiple definition of `fwriter_buffer'; mksquashfs.o:(.bss+0x400c90): first defined here
-ld: read_fs.o:(.bss+0x8):
-  multiple definition of `bwriter_buffer'; mksquashfs.o:(.bss+0x400c98): first defined here
-```
-
-gcc-10 will change the default from -fcommon to fno-common:
-https://gcc.gnu.org/PR85678.
-
-The error also happens if CFLAGS=-fno-common passed explicitly.
-
-Reported-by: Toralf Förster
-Bug: https://bugs.gentoo.org/706456
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
-Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/fe2f5da4b0f8994169c53e84b7cb8a0feefc97b5]
----
- squashfs-tools/mksquashfs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/squashfs-tools/mksquashfs.h b/squashfs-tools/mksquashfs.h
-index 1beefef..b650306 100644
---- a/squashfs-tools/mksquashfs.h
-+++ b/squashfs-tools/mksquashfs.h
-@@ -143,7 +143,7 @@ struct append_file {
- #endif
- 
- extern struct cache *reader_buffer, *fragment_buffer, *reserve_cache;
--struct cache *bwriter_buffer, *fwriter_buffer;
-+extern struct cache *bwriter_buffer, *fwriter_buffer;
- extern struct queue *to_reader, *to_deflate, *to_writer, *from_writer,
- 	*to_frag, *locked_fragment, *to_process_frag;
- extern struct append_file **file_mapping;
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
new file mode 100644
index 0000000000..b505f05735
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
@@ -0,0 +1,34 @@
+From c9e263a7add76df1ed92e879d964264067c0f6e8 Mon Sep 17 00:00:00 2001
+From: Patrick McCarty <patrick.mccarty@intel.com>
+Date: Mon, 26 Jul 2021 11:38:43 -0700
+Subject: [PATCH] Avoid use of INSTALL_DIR for symlink targets
+
+In case INSTALL_DIR is overridden with a staged install location, using
+INSTALL_DIR for the symlink target path prefix will yield an incorrect location
+for the final installation.
+
+Because the symlink itself is already installed to INSTALL_DIR, simply removing
+the INSTALL_DIR prefix suffices as a fix.
+
+Note that using $DESTDIR/$INSTALL_DIR where appropriate can avoid this type of
+issue, but that can be considered a future enhancement.
+
+Upstream-Status: Backport
+Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ squashfs-tools/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
+index 5795d0d..998c5fd 100755
+--- a/Makefile
++++ b/Makefile
+@@ -406,5 +406,5 @@ install: mksquashfs unsquashfs
+ 	mkdir -p $(INSTALL_DIR)
+ 	cp mksquashfs $(INSTALL_DIR)
+ 	cp unsquashfs $(INSTALL_DIR)
+-	ln -fs $(INSTALL_DIR)/unsquashfs $(INSTALL_DIR)/sqfscat
+-	ln -fs $(INSTALL_DIR)/mksquashfs $(INSTALL_DIR)/sqfstar
++	ln -fs unsquashfs $(INSTALL_DIR)/sqfscat
++	ln -fs mksquashfs $(INSTALL_DIR)/sqfstar
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 1a9e8f108b..2b9a765bb2 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -7,11 +7,11 @@ SECTION = "base"
 LICENSE = "GPL-2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "4.4"
-SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
+PV = "4.5"
+SRCREV = "0496d7c3de3e09da37ba492081c86159806ebb07"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
-           file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
-"
+           file://0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch \
+           "
 
 S = "${WORKDIR}/git/squashfs-tools"
 
-- 
2.31.1

