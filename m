Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwX0E-0003F2-PR
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 13:22:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2012 04:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="200887486"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2012 04:10:30 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 14:12:14 +0300
Message-Id: <1343819534-16304-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] kmod: Upgrade to upstream version 9.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 11:22:11 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc    |    6 +++---
 meta/recipes-kernel/kmod/kmod_git.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index adba4d4..e4b4a98 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "http://packages.profusion.mobi/kmod/"
 LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
-PV = "8"
-INC_PR = "r1"
+PV = "9"
+INC_PR = "r0"
 
 DEPENDS += "pkgconfig-native"
 
@@ -22,7 +22,7 @@ SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
            file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
           "
 
-SRCREV = "819f79a24d58e3c8429f1631df2f8f85a2f95d4a"
+SRCREV = "62081c0f68905b22f375156d4532fd37fa5c8d33"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index ad6283e..ca6b004 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,7 +3,7 @@
 
 require kmod.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
 
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
-- 
1.7.9.5



