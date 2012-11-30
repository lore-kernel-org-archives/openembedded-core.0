Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeEGV-0007j5-Aw
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 01:15:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2012 16:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,188,1355126400"; d="scan'208";a="224515830"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2012 16:00:48 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 16:00:43 -0800
Message-Id: <1354233643-3385-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
References: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 4/4] build-appliance-image: Allow SRCREV to be overriden
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
X-List-Received-Date: Fri, 30 Nov 2012 00:15:35 -0000

This will allow use to automagically set the SRCREV for builds on the
autobuilder. It will still require manual updating for releases.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index b89354e..a8b787c 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV = "a0cf759537260f00311450e0dac41bf45b474454"
+SRCREV ?= "a0cf759537260f00311450e0dac41bf45b474454"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.8.0



