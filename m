Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SL0El-0006ny-J5
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:54:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Apr 2012 15:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134590367"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 19 Apr 2012 15:44:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Thu, 19 Apr 2012 15:44:23 -0700
Message-Id: <d58ba903ad88b625ae131d8680f2db96c87fc2a3.1334875218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
Subject: [PATCH 09/10] sqlite3: Upgrade to 3.7.11
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
X-List-Received-Date: Thu, 19 Apr 2012 22:54:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb |   11 -----------
 meta/recipes-support/sqlite/sqlite3_3.7.11.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.10.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.11.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.10.bb b/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
deleted file mode 100644
index ec6ded6..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.10.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sqlite3.inc
-
-PR = "r2"
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071000.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3071000"
-
-SRC_URI[md5sum] = "9ed2ca93577b58cfa0d01f64b9312ab9"
-SRC_URI[sha256sum] = "9c1775057af5cc8b6cc64808b9553d77beccf3757e16ecee3bc878404d9c43e3"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.11.bb b/meta/recipes-support/sqlite/sqlite3_3.7.11.bb
new file mode 100644
index 0000000..9893e05
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.11.bb
@@ -0,0 +1,11 @@
+require sqlite3.inc
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+PR = "r0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071100.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-3071100"
+
+SRC_URI[md5sum] = "0552d71bda98ebdcaea305cd6058221b"
+SRC_URI[sha256sum] = "2badc75dc536249bcd68c44d2a655724285d054303251eaff9d355194cb3476b"
-- 
1.7.7.6



