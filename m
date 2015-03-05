Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DA9CA60144
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:05:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 04 Mar 2015 17:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,344,1422950400"; d="scan'208";a="687070798"
Received: from aaceves-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.183.174])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2015 17:05:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2015 17:05:24 -0800
Message-Id: <1425517524-27548-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] image_types: Fix MIN_BTRFS_SIZE to be 1024 blocks to match ROOTFS_SIZE
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
X-List-Received-Date: Thu, 05 Mar 2015 01:05:35 -0000

[YOCTO #7392]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 4983e98..98a08bf 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -58,7 +58,7 @@ IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
 
-MIN_BTRFS_SIZE ?= "16777216"
+MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD_btrfs () {
 	if [ ${ROOTFS_SIZE} -gt ${MIN_BTRFS_SIZE} ]; then
 		dd if=/dev/zero of=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs count=${ROOTFS_SIZE} bs=1024
-- 
2.1.0


