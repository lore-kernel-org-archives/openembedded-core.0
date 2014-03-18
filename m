Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 661F46F8F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 11:38:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Mar 2014 04:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,677,1389772800"; d="scan'208";a="494272090"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2014 04:38:55 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 13:38:48 +0200
Message-Id: <0068eed9904a5ee7fc4196a01518c8a08a50eed4.1395142153.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/4] image.bbclass, license.bbclass: adjust the name of list_installed_packages()
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
X-List-Received-Date: Tue, 18 Mar 2014 11:38:56 -0000

The old wrapper got renamed to image_list_installed_packages().

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass   |    4 ++--
 meta/classes/license.bbclass |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 51d16d7..9a04288 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -330,9 +330,9 @@ make_zimage_symlink_relative () {
 }
 
 python write_image_manifest () {
-    from oe.rootfs import list_installed_packages
+    from oe.rootfs import image_list_installed_packages
     with open(d.getVar('IMAGE_MANIFEST', True), 'w+') as image_manifest:
-        image_manifest.write(list_installed_packages(d, 'ver'))
+        image_manifest.write(image_list_installed_packages(d, 'ver'))
 }
 
 # Make login manager(s) enable automatic login.
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index a0b877d..08f0665 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -20,9 +20,9 @@ python write_package_manifest() {
 	# Get list of installed packages
 	license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
 	bb.utils.mkdirhier(license_image_dir)
-	from oe.rootfs import list_installed_packages
+	from oe.rootfs import image_list_installed_packages
 	open(os.path.join(license_image_dir, 'package.manifest'),
-         'w+').write(list_installed_packages(d))
+         'w+').write(image_list_installed_packages(d))
 }
 
 license_create_manifest() {
-- 
1.7.9.5


