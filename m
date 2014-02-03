Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 161F06E87D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 11:10:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2014 03:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,771,1384329600"; d="scan'208";a="448840231"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2014 03:10:42 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 13:13:30 +0200
Message-Id: <20aef1c75f6816af7f2d1e946fe7dabb47bc2ed8.1391425810.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1391425810.git.cristian.iorga@intel.com>
References: <cover.1391425810.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1391425810.git.cristian.iorga@intel.com>
References: <cover.1391425810.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: Update to poky commit b37dd451a52622d5b570183a81583cc34c2ff555
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
X-List-Received-Date: Mon, 03 Feb 2014 11:10:50 -0000

This update will add improvements to HOB,
fix issues encountered during build.

Fixes [YOCTO #5759].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
index 650c1a2..8906c1c 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "ee9a3c191c64636971c94d8a9870c41d7bac02bf"
+SRCREV ?= "b37dd451a52622d5b570183a81583cc34c2ff555"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.8.3.2


