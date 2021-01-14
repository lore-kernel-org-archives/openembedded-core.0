Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.5485.1610615000836776545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 01:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,346,1602518400"; 
   d="scan'208";a="103475382"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Jan 2021 17:03:03 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 186874CE602D
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 17:03:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 Jan 2021 17:03:02 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.103 -> 2.4.104
Date: Thu, 14 Jan 2021 17:02:57 +0800
Message-ID: <1610614977-24935-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 186874CE602D.A577A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.103.bb b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.103.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.104.bb
index 1028d618ae..90b7150835 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.103.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
@@ -12,7 +12,7 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
+SRC_URI[sha256sum] = "d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1



