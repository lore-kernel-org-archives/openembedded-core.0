Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.31123.1611541250810563075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 18:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,372,1602518400"; 
   d="scan'208";a="103784303"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Jan 2021 10:20:38 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D4FDF4CE679F
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 10:20:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 25 Jan 2021 10:20:38 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 2/2] libdrm: upgrade 2.4.103 -> 2.4.104
Date: Mon, 25 Jan 2021 10:20:32 +0800
Message-ID: <1611541232-1991-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D4FDF4CE679F.A62F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.103.bb b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.103.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.104.bb
index 1028d618ae..e7007e1330 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.103.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
@@ -12,7 +12,7 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
+SRC_URI[sha256sum] = "d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb"
 
 inherit meson pkgconfig manpages
 
@@ -34,7 +34,7 @@ PACKAGECONFIG[valgrind] = "-Dvalgrind=true,-Dvalgrind=false,valgrind"
 PACKAGECONFIG[install-test-programs] = "-Dinstall-test-programs=true,-Dinstall-test-programs=false"
 PACKAGECONFIG[cairo-tests] = "-Dcairo-tests=true,-Dcairo-tests=false"
 PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,udev"
-PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native python3-docutils-native"
 
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-- 
2.25.1



