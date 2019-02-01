Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1C17C21E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v13so7006002wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y8GfAxBSHfmBDrKxC1IbDHtuAGGj9uoHuBd4rYfe+WA=;
	b=aWX4eDO0AwDp/4D7EqcPKvGkmFGI0Pr52A12GPBuJ+l5hgjwFPMSQ4wrTV1SsrQMgK
	W8ovUv6/6Eea0AeAl7hTfXUkyOCYL+h3BwgyDR8RWeQiYsKlKtfOBUzuBUCElYY787tI
	M/MHPUxPtklU6lv84yU7On44r6C+R1ZTsd/8LpyaY4Eg9imxrudH6KOE8OqC7VxZ1z6a
	c95NJK0HWeCpdd7FNWsFpi0BBoauZp1485BdE88AyGjxSNB0gZYF5modaGJe+6EiFWLY
	GSyNoFPRYpLuOX5myBCB8xqXhhmU5CdgdZfnN3ZDT13MQHsWeBtlalzQz6Hz7fNCmx3X
	v7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y8GfAxBSHfmBDrKxC1IbDHtuAGGj9uoHuBd4rYfe+WA=;
	b=nzC/BwZplxRoNLtIgQi52Rt/Pycq0Tlmn5Z9cAzdkpKWJr+VOdGCUHoHDub3mH6sbn
	JGnq2SP2L+5tq055HTwdOSsT3egyxYMEZdXvoXduQ/WIdrZm5gIRikjFBIzLFt/zBRcn
	rLzkQD7p5tdN3u7SVgUXub5ygNbZoombdJry7X+lojqD2casI2QPp68UHjIzr7+Gf+j9
	z1hCNY9auYkjORvAMkO39Ym7g7hCv4KpvSKUU4KkfZVrFl/FTtmIZav2j1gRZjOgAHO6
	BC6uMS3Hp0cBhHNYw70PdCvuN8+SMvuQWl+/6BV6CPFEC3uzFseuPUfQ4T6CEO6Gz9f9
	iMCA==
X-Gm-Message-State: AJcUukfJPOBBNkgMS+Dusu01H1gvbFWE/QRgpUeKevHfKyWc6sZbn1tq
	MX+kc9p+gpSyVrcg0hFFs6jSfyrJ
X-Google-Smtp-Source: ALg8bN6lBDwsuPDQ5aoUMzu+z0R7zLv2YdSVm7Ua3jllblz9I3sj1D0bz1bhwhSajmsJ6Dx7+UH8vw==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr39003408wrr.51.1549026362248; 
	Fri, 01 Feb 2019 05:06:02 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:42 +0100
Message-Id: <20190201130554.90094-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/13] virglrenderer: add a recipe
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:02 -0000

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


