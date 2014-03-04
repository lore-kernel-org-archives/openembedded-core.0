Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 96AB36EFA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 17:13:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2014 09:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,586,1389772800"; d="scan'208";a="485938912"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2014 09:12:25 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 19:15:24 +0200
Message-Id: <95f4982fbacaf5cb07f403f47c7b5ec1e2378238.1393953291.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1393953291.git.cristian.iorga@intel.com>
References: <cover.1393953291.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1393953291.git.cristian.iorga@intel.com>
References: <cover.1393953291.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: upgraded to commit 54c2e993ec129563c7ae9f3fdee74ab60da28698
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
X-List-Received-Date: Tue, 04 Mar 2014 17:13:26 -0000

- Solves bugs related to bitbake;
- Improved image generation.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
index 8906c1c..a41ac1a 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "b37dd451a52622d5b570183a81583cc34c2ff555"
+SRCREV ?= "54c2e993ec129563c7ae9f3fdee74ab60da28698"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.8.3.2


