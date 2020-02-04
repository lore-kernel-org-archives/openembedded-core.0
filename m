Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3C8611F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 05:54:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:20 -0800
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="219629201"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.206])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 13:47:07 +0800
Message-Id: <20200204054707.913173-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204054707.913173-1-anuj.mittal@intel.com>
References: <20200204054707.913173-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] sqlite3: upgrade 3.30.1 -> 3.31.1
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
X-List-Received-Date: Tue, 04 Feb 2020 05:54:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.30.1.bb | 20 -------------------
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb | 12 +++++++++++
 2 files changed, 12 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.30.1.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.31.1.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.30.1.bb b/meta/recipes-support/sqlite/sqlite3_3.30.1.bb
deleted file mode 100644
index e055aca205..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.30.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://CVE-2019-19244.patch \
-           file://CVE-2019-19880.patch \
-           file://CVE-2019-19923.patch \
-           file://CVE-2019-19924.patch \
-           file://CVE-2019-19925.patch \
-           file://CVE-2019-19926.patch \
-           file://CVE-2019-19959.patch \
-           file://CVE-2019-20218.patch \
-           "
-SRC_URI[md5sum] = "51252dc6bc9094ba11ab151ba650ff3c"
-SRC_URI[sha256sum] = "8c5a50db089bd2a1b08dbc5b00d2027602ca7ff238ba7658fabca454d4298e60"
-
-# -19242 is only an issue in specific development branch commits
-CVE_CHECK_WHITELIST += "CVE-2019-19242"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
new file mode 100644
index 0000000000..903d66ab29
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -0,0 +1,12 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           "
+SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
+SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
+
+# -19242 is only an issue in specific development branch commits
+CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.24.1


