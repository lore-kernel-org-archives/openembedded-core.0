Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4426.1611812834231768125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 21:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103925872"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 13:46:45 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 82F824CE678B
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 13:46:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 13:46:42 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libjitterentropy: upgrade 3.0.0 -> 3.0.1
Date: Thu, 28 Jan 2021 13:46:18 +0800
Message-ID: <1611812778-10744-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 82F824CE678B.A13C2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libjitterentropy_3.0.0.bb => libjitterentropy_3.0.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.0.0.bb => libjitterentropy_3.0.1.bb} (88%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
similarity index 88%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.0.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
index 953ecfd055..197bb787ac 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.1.bb
@@ -5,12 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPLv2+ | BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb16b29576d4c43a9dcd6a40fb3310c7 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=c69090e97c8fd6372d03099c0a5bc382 \
                     file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
-SRCREV = "a37e57d9b939d1f93a1b92e1486edd44a3c1cb4c"
+SRCREV = "747bf030b0ea9c44548b4e29bcfab7ae416675fc"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.25.1



