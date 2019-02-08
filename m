Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBC2C7C5B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q18so3822400wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E6yzzByzjTXQApREYVdHbCdvSaC0azXXVG4aG0yaRe8=;
	b=lGSCSbC45xvoY4IeGolCWmJuJ2QW/naX99AObaGez/+KHbTc7cxjnItWecBBuCbiHh
	4qDjVHzlRYM5Hx3ZqzJmZK2NchMEizKTgt3UTBQ+2ZwBug5GmocKp2AR+GdqiN6d3pg9
	oLoe5+J6uvHe8/MP48hywNV4zfKlj15KnumaPO5M/ACrGxfFIbnjfZA59RNotFShT8M5
	ZLJ+b0DuS9HX0xlZe4YAnjlvgtOcBbvnOiaKmBw5QfmF96lSxU1YBcizQwbNHYuryCEl
	ANO0d7pvyxMnqjGawvT8zXVdaXFZT3HDyIknpDfkVnhwal7wfUxX6WKXjTMgW7KOYpR1
	+zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E6yzzByzjTXQApREYVdHbCdvSaC0azXXVG4aG0yaRe8=;
	b=T5bgD/KrByQp2S2wUpPP33+QaTQUgJQXdo7ndeW/zMHw9wnF5Lu/G3WiobWOH/h+Im
	Vs7Y6rXlGVW6llhWwe5NavHg2pCo+fltGTjfapxq7xLP6tWRcJJo58IJwhgva9FZ3fgz
	T0kKnMNMnuCycpXZSMpGQRDFDJoOrRmf6fsZdcovYXD7tz6UGm5D7SMgZl8Yail7a6GZ
	2EsO3518/MfceJrzXrPcidnIUL4CuH2BjK2IL+os2/7gfIRzsrF76y5aHzlc4X1DDfXt
	JmVNMSONcPq+PM0pJWHbnxP5UMXjCN+HURepFWZkTNMz5sssLcB89JCNRgoqPlW8LPcy
	o5fw==
X-Gm-Message-State: AHQUAubm/1uWsYg1QdpHVx1dEC5wP+XllOU9j/BdgxbQLEMI5B4dtUvz
	AdYHqG+SoGiuFnTXgbR3+xgXHg9H
X-Google-Smtp-Source: AHgI3Ia2CoeeBfZpSTHx1x3csjwVNFIxxNr/61prYKctKuynx5ktQvTPHQyGrGXPlHJ3hs/GaFlEFg==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr17311378wru.177.1549637161234;
	Fri, 08 Feb 2019 06:46:01 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:42 +0100
Message-Id: <c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:01 -0000

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
index 122fdbcff4b..f7d43d20b7f 100644
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


