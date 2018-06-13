Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F690750E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 15:01:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2018 08:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,219,1526367600"; d="scan'208";a="236844174"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2018 08:01:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 81B9E580114
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:01:43 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 17:54:12 +0300
Message-Id: <1528901652-14840-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] sqlite3: upgrade to 3.24.0
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
X-List-Received-Date: Wed, 13 Jun 2018 15:01:52 -0000

Disable fts5 support as it causes build errors for pseudo.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/sqlite3.inc                              | 1 +
 meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 95ec89c..7312c84 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -31,6 +31,7 @@ EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
     --disable-static-shell \
+    --enable-fts5=no \
 "
 
 CFLAGS_append = " -fPIC"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.23.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.24.0.bb
index 3755761..ce18fec 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
-SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
+SRC_URI[md5sum] = "dcd96fb9bbb603d29f6b0ad9554932ee"
+SRC_URI[sha256sum] = "d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a"
-- 
2.4.0


