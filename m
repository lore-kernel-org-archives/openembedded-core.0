Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CE1BB719E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:39:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 31 May 2017 04:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="108662304"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 31 May 2017 04:39:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 48F535803AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 04:39:34 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:39:34 +0300
Message-Id: <1496230776-38517-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] sqlite3: upgrade 3.18.0 -> 3.19.2
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
X-List-Received-Date: Wed, 31 May 2017 11:39:37 -0000

Bug fixes:
1. Fix a problem in REPLACE that can result in a corrupt database
containing two or more rows with the same rowid.
2. Fix a problem in PRAGMA integrity_check that was causing a subsequent
VACUUM to behave suboptimally.
3. Fix the PRAGMA foreign_key_check command so that it works correctly with
foreign keys on WITHOUT ROWID tables.
4. Disallow leading zeros in numeric constants in JSON.
5. Disallow control characters inside of strings in JSON.
6. Limit the depth of recursion for JSON objects and arrays in order to
avoid excess stack usage in the recursive descent parser.
7. Fix more bugs in the LEFT JOIN flattening optimization.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.18.0.bb => sqlite3_3.19.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.18.0.bb => sqlite3_3.19.2.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.18.0.bb b/meta/recipes-support/sqlite/sqlite3_3.19.2.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.18.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.19.2.bb
index 352b53f..cf87073 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.18.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.19.2.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "a6687a8ae1f66abc8df739aeadecfd0c"
-SRC_URI[sha256sum] = "3757612463976e7d08c5e9f0af3021613fc24bbcfe1c51197d6776b9ece9ac5c"
+SRC_URI[md5sum] = "9f006b16de2cd81f6bae9b40e91daabf"
+SRC_URI[sha256sum] = "ca5361fb01cc3ad63d6fd4eb2cb0b6398e629595896d3558f7e121d37dac2ffc"
-- 
2.4.0


