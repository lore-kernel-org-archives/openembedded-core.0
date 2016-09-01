Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 865947327F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 08:57:45 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 01 Sep 2016 01:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,266,1470726000"; 
   d="scan'208";a="3841457"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 01 Sep 2016 01:57:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 9AD596A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 01:57:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 11:55:58 +0300
Message-Id: <532996d3bd01d836024034c25c0a3aed16a35195.1472719962.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 1/6] image: populate_sdk_base: add DEPLOYDIR variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Sep 2016 08:57:46 -0000

This is a preparation for changing deployment directory for image
and populate_sdk targets.

Introduced new variable DEPLOYDIR. Set it to current image/sdk
deployment locations.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass             | 2 ++
 meta/classes/populate_sdk_base.bbclass | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c06dee2..b3dc689 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -74,6 +74,8 @@ IMAGE_INSTALL[type] = "list"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
+DEPLOYDIR = "${DEPLOY_DIR_IMAGE}"
+
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 645a7f4..be731c0 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -26,6 +26,8 @@ SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
+DEPLOYDIR = "${SDK_DEPLOY}"
+
 B_task-populate-sdk = "${SDK_DIR}"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
-- 
2.1.4


