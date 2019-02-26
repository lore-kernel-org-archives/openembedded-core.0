Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B31647CAC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 03:17:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,413,1544457600"; d="scan'208";a="55247663"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2019 11:17:02 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E342047241AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 11:16:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 26 Feb 2019 11:17:10 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2019 11:18:16 +0800
Message-ID: <20190226031816.18160-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: E342047241AB.AA624
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] sqlite3:upgrade to 3.27.2
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
X-List-Received-Date: Tue, 26 Feb 2019 03:17:04 -0000
Content-Type: text/plain

Upgrade sqlite from 3.26.0 to 3.27.2.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-support/sqlite/sqlite3_3.26.0.bb | 10 ----------
 meta/recipes-support/sqlite/sqlite3_3.27.2.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.26.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.27.2.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.26.0.bb b/meta/recipes-support/sqlite/sqlite3_3.26.0.bb
deleted file mode 100644
index a0d615bac1..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.26.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "\
-  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  "
-SRC_URI[md5sum] = "ac2b3b8cd3a97600e36fb8e756e8dda1"
-SRC_URI[sha256sum] = "5daa6a3fb7d1e8c767cd59c4ded8da6e4b00c61d3b466d0685e35c4dd6d7bf5d"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.27.2.bb b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
new file mode 100644
index 0000000000..294a546ab5
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.27.2.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "\
+  http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  "
+SRC_URI[md5sum] = "1f72631ce6e8efa5b4a6e55a43b3bdc0"
+SRC_URI[sha256sum] = "50c39e85ea28b5ecfdb3f9e860afe9ba606381e21836b2849efca6a0bfe6ef6e"
-- 
2.17.2




