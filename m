Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TMNu1-0006HZ-CM
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 20:54:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Oct 2012 11:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,573,1344236400"; d="scan'208";a="204472677"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.5])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2012 11:41:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2012 11:41:05 -0700
Message-Id: <1349980865-30301-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] build-appliance: ensure zip file is linked locally
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2012 18:54:38 -0000

This makes the symbolic link portable with the dated zip file, otherwise
the link still points to the original deploy directory.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 49e250d..59ccb98 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -80,7 +80,7 @@ create_bundle_files () {
 	cp *.vmx* Yocto_Build_Appliance
 	ln -sf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
 	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
-	ln -sf ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip 
+	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip 
 }
 
 python do_bundle_files() {
-- 
1.7.7.6



