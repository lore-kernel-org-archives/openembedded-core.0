Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 705B87F2BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 02:53:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,461,1559491200"; d="scan'208";a="74738320"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Sep 2019 10:53:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 63F284CE14E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 10:53:49 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Sep 2019 10:53:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2019 10:53:17 +0800
Message-ID: <20190903025317.16475-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 63F284CE14E6.A9D82
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] logrotate:upgrade 3.15.0 -> 3.15.1
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
X-List-Received-Date: Tue, 03 Sep 2019 02:53:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../logrotate/{logrotate_3.15.0.bb => logrotate_3.15.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.15.0.bb => logrotate_3.15.1.bb} (96%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.15.0.bb b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
similarity index 96%
rename from meta/recipes-extended/logrotate/logrotate_3.15.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.15.1.bb
index 0f3da2b..7c7d51b 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.15.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[md5sum] = "320046f0b9fc38337e8827d4c5a866a0"
-SRC_URI[sha256sum] = "313612c4776a305393454c874ef590d8acf84c9ffa648717731dfe902284ff8f"
+SRC_URI[md5sum] = "afe109afea749c306ff489203fde6beb"
+SRC_URI[sha256sum] = "491fec9e89f1372f02a0ab66579aa2e9d63cac5178dfa672c204c88e693a908b"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.7.4




