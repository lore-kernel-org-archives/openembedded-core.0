Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id C74DC7CBD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:33:54 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id x10so2153737wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wmzQOu48MBJppvoQmQLfH9ExGiMvVr/zK698gS/GYeY=;
	b=fgOKQgaGdKraDkivw8aRDnobHRmkNrhlAI9fiVxqtVcIa2kle0pX5C2KITyfzjL5xh
	ZJbekEb86lBLYB1D5x3gn8CfSyNSxU0bteAv1jkh23RAhKlIskoVlED0xS5RSeq6YbOY
	mt6qGghAVozYV5DEKiAY5XSnB/iEr1GDYTDecvs5qIb5dUBQMBLFN8F0EkgeHC+i9fz2
	jo9sfuLr1VeWzrwPtVgImYwZWSGx6JDz6AhWOiFW3FVe404QuZVRqmqEStDrHjk4vyoO
	TMC9SJrv/I0xqRsD4XznQGgZCxrnqUeLMsMwxyablAQ/B+knjgD79KN/LxE+r1xfNRww
	VIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wmzQOu48MBJppvoQmQLfH9ExGiMvVr/zK698gS/GYeY=;
	b=dX1GZDpmcgvnap5TICCaE4Aoi8F5qAHKXmb+6F6Ua2pYMIW5jLtWr0d2n26A+djJbh
	iwtdKtwT6QLNwPHVUdDCp5x0iJb9eQtkSg95ZC1tD+wd7LWMsjYEB+X7kwXFk+UCJPnD
	RI6kfVgnAAY5n1CAEaD8HwRXJ8h7nGJ8N823ugF+iKqQy983CeM9o0whVoTedcas5hvD
	BbtMghXk8lJHZaqEIFA22Ohym9REiAFhL+aHfJXVgCEYQay54SczucwIn7Gv8oT9wAmN
	dhIdEOzMBP+zI4bwAkOBko55v45zTqOw4hFz9juN58IJ4sXpUips2Kmm6ApzKDc+8eLl
	+ehw==
X-Gm-Message-State: AHQUAuYDZtMqQSoGJ0JTr22Hwn8O51ZcvmVnF9yxt1Fyh3FeWAxuDO01
	vfnvqVOfC2yo0F09cFgIAQT5W0OG
X-Google-Smtp-Source: AHgI3IY4dolsFa1tZxzXW9OlL+jZNqI+v6odUggKhG07OxdovPSyXkZ4K0/D4S/karb/fk7RIRhlSw==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr2684113wmk.149.1550846035221; 
	Fri, 22 Feb 2019 06:33:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.33.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:33:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:36 +0100
Message-Id: <bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Fri, 22 Feb 2019 14:33:55 -0000

This component enables hardware-accelerated GL inside QEMU guests.
For more information, see here:

https://lwn.net/Articles/767970/
https://www.collabora.com/news-and-blog/blog/2018/02/12/virtualizing-gpu-access/
https://www.collabora.com/news-and-blog/blog/2018/05/09/gpu-virtualization-update/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...efile.am-explicitly-link-with-libdrm.patch | 31 +++++++++++++++
 .../0001-vtest-add-missing-includes.patch     | 38 +++++++++++++++++++
 .../virglrenderer/virglrenderer_0.7.0.bb      | 19 ++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4e3fc103afc..f5e6343904b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -700,6 +700,7 @@ RECIPE_MAINTAINER_pn-util-macros = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-v86d = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-vala = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-valgrind = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-virglrenderer = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan = "Ross Burton <ross.burton@intel.com>"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
new file mode 100644
index 00000000000..aa8d814845e
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
@@ -0,0 +1,31 @@
+From d61f7073b8ce159d21811b291c22b273b040c330 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 12 Feb 2019 12:04:52 +0100
+Subject: [PATCH] Makefile.am: explicitly link with libdrm
+
+Otherwise, a failure happens with gold linker:
+
+../src/.libs/libvirglrenderer.so: error: undefined reference to 'drmPrimeHandleToFD'
+
+https://errors.yoctoproject.org/Errors/Details/222046/
+
+Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/153]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 9a0a44e..9b668c8 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,5 +1,6 @@
+ SUBDIRS := gallium/auxiliary
+ AM_LDFLAGS = -lm \
++	$(LIBDRM_LIBS) \
+ 	$(GBM_LIBS) \
+ 	$(EPOXY_LIBS) \
+ 	$(X11_LIBS) \
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
new file mode 100644
index 00000000000..2b4ffa932de
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
@@ -0,0 +1,38 @@
+From 05c5c5f43fbffb3317bd9da27d414890d2ef493c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 18 Jan 2019 13:47:23 +0100
+Subject: [PATCH] vtest: add missing includes
+
+This fixes build failures with musl C library
+
+Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/125]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ vtest/util.c         | 1 +
+ vtest/vtest_server.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/vtest/util.c b/vtest/util.c
+index 0d3c78f..c605253 100644
+--- a/vtest/util.c
++++ b/vtest/util.c
+@@ -26,6 +26,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <sys/select.h>
+ 
+ int vtest_wait_for_fd_read(int fd)
+ {
+diff --git a/vtest/vtest_server.c b/vtest/vtest_server.c
+index bc6c95f..010721f 100644
+--- a/vtest/vtest_server.c
++++ b/vtest/vtest_server.c
+@@ -31,6 +31,7 @@
+ #include <netinet/in.h>
+ #include <sys/un.h>
+ #include <fcntl.h>
++#include <string.h>
+ 
+ #include "util.h"
+ #include "vtest.h"
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
new file mode 100644
index 00000000000..500ed4f2d8b
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "VirGL virtual OpenGL renderer"
+HOMEPAGE = "https://virgil3d.github.io/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
+
+DEPENDS = "libdrm mesa libepoxy"
+SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
+SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
+           file://0001-vtest-add-missing-includes.patch \
+           file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.17.1


