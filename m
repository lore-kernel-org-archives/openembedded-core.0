Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QdMOF-0003GI-CJ
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 15:07:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2011 06:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,467,1304319600"; d="scan'208";a="22914557"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2011 06:03:22 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jul 2011 21:03:16 +0800
Message-Id: <03663a7c62605c94625f903e2a81b7d2ba85d095.1309698011.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
Subject: [PATCH 4/5] sqlite: upgrade from 3.7.6.2 to 3.7.7.1
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
X-List-Received-Date: Sun, 03 Jul 2011 13:07:11 -0000

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb |   10 ----------
 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb b/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
deleted file mode 100644
index 34d1653..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070602.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3070602"
-PR = "r0"
-
-SRC_URI[md5sum] = "f16c08617968b4087b3d591fd575f59f"
-SRC_URI[sha256sum] = "53aa66f30d8ff87230d4173b7979814432b8084da77fba05992223f76593fc81"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb b/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
new file mode 100644
index 0000000..5651c07
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070701.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3070701"
+PR = "r0"
+
+SRC_URI[md5sum] = "554026fe7fac47b1cf61c18d5fe43419"
+SRC_URI[sha256sum] = "7dcc36b25f7bcbe2938d0ea2baea5b706f0af93473d02a3f612d7ab39e386edf"
-- 
1.7.0.4



