Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SJsK2-0004af-Ti
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:14:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2012 13:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="130306111"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2012 13:05:25 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 13:10:31 -0700
Message-Id: <eb9e9cf6caf5fdd4845e36064c6d529cf0cbe9df.1334606582.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334606582.git.elizabeth.flanagan@intel.com>
References: <cover.1334606582.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1334606582.git.elizabeth.flanagan@intel.com>
References: <cover.1334606582.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/2] core-image-rt-*.bb: require munges DESCRIPTION
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
X-List-Received-Date: Mon, 16 Apr 2012 20:14:51 -0000

The require of core-image-minimal overrides the description.
The best fix for this would be conditional setting of DESCRIPTION
in the required images for all image descriptions, but that opens
a potential can of worms. Moving the require fixes this.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-rt/images/core-image-rt-sdk.bb |    3 +--
 meta/recipes-rt/images/core-image-rt.bb     |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 5a67eeb..6ec2d00 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -1,14 +1,13 @@
 #
 # Copyright (C) 2011 Intel Corporation.
 #
+require recipes-core/images/core-image-minimal.bb
 
 DESCRIPTION = "Small image capable of booting a device with a test suite and \
 tools for real-time use. It includes the full meta-toolchain, development \
 headers and libraries to form a standalone SDK."
 DEPENDS = "linux-yocto-rt"
 
-require recipes-core/images/core-image-minimal.bb
-
 IMAGE_FEATURES += "dev-pkgs tools-sdk"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
 
diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index ef547a6..9b816bb 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -1,13 +1,12 @@
 #
 # Copyright (C) 2010 Intel Corporation.
 #
+require recipes-core/images/core-image-minimal.bb
 
 DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
 real-time test suite and tools appropriate for real-time use."
 DEPENDS = "linux-yocto-rt"
 
-require recipes-core/images/core-image-minimal.bb
-
 IMAGE_INSTALL += "rt-tests"
 
 LICENSE = "MIT"
-- 
1.7.1



