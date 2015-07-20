Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF8565CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 19:39:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2015 12:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,509,1432623600"; d="scan'208";a="767861326"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.54])
	by orsmga002.jf.intel.com with ESMTP; 20 Jul 2015 12:39:56 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 14:40:00 -0500
Message-Id: <1437421200-27648-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sqlite3: Upgrade 3.8.10.0 -> 3.8.10.2
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
X-List-Received-Date: Mon, 20 Jul 2015 19:39:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor upgrade contains fixes see [1].

[1] https://www.sqlite.org/releaselog/3_8_10_2.html

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../sqlite/{sqlite3_3.8.10.0.bb => sqlite3_3.8.10.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.10.0.bb => sqlite3_3.8.10.2.bb} (81%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb b/meta/recipes-support/sqlite/sqlite3_3.8.10.2.bb
similarity index 81%
rename from meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.10.2.bb
index d7f72d9ab..c72ad50 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.10.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://0001-using-the-dynamic-library.patch \
 "
 
-SRC_URI[md5sum] = "04d0311ef70818e8d914c1dc383eddff"
-SRC_URI[sha256sum] = "c4b8f9eefbdf0b9bef2044bdc3510c8a3f3b0ddb0489661fb433034187f5a428"
+SRC_URI[md5sum] = "a18bfc015cd49a1e7a961b7b77bc3b37"
+SRC_URI[sha256sum] = "8382e55a4e7d853c93038562ca3dd00307937fccf1c6b65ddd813e503a56d626"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
-- 
1.9.1


