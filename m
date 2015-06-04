Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 72625757AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:44:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jun 2015 03:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="720634396"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2015 03:44:06 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:44:21 +0300
Message-Id: <be49b886260c65a85e764c621eb3ba917e312bb2.1433414236.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
References: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1433414236.git.jussi.kukkonen@intel.com>
References: <cover.1433414236.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/6] xf86-video-vmware: Upgrade 13.0.2 -> 13.1.0
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
X-List-Received-Date: Thu, 04 Jun 2015 10:44:21 -0000

Remove one upstreamed patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...001-configure-fix-build-without-xatracker.patch | 37 ----------------------
 ...mware_13.0.2.bb => xf86-video-vmware_13.1.0.bb} |  7 ++--
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.0.2.bb => xf86-video-vmware_13.1.0.bb} (59%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch
deleted file mode 100644
index cf66403..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From bdaa9de44a197ba1297b990422ed9e515289f141 Mon Sep 17 00:00:00 2001
-From: Julien Cristau <jcristau@debian.org>
-Date: Tue, 1 Apr 2014 10:11:13 +0200
-Subject: [PATCH 1/2] configure: fix build without xatracker
-
-ACTION-IF-NOT-FOUND is the fourth argument to PKG_CHECK_MODULES, not the
-fifth.
-
-Debian bug#743239 <https://bugs.debian.org/743239>
-
-Reviewed-by: Thomas Klausner <wiz@NetBSD.org>
-Reviewed-by: Jakob Bornecrantz <jakob@vmware.com>
-Signed-off-by: Julien Cristau <jcristau@debian.org>
-Signed-off-by: Jakob Bornecrantz <jakob@vmware.com>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index dd3ad4e..be40ed7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -126,7 +126,7 @@ if test x$BUILD_VMWGFX = xyes; then
- 			  [PKG_CHECK_EXISTS([xatracker = 2.0.0],
- 	                  [AC_DEFINE([HAVE_XA_2], 1,
-                		  [Has version 2 of XA])])],
--			  [],[BUILD_VMWGFX=no])
-+			  [BUILD_VMWGFX=no])
- #
- # Check for prime.
- #
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
similarity index 59%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
index 24041b5..89b98ee 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
 DEPENDS += "virtual/libx11 xineramaproto videoproto libpciaccess"
 
-SRC_URI += "file://0001-configure-fix-build-without-xatracker.patch \
-            file://0002-add-option-for-vmwgfx.patch"
+SRC_URI += "file://0002-add-option-for-vmwgfx.patch"
 
-SRC_URI[md5sum] = "91d1d7d33181766714405ab013d31244"
-SRC_URI[sha256sum] = "c8ba3d2cead3620dba2cbf5defb7f1759b2b96f4fe209f4bf6976832b6763c54"
+SRC_URI[md5sum] = "0cba22fed4cb639d5c4276f7892c543d"
+SRC_URI[sha256sum] = "3c1d244e4b1b77e92126957965cdc9fb82de4c215c0706a3a8aaff6939e4a0cc"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-- 
2.1.4


