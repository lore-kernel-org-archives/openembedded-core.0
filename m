Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id E4A6F60657
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 12:45:23 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2013 13:45:12 +0100
Message-Id: <1369226712-22786-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.3
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] sqlite3: update to 3.7.17
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
X-List-Received-Date: Wed, 22 May 2013 12:45:24 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

build and runtime tested on armv7a

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-support/sqlite/{sqlite3_3071602.bb => sqlite3_3071700.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3071602.bb => sqlite3_3071700.bb} (60%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3071602.bb b/meta/recipes-support/sqlite/sqlite3_3071700.bb
similarity index 60%
rename from meta/recipes-support/sqlite/sqlite3_3071602.bb
rename to meta/recipes-support/sqlite/sqlite3_3071700.bb
index 09f54f6..113e8ce 100644
--- a/meta/recipes-support/sqlite/sqlite3_3071602.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3071700.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ce7d2bc0d9b8dd18995b888c6b0b220f"
-SRC_URI[sha256sum] = "1d7e6937c19fc5de1c0cdb392638296e4a6d8b158001dbb421e257dfb6f088db"
+SRC_URI[md5sum] = "18c285053e9562b848209cb0ee16d4ab"
+SRC_URI[sha256sum] = "8ff46d0baa9e64c0815544e829e985f1161c096aa6344c8f430791dbeadc2baf"
 
 S = "${WORKDIR}/sqlite-autoconf-${PV}"
-- 
1.8.2.3


