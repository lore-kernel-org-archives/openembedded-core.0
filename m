Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5387EC6FA89
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:03:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.22834.1662368623514940494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yhglZ4YX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368622; i=@fujitsu.com;
	bh=zXwJgeDrIbTyeMo3YsS8Y5k+mllGFF8KEZIBxVv3ICA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yhglZ4YXo+p/dk35g0/lY+77IeXykQ/5sYG48gv9hrrmD7ewtm3MtwjwKt2Afgo3G
	 sSPnCPMQ8LXnvKX7I9yW/LdqdGKwfniSx7mTfIcTlOX3Zv58MmJgN/FNMLt5jEfqVw
	 CIPDFP9zg70JrqS3aZSlRbq6FPYLjfKlAf+zC2ALBxKPJcC8uepIJo8QFaRLVLxTe/
	 hqfbtzVb6eJqh/VSHV8aTWKNkVBFWvosa+uONhE5STTl6dp2ZnAHx2U1TXVfcgC5Xl
	 FRKvBkPOSHx18FNOPpkKQBKDRPleKHQiaSU5dwsK+63L1UF/z0dUdbJPnDVWepQKmq
	 D8VLrHj+EKZZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRWlGSWpSXmKPExsViZ8OxWTd3t2i
  ywd7lmhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bLzsmsBROUKnp+v2VpYLwk18XIxSEk8IBR
  4sD2HvYuRk4g5zKTxOGvMRCJ3YwSZ9f/YQJJsAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  xC9wgJ2Eqe7z7GC2CxA8U07TrKA2LwCThL3300GsyUEFCSmPHzPDDKGU8BZ4uRJP4i1ThJL97
  5mgigXlDg58wkLxHgJiYMvXjBDtCpKzL7cDDWmQqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbrpKLM9IyS3MTMHF1DAwNdQ0NTXWNLXSNDY73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK
  3OScFL281JJNjMAQTilWv7qDcfOqn3qHGCU5mJREed/PEU0W4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMG7cgdQTrAoNT21Ii0zBxhPMGkJDh4lEV7/dUBp3uKCxNzizHSI1ClGb46rV67sZeaYOv
  vffmaO5WBy5te2A8wc7du7gOSmfUBSiCUvPy9VSpx3E8gGAZARGaV5cAtgaeESo6yUMC8jAwO
  DEE9BalFuZgmq/CtGcQ5GJWFeLpApPJl5JXB3vAI6kQnoRLs+YZATSxIRUlINTCtWLX+XtPt5
  /rKPzKJhH7wMPa1vd/mH/c9uCn7CElf0wnh/stI1nq3anR1Nd0o+Xf3eaNqY/f705qcM8c++T
  zI33LXL+p34rLiASY/LFwj78U9kO9z29PzGf41i1i90PmzS/ZnjyfLu0+2eY4+PZ/ncWc5zQ/
  2PyW+dpfzfjh6LcF+7U8vEuVa7omcD60K+TRZffSxdS91Nc5QLHY+bH09dsMDsq/9a3Tui/81
  1vvxSfqlWLbhgT3trZfibX66zZibrMS74M+OizvylxllPZm0vX7zx+5b8HZ/lZerW96xWdKuc
  8E92/oet0lZf0xUX77nANukzE/fiHWv2eu28vy4/beqZg0/i635KfHZq4XijxFKckWioxVxUn
  AgAeW+xjYYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1662368621!361923!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29309 invoked from network); 5 Sep 2022 09:03:41 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:03:41 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 604CB151
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 53AF0150
	for <openembedded-core@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:03:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:03:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kmscube: upgrade to latest revision
Date: Mon, 5 Sep 2022 17:03:18 +0800
Message-ID: <1662368601-32265-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
References: <1662368601-32265-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 09:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170301

0001-drm-common.c-do-not-use-invalid-modifier.patch
0001-texturator-Use-correct-GL-extension-header.patch
removed since they're included in new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...common.c-do-not-use-invalid-modifier.patch | 27 ---------------
 ...ator-Use-correct-GL-extension-header.patch | 33 -------------------
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  7 ++--
 3 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
 delete mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-correct-GL-extension-header.patch

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch b/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
deleted file mode 100644
index 58ff3ba561..0000000000
--- a/meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bdde833c254092a47df6c7109a9751653c82aaae Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 8 Aug 2022 20:22:39 +0200
-Subject: [PATCH] drm-common.c: do not use invalid modifier
-
-Prior to kernel 5.19 this was a soft failure, but 5.19
-adds checks that result in a hard syscall fail.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/merge_requests/33]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- drm-common.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drm-common.c b/drm-common.c
-index 5c9cca2..964e1c3 100644
---- a/drm-common.c
-+++ b/drm-common.c
-@@ -92,7 +92,7 @@ struct drm_fb * drm_fb_get_from_bo(struct gbm_bo *bo)
- 			modifiers[i] = modifiers[0];
- 		}
- 
--		if (modifiers[0]) {
-+		if (modifiers[0] && modifiers[0] != DRM_FORMAT_MOD_INVALID) {
- 			flags = DRM_MODE_FB_MODIFIERS;
- 			printf("Using modifier %" PRIx64 "\n", modifiers[0]);
- 		}
diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-correct-GL-extension-header.patch b/meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-correct-GL-extension-header.patch
deleted file mode 100644
index 5965782de7..0000000000
--- a/meta/recipes-graphics/kmscube/kmscube/0001-texturator-Use-correct-GL-extension-header.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2b74e0e32235f6ab2e3e42d53dea985a7ba6227f Mon Sep 17 00:00:00 2001
-From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
-Date: Wed, 16 Dec 2020 11:08:25 +0900
-Subject: [PATCH] texturator: Use correct GL extension header
-
-gl2ext.h is the extenstion header for OpenGL ES 2.0 and all later
-versions according to the Khronos documentation [1].  gl3ext.h is either
-an empty stub, or may not even exist on some platforms.
-
-[1]: https://www.khronos.org/registry/OpenGL/index_es.php#headers
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/merge_requests/26]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- texturator.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/texturator.c b/texturator.c
-index d9335d7..6d97856 100644
---- a/texturator.c
-+++ b/texturator.c
-@@ -30,7 +30,7 @@
- #include <math.h>
- 
- #include <GLES3/gl3.h>
--#include <GLES3/gl3ext.h>
-+#include <GLES2/gl2ext.h>
- 
- #ifdef HAVE_LIBPNG
- #include <png.h>
--- 
-2.33.1
-
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index f7ee6e4e10..6ed97dfafe 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,11 +10,8 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
-SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
-           file://0001-texturator-Use-correct-GL-extension-header.patch \
-           file://0001-drm-common.c-do-not-use-invalid-modifier.patch \
-           "
+SRCREV = "3bf6ee1a02334386d87cfe356c3bfb0b24e1fed8"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


