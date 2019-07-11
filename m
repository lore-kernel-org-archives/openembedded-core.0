Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 56CF57ECA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 05:19:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,476,1557158400"; d="scan'208";a="71158393"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jul 2019 13:19:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6E8534B41EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 13:19:43 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 11 Jul 2019 13:19:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2019 13:18:56 +0800
Message-ID: <20190711051856.1785-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6E8534B41EDC.A8977
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sqlite3:upgrade 3.28.0 -> 3.29.0
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
X-List-Received-Date: Thu, 11 Jul 2019 05:19:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from sqlite3_3.28.0.bb to sqlite3_3.29.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.28.0.bb => sqlite3_3.29.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.28.0.bb => sqlite3_3.29.0.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.28.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3.28.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.29.0.bb
index 438a4ea..07e36be 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.28.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[md5sum] = "3c68eb400f8354605736cd55400e1572"
-SRC_URI[sha256sum] = "d61b5286f062adfce5125eaf544d495300656908e61fca143517afcc0a89b7c3"
+SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
+SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
-- 
2.7.4




