Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E62926D050
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506402"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:08 -0700
Message-Id: <90ccd94feae7520536c467a4a266b44afd3a35e2.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 02/18] sqlite3: update to version 3.8.0.1
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:29 -0000

From: "Maxin B. John" <maxin.john@enea.com>

Upgrade to latest version 3.8.0.1

(From OE-Core rev: 0f1a3558647e18f0fdf7fc63350eff0282ec39bf)

Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/sqlite/{sqlite3_3071700.bb => sqlite3_3080001.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3071700.bb => sqlite3_3080001.bb} (60%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3071700.bb b/meta/recipes-support/sqlite/sqlite3_3080001.bb
similarity index 60%
rename from meta/recipes-support/sqlite/sqlite3_3071700.bb
rename to meta/recipes-support/sqlite/sqlite3_3080001.bb
index 113e8ce..692e56a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3071700.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3080001.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "18c285053e9562b848209cb0ee16d4ab"
-SRC_URI[sha256sum] = "8ff46d0baa9e64c0815544e829e985f1161c096aa6344c8f430791dbeadc2baf"
+SRC_URI[md5sum] = "ee32c96e5db6c6d651c7c9b71082cf7c"
+SRC_URI[sha256sum] = "1d92ccfca5629701b207e57e86fdf0a01d8dca61c60e1246f92ec8d87408cf36"
 
 S = "${WORKDIR}/sqlite-autoconf-${PV}"
-- 
1.8.3.1


