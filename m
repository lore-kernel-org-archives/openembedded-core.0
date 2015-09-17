Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 88C9277012
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 08:49:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2015 01:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,545,1437462000"; d="scan'208";a="646631096"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 17 Sep 2015 01:49:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 4E32D6A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 01:48:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 11:49:33 +0300
Message-Id: <7a4d8aa0d8b27f7fdc333e2748a4b1c5d5d5a6ce.1442479528.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1442479528.git.ed.bartosh@linux.intel.com>
References: <cover.1442479528.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1442479528.git.ed.bartosh@linux.intel.com>
References: <cover.1442479528.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/4] wic-image-minimal: add dependency to .wks
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
X-List-Received-Date: Thu, 17 Sep 2015 08:49:45 -0000

Added dependency to wic-image-minimal.wks to the recipe. This makes
bitbake to rebuild the image if .wks file changes.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 69236c4..89451bd 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -1,5 +1,7 @@
 SUMMARY = "An example of partitioned image."
 
+SRC_URI = "file://${FILE_DIRNAME}/${BPN}.wks"
+
 IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 
 IMAGE_FSTYPES = "wic.bz2"
-- 
2.1.4


