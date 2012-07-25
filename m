Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Su6jC-0008IT-U3
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:54:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 11:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173137547"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.21])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 11:43:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 19:42:55 +0100
Message-Id: <16a5340f6a18adb2a498b16337b3726bd7755a71.1343241383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] core-image-minimal: clear IMAGE_FEATURES
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
X-List-Received-Date: Wed, 25 Jul 2012 18:54:35 -0000

Since dbg/dev packages are no longer added via PACKAGE_GROUP_*, having
dev-pkgs/dbg-pkgs in IMAGE_FEATURES will now affect core-image-minimal.
Set IMAGE_FEATURES to "" in order to avoid this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/core-image-minimal.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 089a728..3d63a96 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A small image just capable of allowing a device to boot."
 
 IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
 
+IMAGE_FEATURES = ""
 IMAGE_LINGUAS = " "
 
 LICENSE = "MIT"
-- 
1.7.9.5



