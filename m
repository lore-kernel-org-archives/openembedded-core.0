Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 74FD362138
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 12:34:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2015 04:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,506,1418112000"; d="scan'208";a="671460541"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2015 04:34:16 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Feb 2015 14:34:09 +0200
Message-Id: <950a89490978bbc3bab567a72bff7f1b306c2e59.1422880224.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1422880224.git.cristian.iorga@intel.com>
References: <cover.1422880224.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1422880224.git.cristian.iorga@intel.com>
References: <cover.1422880224.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: update to head afe85485fe185b663a1285b5c27de3160bf06cf7
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
X-List-Received-Date: Mon, 02 Feb 2015 12:34:23 -0000

Build Appliance includes a more recent
version of poky, up to commit:
afe85485fe185b663a1285b5c27de3160bf06cf7.

Fixes [YOCTO #7228].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image_12.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_12.0.1.bb b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
index 3d632d6..9a5795e 100644
--- a/meta/recipes-core/images/build-appliance-image_12.0.1.bb
+++ b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "d9d5b8b499af3ae01a1e33d0d3969c54c2d4ab1b"
+SRCREV ?= "afe85485fe185b663a1285b5c27de3160bf06cf7"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
2.1.0


