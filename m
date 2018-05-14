Return-Path: <peter.marko@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4265774AD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 11:01:44 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w4EB1i8q003359
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 13:01:45 +0200
Received: from dev-6.vm6.ccp.siemens.com ([163.242.56.239])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w4EB1i2E008303;
	Mon, 14 May 2018 13:01:44 +0200
Received: from dev-6.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev-6.vm6.ccp.siemens.com (Postfix) with ESMTP id 5548650CCA9;
	Mon, 14 May 2018 13:01:44 +0200 (CEST)
From: "Marko, Peter" <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 13:01:18 +0200
Message-Id: <20180514110118.31869-1-peter.marko@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] sqlite3: upgrade 3.23.0 -> 3.23.1
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
X-List-Received-Date: Mon, 14 May 2018 11:01:45 -0000

Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.23.0.bb => sqlite3_3.23.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.23.0.bb => sqlite3_3.23.1.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.0.bb b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.23.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.23.1.bb
index 1b7ae9a45d..3755761d76 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.23.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "6a26a122a18bcd1a6a1c18b4bad64498"
-SRC_URI[sha256sum] = "b7711a1800a071674c2bf76898ae8584fc6c9643cfe933cfc1bc54361e3a6e49"
+SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
+SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
-- 
2.11.0


