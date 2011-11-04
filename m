Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO2O-0000OA-EH
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 18:58:44 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="71264389"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga001.jf.intel.com with ESMTP; 04 Nov 2011 10:52:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:52:27 +0000
Message-Id: <8ae5b3cd9ef609e444cc360e226f857685e2e254.1320429060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429060.git.paul.eggleton@linux.intel.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429060.git.paul.eggleton@linux.intel.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] core-image-minimal-initramfs: force IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 04 Nov 2011 17:58:44 -0000

If the user has set their own value for IMAGE_FSTYPES, they may have
disabled the cpio.gz image type, preventing the initramfs from being
produced in the format that image-live.bbclass expects; so force
IMAGE_FSTYPES to cpio.gz within the initramfs image recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../images/core-image-minimal-initramfs.bb         |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 0bac27a..e4d0e51 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -13,3 +13,4 @@ LICENSE = "MIT"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
+IMAGE_FSTYPES = "cpio.gz"
-- 
1.7.5.4



