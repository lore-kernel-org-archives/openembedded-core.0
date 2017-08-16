Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54FE9785EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 05:58:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7G5wajb005415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:58:36 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 22:58:36 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 22:58:36 -0700
Message-ID: <20170816055836.29912-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] sqlite3: upgrade to 3.2.0
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
X-List-Received-Date: Wed, 16 Aug 2017 05:58:36 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* Uprev from 3.19.3 to 3.2.0 for fixing CVE-2017-10989:

The getNodeSize function in ext/rtree/rtree.c in SQLite through 3.19.3,
as used in GDAL and other products, mishandles undersized RTree blobs
in a crafted database, leading to a heap-based buffer over-read or
possibly unspecified other impact.

https://nvd.nist.gov/vuln/detail/CVE-2017-10989

* LIC_FILES_CHKSUM updated for below changes:

  -** 2001 September 15
  +** 2001-09-15

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-support/sqlite/{sqlite3_3.19.3.bb => sqlite3_3.20.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.19.3.bb => sqlite3_3.20.0.bb} (34%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.19.3.bb b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
similarity index 34%
rename from meta/recipes-support/sqlite/sqlite3_3.19.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.20.0.bb
index 89d439530f..417c36202d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.19.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
@@ -1,10 +1,10 @@
 require sqlite3.inc
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "c93070d5bf136ce271db23d2dfbc2435"
-SRC_URI[sha256sum] = "06129c03dced9f87733a8cba408871bd60673b8f93b920ba8d815efab0a06301"
+SRC_URI[md5sum] = "e262a28b73cc330e7e83520c8ce14e4d"
+SRC_URI[sha256sum] = "3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0"
-- 
2.13.0


