Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlYA-0000G3-7S
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490586"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:21:01 -0800
Message-Id: <c54b713357afb73027cb8cf3f02186e7e68b1eb6.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
Subject: [PATCH 08/10] sqlite3: Update to 3.7.14.1
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
X-List-Received-Date: Wed, 14 Nov 2012 22:35:22 -0000

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



