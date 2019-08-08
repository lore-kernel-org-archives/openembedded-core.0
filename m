Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5447F32F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 05:56:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,360,1559491200"; d="scan'208";a="73200821"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Aug 2019 13:56:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 221F44CDFCF3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 13:56:33 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019 13:56:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 13:55:50 +0800
Message-ID: <20190808055550.10775-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 221F44CDFCF3.A94C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] man-db:upgrade 2.8.5 -> 2.8.6.1
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
X-List-Received-Date: Thu, 08 Aug 2019 05:56:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/man-db/{man-db_2.8.5.bb => man-db_2.8.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.5.bb => man-db_2.8.6.1.bb} (92%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.5.bb b/meta/recipes-extended/man-db/man-db_2.8.6.1.bb
similarity index 92%
rename from meta/recipes-extended/man-db/man-db_2.8.5.bb
rename to meta/recipes-extended/man-db/man-db_2.8.6.1.bb
index 441e2f4..ec9eb83 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.5.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.6.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[md5sum] = "c5c6c3434be14a5527d43b5ad0f09a13"
-SRC_URI[sha256sum] = "b64d52747534f1fe873b2876eb7f01319985309d5d7da319d2bc52ba1e73f6c1"
+SRC_URI[md5sum] = "22e82fe1127f4ca95de7100168a927d1"
+SRC_URI[sha256sum] = "2c77a2bb9dbf06f72417a6f63063e204888a22a5020ff77334d304d55f813a28"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
-- 
2.7.4




