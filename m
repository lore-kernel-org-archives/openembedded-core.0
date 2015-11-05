Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 584F775A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:49:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Nov 2015 07:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="812545732"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Nov 2015 07:49:42 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 85E2E6A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 07:48:38 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 17:50:10 +0200
Message-Id: <1446738610-19230-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/5] rt-tests: upgrade to version 0.96
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
X-List-Received-Date: Thu, 05 Nov 2015 15:49:44 -0000

bump version to 0.96

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../rt-tests/{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb}           | 2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc                               | 6 +++---
 meta/recipes-rt/rt-tests/{rt-tests_0.94.bb => rt-tests_0.96.bb}     | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb} (90%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.94.bb => rt-tests_0.96.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.94.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
similarity index 90%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.94.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
index 8319eb9..962069e 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_0.94.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Hardware latency detector"
 DESCRIPTION = "Python utility for controlling the kernel hardware latency detection module (hwlat_detector.ko)."
-HOMEPAGE = "http://git.kernel.org/?p=linux/kernel/git/clrkwllms/rt-tests.git"
+HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
 SECTION = "tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 4e099df..76f9b3a 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,6 +1,6 @@
-# Version v0.94
-PV = "0.94"
-SRCREV = "a8fd81efa718ec449d90cba8f41123ed521bd12b"
+# Version v0.96
+PV = "0.96"
+SRCREV = "24f8c0175e04bab78e7555698e34d7002b01c87f"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.94.bb b/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/rt-tests_0.94.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.96.bb
-- 
2.4.0


