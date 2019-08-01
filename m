Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0948A7F445
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 01:11:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,332,1559491200"; d="scan'208";a="72631024"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Aug 2019 09:11:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 857D54CDDAEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 09:11:20 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019 09:11:21 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Aug 2019 09:10:38 +0800
Message-ID: <20190801011038.4416-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 857D54CDDAEB.AA6AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libx11:upgrade 1.6.7 -> 1.6.8
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
X-List-Received-Date: Thu, 01 Aug 2019 01:11:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc                           | 4 ++--
 meta/recipes-graphics/xorg-lib/{libx11_1.6.7.bb => libx11_1.6.8.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.7.bb => libx11_1.6.8.bb} (100%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index ea2ebfb..53c9e43 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -10,8 +10,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 
 PE = "1"
 
-SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
-SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
+SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
+SRC_URI[sha256sum] = "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
 
 PROVIDES = "virtual/libx11"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
-- 
2.7.4




