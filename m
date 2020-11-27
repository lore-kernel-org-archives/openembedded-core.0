Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.16218.1606465925441192169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 00:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101815570"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 16:31:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A77C64CE5CDD
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 16:31:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 16:31:41 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libxkbcommon: upgrade 1.0.1 -> 1.0.3
Date: Fri, 27 Nov 2020 16:31:39 +0800
Message-ID: <1606465899-123573-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A77C64CE5CDD.A41FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.0.1.bb => libxkbcommon_1.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.0.1.bb => libxkbcommon_1.0.3.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
index fc35bc613b..99f55f4a14 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
@@ -9,7 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ab68b25341c99f2218d7cf3dad459c1827f411219901ade05bbccbdb856b6c8d"
+SRC_URI[sha256sum] = "a2202f851e072b84e64a395212cbd976ee18a8ee602008b0bad02a13247dbc52"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.25.1



