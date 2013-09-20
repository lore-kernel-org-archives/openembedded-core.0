Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DE78B6CA26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:27:59 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 02:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,943,1371106800"; d="scan'208";a="363220961"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 02:28:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 10:27:52 +0100
Message-Id: <a06d32dba79c504fd855b0d871511b845d386abb.1379669217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] conf/local.conf.sample: update for new testimage class
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
X-List-Received-Date: Fri, 20 Sep 2013 09:28:00 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 4030492..45de339 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -151,23 +151,9 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 #
 # The build system can test booting virtual machine images under qemu (an emulator)
 # after any root filesystems are created and run tests against those images. To
-# enable this uncomment this line
-#IMAGETEST = "qemu"
-#
-# This variable controls which tests are run against virtual images if enabled
-# above. The following would enable bat, boot the test case under the sanity suite
-# and perform toolchain tests
-#TEST_SCEN = "sanity bat sanity:boot toolchain"
-#
-# Because of the QEMU booting slowness issue (see bug #646 and #618), the
-# autobuilder may suffer a timeout issue when running sanity tests. We introduce
-# the variable TEST_SERIALIZE here to reduce the time taken by the sanity tests.
-# It is set to 1 by default, which will boot the image and run cases in the same
-# image without rebooting or killing the machine instance. If it is set to 0, the
-# image will be copied and tested for each case, which will take longer but be
-# more precise.
-#TEST_SERIALIZE = "1"
-
+# enable this uncomment this line. See classes/testimage(-auto).bbclass for
+# further details.
+#TEST_IMAGE = "1"
 #
 # Interactive shell configuration
 #
-- 
1.8.1.2


