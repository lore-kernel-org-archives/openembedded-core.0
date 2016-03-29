Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BBA36605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 20:37:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 29 Mar 2016 13:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,412,1455004800"; d="scan'208";a="947518516"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.90])
	by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2016 13:37:11 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 14:37:50 -0600
Message-Id: <1459283870-24898-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] ptest-runner_2.0.bb: Update recipe to point git.yoctoproject.org repo.
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
X-List-Received-Date: Tue, 29 Mar 2016 20:37:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since ptest-runner is a Yocto Project tool is better to have hosted
into git.yoctoproject.org.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
index dc6ac72..7081afb 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A C program to run all installed ptests"
 DESCRIPTION = "The ptest-runner2 package installs a ptest-runner \
 program which loops through all installed ptest test suites and \
 runs them in sequence."
-HOMEPAGE = "https://github.com/alimon/ptest-runner2"
+HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "8bfdf946e784f4d5757bebee1fbc4b4a3d7a95c4"
 PV = "2.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/alimon/ptest-runner2.git;protocol=https"
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
 S = "${WORKDIR}/git"
 
 FILES_${PN} = "${bindir}/ptest-runner"
-- 
2.1.4


