Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A33517E772
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:27:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="68016810"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 15:27:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C46AE4CDD988
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:27:35 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 15:27:38 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2019 15:28:58 +0800
Message-ID: <20190619072858.23162-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: C46AE4CDD988.AA702
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xkeyboard:upgrade 2.26 -> 2.27
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
X-List-Received-Date: Wed, 19 Jun 2019 07:27:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xkeyboard-config_2.26.bb to xkeyboard-config_2.27.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{xkeyboard-config_2.26.bb => xkeyboard-config_2.27.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.26.bb => xkeyboard-config_2.27.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.26.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.26.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
index 5c23288456..a6b2cc0eea 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.26.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.27.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e2e980629bfeb9f40a7d44488b18ba12"
-SRC_URI[sha256sum] = "393718c7460cd06c4e8cb819d943ca54812ea476f32714c4d8975c77031a038e"
+SRC_URI[md5sum] = "316753e35d3906d042c74230612eab9f"
+SRC_URI[sha256sum] = "690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.20.1




