Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TBeac-0007jC-7F
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 06:30:14 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Sep 2012 21:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,407,1344236400"; d="scan'208";a="144052048"
Received: from unknown (HELO localhost) ([10.255.13.174])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Sep 2012 21:17:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Tue, 11 Sep 2012 21:17:07 -0700
Message-Id: <d472c24dc241dcf5250e0b321302bbc4f4f5e5c5.1347423112.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1347423112.git.dvhart@linux.intel.com>
References: <cover.1347423112.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1347423112.git.dvhart@linux.intel.com>
References: <cover.1347423112.git.dvhart@linux.intel.com>
Subject: [PATCH 3/3] rt: Add hwlatdetect to rt images
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
X-List-Received-Date: Wed, 12 Sep 2012 04:30:14 -0000

This adds the newly separated hwlatdetect package to the rt images.
While this pulls in a python dependency, it is worth have hwlatdetect
installed by default on these images as they are intended to assist in
the evaluation of platforms for use in real-time environments.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-rt/images/core-image-rt-sdk.bb | 2 +-
 meta/recipes-rt/images/core-image-rt.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index d3bf3e9..58f983f 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -7,6 +7,6 @@ DEPENDS = "linux-yocto-rt"
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug tools-profile tools-testapps debug-tweaks"
 
-IMAGE_INSTALL += "rt-tests kernel-dev"
+IMAGE_INSTALL += "rt-tests hwlatdetect kernel-dev"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index f749bfe..cab6f8b 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -4,6 +4,6 @@ DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
 real-time test suite and tools appropriate for real-time use."
 DEPENDS = "linux-yocto-rt"
 
-IMAGE_INSTALL += "rt-tests"
+IMAGE_INSTALL += "rt-tests hwlatdetect"
 
 LICENSE = "MIT"
-- 
1.7.11.4



