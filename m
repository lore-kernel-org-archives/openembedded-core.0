Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5723E7D795
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:11:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0PR317Sz60
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234715;
	bh=PQMKFH4Iq2PQVKQfkjE6iaGHItp9O8iLARqQ2i/jrEA=;
	h=From:To:Subject:Date:From;
	b=gfWbnRhy4eLeQb8hErJeCxWRv7jJp+1lQ3zH7/Qb9d7ig0q6vUHxLis1kPTEIUkBG
	g9OMfDP5LqIlM8xmPgbJXV023BsugMsg8NxMNj3u/9XkdEmFUTl+TBMz3Cbl2grsGP
	0ktuY4Nr/TtDs7a4+HT4fAXYVw55D6/Z6DSTY/jIhXV9qANoJfshhFhTpheEmqllNE
	Z+7UkA0UKOk4YVcnaiIsNvvuV7y3hPB9h9YykEpO9Wk7gn7k9VvF6uODUt6n3LqyHG
	pWOqMNIRV6nKwYo0zbOqa6S52jM/MTDbc2tFZmIfosLLHgqc+ib2wpH9AIwaOeLC/m
	CFpu4/f4z7Nd+/Xr85gwBNAT5idaAvIkKaErASldd2EJJBWkH8kdqUGNdSsYW6CT5l
	a1BtAd0Woab6YaJLz5mJ3vtRnAkMsg3Zrzfu4ESnFGSIorOfvDk3WAGxDmJRtHFn3O
	Lc6+dBVWbtkXRDOfUWK3bg0vgQPnjYf53nNvE2gZIMNXTKORkolFrWB9KeiDyppIPL
	EGb1bbCS5bz0YmjNQFrs7hzYCDgeBo9s2N3sptlk01F51v2gOAl3wN5bMAF3bMd8xB
	FbyQb4o6NSxkOEooKspFAxTAKS2Asoi8ciytPJ/UHeD2j3HkeX/AzakP3jtqRXIODC
	s+O543NkJyvqKny9MZ75UE0M=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:11:48 +0300
Message-Id: <20190507131151.31070-9-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cogl: upgrade 1.22.2 -> 1.22.4
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
X-List-Received-Date: Tue, 07 May 2019 13:11:54 -0000

Remove backported patch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...n-incorrect-preprocessor-conditional.patch | 32 -------------------
 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb |  8 -----
 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb |  8 +++++
 3 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
deleted file mode 100644
index 2a9d8f829b..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport
-
-
-Original upstream commit follows:
-
-From b583e21d8698dbd58013320cfb47739102efdea7 Mon Sep 17 00:00:00 2001
-From: Kalev Lember <klember@redhat.com>
-Date: Wed, 19 Oct 2016 23:38:28 +0200
-Subject: [PATCH] Fix an incorrect preprocessor conditional
-
-This fixes the build with wayland wayland egl server support disabled.
----
- cogl/winsys/cogl-winsys-egl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cogl/winsys/cogl-winsys-egl.c b/cogl/winsys/cogl-winsys-egl.c
-index 39bfd884..4a9f3aa6 100644
---- a/cogl/winsys/cogl-winsys-egl.c
-+++ b/cogl/winsys/cogl-winsys-egl.c
-@@ -1029,7 +1029,7 @@ _cogl_egl_create_image (CoglContext *ctx,
-     egl_ctx = EGL_NO_CONTEXT;
-   else
- #endif
--#if COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
-+#ifdef COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
-   /* The WL_bind_wayland_display spec states that EGL_NO_CONTEXT is to be used
-    * in conjunction with the EGL_WAYLAND_BUFFER_WL target */
-   if (target == EGL_WAYLAND_BUFFER_WL)
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
deleted file mode 100644
index 5901062a4c..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
-            file://0001-Fix-an-incorrect-preprocessor-conditional.patch"
-SRC_URI[archive.md5sum] = "d53b708ca7c4af03d7254e46945d6b33"
-SRC_URI[archive.sha256sum] = "39a718cdb64ea45225a7e94f88dddec1869ab37a21b339ad058a9d898782c00d"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
new file mode 100644
index 0000000000..432025233b
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
@@ -0,0 +1,8 @@
+require cogl-1.0.inc
+
+SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
+"
+SRC_URI[archive.md5sum] = "31755015a865c4af51ac84f6e53af8ab"
+SRC_URI[archive.sha256sum] = "5217bf94cbca3df63268a3b79d017725382b9e592b891d1e7dc6212590ce0de0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-- 
2.17.1


