Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 293F37F33A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 04:40:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,267,1571673600"; d="scan'208";a="79419804"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 12:40:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3496F4CE6F84
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 12:31:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 12:40:09 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Dec 2019 03:09:10 -0800
Message-ID: <1575284950-97542-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3496F4CE6F84.A6A1E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xkeyboard-config: 2.27 -> 2.28
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
X-List-Received-Date: Mon, 02 Dec 2019 04:40:07 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{xkeyboard-config_2.27.bb => xkeyboard-config_2.28.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.27.bb => xkeyboard-config_2.28.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
index 02156ad..7a3d694 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "316753e35d3906d042c74230612eab9f"
-SRC_URI[sha256sum] = "690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f"
+SRC_URI[md5sum] = "5a968ab77846ff85a04242410b2a61de"
+SRC_URI[sha256sum] = "69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.7.4




