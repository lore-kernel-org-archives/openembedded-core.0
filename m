Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 380136D458
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:08:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,272,1569254400"; d="scan'208";a="77939591"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 15:08:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 383824CE1BE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:00:44 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019 15:08:48 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Nov 2019 15:09:06 +0800
Message-ID: <20191106070906.10141-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 383824CE1BE4.A8118
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libdrm:upgrade 2.4.99 -> 2.4.100
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
X-List-Received-Date: Wed, 06 Nov 2019 07:08:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../drm/{libdrm_2.4.99.bb => libdrm_2.4.100.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.99.bb => libdrm_2.4.100.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.99.bb b/meta/recipes-graphics/drm/libdrm_2.4.100.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.99.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.100.bb
index fa3eb08f40..4859425672 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.99.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.100.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
-SRC_URI[md5sum] = "72539626815b35159a63d45bc4c14ee6"
-SRC_URI[sha256sum] = "4dbf539c7ed25dbb2055090b77ab87508fc46be39a9379d15fed4b5517e1da5e"
+SRC_URI[md5sum] = "f47bc87e28198ba527e6b44ffdd62f65"
+SRC_URI[sha256sum] = "c77cc828186c9ceec3e56ae202b43ee99eb932b4a87255038a80e8a1060d0a5d"
 
 inherit meson pkgconfig manpages
 
-- 
2.20.1




