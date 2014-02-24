Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5EF6EE8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:04:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 08:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="461291623"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2014 09:03:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 19:03:12 +0200
Message-Id: <1393261393-9602-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] sqlite3: Update to 3080301
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

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sqlite/{sqlite3_3080002.bb => sqlite3_3080301.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3080002.bb => sqlite3_3080301.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3080002.bb b/meta/recipes-support/sqlite/sqlite3_3080301.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3080002.bb
rename to meta/recipes-support/sqlite/sqlite3_3080301.bb
index 18ff292..8ed01a9 100644
--- a/meta/recipes-support/sqlite/sqlite3_3080002.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3080301.bb
@@ -2,10 +2,10 @@ require sqlite3.inc
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6d6cc639a4da04fbbdda7b1a1a01b386"
-SRC_URI[sha256sum] = "fca3a0a12f94dc92a6d9e700c3f6cab6cd4e79214bd7b6f13717a10f4bcfddb2"
+SRC_URI[md5sum] = "509ff98d8dc9729b618b7e96612079c6"
+SRC_URI[sha256sum] = "de5dc216e9289fabf027f78dbbface32ffc8c6341b7d841d0814b1a452ffdb8c"
 
 S = "${WORKDIR}/sqlite-autoconf-${PV}"
 
-- 
1.8.3.1


