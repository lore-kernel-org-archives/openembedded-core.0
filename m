Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BF8F470E6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283398"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:13 -0700
Message-Id: <8b224af72a8c0809e0f2c21cb20c8177e24614ff.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
Subject: [PATCH 7/7] sqlite3: Upgrade to 2.8.6.0
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:51 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sqlite/{sqlite3_3.8.5.0.bb => sqlite3_3.8.6.0.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.5.0.bb => sqlite3_3.8.6.0.bb} (80%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.5.0.bb b/meta/recipes-support/sqlite/sqlite3_3.8.6.0.bb
similarity index 80%
rename from meta/recipes-support/sqlite/sqlite3_3.8.5.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.6.0.bb
index 244816b..32f60eb 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.5.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.6.0.bb
@@ -10,10 +10,10 @@ PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
 SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
-S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
+SRC_URI[md5sum] = "f7e4a156b583abeba349629e2364224b"
+SRC_URI[sha256sum] = "53bab14255bc16c3d73fdbe54b364c1764709d68dda167587f8026c98b9f4e95"
 
-SRC_URI[md5sum] = "0544ef6d7afd8ca797935ccc2685a9ed"
-SRC_URI[sha256sum] = "98c33abe4106e508e73fda648b2657ac9e969fe24695f543dcde68cc71f3091b"
+S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
 # Provide column meta-data API
 BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-- 
1.8.3.1


