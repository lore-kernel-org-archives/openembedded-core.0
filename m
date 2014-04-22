Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B1C4665D49
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712253"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:31 -0700
Message-Id: <b734f87b706cb1ec48d4e5f9b7dde7b7803fd49f.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 09/10] sqlite3: Update to 3080403
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:42 -0000

And rename the PV to match the upstream versioning
This requires a PE Bump to ensure package versions don't
go backwards.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sqlite/{sqlite3_3.8.3.1.bb => sqlite3_3080403.bb}          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.3.1.bb => sqlite3_3080403.bb} (68%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb b/meta/recipes-support/sqlite/sqlite3_3080403.bb
similarity index 68%
rename from meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3080403.bb
index 4f15f5d..7793a75 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3080403.bb
@@ -6,15 +6,15 @@ def sqlite_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
     return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])
 
-PE = "1"
+PE = "2"
 SQLITE_PV = "${@sqlite_download_version(d)}"
-SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-
-SRC_URI[md5sum] = "509ff98d8dc9729b618b7e96612079c6"
-SRC_URI[sha256sum] = "de5dc216e9289fabf027f78dbbface32ffc8c6341b7d841d0814b1a452ffdb8c"
+SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${PV}.tar.gz"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
+SRC_URI[md5sum] = "0f5459cde43cb269e5120ecd2c671ced"
+SRC_URI[sha256sum] = "e0e995e23a324a5d6ae95d8a836240382a4d7475d09707fc469c8cafcbd48d65"
+
 # Provide column meta-data API
 BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
 TARGET_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-- 
1.8.3.1


