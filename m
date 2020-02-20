Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 38986615E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:29:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,462,1574092800"; d="scan'208";a="83594377"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Feb 2020 10:29:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0E3DA50A9976
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:19:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 20 Feb 2020 10:29:17 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 20 Feb 2020 10:29:24 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 01:41:16 -0800
Message-ID: <1582191676-130817-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 0E3DA50A9976.A6608
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] man-pages: upgrade 5.04 -> 5.05
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
X-List-Received-Date: Thu, 20 Feb 2020 02:29:19 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../man-pages/{man-pages_5.04.bb => man-pages_5.05.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.04.bb => man-pages_5.05.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.04.bb b/meta/recipes-extended/man-pages/man-pages_5.05.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_5.04.bb
rename to meta/recipes-extended/man-pages/man-pages_5.05.bb
index be456759fc..b95872eb4d 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.04.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.05.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "14d33d3fe02577a33aab26eb75df39cb"
-SRC_URI[sha256sum] = "8c6ab56b654a6dd00e3759279954a25fc68b258b8f493a75af55ea7b6401fdb2"
+SRC_URI[md5sum] = "cdad5deb15117e60a6d9e3a6bdc035b5"
+SRC_URI[sha256sum] = "43c33d2eea9ba989c18eef90298cf6d5521ff038deb51cda0ecd0fdc3cec2b7d"
 
 inherit manpages
 
-- 
2.17.1




