Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9CAB7C479
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r10so17863130wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Y8GfAxBSHfmBDrKxC1IbDHtuAGGj9uoHuBd4rYfe+WA=;
	b=SGdMeuDqA6JygzXM0b5XN/ngk/KczuIS4eMpRP7woISTpec7kOtx8vw6uGRM7XSq6z
	zRKcvSXQmB+2QjD7XJmSvptMCoNpWjmtaK7W/sm+U8I7gFESr/oZVM9h0sefEwNnDR/j
	UGfHDJzKbDF5P6B6ZPiYwAoe8iCXBLpWwfkr8DsTawTVdkodxJXKMrVwNFjTIjsotWFF
	0NUXW4DswNsp15Y+aUVARHDFubEk1MyUvKeobdMZ/0tT8RRQeNDTfiyYmsM3zcnGFC9s
	PcphRsBDQWhnAzAZhPf8ds6kpA6FGzta3Nk7P4ogw4R9UfV+dMiRxMw+raUJZMZJ5jE8
	qmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y8GfAxBSHfmBDrKxC1IbDHtuAGGj9uoHuBd4rYfe+WA=;
	b=c9ZgwUKSPL9rKWj+d5Dshch+5SaXB2RB9tjadYAAiBlBa0Bftij81qs9yWEhQ5l2Jn
	dcQqdMKwiP0C580HXsohn2WiDeDS/BpdoztvDfn5CoAFrZ25ZPN2EfnHCAegNrMZvib4
	a9ZR16vWXhHfclr5REzMG5rTwXI3RjGIkaVDK5AX2Z3+05O23krx0ScRn2GOlYNEa1Sz
	vrhASvHSt+5//Y04LVcxxDMizj4nwxc5tsyIcYh7X+j0T3YiKmXwCZt2u0Bdweg0YtO+
	+lZUggUg1VlEfUL/5D4YEJZOYKGb0pq08wmnOQaMrAJyIxLxHc8qzhPGMh4DcDMl9tuR
	dhZg==
X-Gm-Message-State: AJcUukfrkIRXfSJganDXUzGOXDERQqf7LQyrWyGc2JHuFx40Ts9dBgVa
	rqyrYX4K2dpwpWdZlLab/fOjhnM2
X-Google-Smtp-Source: ALg8bN4qyTyWKbY2tkGga3wBX4eqgnqUUhbye+wp/oZeDQDaiqyFUfiCRUy8gRoB8YKSu6Xcp7x/qg==
X-Received: by 2002:adf:9422:: with SMTP id 31mr22919320wrq.106.1548679635972; 
	Mon, 28 Jan 2019 04:47:15 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:39 +0100
Message-Id: <096d35733aa3c71bc6b57dd31a8adfead8919889.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 08/24] virglrenderer: add a recipe
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:16 -0000

This component enables hardware-accelerated GL inside QEMU guests.
For more information, see here:

https://lwn.net/Articles/767970/
https://www.collabora.com/news-and-blog/blog/2018/02/12/virtualizing-gpu-access/
https://www.collabora.com/news-and-blog/blog/2018/05/09/gpu-virtualization-update/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-vtest-add-missing-includes.patch     | 38 +++++++++++++++++++
 .../virglrenderer/virglrenderer_git.bb        | 19 ++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8d6eb1afc0d..f369fb13834 100644
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
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
new file mode 100644
index 00000000000..b565c48ee66
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/125]
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
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb
new file mode 100644
index 00000000000..93fc35feb8d
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "VirGL virtual OpenGL renderer"
+HOMEPAGE = "https://virgil3d.github.io/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
+
+DEPENDS = "libdrm mesa libepoxy"
+PV = "0.7.0"
+SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
+SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
+           file://0001-vtest-add-missing-includes.patch \
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


