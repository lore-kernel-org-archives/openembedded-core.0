Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 72BDD7D251
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:03:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,446,1559491200"; d="scan'208";a="74578351"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Aug 2019 17:03:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6EB9F4CE089C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 17:03:42 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 30 Aug 2019 17:03:45 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2019 18:03:26 +0900
Message-ID: <20190830090326.19091-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 6EB9F4CE089C.A1364
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] man-db: upgrade 2.8.6.1 -> 2.8.7
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
X-List-Received-Date: Fri, 30 Aug 2019 09:03:46 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../man-db/{man-db_2.8.6.1.bb => man-db_2.8.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.6.1.bb => man-db_2.8.7.bb} (92%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.6.1.bb b/meta/recipes-extended/man-db/man-db_2.8.7.bb
similarity index 92%
rename from meta/recipes-extended/man-db/man-db_2.8.6.1.bb
rename to meta/recipes-extended/man-db/man-db_2.8.7.bb
index ec9eb8385b..bdf340ae74 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.6.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.7.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "22e82fe1127f4ca95de7100168a927d1"
-SRC_URI[sha256sum] = "2c77a2bb9dbf06f72417a6f63063e204888a22a5020ff77334d304d55f813a28"
+SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
+SRC_URI[sha256sum] = "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
-- 
2.17.1




