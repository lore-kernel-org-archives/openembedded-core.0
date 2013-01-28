Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4O-0003nY-IJ
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Jan 2013 01:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195770001"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:16:00 -0800
Message-Id: <56e80f8972b31ff27dc5a753f5fd8fd009b1a469.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 13/13] sqlite3: Update to 3.7.15.2
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:25 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sqlite/{sqlite3_3.7.15.1.bb => sqlite3_3.7.15.2.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.7.15.1.bb => sqlite3_3.7.15.2.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb b/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb
index 77530f2..5eb7188 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb
@@ -1,6 +1,6 @@
 require sqlite3.inc
 
-SQLITE_VERSTR = "3071501"
+SQLITE_VERSTR = "3071502"
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
@@ -9,5 +9,5 @@ PR = "r0"
 SRC_URI = "http://www.sqlite.org/sqlite-autoconf-${SQLITE_VERSTR}.tar.gz"
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_VERSTR}"
 
-SRC_URI[md5sum] = "a67c25afa199a11f0a37aff7ed9d2c14"
-SRC_URI[sha256sum] = "e8809bd9a292be777f76c97c7e77ab41f7d1020776ded5a631da3985b4b26afd"
+SRC_URI[md5sum] = "bcb0ab0b5b30116b2531cfeef3c861b4"
+SRC_URI[sha256sum] = "782d16b797f6ca879f6f679ba3fb6ceb54bcb0cab65feef332058bf04b36ba8c"
-- 
1.8.0.2



