Received: from mail-bk0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TnnH7-0007xf-4I
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 10:28:14 +0100
Received: by mail-bk0-f44.google.com with SMTP id w11so3850394bku.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 01:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=hlE3ikF3LLdZxlDA3uu5ECZnLpAfXHhU4yHd4VT1gj4=;
	b=WCF5m1bnFOYkvmim7FjQOl1adYIAit2D7V7Q/50vq2wnKmDx6xSV8XSuBD/sSDZ8B+
	3fGQBqoEg9oxjI4/tXaTIeanQ1/geTx2nMONRX/P92mTEOiNdQGWgi5qYz5mRzwu5/T0
	qK0HNMxbs3gVwTmI6DeVktUID9GgGIrc/xKo2pTK4sFfz6uxzVK10xyRwYgLhoc1/NNR
	xG2dK+8Fiti/DZGUmSBv3ko9hR3gYpyBLNtEvPkem1Xe1lPlWgNUphFqtOJTRQqZbnR1
	0GMdFe/EwA7ficUT2jHfwFfw8PTCe51GdapkSkEMd4ypWu1nzcJnYkRKvwUAySKrdzbv
	2phA==
X-Received: by 10.204.12.203 with SMTP id y11mr13192882bky.27.1356513172504;
	Wed, 26 Dec 2012 01:12:52 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id i20sm18099405bkw.5.2012.12.26.01.12.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 01:12:51 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tnn2f-0005mE-9z; Wed, 26 Dec 2012 11:12:49 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2012 11:12:47 +0200
Message-Id: <1356513167-20389-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] sqlite: update to upstream version 3.7.15.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Dec 2012 09:28:14 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb |   11 -----------
 meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb |   13 +++++++++++++
 2 files changed, 13 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb b/meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb
deleted file mode 100644
index 3a60bfb..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.7.15.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sqlite3.inc
-
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-PR = "r0"
-
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071500.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-3071500"
-
-SRC_URI[md5sum] = "0d2a2d27b56ac73d49db76dcb6b4619c"
-SRC_URI[sha256sum] = "fee53abf5ce8f44ef37cdc734551d82295fc933f522911d371d3421ccd305d48"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb b/meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb
new file mode 100644
index 0000000..77530f2
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.15.1.bb
@@ -0,0 +1,13 @@
+require sqlite3.inc
+
+SQLITE_VERSTR = "3071501"
+
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+PR = "r0"
+
+SRC_URI = "http://www.sqlite.org/sqlite-autoconf-${SQLITE_VERSTR}.tar.gz"
+S = "${WORKDIR}/sqlite-autoconf-${SQLITE_VERSTR}"
+
+SRC_URI[md5sum] = "a67c25afa199a11f0a37aff7ed9d2c14"
+SRC_URI[sha256sum] = "e8809bd9a292be777f76c97c7e77ab41f7d1020776ded5a631da3985b4b26afd"
-- 
1.7.10.4



