Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C30BA6612C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 11:53:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 03:53:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,189,1484035200"; d="scan'208";a="1132801828"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 03:53:34 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 5F57E6A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 03:53:33 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 13:55:06 +0200
Message-Id: <1487678107-30737-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] sqlite3: upgrade to 3.17.0
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
X-List-Received-Date: Tue, 21 Feb 2017 11:53:34 -0000

3.16.2 -> 3.17.0

* Approximately 25% better performance from the R-Tree extension.
* Other performance improvements. Uses about 6.5% fewer CPU cycles.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.16.2.bb => sqlite3_3.17.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.16.2.bb => sqlite3_3.17.0.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.16.2.bb b/meta/recipes-support/sqlite/sqlite3_3.17.0.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.16.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.17.0.bb
index cfbe198..593cb32 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.16.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.17.0.bb
@@ -6,6 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "5a153ef1fd2fa5845ada74deabc68e32"
-SRC_URI[sha256sum] = "65cc0c3e9366f50c0679c5ccd31432cea894bc4a3e8947dabab88c8693263615"
-
+SRC_URI[md5sum] = "450a95a7bde697c9fe4de9ae2fffdcca"
+SRC_URI[sha256sum] = "a4e485ad3a16e054765baf6371826b5000beed07e626510896069c0bf013874c"
-- 
2.4.0


