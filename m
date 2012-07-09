Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SoHXV-00063H-4q
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:14:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 10:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190326802"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.244])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 10:03:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 18:03:08 +0100
Message-Id: <e46cfd0472f229904ab79d02ffc5aa0152039008.1341853333.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341853333.git.paul.eggleton@linux.intel.com>
References: <cover.1341853333.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1341853333.git.paul.eggleton@linux.intel.com>
References: <cover.1341853333.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] core-image-minimal-dev: base on core-image-minimal
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
X-List-Received-Date: Mon, 09 Jul 2012 17:14:25 -0000

When core-image-minimal has been updated in the past, we have on several
occasions missed applying those updates to this recipe, so let's just
base it directly on core-image-minimal and completely avoid that problem
in future.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/core-image-minimal-dev.bb |   12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal-dev.bb b/meta/recipes-core/images/core-image-minimal-dev.bb
index 67c7790..4e9cb35 100644
--- a/meta/recipes-core/images/core-image-minimal-dev.bb
+++ b/meta/recipes-core/images/core-image-minimal-dev.bb
@@ -1,18 +1,10 @@
 #
 # Copyright (C) 2007 OpenedHand Ltd.
 #
+require core-image-minimal.bb
+
 DESCRIPTION = "A small image just capable of allowing a device to boot and \
 is suitable for development work."
 
-IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE}"
-
 IMAGE_FEATURES += "dev-pkgs"
 
-IMAGE_LINGUAS = " "
-
-LICENSE = "MIT"
-
-inherit core-image
-
-# remove not needed ipkg informations
-ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
-- 
1.7.9.5



