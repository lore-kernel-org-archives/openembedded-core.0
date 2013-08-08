Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E8CFE6B0D0
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 21:33:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2013 14:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,841,1367996400"; d="scan'208";a="359882639"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2013 14:33:28 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 21:34:28 +0000
Message-Id: <83539c1ee1aa0bf122c88b9c23275f4914330d99.1375996888.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <13a5bf7b035552bb397edea9c91dc528cfa9b70d.1375996888.git.nitin.a.kamble@intel.com>
References: <13a5bf7b035552bb397edea9c91dc528cfa9b70d.1375996888.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1375996888.git.nitin.a.kamble@intel.com>
References: <cover.1375996888.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] packagegroup-base.bb: add a new machine feature: v4l2
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
X-List-Received-Date: Thu, 08 Aug 2013 21:33:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This new machine feature gives a choice to add the video for linux 2
drivers and related utilities to BSPs.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 1c0c757..839c400 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -24,6 +24,7 @@ PACKAGES = ' \
             ${@base_contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
             ${@base_contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
             ${@base_contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "v4l2", "packagegroup-base-v4l2", "", d)} \
             \
             ${@base_contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
@@ -60,6 +61,7 @@ RDEPENDS_packagegroup-base = "\
     ${@base_contains('MACHINE_FEATURES', 'acpi', 'packagegroup-base-acpi', '',d)} \
     ${@base_contains('MACHINE_FEATURES', 'keyboard', 'packagegroup-base-keyboard', '',d)} \
     ${@base_contains('MACHINE_FEATURES', 'phone', 'packagegroup-base-phone', '',d)} \
+    ${@base_contains('MACHINE_FEATURES', 'v4l2', 'packagegroup-base-v4l2', '',d)} \
     \
     ${@base_contains('COMBINED_FEATURES', 'alsa', 'packagegroup-base-alsa', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'ext2', 'packagegroup-base-ext2', '',d)} \
@@ -355,6 +357,12 @@ SUMMARY_packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS_packagegroup-base-zeroconf = "\
     avahi-daemon"
 
+SUMMARY_packagegroup-base-v4l2 = "Video for Linux 2 support"
+RDEPENDS_packagegroup-base-v4l2 = "\
+    kernel-module-v4l2-int-device \
+    kernel-module-v4l2-common \
+    v4l-utils"
+
 SUMMARY_packagegroup-base-ipv6 = "IPv6 support"
 RDEPENDS_packagegroup-base-ipv6 = "\
     "
-- 
1.8.1.4


