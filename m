Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2841B6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 16:26:36 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 08:26:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,474,1508828400"; d="scan'208";a="182004261"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2017 08:26:37 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Nov 2017 08:26:13 -0800
Message-Id: <20171129162613.102550-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] image-buildinfo.bbclass: include IMAGE related variables
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
X-List-Received-Date: Wed, 29 Nov 2017 16:26:37 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These variables provide additional information (image related) targeted
for QA image verification. Now, target /etc/build looks like:

    root@qemux86:~# cat /etc/build
    -----------------------
    Build Configuration:  |
    -----------------------
    DISTRO = poky
    DISTRO_VERSION = 2.4+snapshot-20171129
    IMAGE_NAME = core-image-minimal-qemux86-20171129162018
    IMAGE_OVERHEAD_FACTOR = 1.3
    IMAGE_ROOTFS_EXTRA_SPACE = 0
    IMAGE_PKGTYPE = rpm
    -----------------------
    Layer Revisions:      |
    -----------------------
    meta              = master:72867393fe2004ab9f0ee23eb09a975c82938b9e -- modified
    meta-poky         = master:72867393fe2004ab9f0ee23eb09a975c82938b9e -- modified
    meta-yocto-bsp    = master:72867393fe2004ab9f0ee23eb09a975c82938b9e -- modified

[YOCTO #10503]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/image-buildinfo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 213fb9cf9b..308fcc630b 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -10,7 +10,7 @@
 #
 
 # Desired variables to display 
-IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION"
+IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION IMAGE_NAME IMAGE_OVERHEAD_FACTOR IMAGE_ROOTFS_EXTRA_SPACE IMAGE_PKGTYPE"
 
 # Desired location of the output file in the image.
 IMAGE_BUILDINFO_FILE ??= "${sysconfdir}/build"
-- 
2.12.3


