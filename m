Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhR-0008QA-Pb
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197459"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:15 -0800
Message-Id: <27eddddc48556715c7fc64b074c847acd8d9b633.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/36] sqlite3: Update to version 3.7.10
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:10 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb |   11 +++++++++++
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb  |   11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.10.bb
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.9.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.10.bb b/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
new file mode 100644
index 0000000..763878b
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
@@ -0,0 +1,11 @@
+require sqlite3.inc
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071000.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3071000"
+
+SRC_URI[md5sum] = "9ed2ca93577b58cfa0d01f64b9312ab9"
+SRC_URI[sha256sum] = "9c1775057af5cc8b6cc64808b9553d77beccf3757e16ecee3bc878404d9c43e3"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.9.bb b/meta/recipes-support/sqlite/sqlite3_3.7.9.bb
deleted file mode 100644
index 8f7348d..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.9.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sqlite3.inc
-
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070900.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3070900"
-
-SRC_URI[md5sum] = "dce303524736fe89a76b8ed29d566352"
-SRC_URI[sha256sum] = "7be6cdb375505e5d9a4aee88b2ddb6ea0d9d29c9545114ff77b345e1fa812439"
-- 
1.7.7.6



