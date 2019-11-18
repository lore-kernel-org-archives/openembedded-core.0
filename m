Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id BC74A7F8CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:52:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:52:03 -0800
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; d="scan'208";a="196061712"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.67.150])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:52:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:51:47 +0800
Message-Id: <20191118085149.19903-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191118085149.19903-1-anuj.mittal@intel.com>
References: <20191118085149.19903-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] sqlite3: upgrade 3.30.0 -> 3.30.1
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
X-List-Received-Date: Mon, 18 Nov 2019 08:52:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.30.0.bb => sqlite3_3.30.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.30.0.bb => sqlite3_3.30.1.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.30.0.bb b/meta/recipes-support/sqlite/sqlite3_3.30.1.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3.30.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.30.1.bb
index feeee8af02..f18eeb19ed 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.30.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.30.1.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[md5sum] = "84230638d5b80b61843e43b5efcb9e53"
-SRC_URI[sha256sum] = "e0a8cf4c7a87455e55e10413d16f358ca121ccec687fe1301eac95e2d340fc58"
+SRC_URI[md5sum] = "51252dc6bc9094ba11ab151ba650ff3c"
+SRC_URI[sha256sum] = "8c5a50db089bd2a1b08dbc5b00d2027602ca7ff238ba7658fabca454d4298e60"
-- 
2.21.0


