Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8p-0002b8-QD
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189770"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:38 -0800
Message-Id: <43a2704c2dfda2f042c52f5a41a44fa0ac81dec1.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/18] sqlite3: Update to 3.7.9
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb |   10 ----------
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb   |   11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.9.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb b/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
deleted file mode 100644
index fd03780..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.7.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070701.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3070701"
-PR = "r1"
-
-SRC_URI[md5sum] = "554026fe7fac47b1cf61c18d5fe43419"
-SRC_URI[sha256sum] = "7dcc36b25f7bcbe2938d0ea2baea5b706f0af93473d02a3f612d7ab39e386edf"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.9.bb b/meta/recipes-support/sqlite/sqlite3_3.7.9.bb
new file mode 100644
index 0000000..f6c2f9e
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.9.bb
@@ -0,0 +1,11 @@
+require sqlite3.inc
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070900.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3070900"
+
+SRC_URI[md5sum] = "dce303524736fe89a76b8ed29d566352"
+SRC_URI[sha256sum] = "7be6cdb375505e5d9a4aee88b2ddb6ea0d9d29c9545114ff77b345e1fa812439"
-- 
1.7.6.4



