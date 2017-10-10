Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 032367757F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:59:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,505,1500912000"; d="scan'208";a="28805785"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Oct 2017 20:59:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8C91348029C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:59:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 10 Oct 2017 20:59:37 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Oct 2017 20:59:31 +0800
Message-ID: <1507640372-934-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507640372-934-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1507640372-934-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 8C91348029C5.A52B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] at-spi2-atk: 2.24.1 -> 2.26.0
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
X-List-Received-Date: Tue, 10 Oct 2017 12:59:37 -0000
Content-Type: text/plain

Upgrade at-spi2-atk from 2.24.1 to 2.26.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../atk/{at-spi2-atk_2.24.1.bb => at-spi2-atk_2.26.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.24.1.bb => at-spi2-atk_2.26.0.bb} (83%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
similarity index 83%
rename from meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
index 4a0e411..0d53e58 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "79388fbc4dc7f27394556dd389aeb594"
-SRC_URI[sha256sum] = "60dc90ac4f74b8ffe96a9363c25208a443b381bacecfefea6de549f20ed6957d"
+SRC_URI[md5sum] = "555d4ca06a1b75c14db67bffac5f4d1f"
+SRC_URI[sha256sum] = "d25e528e1406a10c7d9b675aa15e638bcbf0a122ca3681f655a30cce83272fb9"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core"
 
-- 
2.7.4




