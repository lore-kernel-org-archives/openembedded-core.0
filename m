Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B53447F145
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 03:24:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,276,1559491200"; d="scan'208";a="71686595"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jul 2019 11:24:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F08374CDE8CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 11:24:42 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 18 Jul 2019 11:24:49 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jul 2019 11:23:58 +0800
Message-ID: <20190718032358.13358-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: F08374CDE8CC.AB2E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xwininfo:upgrade 1.1.4 -> 1.1.5
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
X-List-Received-Date: Thu, 18 Jul 2019 03:24:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xwininfo_1.1.4.bb to xwininfo_1.1.5.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xwininfo_1.1.4.bb => xwininfo_1.1.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.4.bb => xwininfo_1.1.5.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb
index 1fb90dd..ec9f082 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.5.bb
@@ -11,5 +11,5 @@ DEPENDS += "libxext libxmu gettext-native"
 
 PE = "0"
 
-SRC_URI[md5sum] = "9a505b91ae7160bbdec360968d060c83"
-SRC_URI[sha256sum] = "839498aa46b496492a5c65cd42cd2e86e0da88149b0672e90cb91648f8cd5b01"
+SRC_URI[md5sum] = "26d46f7ef0588d3392da3ad5802be420"
+SRC_URI[sha256sum] = "7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e"
-- 
2.7.4




