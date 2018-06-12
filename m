Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09B7578DF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:26:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="48688519"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 12 Jun 2018 04:26:02 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 885995800AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:26:01 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:13 +0300
Message-Id: <1528802295-11278-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 10/12] sqlite3: upgrade to 3.24.0
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
X-List-Received-Date: Tue, 12 Jun 2018 11:26:01 -0000

3.23.1 -> 3.24.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} (59%)

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


