Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q88XW-000836-7m
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 12:03:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2011 03:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,322,1299484800"; d="scan'208";a="730752812"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2011 03:01:31 -0700
Message-Id: <fc76573f371abbc27406f552524635f935af308c.1302256139.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302256139.git.dexuan.cui@intel.com>
References: <cover.1302256139.git.dexuan.cui@intel.com>
Old-Date: Fri, 8 Apr 2011 17:44:07 +0800
Date: Fri, 08 Apr 2011 17:59:33 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 2/2] lsbsetup: Fix LIC_FILE_CHKSUM
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
X-List-Received-Date: Fri, 08 Apr 2011 10:03:58 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Fix [YOCTO #961]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-extended/lsb/lsbsetup_0.9.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup_0.9.bb b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
index 08e1d99..8cbaf1e 100644
--- a/meta/recipes-extended/lsb/lsbsetup_0.9.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
@@ -4,7 +4,7 @@ PRIORITY = "required"
 LICENSE = "GPLv2"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://LSB_Setup.sh;md5=9cc166e6ee4b327fb94d6da63af9556c"
+LIC_FILES_CHKSUM = "file://LSB_Setup.sh;md5=7391be3e70a02d44e1b183fa103b0585"
 
 SRC_URI = "file://LSB_Setup.sh"
 
-- 
1.7.2



