Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 014C87EC47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 06:14:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,244,1571673600"; d="scan'208";a="79078713"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Nov 2019 14:14:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9E86F4CE1BEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 14:06:26 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 26 Nov 2019 14:14:45 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2019 14:15:34 +0800
Message-ID: <20191126061534.23817-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 9E86F4CE1BEC.ADE65
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCHv3] cronie:upgrade 1.5.4 -> 1.5.5
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
X-List-Received-Date: Tue, 26 Nov 2019 06:14:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

-Added PACKAGECONFIG to solve compilation problems with musl.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} (93%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.4.bb b/meta/recipes-extended/cronie/cronie_1.5.5.bb
similarity index 93%
rename from meta/recipes-extended/cronie/cronie_1.5.4.bb
rename to meta/recipes-extended/cronie/cronie_1.5.5.bb
index d35c667..82cd428 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.4.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.5.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
-SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
+SRC_URI[md5sum] = "351a37d0b5bd0144816724b4482747ad"
+SRC_URI[sha256sum] = "be34c79505e5544323281854744b9955ff16b160ee569f9df7c0dddae5720eac"
 
 inherit autotools update-rc.d useradd systemd
 
@@ -34,6 +34,7 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
+PACKAGECONFIG[anacron] = "--enable-anacron,--disable-anacron,anacron"
 
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
-- 
2.7.4




