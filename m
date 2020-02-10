Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3A59660BCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:49:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,424,1574092800"; d="scan'208";a="83096240"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Feb 2020 17:49:47 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 290D1406AB15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:40:16 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 10 Feb 2020 17:49:48 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 10 Feb 2020 17:49:50 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2020 09:38:01 -0800
Message-ID: <1581356285-65315-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 290D1406AB15.A02BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xkeyboard-config: upgrade 2.28 -> 2.29
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
X-List-Received-Date: Mon, 10 Feb 2020 09:49:46 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{xkeyboard-config_2.28.bb => xkeyboard-config_2.29.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.28.bb => xkeyboard-config_2.29.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
index 7a3d694bd6..c8fa98e8d8 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5a968ab77846ff85a04242410b2a61de"
-SRC_URI[sha256sum] = "69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce"
+SRC_URI[md5sum] = "b5980bdc6c7d79f6dcccba8c76bb6c5d"
+SRC_URI[sha256sum] = "1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.17.1




