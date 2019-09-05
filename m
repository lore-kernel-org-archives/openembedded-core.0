Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC8E7D39B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 05:53:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74874464"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 13:54:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E93D54CDFCE9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 13:53:57 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 13:54:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2019 13:53:26 +0800
Message-ID: <20190905055326.14859-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E93D54CDFCE9.AF33B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libogg:upgrade 1.3.3 -> 1.3.4
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
X-List-Received-Date: Thu, 05 Sep 2019 05:54:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-multimedia/libogg/{libogg_1.3.3.bb => libogg_1.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.3.bb => libogg_1.3.4.bb} (80%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.3.bb b/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
similarity index 80%
rename from meta/recipes-multimedia/libogg/libogg_1.3.3.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.4.bb
index 8d88f1f..8ca0010 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.3.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "87ed742047f065046eb6c36745d871b8"
-SRC_URI[sha256sum] = "4f3fc6178a533d392064f14776b23c397ed4b9f48f5de297aba73b643f955c08"
+SRC_URI[md5sum] = "eadef24aad6e3e8379ba0d14971fd64a"
+SRC_URI[sha256sum] = "c163bc12bc300c401b6aa35907ac682671ea376f13ae0969a220f7ddf71893fe"
 
 inherit autotools pkgconfig
-- 
2.7.4




