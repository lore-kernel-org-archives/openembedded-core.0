Return-Path: <eflanagan@qana.jf.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 25D8D6041E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 21:54:50 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2013 14:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,696,1367996400"; d="scan'208";a="270293699"
Received: from qana.jf.intel.com ([10.7.201.146])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jul 2013 14:54:35 -0700
Received: by qana.jf.intel.com (Postfix, from userid 1000)
	id 44D315F82581; Thu, 18 Jul 2013 14:53:09 -0700 (PDT)
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 14:53:06 -0700
Message-Id: <1374184386-15999-1-git-send-email-elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] adt_installer_internal: fix spelling error
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
X-List-Received-Date: Thu, 18 Jul 2013 21:54:50 -0000

From: Beth Flanagan <elizabeth.flanagan@intel.com>

s/envrionement/environment/

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 .../installer/adt-installer/scripts/adt_installer_internal              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 175d285..9c25ba8 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -134,7 +134,7 @@ for native_target_type in $YOCTOADT_TARGETS; do
   $OPKG_INSTALL_NATIVE_CMD gdb-cross-canadian-$native_target_type &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
 
-  echo_info "Installing envrionement file for $native_target_type ..."
+  echo_info "Installing environment file for $native_target_type ..."
   $OPKG_INSTALL_NATIVE_CMD meta-environment-$native_target_type &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
 
-- 
1.8.1.2


