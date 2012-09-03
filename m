Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8E-0004vF-Uz
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497178"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:26 +0100
Message-Id: <f7b80305a56445148cb466225606b7a078a25aa1.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/28] classes/packagegroup: Use package group nomenclature
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:51 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/packagegroup.bbclass |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 6ec154a..aa9e0ac 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -1,16 +1,18 @@
-# Task packages are only used to pull in other packages
+# Class for packagegroup (package group) recipes
+
+# packagegroup packages are only used to pull in other packages
 # via their dependencies. They are empty.
 ALLOW_EMPTY = "1"
 
-# By default, only the task package itself is in PACKAGES.
+# By default, only the packagegroup package itself is in PACKAGES.
 # -dbg and -dev flavours are handled by the anonfunc below.
-# This means that task recipes used to build multiple task
-# packages have to modify PACKAGES after inheriting task.bbclass.
+# This means that packagegroup recipes used to build multiple packagegroup
+# packages have to modify PACKAGES after inheriting packagegroup.bbclass.
 PACKAGES = "${PN}"
 
-# By default, task packages do not depend on a certain architecture.
+# By default, packagegroup packages do not depend on a certain architecture.
 # Only if dependencies are modified by MACHINE_FEATURES, packages
-# need to be set to MACHINE_ARCH after inheriting task.bbclass
+# need to be set to MACHINE_ARCH after inheriting packagegroup.bbclass
 PACKAGE_ARCH = "all"
 
 # This automatically adds -dbg and -dev flavours of all PACKAGES
-- 
1.7.9.5



