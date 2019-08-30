Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2957F447
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:13 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g207so3219245wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eBC5ibz32Bnezme97bdYOOjCuetjNrbro56nmOto804=;
	b=oT2rDDbyNQnCno38NGHCVq5HLcMkZYELvzO94i8LEi+KKQcSMN24LIrmGi3nBgq62i
	wotYFOjvBrXE2z1sFwccYrccT4hHVExGNav8t7jqw12ipZs1TTfebuEtoM6ThtYxezpO
	4BCjVOe6v07qr6VNcNgoP8xDC0D1MaONkcTjv4yQVWc487/vL5CUtrujMogd0Eyzq11s
	qc4+VcWVzYEfcwXmY69JrDtdJ2yjfVXY7OZ2I6mdjgwbYSLqVg6zw2BP53KzOQZmD6BX
	LX8b/AI4qdYHvK+k8O/G+Pw1LdRSWR//1D+FL31hvkYyE+RazEC7/FyLlFdtZ6cTXYk5
	VrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eBC5ibz32Bnezme97bdYOOjCuetjNrbro56nmOto804=;
	b=j9TtKdAB96EJSLi9tdW4+/sQ+7nnPPTglcVNzCv1t43ayXaiJKDpmBd9Ag2A/+b1DB
	Xd/AgmkVtMcd8QRRlKW0EbB6b8vc8MnO2RAWi/bwUSbXQjYA+lb8BerRi3XwmA+cBg2h
	enWkW7OIw+7ClAJUm5H3HZHV7/g3kX9tMDFJL1QW812BdKoFsmugE5+S4NH7OxrYuqUF
	j95jFscLOOq1+G/CGB8NPlm4XPdhqXWpGuViswjcWC2Sox+yiSeNlQb0kgaJFtS7Z3qs
	UsKfgy0YQSZG4tHFAc03AU0Q9qJv9Ug63sZ8+CPWZsP2BEhgt5UubAxW4CT2FBIUEFmi
	7IOQ==
X-Gm-Message-State: APjAAAWrUyB/znCElFmBA4q211KWNsyA7C/LlnKyoeJzyMoigbxYa1IO
	WeGaE1J86eG0bszDzUOHwohsVTc1
X-Google-Smtp-Source: APXvYqwp9Y/mlnc4bgHeiqwLMjHGQqme7Ck2OVJ+7C2hW8Cp57VS1u9n+2sB6EsWX87EkKgM+tbNzg==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr10044523wme.41.1567169413920; 
	Fri, 30 Aug 2019 05:50:13 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:55 +0200
Message-Id: <6afa80108d6f20de679a93a74e5be61731f1f613.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 10/13] virglrenderer: update 0.7.0 -> 0.8.0
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:14 -0000

This also allows building virglrenderer without python 2.x

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...efile.am-explicitly-link-with-libdrm.patch | 31 ---------------
 .../0001-vtest-add-missing-includes.patch     | 38 -------------------
 ...nderer_0.7.0.bb => virglrenderer_0.8.0.bb} |  4 +-
 3 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.7.0.bb => virglrenderer_0.8.0.bb} (76%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
deleted file mode 100644
index aa8d814845e..00000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d61f7073b8ce159d21811b291c22b273b040c330 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 12 Feb 2019 12:04:52 +0100
-Subject: [PATCH] Makefile.am: explicitly link with libdrm
-
-Otherwise, a failure happens with gold linker:
-
-../src/.libs/libvirglrenderer.so: error: undefined reference to 'drmPrimeHandleToFD'
-
-https://errors.yoctoproject.org/Errors/Details/222046/
-
-Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/153]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 9a0a44e..9b668c8 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,5 +1,6 @@
- SUBDIRS := gallium/auxiliary
- AM_LDFLAGS = -lm \
-+	$(LIBDRM_LIBS) \
- 	$(GBM_LIBS) \
- 	$(EPOXY_LIBS) \
- 	$(X11_LIBS) \
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
deleted file mode 100644
index 2b4ffa932de..00000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 05c5c5f43fbffb3317bd9da27d414890d2ef493c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 18 Jan 2019 13:47:23 +0100
-Subject: [PATCH] vtest: add missing includes
-
-This fixes build failures with musl C library
-
-Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/125]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- vtest/util.c         | 1 +
- vtest/vtest_server.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/vtest/util.c b/vtest/util.c
-index 0d3c78f..c605253 100644
---- a/vtest/util.c
-+++ b/vtest/util.c
-@@ -26,6 +26,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
-+#include <sys/select.h>
- 
- int vtest_wait_for_fd_read(int fd)
- {
-diff --git a/vtest/vtest_server.c b/vtest/vtest_server.c
-index bc6c95f..010721f 100644
---- a/vtest/vtest_server.c
-+++ b/vtest/vtest_server.c
-@@ -31,6 +31,7 @@
- #include <netinet/in.h>
- #include <sys/un.h>
- #include <fcntl.h>
-+#include <string.h>
- 
- #include "util.h"
- #include "vtest.h"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
similarity index 76%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
index 818d5b63077..d2b11c103a3 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
@@ -5,10 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm mesa libepoxy"
-SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
+SRCREV = "48cc96c9aebb9d0164830a157efc8916f08f00c0"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
-           file://0001-vtest-add-missing-includes.patch \
-           file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            "
 
-- 
2.17.1


