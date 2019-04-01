Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 37AA06C1BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 03:27:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,295,1549900800"; d="scan'208";a="58171509"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 11:27:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D8F74CD6C91
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:27:46 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 11:27:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 11:28:22 +0800
Message-ID: <20190401032822.27272-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 6D8F74CD6C91.AB400
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libxxf86dga:upgrade 1.1.4 -> 1.1.5
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
X-List-Received-Date: Mon, 01 Apr 2019 03:27:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from libxxf86dga_1.1.4.bb to libxxf86dga_1.1.5.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{libxxf86dga_1.1.4.bb => libxxf86dga_1.1.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86dga_1.1.4.bb => libxxf86dga_1.1.5.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
index 626199e09c..e1cb345658 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.5.bb
@@ -13,7 +13,7 @@ DEPENDS += "libxext"
 
 PE = "1"
 
-SRC_URI[md5sum] = "d7dd9b9df336b7dd4028b6b56542ff2c"
-SRC_URI[sha256sum] = "8eecd4b6c1df9a3704c04733c2f4fa93ef469b55028af5510b25818e2456c77e"
+SRC_URI[md5sum] = "0ddeafc13b33086357cfa96fae41ee8e"
+SRC_URI[sha256sum] = "2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203"
 
 XORG_PN = "libXxf86dga"
-- 
2.20.1




