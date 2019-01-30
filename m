Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C79677C2F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t200so21262053wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Y8GfAxBSHfmBDrKxC1IbDHtuAGGj9uoHuBd4rYfe+WA=;
	b=IxqjLBToujIvIatdoRTXFBq8Eng/j2Usuf4yGDDDYCz4zMJoqJFcjExaItKEHdLUfR
	ul01ZV3yE+6AIotjdb7wfiZH2yrmrPpihklSpeYekdO0k0WWXcfDJZo4eXy0MzL5WyXs
	tBGBft8fnZTE61z7At+PU3fThmeP41jn8ACTEYucbRiwo4pJljWFliyLN7BF2GgpjNMA
	od7CYPRNB7KLccOLkok8xryWmD/ErtgEFDTfLkqZO/5wn6LFUbTB/D8wk3SNOn5X64MJ
	aduQ1gPf8UxGbat2HNeNQJeA7AA1QWuntPzPh6yrVMwDB9qcBD/R7o7JzC0U+i8w7x2L
	FOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y8GfAxBSHfmBDrKxC1IbDHtuAGGj9uoHuBd4rYfe+WA=;
	b=M/dHpIW0d4244q2o3UNlXTHLIm5mtfeW1ScF5kIMEozzi1Q7tOthvF35iSKHGcGkeY
	UPZeHf1/R88WpkTE1Kl2GfdWHbHLfpCH/HvXCWdnmQiDyiHK9iNQqpRvuMXxXKKLl/Vy
	0MpEwqAtbWUCld+3e4kfD4KHV+fqsy3Oh4BxWw3xSyPC3Bl2fqLtVZ815yGHhs7bZU/4
	x4ogLj8o9J95saMHpWR7PkFBm7RcxjLXcu1b/SIAaUhpmHZ7S6idvKpqUZYWZibZq+Y4
	7HCn3SHtEcSOokoX21IWu7KsSKsNukTcpTX4VHtY1+Q6aGCyv95tM18GBZgBS/74XZ83
	9yOg==
X-Gm-Message-State: AJcUukcTf+i7G1EMiPGfoRJjm9HDIV14Bp74Ww1U19k4k3YJVnmGof25
	jpOVuAOwtfNcZBzvpo3qEV59vNba
X-Google-Smtp-Source: ALg8bN5tfe9S+TnyX/9aUIcNJIzxjVObdtW/nHwWErxzdLqzOI7qJKHE3ckqw6yNAJyqu5cpmMMf0Q==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr24215700wmk.37.1548845995193; 
	Wed, 30 Jan 2019 02:59:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:28 +0100
Message-Id: <a0d8e38df84d68e76fca2b12d71f3add0dd3437b.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 05/20] virglrenderer: add a recipe
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:55 -0000

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


