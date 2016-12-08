Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A2F9E6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 01:26:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13708264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2016 09:26:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 24B0246704A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 09:26:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 8 Dec 2016 09:26:34 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2016 09:25:56 +0800
Message-ID: <1481160356-9807-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 24B0246704A8.A4A25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] xkeyboard-config: 2.18 -> 2.19
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
X-List-Received-Date: Thu, 08 Dec 2016 01:26:29 -0000
Content-Type: text/plain

Upgrade xkeyboard-config from 2.18 to 2.19

Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{xkeyboard-config_2.18.bb => xkeyboard-config_2.19.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.18.bb => xkeyboard-config_2.19.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
index 79fcbd8..d24d93f 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
-SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a6ada824fdd1e9684b52dd48c9530617ddd0"
+SRC_URI[md5sum] = "88cbf55f2f32b80ba9bb872889daf7ff"
+SRC_URI[sha256sum] = "83dfd186b9eb9ced69e01d8d8e2f15b6a79b2e30124874ef086f2d3048f45827"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
2.7.4




