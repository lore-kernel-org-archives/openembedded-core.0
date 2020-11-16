Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.29892.1605497990995380086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 19:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; 
   d="scan'208";a="101403610"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Nov 2020 11:39:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4B5634CE34EF
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 11:39:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Nov 2020 11:39:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.102 -> 2.4.103
Date: Mon, 16 Nov 2020 23:39:27 +0800
Message-ID: <1605541167-86728-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4B5634CE34EF.A4835
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../drm/{libdrm_2.4.102.bb => libdrm_2.4.103.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.102.bb => libdrm_2.4.103.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.102.bb b/meta/recipes-graphics/drm/libdrm_2.4.103.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.102.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.103.bb
index ad512d14a9..1028d618ae 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.102.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.103.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \ 
-           file://0001-xf86drm.c-fix-build-failure.patch "
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b"
+SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1



