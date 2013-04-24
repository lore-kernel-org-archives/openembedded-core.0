Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47X-0004Uk-N5
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2013 10:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632425"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:41 +0100
Message-Id: <cff8c7945916932c464414fb33e5314bfe3561e1.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/21] build-appliance-image: add SUMMARY, HOMEPAGE and improve DESCRIPTION
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
X-List-Received-Date: Wed, 24 Apr 2013 18:08:47 -0000

Move the link from DESCRIPTION to HOMEPAGE and add a short SUMMARY.
Also move IMAGE_INSTALL line to be further down in the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 53e6edc..fad4176 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -1,11 +1,13 @@
-DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.\
- For more information, see the <a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
-IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted"
+SUMMARY = "An image containing the build system itself"
+DESCRIPTION = "An image containing the build system that you can boot and run using either VMware Player or VMware Workstation."
+HOMEPAGE = "http://www.yoctoproject.org/documentation/build-appliance"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted"
+
 IMAGE_FEATURES += "x11-base package-management splash"
 
 # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
-- 
1.7.10.4



