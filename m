Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.6990.1613732762125727807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 03:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,189,1610380800"; 
   d="scan'208";a="104643992"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Feb 2021 19:06:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3B2374CE6F9E
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 19:06:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 19 Feb 2021 19:05:49 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] xkeyboard-config: upgrade 2.31 -> 2.32
Date: Fri, 19 Feb 2021 19:05:45 +0800
Message-ID: <1613732745-5747-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1613732745-5747-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1613732745-5747-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 3B2374CE6F9E.A2B0F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{xkeyboard-config_2.31.bb => xkeyboard-config_2.32.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.31.bb => xkeyboard-config_2.32.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb
index ad150544e1..daa07a4d02 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "da44181f2c8828789c720decf7d13acb3c3950e2a040af5132f50f04bb6aada3"
+SRC_URI[sha256sum] = "1feee317ba39b91902b0cbd2987c0c73e6afbfc8f4c096367a5c86c216c036a8"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.25.1



