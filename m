Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 00F86787B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="12537593"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2018 06:04:15 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 139815803BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:14 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:47 +0200
Message-Id: <1516716352-32735-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 07/12] sqlite3: upgrade to version 3.22.0
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:28 -0000

Update SRC_URI for releases in 2018.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.21.0.bb | 10 ----------
 meta/recipes-support/sqlite/sqlite3_3.22.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.21.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.22.0.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.21.0.bb b/meta/recipes-support/sqlite/sqlite3_3.21.0.bb
deleted file mode 100644
index 1d51733..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.21.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "\
-  http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  "
-SRC_URI[md5sum] = "7913de4c3126ba3c24689cb7a199ea31"
-SRC_URI[sha256sum] = "d7dd516775005ad87a57f428b6f86afd206cb341722927f104d3f0cf65fbbbe3"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.22.0.bb b/meta/recipes-support/sqlite/sqlite3_3.22.0.bb
new file mode 100644
index 0000000..ef88659
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.22.0.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "\
+  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  "
+SRC_URI[md5sum] = "96b5648d542e8afa6ab7ffb8db8ddc3d"
+SRC_URI[sha256sum] = "2824ab1238b706bc66127320afbdffb096361130e23291f26928a027b885c612"
-- 
2.4.0


