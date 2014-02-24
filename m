Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 396A86F2E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:04:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 08:59:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="461291631"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2014 09:03:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 19:03:13 +0200
Message-Id: <1393261393-9602-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1393261393-9602-1-git-send-email-sgw@linux.intel.com>
References: <1393261393-9602-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] sqlite: rename to match upstream versioning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2014 17:04:40 -0000

Since we are re-doing the version from a big number down to a dot
based number we have to bump the Package Epoch (PE).

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sqlite/{sqlite3_3080301.bb => sqlite3_3.8.3.1.bb}               | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3080301.bb => sqlite3_3.8.3.1.bb} (71%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3080301.bb b/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
similarity index 71%
rename from meta/recipes-support/sqlite/sqlite3_3080301.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
index 8ed01a9..ca3a05c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3080301.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
@@ -2,12 +2,14 @@ require sqlite3.inc
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${PV}.tar.gz"
+PE = "1"
+SQLITE_PV = "3080301"
+SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
 SRC_URI[md5sum] = "509ff98d8dc9729b618b7e96612079c6"
 SRC_URI[sha256sum] = "de5dc216e9289fabf027f78dbbface32ffc8c6341b7d841d0814b1a452ffdb8c"
 
-S = "${WORKDIR}/sqlite-autoconf-${PV}"
+S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
 # Provide column meta-data API
 BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-- 
1.8.3.1


