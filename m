Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A7C926BEF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:36:15 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Mon, 2 Sep 2013
	13:36:11 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id B693028B833;
	Mon,  2 Sep 2013 13:36:11 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Sep 2013 13:36:10 +0200
Message-ID: <1378121770-55045-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] sqlite3: update to version 3.8.0.1
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
X-List-Received-Date: Mon, 02 Sep 2013 11:36:16 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Upgrade to latest version 3.8.0.1

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/sqlite/sqlite3_3071700.bb |   10 ----------
 meta/recipes-support/sqlite/sqlite3_3080001.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3071700.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3080001.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3071700.bb b/meta/recipes-support/sqlite/sqlite3_3071700.bb
deleted file mode 100644
index 113e8ce..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3071700.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "18c285053e9562b848209cb0ee16d4ab"
-SRC_URI[sha256sum] = "8ff46d0baa9e64c0815544e829e985f1161c096aa6344c8f430791dbeadc2baf"
-
-S = "${WORKDIR}/sqlite-autoconf-${PV}"
diff --git a/meta/recipes-support/sqlite/sqlite3_3080001.bb b/meta/recipes-support/sqlite/sqlite3_3080001.bb
new file mode 100644
index 0000000..692e56a
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3080001.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ee32c96e5db6c6d651c7c9b71082cf7c"
+SRC_URI[sha256sum] = "1d92ccfca5629701b207e57e86fdf0a01d8dca61c60e1246f92ec8d87408cf36"
+
+S = "${WORKDIR}/sqlite-autoconf-${PV}"
-- 
1.7.10.4


