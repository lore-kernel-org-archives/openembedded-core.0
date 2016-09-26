Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A84C760017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 21:43:10 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2016 14:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,401,1470726000"; d="scan'208";a="13493948"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2016 14:43:11 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 16:44:25 -0500
Message-Id: <20160926214425.25330-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V3] ptest-runner: recipe update related to minor fix.
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
X-List-Received-Date: Mon, 26 Sep 2016 21:43:10 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

A minor fix has been published regarding the need of a user
of being noticed when some run-ptest script fails.

Also Found modifications to ptest unit test stuff
* removed unnecessary code from unit test run_timeout_ptest
* added test case for run_ptest failure

Finally..
New content within contributions section of README.md.

[YOCTO #9752]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
index aaa7c59..9d45513 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "8bfdf946e784f4d5757bebee1fbc4b4a3d7a95c4"
-PV = "2.0+git${SRCPV}"
+SRCREV = "e2aa4256745377b784c8691f546041b59f6e046b"
+PV = "2.0.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
-- 
2.9.3


