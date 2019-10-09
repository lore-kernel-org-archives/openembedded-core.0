Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF2D7F440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 01:53:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,273,1566835200"; d="scan'208";a="76674972"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Oct 2019 09:53:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 919594CE14FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 09:53:01 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 09:53:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Oct 2019 09:53:04 +0800
Message-ID: <20191009015304.18573-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 919594CE14FE.AB348
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sqlite3:upgrade 3.29 -> 3.30
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
X-List-Received-Date: Wed, 09 Oct 2019 01:53:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.29.0.bb => sqlite3_3.30.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.29.0.bb => sqlite3_3.30.0.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.30.0.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3.29.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.30.0.bb
index 07e36be..feeee8a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.30.0.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
-SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
+SRC_URI[md5sum] = "84230638d5b80b61843e43b5efcb9e53"
+SRC_URI[sha256sum] = "e0a8cf4c7a87455e55e10413d16f358ca121ccec687fe1301eac95e2d340fc58"
-- 
2.7.4




