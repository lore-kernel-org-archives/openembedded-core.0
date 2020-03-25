Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.3460.1585100617988134149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; 
   d="scan'208";a="87206055"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 09:43:43 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2F4CE406AB15
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 09:33:29 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 09:43:39 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 09:43:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 20.0.1 -> 20.0.2
Date: Tue, 24 Mar 2020 23:47:52 -0700
Message-ID: <1585118872-33976-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585118872-33976-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585118872-33976-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2F4CE406AB15.A22ED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../mesa/{mesa-gl_20.0.1.bb => mesa-gl_20.0.2.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_20.0.1.bb => mesa_20.0.2.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.0.1.bb => mesa-gl_20.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.0.1.bb => mesa_20.0.2.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_20.0.1.bb b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_20.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_20.0.2.bb
index e18c00b051..56ee28c870 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.2.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[md5sum] = "428ac511e4b05647a00b3778f1279da7"
-SRC_URI[sha256sum] = "6153ba3f8cb0524bbfc08e4db76b408126b2d1be8f789dffe28d1a0461eedde4"
+SRC_URI[md5sum] = "31ca59cd92c38cb8e1a58b62b01c3e08"
+SRC_URI[sha256sum] = "aa54f1cb669550606aab8ceb475105d15aeb814fca5a778ce70d0fd10e98e86f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1



