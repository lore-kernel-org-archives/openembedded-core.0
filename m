Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaKXT-000444-L5
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 07:09:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2012 21:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,276,1352102400"; d="scan'208";a="221530197"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2012 21:54:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2012 21:54:36 -0800
Message-Id: <0cb925c33f1e00d613af98333b6a9c0a4d0f169c.1353304234.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
Subject: [PATCH 03/17] sqlite3: Update to 3.7.14.1
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
X-List-Received-Date: Mon, 19 Nov 2012 06:09:18 -0000

[YOCTO #3283]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.13.bb   |   11 -----------
 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.13.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb b/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
deleted file mode 100644
index 48b50ac..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-PR = "r1"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071300.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3071300"
-
-SRC_URI[md5sum] = "c97df403e8a3d5b67bb408fcd6aabd8e"
-SRC_URI[sha256sum] = "ac566819f82ec4cc2ff6c5cc90987ca38e589efbd79ff263838bbc62356ab119"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb b/meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
new file mode 100644
index 0000000..69e011a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
@@ -0,0 +1,11 @@
+require sqlite3.inc
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+PR = "r0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071401.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3071401"
+
+SRC_URI[md5sum] = "4cf3fd434bbb6e50777019ff3507bfa5"
+SRC_URI[sha256sum] = "d46d302a63b23d9c3b80e519be12cb7d6a8d3da57bd9c119341a0aa8b3b28692"
-- 
1.7.7.6



