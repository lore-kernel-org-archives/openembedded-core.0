Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8356A6BD5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:27:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2013 06:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,990,1367996400"; d="scan'208";a="371050095"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2013 06:27:27 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 16:29:20 +0300
Message-Id: <7aadd718720d4b917692a40e01ca1bf551df1930.1377869309.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377869309.git.cristian.iorga@intel.com>
References: <cover.1377869309.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377869309.git.cristian.iorga@intel.com>
References: <cover.1377869309.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: upgrade to commit 5745e45b18e5099e94b4d5a73bc97dc6d4cdc91f
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
X-List-Received-Date: Fri, 30 Aug 2013 13:27:46 -0000

Improvements to poky gets in this way
reflected in Build Appliance.

Notable improvements/fixes to bitbake.
New hardware targets.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
index 27cdd6f..bb2ded6 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "ac60aa8cf707eec58e2cb51e7c406250d0b43ef1"
+SRCREV ?= "5745e45b18e5099e94b4d5a73bc97dc6d4cdc91f"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.8.1.2


