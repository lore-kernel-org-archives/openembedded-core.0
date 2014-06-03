Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6D66F509
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:29:56 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kx10so2615104pab.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 20:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rD7IZizxZOctmaqjYKWpwi4DP6EFrS3zil3A2m8RVHg=;
	b=y2owHnkK7jh2jmlMdI4Or7vX7nAIZ6jTQpaQlc067P0DVcYhyDnt+0Q4safrNIzWDe
	JHb+ItBXreXh1/z/wwKPPuKyZrCLtGzN0w6wFBjCeE9NNbFvcoRF/+8xzOMmHFjVveVx
	/nR7zVogzNp0K/cXCEdfBdkD5sWxf0wMii4NFmLAsQWmVEDDkCH4MhfaLLTn0D0LfYWE
	LSZljuR23o3c+VRVvOGlgl4L1xOAvIZ/DZCcRjk92huBqDKgJutNb/AP8H5VPA0aNMSG
	qeOIL+N4hZq/YK+a9tDMJBg8ymFsk0tlBvdRZdWmtrSsuy6LklUOhvAx6SJCIRzduhQH
	XhMw==
X-Received: by 10.68.248.2 with SMTP id yi2mr40510332pbc.158.1401766197745;
	Mon, 02 Jun 2014 20:29:57 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	py7sm22947478pbb.78.2014.06.02.20.29.56 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 20:29:57 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:33:13 -0700
Message-Id: <1401766394-8680-2-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1401766394-8680-1-git-send-email-ticotimo@gmail.com>
References: <1401766394-8680-1-git-send-email-ticotimo@gmail.com>
Subject: [PATCH 1/2] cogl: update to 1.18.0
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
X-List-Received-Date: Tue, 03 Jun 2014 03:29:59 -0000

From: Tim Orling <TicoTimo@gmail.com>

Announcement:
http://lists.freedesktop.org/archives/cogl/2014-March/001636.html

* License changed from LGPL to MIT
* kms-include-stddef.h-before-drm.h.patch fixed upstream

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc            |  2 +-
 .../kms-include-stddef.h-before-drm.h.patch        | 33 ----------------------
 meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb      |  8 ------
 meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb      |  6 ++++
 4 files changed, 7 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/kms-include-stddef.h-before-drm.h.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index a4a8550..e25968e 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
-LICENSE = "LGPLv2.1+"
+LICENSE = "MIT"
 
 inherit clutter
 
diff --git a/meta/recipes-graphics/cogl/cogl-1.0/kms-include-stddef.h-before-drm.h.patch b/meta/recipes-graphics/cogl/cogl-1.0/kms-include-stddef.h-before-drm.h.patch
deleted file mode 100644
index 7cce279..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0/kms-include-stddef.h-before-drm.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Submitted [cogl@lists.freedesktop.org]
-
-From 5e4f4689308732a0570a1631169247157c59f064 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@saftware.de>
-Date: Tue, 28 Jan 2014 18:36:04 +0100
-Subject: [PATCH] kms: include stddef.h before drm.h
-
-Not doing so leads to the following error, if stddef.h is not included
-indirectly through EGL headers:
-
-| libdrm/drm.h:132:2: error: unknown type name 'size_t'
-|   size_t name_len;   /**< Length of name buffer */
-
-Signed-off-by: Andreas Oberritter <obi@saftware.de>
----
- cogl/winsys/cogl-winsys-egl-kms.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cogl/winsys/cogl-winsys-egl-kms.c b/cogl/winsys/cogl-winsys-egl-kms.c
-index f7c9cfb..144ad9b 100644
---- a/cogl/winsys/cogl-winsys-egl-kms.c
-+++ b/cogl/winsys/cogl-winsys-egl-kms.c
-@@ -40,6 +40,7 @@
- 
- #include <EGL/egl.h>
- #include <EGL/eglext.h>
-+#include <stddef.h>
- #include <drm.h>
- #include <xf86drm.h>
- #include <xf86drmMode.h>
--- 
-1.8.3.2
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb
deleted file mode 100644
index 521158e..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require cogl-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI += "file://kms-include-stddef.h-before-drm.h.patch"
-
-SRC_URI[archive.md5sum] = "aaf32bde135cf3815aa3221726bad71e"
-SRC_URI[archive.sha256sum] = "65be91591546ef6fdfec93a71979b2b108eee25edbc20c53190caafc9a92d4e7"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb
new file mode 100644
index 0000000..375b079
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb
@@ -0,0 +1,6 @@
+require cogl-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
+
+SRC_URI[archive.md5sum] = "994a29f5c02768367b6f035bfe456ba6"
+SRC_URI[archive.sha256sum] = "a4d91ebf7e7aba362eb5c6e4ffebbf1167ff4ac87fabae104912d879a5390f5e"
-- 
1.8.3.2


