Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 10F8576FED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:10:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Sep 2015 14:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="812638128"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.56])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2015 14:10:35 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 16:10:25 -0500
Message-Id: <359868d8a265ef513a6953bdc845f380e69a2185.1443128706.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
References: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
References: <cover.1443128706.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH 2/3] initramfs-framework:add virtual reference
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
X-List-Received-Date: Thu, 24 Sep 2015 21:10:42 -0000

This recipe have a hardcoded dependency to busybox, in order to be able to have a flexible selection,
instead of the hardcoded dependency,now is point to virtual reference base-utils.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6c37b9a..0704cb1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS_${PN} += "busybox"
+RDEPENDS_${PN} += "virtual/anybox"
 
 PR = "r2"
 
-- 
2.1.0


