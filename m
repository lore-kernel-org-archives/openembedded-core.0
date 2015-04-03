Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D939973D0D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 14:13:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Apr 2015 07:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,517,1422950400"; d="scan'208";a="702887950"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2015 07:13:26 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Apr 2015 17:13:13 +0300
Message-Id: <477eb5e6f622233fb06912a5b4e0dd91b1672412.1428070227.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
Subject: [PATCH 4/5] upstream_tracking.inc: bluez4 removed from oe-core
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
X-List-Received-Date: Fri, 03 Apr 2015 14:13:34 -0000

info updated accordingly.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta-yocto/conf/distro/include/upstream_tracking.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index 15f6a18..2c6a074 100644
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


