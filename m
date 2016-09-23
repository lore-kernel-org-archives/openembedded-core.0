Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2C660778
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 20:07:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 23 Sep 2016 13:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,383,1470726000"; d="scan'208";a="12709093"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga005.jf.intel.com with ESMTP; 23 Sep 2016 13:07:44 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 15:08:59 -0500
Message-Id: <20160923200859.21433-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] ptest-runner: recipe update related to minor fix.
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
X-List-Received-Date: Fri, 23 Sep 2016 20:07:44 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

A minor fix has been published regarding the need of a user
of being noticed when some run-ptest script fails.

[YOCTO #9752]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
index aaa7c59..34d360e 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "8bfdf946e784f4d5757bebee1fbc4b4a3d7a95c4"
+SRCREV = "e2aa4256745377b784c8691f546041b59f6e046b"
 PV = "2.0+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
-- 
2.9.3


