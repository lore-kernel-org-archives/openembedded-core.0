Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 348AA73D5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:31:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 20 Apr 2015 08:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="712247969"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2015 08:31:49 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 18:31:44 +0300
Message-Id: <646d71496d66b441f4c085b0753818dd293a1978.1429543826.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429543826.git.cristian.iorga@intel.com>
References: <cover.1429543826.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429543826.git.cristian.iorga@intel.com>
References: <cover.1429543826.git.cristian.iorga@intel.com>
Subject: [PATCH v4 2/4] upstream_tracking.inc: bluez4 removed from oe-core
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
X-List-Received-Date: Mon, 20 Apr 2015 15:31:49 -0000

info updated accordingly.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta-yocto/conf/distro/include/upstream_tracking.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index b36ad36..1fd04a2 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -50,7 +50,6 @@ RECIPE_UPSTREAM_DATE_pn-pseudo = "Jan 23, 2015"
 CHECK_DATE_pseudo = "Feb 12, 2015"
 
 # NO UPDATE REASONS
-RECIPE_NO_UPDATE_REASON_pn-bluez4 = "BlueZ 5.x is not backward-compatible; components that interact with bluez not updated"
 RECIPE_NO_UPDATE_REASON_pn-build-appliance = "Always reports behind"
 RECIPE_NO_UPDATE_REASON_pn-cdrtools = "v3.x uses incompatible CDDL license"
 RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
-- 
2.1.0


