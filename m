Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 21C917F823
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 08:09:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,280,1571673600"; d="scan'208";a="79631631"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 16:09:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6C4F94CE1BED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 16:00:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Dec 2019 16:09:28 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2019 06:26:47 -0800
Message-ID: <1575556007-31713-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6C4F94CE1BED.A9C18
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] man-db: 2.8.7 -> 2.9.0
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
X-List-Received-Date: Thu, 05 Dec 2019 08:09:29 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/man-db/{man-db_2.8.7.bb => man-db_2.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.7.bb => man-db_2.9.0.bb} (92%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb b/meta/recipes-extended/man-db/man-db_2.9.0.bb
similarity index 92%
rename from meta/recipes-extended/man-db/man-db_2.8.7.bb
rename to meta/recipes-extended/man-db/man-db_2.9.0.bb
index 083b237..5b017e8 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
-SRC_URI[sha256sum] = "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
+SRC_URI[md5sum] = "897576a19ecbef376a916485608cd790"
+SRC_URI[sha256sum] = "5d4aacd9e8876d6a3203a889860c3524c293c38f04111a3350deab8a6cd3e261"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
-- 
2.7.4




