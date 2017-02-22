Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 478B1730D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 13:02:42 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 22 Feb 2017 05:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="61103159"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 22 Feb 2017 05:02:44 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 2C3C96A4080;
	Wed, 22 Feb 2017 05:02:42 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 15:02:34 +0200
Message-Id: <f6a8a61195fb454781e93c2dcf615e48a2fc8682.1487764904.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487764904.git.jussi.kukkonen@intel.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/6] libdrm: Upgrade 2.4.74 -> 2.4.75
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
X-List-Received-Date: Wed, 22 Feb 2017 13:02:43 -0000

* Remove udev from depends (it's not actually used).
* Rebase a patch

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/drm/libdrm/installtests.patch | 28 +++++++++++++++-------
 .../drm/{libdrm_2.4.74.bb => libdrm_2.4.75.bb}     |  6 ++---
 2 files changed, 22 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.74.bb => libdrm_2.4.75.bb} (91%)

diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
index 30e0a61..ec1fb02 100644
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
@@ -1,15 +1,25 @@
-tests: also install tests app
+From 5c6eb43c2f6e7f2ee7c25c92e42f4e4403fa0527 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 21 Feb 2017 14:37:52 +0200
+Subject: [PATCH] tests: also install test apps
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
 
-Index: libdrm-2.4.66/tests/Makefile.am
-===================================================================
---- libdrm-2.4.66.orig/tests/Makefile.am
-+++ libdrm-2.4.66/tests/Makefile.am
-@@ -73,3 +73,4 @@ TESTS +=					\
- endif
- 
- check_PROGRAMS += $(TESTS)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0355a92..b4882cd 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -45,3 +45,4 @@ TESTS = \
+ check_PROGRAMS = \
+ 	$(TESTS) \
+ 	drmdevice
 +bin_PROGRAMS = $(check_PROGRAMS)
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.74.bb b/meta/recipes-graphics/drm/libdrm_2.4.75.bb
similarity index 91%
rename from meta/recipes-graphics/drm/libdrm_2.4.74.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.75.bb
index 06d7642..56963d4 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.74.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.75.bb
@@ -8,7 +8,7 @@ SECTION = "x11/base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 PROVIDES = "drm"
-DEPENDS = "libpthread-stubs udev libpciaccess"
+DEPENDS = "libpthread-stubs libpciaccess"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch \
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "31964aa15bdea1a40c5941d4ce0962ee"
-SRC_URI[sha256sum] = "d80dd5a76c401f4c8756dcccd999c63d7e0a3bad258d96a829055cfd86ef840b"
+SRC_URI[md5sum] = "57b0589122ec4b8d5dfb9e430a21f0b3"
+SRC_URI[sha256sum] = "2d5a500eef412cc287d12268eed79d571e262d4957a2ec9258073f305985054f"
 
 inherit autotools pkgconfig manpages
 
-- 
2.1.4


