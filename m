Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D52BA71988
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:50:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2017 07:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="1089707651"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2017 07:50:16 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 416096A4006;
	Wed,  1 Feb 2017 07:49:17 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 17:27:49 +0200
Message-Id: <1485962869-11868-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image: rename image-wic -> image_types_wic
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
X-List-Received-Date: Wed, 01 Feb 2017 15:50:17 -0000

Make name of the wic image type class consistent with
existing naming scheme for image types.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass                                  | 5 +++--
 meta/classes/{image-wic.bbclass => image_types_wic.bbclass} | 0
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/classes/{image-wic.bbclass => image_types_wic.bbclass} (100%)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 613cd92..b5a4fb4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -151,6 +151,9 @@ def build_uboot(d):
 IMAGE_TYPE_uboot = "${@build_uboot(d)}"
 inherit ${IMAGE_TYPE_uboot}
 
+IMAGE_TYPE_wic = "image_types_wic"
+inherit ${IMAGE_TYPE_wic}
+
 python () {
     deps = " " + imagetypes_getdepends(d)
     d.appendVarFlag('do_rootfs', 'depends', deps)
@@ -187,8 +190,6 @@ python () {
 IMAGE_CLASSES += "image_types"
 inherit ${IMAGE_CLASSES}
 
-inherit image-wic
-
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
 # some default locales
diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image_types_wic.bbclass
similarity index 100%
rename from meta/classes/image-wic.bbclass
rename to meta/classes/image_types_wic.bbclass
-- 
2.1.4


