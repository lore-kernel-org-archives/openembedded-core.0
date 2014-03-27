Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E25A26F902
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:12:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 27 Mar 2014 06:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,742,1389772800"; d="scan'208";a="500922071"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2014 06:12:00 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 15:15:17 +0200
Message-Id: <f50ee03ed832fe61b9e5a5ee58a605f450be347a.1395926032.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1395926032.git.cristian.iorga@intel.com>
References: <cover.1395926032.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1395926032.git.cristian.iorga@intel.com>
References: <cover.1395926032.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: update to head ae938eba92b2c89a9fd91161e57c5dbc594ad4ad
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
X-List-Received-Date: Thu, 27 Mar 2014 13:12:19 -0000

Build Appliance includes a more recent version
of poky, up to commit:
ae938eba92b2c89a9fd91161e57c5dbc594ad4ad.

Adds bitbake fixes/optimizations;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
index a41ac1a..131e5e0 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "54c2e993ec129563c7ae9f3fdee74ab60da28698"
+SRCREV ?= "ae938eba92b2c89a9fd91161e57c5dbc594ad4ad"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.8.3.2


