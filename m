Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1947ED6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 06:24:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,493,1557158400"; d="scan'208";a="71447651"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jul 2019 14:24:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 322AF4CDDD3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 14:24:03 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 15 Jul 2019 14:24:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2019 14:23:28 +0800
Message-ID: <20190715062328.18161-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 322AF4CDDD3D.A9D4A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xauth:upgrade 1.0.10 -> 1.1
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
X-List-Received-Date: Mon, 15 Jul 2019 06:24:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xauth_1.0.10.bb to xauth_1.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/xorg-app/{xauth_1.0.10.bb => xauth_1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.10.bb => xauth_1.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.10.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-app/xauth_1.0.10.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.bb
index 0e90ffd..24ad960 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
-SRC_URI[md5sum] = "f3f76cb10f69b571c43893ea6a634aa4"
-SRC_URI[sha256sum] = "5afe42ce3cdf4f60520d1658d2b17face45c74050f39af45dccdc95e73fafc4d"
+SRC_URI[md5sum] = "e50587c1bb832aafd1a19d91a0890a0b"
+SRC_URI[sha256sum] = "6d1dd1b79dd185107c5b0fdd22d1d791ad749ad6e288d0cdf80964c4ffa7530c"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4




