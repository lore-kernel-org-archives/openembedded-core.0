Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJQXH-0007u7-UQ
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:06:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2012 07:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="229468671"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.52])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2012 07:53:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 15:53:27 +0100
Message-Id: <1349276007-6014-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] build-appliance-image: Fix spacing in DESCRIPTION
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
X-List-Received-Date: Wed, 03 Oct 2012 15:06:56 -0000

Fixes [YOCTO #2636]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 69a4828..49e250d 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
+DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.\
+ For more information, see the <a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
 IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted"
 
 LICENSE = "MIT"
-- 
1.7.9.5



