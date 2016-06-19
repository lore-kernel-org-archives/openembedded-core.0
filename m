Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BC7A460557
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 00:13:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jun 2016 17:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,490,1459839600"; d="scan'208";a="1005076612"
Received: from swold-mobl2.jf.intel.com ([10.252.135.173])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2016 17:13:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Sat, 18 Jun 2016 17:13:55 -0700
Message-Id: <1466295235-11827-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] rootfs_rpm: Increase rootfs size
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
X-List-Received-Date: Sun, 19 Jun 2016 00:14:00 -0000

This doubles the amount of extra space that is provided for SMART and
RPM, as they consume more disk space during qa testing via testimage

[YOCTO #9800]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 0d2e897..38b3c99 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -5,8 +5,8 @@
 ROOTFS_PKGMANAGE = "rpm smartpm"
 ROOTFS_PKGMANAGE_BOOTSTRAP = "run-postinsts"
 
-# Add 50Meg of extra space for Smart
-IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "smartpm", " + 51200", "" ,d)}"
+# Add 100Meg of extra space for Smart
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "smartpm", " + 102400", "" ,d)}"
 
 # Smart is python based, so be sure python-native is available to us.
 EXTRANATIVEPATH += "python-native"
-- 
2.5.0


