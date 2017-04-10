Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 517166010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 09:01:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17553661"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Apr 2017 17:01:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9362547CE221
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 17:01:13 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 10 Apr 2017 17:01:17 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Apr 2017 17:01:15 +0800
Message-ID: <1491814875-961-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 9362547CE221.A43F9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] at-spi2-core: 2.22.0 -> 2.24.0
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
X-List-Received-Date: Mon, 10 Apr 2017 09:01:19 -0000
Content-Type: text/plain

Upgreade at-spi2-core from 2.22.0 to 2.24.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../atk/{at-spi2-core_2.22.0.bb => at-spi2-core_2.24.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.22.0.bb => at-spi2-core_2.24.0.bb} (88%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.22.0.bb b/meta/recipes-support/atk/at-spi2-core_2.24.0.bb
similarity index 88%
rename from meta/recipes-support/atk/at-spi2-core_2.22.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.24.0.bb
index 272849e..c3b0c48 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.22.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.24.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-build-Add-with-systemduserunitdir.patch \
           "
 
-SRC_URI[md5sum] = "3da5fe62a653e49dad1c47f9a46fee56"
-SRC_URI[sha256sum] = "415ea3af21318308798e098be8b3a17b2f0cf2fe16cecde5ad840cf4e0f2c80a"
+SRC_URI[md5sum] = "27598276ec58371a6254a4f8b949bf8c"
+SRC_URI[sha256sum] = "6179f314fbd903b3cd3477a57b6b1fecca88b76ce769ce777fda0d3e5f61afcd"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-- 
2.7.4




