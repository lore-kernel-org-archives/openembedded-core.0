Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E6C44773EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 15:19:24 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2016 07:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,384,1477983600"; d="scan'208";a="45405689"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 21 Dec 2016 07:19:05 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 348556A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 07:18:15 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:20:27 +0200
Message-Id: <1482333628-15689-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1482333628-15689-1-git-send-email-maxin.john@intel.com>
References: <1482333628-15689-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] sqlite3: upgrade to 3.15.2
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
X-List-Received-Date: Wed, 21 Dec 2016 15:19:25 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.15.1.bb => sqlite3_3.15.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.15.1.bb => sqlite3_3.15.2.bb} (66%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.15.1.bb b/meta/recipes-support/sqlite/sqlite3_3.15.2.bb
similarity index 66%
rename from meta/recipes-support/sqlite/sqlite3_3.15.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.15.2.bb
index c315a53..20bc515 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.15.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.15.2.bb
@@ -8,5 +8,5 @@ SRC_URI = "\
   file://0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch \
   "
 
-SRC_URI[md5sum] = "0259d52be88f085d104c6d2aaa8349ac"
-SRC_URI[sha256sum] = "5dfa89b7697ee3c2ac7b44e8e157e7f204bf999c866afcaa8bb1c7ff656ae2c5"
+SRC_URI[md5sum] = "6b4fc0d8f7f02dd56bbde10a7c497a05"
+SRC_URI[sha256sum] = "07b35063b9386865b78226cdaca9a299d938a87aaa8fdc4d73edb0cef30f3149"
-- 
2.4.0


