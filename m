Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D18936B55C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 19:00:29 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2013 12:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,840,1367996400"; d="scan'208";a="279556806"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 12:00:28 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 22:02:11 +0300
Message-Id: <f2a55168417b13f65c6aa3e3d6a65eb0185bb3e1.1375988444.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375988444.git.cristian.iorga@intel.com>
References: <cover.1375988444.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375988444.git.cristian.iorga@intel.com>
References: <cover.1375988444.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] build-appliance-image: upgrade to ac60aa8cf707eec58e2cb51e7c406250d0b43ef1 commit.
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
X-List-Received-Date: Thu, 08 Aug 2013 19:00:30 -0000

Fixes [YOCTO #4977].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
index fad4176..27cdd6f 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "dc529e1f18975ff33a1686dc9804a38204fd1bd0"
+SRCREV ?= "ac60aa8cf707eec58e2cb51e7c406250d0b43ef1"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.8.1.2


