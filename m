Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 757CC71BF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 11:19:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="33090647"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Dec 2017 19:19:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D4E948AE9FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 19:19:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 27 Dec 2017 19:19:36 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Dec 2017 19:19:40 +0800
Message-ID: <1514373580-2837-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 4D4E948AE9FB.A8EA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] at-spi2-atk: 2.26.0 -> 2.26.1
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
X-List-Received-Date: Wed, 27 Dec 2017 11:19:42 -0000
Content-Type: text/plain

Upgrade at-spi2-atk from 2.26.0 to 2.26.1

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../atk/{at-spi2-atk_2.26.0.bb => at-spi2-atk_2.26.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.26.0.bb => at-spi2-atk_2.26.1.bb} (83%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.26.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.26.1.bb
similarity index 83%
rename from meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.26.1.bb
index 0d53e58..8617bb8 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.26.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "555d4ca06a1b75c14db67bffac5f4d1f"
-SRC_URI[sha256sum] = "d25e528e1406a10c7d9b675aa15e638bcbf0a122ca3681f655a30cce83272fb9"
+SRC_URI[md5sum] = "eeec6cead3350dca48a235271c105b3e"
+SRC_URI[sha256sum] = "b4f0c27b61dbffba7a5b5ba2ff88c8cee10ff8dac774fa5b79ce906853623b75"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core"
 
-- 
2.7.4




