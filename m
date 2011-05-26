Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPjhe-0001hA-8B
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:10:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 16:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="5588264"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 16:07:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 16:07:34 -0700
Message-Id: <73f3eadb1071ce17355305b27b320b8769a28e1d.1306451124.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 3/9] bitbake.conf: change IMAGE_ROOTFS_EXTRA_SPACE to soft (?=) default
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
X-List-Received-Date: Thu, 26 May 2011 23:10:54 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 35fd6f8..d307385 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -347,13 +347,14 @@ IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 
-# This option allows for a precentage overage of the actaul image size rather than a
-# fixed extra space
+# This option allows for a percentage overage of the actual image size rather than a
+# fixed extra space, this is space needed for initial startup and basic operations.
 IMAGE_OVERHEAD_FACTOR ?= 1.3
 # This option allow for adding addition space in K above and beyond what the 
-# IMAGE_OVERHEAD_FACTOR might add. To set a fixed size then overrideing IMAGE_ROOTFS_SIZE
-# with the max size one wants should do the trick
-IMAGE_ROOTFS_EXTRA_SPACE = "0"
+# IMAGE_OVERHEAD_FACTOR might add. This space is for additional packages, user data, ...
+# To set a fixed size then overrideing IMAGE_ROOTFS_SIZE with the max size one wants
+# should do the trick
+IMAGE_ROOTFS_EXTRA_SPACE ?= "0"
 
 EXTRA_IMAGEDEPENDS = ""
 
-- 
1.7.3.4



