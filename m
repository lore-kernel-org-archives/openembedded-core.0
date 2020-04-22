Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.86.1587557003311603432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 05:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; 
   d="scan'208";a="89494641"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 20:03:21 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C1924BCC882
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 19:52:41 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 20:03:16 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 20:03:24 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] xkeyboard-config: upgrade 2.28 -> 2.29
Date: Wed, 22 Apr 2020 13:02:57 -0700
Message-ID: <20200422200258.84579-3-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
References: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3C1924BCC882.A3843
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{xkeyboard-config_2.28.bb => xkeyboard-config_2.29.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.28.bb => xkeyboard-config_2.29.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
index 7a3d694bd6..c8fa98e8d8 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.28.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5a968ab77846ff85a04242410b2a61de"
-SRC_URI[sha256sum] = "69adb25b0fc64e4075f8ec0eab8d869892419f474f91fb69db1713de2062bdce"
+SRC_URI[md5sum] = "b5980bdc6c7d79f6dcccba8c76bb6c5d"
+SRC_URI[sha256sum] = "1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.17.1



