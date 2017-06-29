Return-Path: <wei.tee.ng@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3B43B78227
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:47:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 29 Jun 2017 19:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,284,1496127600"; d="scan'208";a="1146328201"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2017 19:47:01 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 12:22:34 -0700
Message-Id: <340dcd3ae5be23d6f1395d4f8bb6fd25f7a95c6e.1498763563.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1498763563.git.wei.tee.ng@intel.com>
References: <cover.1498763563.git.wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [PATCH 1/3] initramfs-framework: udev: Add a runtime dependency on udev-extraconf
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
X-List-Received-Date: Fri, 30 Jun 2017 02:47:01 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

In order to implement initramfs-framework for boot up process, it
depends on udev performing automounting, which happens in udev-extraconf.
Explicitly depend on it so that we always have it installed.

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 67a1b04..6bbe4c1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -65,7 +65,7 @@ RDEPENDS_initramfs-module-mdev = "${PN}-base busybox-mdev"
 FILES_initramfs-module-mdev = "/init.d/01-mdev"
 
 SUMMARY_initramfs-module-udev = "initramfs support for udev"
-RDEPENDS_initramfs-module-udev = "${PN}-base udev"
+RDEPENDS_initramfs-module-udev = "${PN}-base udev udev-extraconf"
 FILES_initramfs-module-udev = "/init.d/01-udev"
 
 SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
-- 
2.7.4


