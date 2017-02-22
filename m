Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A553F72FDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 20:02:34 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id q39so1696136wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N7SrjF2nwAIuIyxRUaFxWcshoyxaD346dpPysDcKgU4=;
	b=D3/qG4q8ZQgWBTxPxSiJrCRzE3SdswuTrUV76xYTEnVn4zbhIKb5c0hU/++vzWnmar
	O8R8wOHbxiHoRmEc7RMARhWPZLgd3tiorv2R5pTLjt6l/M9SlKVm2UwYE086oVyijxAi
	BK0uU7eWdEMd9ndlzHkvG39LFELJsTJR01Otd+EEtmjIsi+vGoXkGhfvnbU4K4CEqmWP
	T8ySo+AcSAJnlIL3YkZf8LZhXMpJ1svZ+ugbvd9kB4DG39Gs97J9KPWMocPw+JV22WC4
	28z1wuJoAWvOPeNrU64L2Uqvukcc3tYKlhUOwBbEMx6YTaT0NPtbirW5Df2zAdBl6zOs
	6rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N7SrjF2nwAIuIyxRUaFxWcshoyxaD346dpPysDcKgU4=;
	b=BYvbT/QijvPGM501T4DlfFuyYDg076FjEQOQYYNIlDT0U+QFX0zwAg9KMnLsBgJuU9
	x9gt4m4ty4AnaX/nMrDcHgNnN7dLFneb7vXu9bw90MYjF2xk7Fnswm/PdqL/3nPRtK/K
	dEvl1VwCAmhELkKJbOcKr0ihguf3hDzEBFi33Ls38zWEG0gfY20gnulThfWN2QUAqxnz
	nSzZs8u5am9n1GFHGZr2mpJjBTQcZNIVP0qbvfCVhyVO1lw8EWcLELFOQAbCvPXdhAo4
	D5+xrM6AH2dHBf8jx6MFuhBtdJNiGnnLGDyQp1+bCx9MCxj+M6e8fu43EC+MyMexY+RC
	72uA==
X-Gm-Message-State: AMke39m4RMGNrEc3owgEXC2yYbGSoMDhMGyXDhCHEknzQ0ARjTLZhb5jmb4Kap1hYl3RIw==
X-Received: by 10.223.150.59 with SMTP id b56mr26974251wra.192.1487793755329; 
	Wed, 22 Feb 2017 12:02:35 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o143sm3354878wmd.3.2017.02.22.12.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 12:02:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 21:02:32 +0100
Message-Id: <20170222200232.27761-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170222200232.27761-1-Martin.Jansa@gmail.com>
References: <20170222200232.27761-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] syslinux: fix build with glibc-2.25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2017 20:02:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../syslinux/syslinux-6.03-sysmacros.patch         | 45 ++++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.03.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch
new file mode 100644
index 0000000000..3ce46da103
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch
@@ -0,0 +1,45 @@
+https://bugs.gentoo.org/579928
+
+From d84db34dbe39d55b4d7e868764c056689aa0793b Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Tue, 19 Apr 2016 01:56:41 -0400
+Subject: [PATCH] extlinux: pull in sys/sysmacros.h for major/minor/makedev
+
+These functions are defined in sys/sysmacros.h, so add the include to
+main.c.  This is already handled correctly in mountinfo.c.  Otherwise
+we get build failures like:
+
+main.o: In function 'find_device_sysfs':
+extlinux/main.c:1131: undefined reference to 'minor'
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+
+The first part wasn't enough in OE build, I had to add the same for syslinuxext.c.
+---
+ extlinux/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/extlinux/main.c b/extlinux/main.c
+index a7ebd49..ebff7ea 100644
+--- a/extlinux/main.c
++++ b/extlinux/main.c
+@@ -38,6 +38,7 @@
+ #include <sysexits.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/mount.h>
+ #include <sys/vfs.h>
+--- a/libinstaller/syslinuxext.c	2017-02-22 20:17:05.336869181 +0100
++++ b/libinstaller/syslinuxext.c	2017-02-22 20:16:47.500868751 +0100
+@@ -2,6 +2,7 @@
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <getopt.h>
+ #include <ext2fs/ext2fs.h>
+ 
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index ab8a51a23f..69bce1f8d7 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -23,6 +23,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.xz \
            file://0009-linux-syslinux-implement-install_bootblock.patch \
            file://0010-gcc46-compatibility.patch \
            file://0011-mk-MMD-does-not-take-any-arguments.patch \
+           file://syslinux-6.03-sysmacros.patch \
            "
 
 SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
-- 
2.11.1


