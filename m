Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A27BA6C42C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 09:29:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,295,1549900800"; d="scan'208";a="58199482"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 17:29:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C2C024CD77BB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 17:29:08 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 17:29:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 17:29:44 +0800
Message-ID: <20190401092944.13093-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: C2C024CD77BB.A93FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xtrans:upgrade 1.3.5 -> 1.4.0
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
X-List-Received-Date: Mon, 01 Apr 2019 09:29:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from xtrans_1.3.5.bb to xtrans_1.4.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{xtrans_1.3.5.bb => xtrans_1.4.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.5.bb => xtrans_1.4.0.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
index 200716fb02..5bf134b5f8 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
@@ -22,5 +22,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c5ba432dd1514d858053ffe9f4737dd8"
-SRC_URI[sha256sum] = "adbd3b36932ce4c062cd10f57d78a156ba98d618bdb6f50664da327502bc8301"
+SRC_URI[md5sum] = "ce2fb8100c6647ee81451ebe388b17ad"
+SRC_URI[sha256sum] = "377c4491593c417946efcd2c7600d1e62639f7a8bbca391887e2c4679807d773"
-- 
2.20.1




