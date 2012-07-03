Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx78-00036R-2P
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373942"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:19 +0300
Message-Id: <1341298228-4412-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 02/10] xf86-input-synaptics: upgrade to 1.6.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 07:01:34 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...tics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
index 8f2a7f2..193bd08 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.6.2.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e395e21f3c21d4fc3a243783e85e9ab5"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "d10a7ee362d015975fbef11c6beaac97"
-SRC_URI[sha256sum] = "1ab1459ea340f371c40be7d6a780e43bdaa2d9799c1de21145e3b5808d0eab3c"
+SRC_URI[md5sum] = "9914022a173e3f0ccfe7137ab84f6133"
+SRC_URI[sha256sum] = "c3f7d6a085d480c352f030aeb43db2e5560d1468ed34be24d44a0fc3fda25920"
 
 DEPENDS += "libxi"
 
-- 
1.7.9.5



