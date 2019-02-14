Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E3F737BE4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 05:49:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2019 21:49:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; d="scan'208";a="144143794"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.114])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2019 21:49:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 13:48:56 +0800
Message-Id: <20190214054857.18876-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190214054857.18876-1-anuj.mittal@intel.com>
References: <20190214054857.18876-1-anuj.mittal@intel.com>
Subject: [PATCH 3/4] pixman: upgrade 0.34.0 -> 0.38.0
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
X-List-Received-Date: Thu, 14 Feb 2019 05:49:01 -0000

For changes, see:

https://cgit.freedesktop.org/pixman/log/?qt=range&q=pixman-0.38.0...pixman-0.34.0

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xorg-lib/pixman/asm_include.patch         | 29 -------------------
 .../{pixman_0.34.0.bb => pixman_0.38.0.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.34.0.bb => pixman_0.38.0.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch b/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
deleted file mode 100644
index b52a5707d6..0000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fixes errors like
-
-Assembler messages:
-Fatal error: can't create .libs/pixman-mips-dspr2-asm.o: No such file or directory
-
-it works with glibc because it uses gcc fixed-headers but thats not right.
-
-We move the include under C block
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: pixman-0.32.6/pixman/pixman-private.h
-===================================================================
---- pixman-0.32.6.orig/pixman/pixman-private.h
-+++ pixman-0.32.6/pixman/pixman-private.h
-@@ -1,4 +1,3 @@
--#include <float.h>
- 
- #ifndef PIXMAN_PRIVATE_H
- #define PIXMAN_PRIVATE_H
-@@ -17,6 +16,8 @@
- 
- #ifndef __ASSEMBLER__
- 
-+#include <float.h>
-+
- #ifndef PACKAGE
- #  error config.h must be included before pixman-private.h
- #endif
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
index c290fa4614..49c3d62342 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
@@ -31,11 +31,10 @@ EXTRA_OECONF_class-nativesdk = "--disable-gtk"
 
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-	    file://asm_include.patch \
 	    file://0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch \
 "
 
-SRC_URI[md5sum] = "002a4fcb644ddfcb4b0e4191576a0d59"
-SRC_URI[sha256sum] = "39ba3438f3d17c464b0cb8be006dacbca0ab5aee97ebde69fec7ecdbf85794a0"
+SRC_URI[md5sum] = "04ecad28edcc14e7eb5f7ed6df29c7a0"
+SRC_URI[sha256sum] = "b768e3f7895ddebdc0f07478729d9cec4fe0a9d2201f828c900d67b0e5b436a8"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.17.1


