Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AC5E97F7E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 09:17:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,229,1571673600"; d="scan'208";a="78913203"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Nov 2019 17:17:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E41DF4CE1507
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 17:08:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 22 Nov 2019 17:17:03 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2019 08:22:59 -0800
Message-ID: <1574439782-29100-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: E41DF4CE1507.A6BD6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] cronie:upgrade 1.5.4 -> 1.5.5
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
X-List-Received-Date: Fri, 22 Nov 2019 09:17:04 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} (94%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.4.bb b/meta/recipes-extended/cronie/cronie_1.5.5.bb
similarity index 94%
rename from meta/recipes-extended/cronie/cronie_1.5.4.bb
rename to meta/recipes-extended/cronie/cronie_1.5.5.bb
index d35c667..b327381 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.4.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.5.bb
@@ -16,7 +16,7 @@ SECTION = "utils"
 
 UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
-SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
+SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
            file://crond.service \
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
-SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
+SRC_URI[md5sum] = "351a37d0b5bd0144816724b4482747ad"
+SRC_URI[sha256sum] = "be34c79505e5544323281854744b9955ff16b160ee569f9df7c0dddae5720eac"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.7.4




