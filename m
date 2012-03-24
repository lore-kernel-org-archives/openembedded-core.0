Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SBGw0-0003bU-T1
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 03:42:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2012 19:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144454943"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 19:33:30 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 10:31:14 +0800
Message-Id: <10968f8c0cf425011983ef7e0fe4c14b7da5ef74.1332555951.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1332555951.git.dongxiao.xu@intel.com>
References: <cover.1332555951.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1332555951.git.dongxiao.xu@intel.com>
References: <cover.1332555951.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] image_types.bbclass: Define runnable and deployable pattern
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
X-List-Received-Date: Sat, 24 Mar 2012 02:42:29 -0000

Define runnable image type and machine pattern.
Define deployable image type.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/image_types.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index e92f519..3aa3f17 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -220,3 +220,7 @@ COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
 COMPRESS_DEPENDS_xz = "xz-native"
 
+RUNNABLE_IMAGE_TYPES ?= "ext2 ext3"
+RUNNABLE_MACHINE_PATTERNS ?= "qemu"
+
+DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
-- 
1.7.4.1



