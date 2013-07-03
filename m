Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B0B3E61485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:55:35 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jul 2013 07:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="263647296"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2013 07:55:30 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 18:02:49 +0300
Message-Id: <1372863769-17706-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v3] mkelfimage: switch to git repository
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
X-List-Received-Date: Wed, 03 Jul 2013 14:55:35 -0000

The project has switched to using git for version control.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../{mkelfimage_svn.bb => mkelfimage_git.bb}       |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/mkelfimage/{mkelfimage_svn.bb => mkelfimage_git.bb} (56%)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
similarity index 56%
rename from meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
rename to meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index b53f7a7..8d232bb 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -1,21 +1,21 @@
-DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
+DESCRIPTION = "A utility to create ELF boot images for ELF-based Linux kernel images"
 HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
 
-SRCREV = "6637"
-PV = "1.0.0+svn${SRCPV}"
-PR = "r2"
+SRCREV = "686a48a339b3200184c27e7f98d4c03180b2be6c"
+PV = "4.0+git${SRCPV}"
+PR = "r0"
 
 DEPENDS += "zlib"
 
-SRC_URI = "svn://coreboot.org/coreboot/trunk/util;module=mkelfImage;protocol=svn \
-           file://cross-compile.patch \
-           file://fix-makefile-to-find-libz.patch \
+SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http \
+           file://cross-compile.patch   \
+           file://fix-makefile-to-find-libz.patch   \
           "
 
-S = "${WORKDIR}/mkelfImage"
+S = "${WORKDIR}/git/util/mkelfImage"
 
 CFLAGS += "-fno-stack-protector"
 CACHED_CONFIGUREVARS += "HOST_CC='${BUILD_CC}'"
-- 
1.7.9.5


