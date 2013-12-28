Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE176B59C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:29:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457009916"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:29:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:28:58 +0000
Message-Id: <4a6d74fe7ecd59dc0cf5bc26a74f7d30f3ef161d.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/38] Drop empty/invalid BUGTRACKER values
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
X-List-Received-Date: Sat, 28 Dec 2013 22:29:47 -0000

Setting this value to blank or "n/a" in just a few recipes accomplishes
nothing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/jpeg/jpeg_8d.bb                     | 1 -
 meta/recipes-extended/bc/bc_1.06.bb                   | 1 -
 meta/recipes-extended/ed/ed_1.9.bb                    | 1 -
 meta/recipes-extended/mdadm/mdadm_3.3.bb              | 1 -
 meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb  | 1 -
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 1 -
 meta/recipes-kernel/latencytop/latencytop_0.5.bb      | 1 -
 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb            | 1 -
 meta/recipes-support/libfm/libfm_1.1.2.2.bb           | 1 -
 9 files changed, 9 deletions(-)

diff --git a/meta/recipes-core/jpeg/jpeg_8d.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
index ad4fa51..b1247df 100644
--- a/meta/recipes-core/jpeg/jpeg_8d.bb
+++ b/meta/recipes-core/jpeg/jpeg_8d.bb
@@ -1,7 +1,6 @@
 SUMMARY = "libjpeg is a library for handling the JPEG (JFIF) image format."
 DESCRIPTION = "libjpeg contains a library for handling the JPEG (JFIF) image format, as well as related programs for accessing the libjpeg functions."
 HOMEPAGE = "http://www.ijg.org/"
-BUGTRACKER = ""
 
 LICENSE ="BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://README;md5=4f46756b064c225fae088903300e5c98"
diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
index 7c33f75..3013c10 100644
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ b/meta/recipes-extended/bc/bc_1.06.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "An arbitrary precision calculator language."
 HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
-BUGTRACKER = ""
 
 LICENSE = "GPLv2+ & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.9.bb
index bd00c52..90c46e6 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "a line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
-BUGTRACKER = ""
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.bb b/meta/recipes-extended/mdadm/mdadm_3.3.bb
index 41816bc..5362396 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = " A tool for managing Soft RAID under Linux"
 HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
-BUGTRACKER = "n/a"
 
 # Some files are GPLv2+ while others are GPLv2.
 LICENSE = "GPLv2 & GPLv2+"
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
index 6ba46f0..73a9c52 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Library for caching application menus"
 DESCRIPTION = "A library creating and utilizing caches to speed up freedesktop.org application menus"
 HOMEPAGE = "http://lxde.sourceforge.net/"
-BUGTRACKER = ""
 
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 5e33f14..3688685 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Xorg minimal fonts data"
 DESCRIPTION = "Minimal fonts required by X.org."
 HOMEPAGE = "http://www.x.org"
-BUGTRACKER = "n/a"
 
 SECTION = "x11/fonts"
 
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index dad0588..4b1f16f 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "LatencyTOP, a Linux tool measuring and fixing latency"
 HOMEPAGE = "http://www.latencytop.org/"
-BUGTRACKER = "n/a"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
index 4bd4a6a..e66aa2a 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Fast lightweight tabbed filemanager"
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
-BUGTRACKER = ""
 
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-support/libfm/libfm_1.1.2.2.bb b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
index 8460223..97865e1 100644
--- a/meta/recipes-support/libfm/libfm_1.1.2.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Library for file management"
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
-BUGTRACKER = ""
 
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-- 
1.8.1.2


