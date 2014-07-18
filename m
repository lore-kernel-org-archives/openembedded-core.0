Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A7B5B7066D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 12:41:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2014 05:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,684,1400050800"; d="scan'208";a="545346251"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2014 05:41:16 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 15:41:34 +0300
Message-Id: <a36a9c3d405abe05010fb260d909a5a135ea1ac2.1405687258.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1405687258.git.roxana.ciobanu@intel.com>
References: <cover.1405687258.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1405687258.git.roxana.ciobanu@intel.com>
References: <cover.1405687258.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] license.bbclass: fix indentation in python function
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
X-List-Received-Date: Fri, 18 Jul 2014 12:41:46 -0000

If we don't fix this, the fix for bug 6502 will trigger warnings
that the write_package_manifest function contains tabs.

Related to fix for [YOCTO #6502].

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta/classes/license.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 08f0665..2a6e869 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -17,12 +17,12 @@ do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
 python write_package_manifest() {
-	# Get list of installed packages
-	license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
-	bb.utils.mkdirhier(license_image_dir)
-	from oe.rootfs import image_list_installed_packages
-	open(os.path.join(license_image_dir, 'package.manifest'),
-         'w+').write(image_list_installed_packages(d))
+    # Get list of installed packages
+    license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
+    bb.utils.mkdirhier(license_image_dir)
+    from oe.rootfs import image_list_installed_packages
+    open(os.path.join(license_image_dir, 'package.manifest'),
+        'w+').write(image_list_installed_packages(d))
 }
 
 license_create_manifest() {
-- 
1.9.1


