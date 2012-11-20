Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact5-0005Xt-MD
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596737"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:18 -0800
Message-Id: <accf99081d61ccd85804b53505322da81d2a82dd.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 10/13] rt-tests/hwlatdetect: Update to 0.85
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:32 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{hwlatdetect_0.84.bb => hwlatdetect_0.85.bb}   |    0
 meta/recipes-rt/rt-tests/rt-tests.inc              |    4 ++--
 .../{rt-tests_0.84.bb => rt-tests_0.85.bb}         |    0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.84.bb => hwlatdetect_0.85.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.84.bb => rt-tests_0.85.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index f511532..6a699fc 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-# Version v0.84
-SRCREV = "857cdd5320ce1f293f5dbcbec79cc8fe22b0bebf"
+# Version v0.85
+SRCREV = "210e625227d21e0b589b8eaa36cd81f1cb981819"
 
 PR = "r0"
 
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.84.bb b/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/rt-tests_0.84.bb
rename to meta/recipes-rt/rt-tests/rt-tests_0.85.bb
-- 
1.7.7.6



