Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q912r-0007eL-WD
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:15:42 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2011 13:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,334,1299484800"; d="scan'208";a="677361464"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2011 13:13:28 -0700
Message-Id: <058f615dc4ba4cb5d7f7a9e85564ca710e74b080.1302466269.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302466269.git.sgw@linux.intel.com>
References: <cover.1302466269.git.sgw@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 20:45:40 -0600
Date: Sun, 10 Apr 2011 13:13:28 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 2/6] Allow JFFS2 image options to be overridden
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
X-List-Received-Date: Sun, 10 Apr 2011 20:15:42 -0000

From: Gary Thomas <gary@mlbassoc.com>

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f11a7ed..f23c1f5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -63,7 +63,7 @@ IMAGE_CMD_ubi () {
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
+EXTRA_IMAGECMD_jffs2 ?= "--pad --little-endian --eraseblock=0x40000"
 EXTRA_IMAGECMD_yaffs2 = "1"
 # Change these if you want default genext2fs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
-- 
1.7.1.1



