Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 170E860132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 14:26:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2015 07:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,505,1437462000"; d="scan'208";a="559075504"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2015 07:26:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 083866A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:25:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 17:26:32 +0300
Message-Id: <5664fc8341f2c31f9bf7ac14126a6001e584829f.1441889095.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441889095.git.ed.bartosh@linux.intel.com>
References: <cover.1441889095.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441889095.git.ed.bartosh@linux.intel.com>
References: <cover.1441889095.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 1/3] wic: add dependencies to wic-image-minimal recipe
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
X-List-Received-Date: Thu, 10 Sep 2015 14:26:40 -0000

Added "DEPENDS =" line to the recipe to ensure that all tools required
for image creation are built.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 073c569..69236c4 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -5,6 +5,8 @@ IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 IMAGE_FSTYPES = "wic.bz2"
 RM_OLD_IMAGE = "1"
 
+DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-native"
+
 # core-image-minimal is referenced in .wks, so we need its rootfs
 # to be ready before our rootfs
 do_rootfs[depends] += "core-image-minimal:do_rootfs"
-- 
2.1.4


