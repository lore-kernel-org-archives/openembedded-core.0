Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C6C0E65D49
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482002"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:11 -0700
Message-Id: <0ce8d1ddfba83d5d1b97d93a35ead8520b02ccf1.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 01/10] sqlite3: Update to 3.8.5.0
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-support/sqlite/{sqlite3_3.8.4.3.bb => sqlite3_3.8.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.4.3.bb => sqlite3_3.8.5.0.bb} (80%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.4.3.bb b/meta/recipes-support/sqlite/sqlite3_3.8.5.0.bb
similarity index 80%
rename from meta/recipes-support/sqlite/sqlite3_3.8.4.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.5.0.bb
index 9388297..244816b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.4.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.5.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
-SRC_URI[md5sum] = "0f5459cde43cb269e5120ecd2c671ced"
-SRC_URI[sha256sum] = "e0e995e23a324a5d6ae95d8a836240382a4d7475d09707fc469c8cafcbd48d65"
+SRC_URI[md5sum] = "0544ef6d7afd8ca797935ccc2685a9ed"
+SRC_URI[sha256sum] = "98c33abe4106e508e73fda648b2657ac9e969fe24695f543dcde68cc71f3091b"
 
 # Provide column meta-data API
 BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-- 
1.8.3.1


