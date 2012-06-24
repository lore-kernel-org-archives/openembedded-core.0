Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKT-0004YL-3o
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983137"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:26 -0700
Message-Id: <c6e41d0c4d34b9dfc74432eadd1facae6f111cfa.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 01/14] sqlite3: Update to 3.7.13
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:33 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.11.bb |   11 -----------
 meta/recipes-support/sqlite/sqlite3_3.7.13.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.11.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.13.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.11.bb b/meta/recipes-support/sqlite/sqlite3_3.7.11.bb
deleted file mode 100644
index 9893e05..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.11.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-PR = "r0"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071100.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3071100"
-
-SRC_URI[md5sum] = "0552d71bda98ebdcaea305cd6058221b"
-SRC_URI[sha256sum] = "2badc75dc536249bcd68c44d2a655724285d054303251eaff9d355194cb3476b"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb b/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
new file mode 100644
index 0000000..4e050a3
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
@@ -0,0 +1,11 @@
+require sqlite3.inc
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+PR = "r0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071300.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3071300"
+
+SRC_URI[md5sum] = "c97df403e8a3d5b67bb408fcd6aabd8e"
+SRC_URI[sha256sum] = "ac566819f82ec4cc2ff6c5cc90987ca38e589efbd79ff263838bbc62356ab119"
-- 
1.7.7.6



