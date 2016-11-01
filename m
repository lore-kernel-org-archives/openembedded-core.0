Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A142371A34
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:28:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876296"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:28:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:19 +0200
Message-Id: <6ca58a9fe0465cf94cde885033f1cb4d333b340f.1478013702.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/13] rt-tests: fix the recipe version to match upstream
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
X-List-Received-Date: Tue, 01 Nov 2016 15:28:00 -0000

Upstream had a 2.0 tag for a while, then removed it and added a 1.1 tag :-/
Let's make it match to avoid confusion. There's only one new commit
added, which adds a missing manpage.

Also, update the outdated version comment in rt-tests.inc

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-rt/rt-tests/{hwlatdetect_2.0.bb => hwlatdetect_1.1.bb} | 0
 meta/recipes-rt/rt-tests/rt-tests.inc                               | 5 +++--
 meta/recipes-rt/rt-tests/{rt-tests_2.0.bb => rt-tests_1.1.bb}       | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_2.0.bb => hwlatdetect_1.1.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_2.0.bb => rt-tests_1.1.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_2.0.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_2.0.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index d832828..5606d8e 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,6 @@
-# Version v0.96
-SRCREV = "e1b1537a20b35af75a49bf55dcf70296f8a62467"
+# Version 1.1
+SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
+PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/rt-tests_2.0.bb
rename to meta/recipes-rt/rt-tests/rt-tests_1.1.bb
-- 
2.10.1


