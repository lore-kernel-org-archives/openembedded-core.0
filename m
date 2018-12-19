Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F007D7BFBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597359"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:24 +0800
Message-Id: <20181219072929.5870-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219072929.5870-1-anuj.mittal@intel.com>
References: <20181219072929.5870-1-anuj.mittal@intel.com>
Subject: [PATCH 4/9] sqlite3: upgrade 3.25.3 -> 3.26.0
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:34 -0000

For changes, see:

https://www.sqlite.org/releaselog/3_26_0.html

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.25.3.bb => sqlite3_3.26.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.25.3.bb => sqlite3_3.26.0.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.25.3.bb b/meta/recipes-support/sqlite/sqlite3_3.26.0.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.25.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.26.0.bb
index a7cf6d1b81..a0d615bac1 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.25.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.26.0.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "06db8206bc8febf07141b78ad58595ea"
-SRC_URI[sha256sum] = "00ebf97be13928941940cc71de3d67e9f852698233cd98ce2d178fd08092f3dd"
+SRC_URI[md5sum] = "ac2b3b8cd3a97600e36fb8e756e8dda1"
+SRC_URI[sha256sum] = "5daa6a3fb7d1e8c767cd59c4ded8da6e4b00c61d3b466d0685e35c4dd6d7bf5d"
-- 
2.17.1


