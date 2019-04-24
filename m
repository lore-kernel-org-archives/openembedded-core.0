Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CBC1C7D565
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:19:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,388,1549900800"; d="scan'208";a="60365417"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 15:19:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 685AC4CDAABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:19:06 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 15:19:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Apr 2019 15:19:55 +0800
Message-ID: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 685AC4CDAABF.A9D37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mesa:upgrade 19.0.1 -> 19.0.2
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
X-List-Received-Date: Wed, 24 Apr 2019 07:19:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from mesa_19.0.1.bb to mesa_19.0.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.2.bb
index d90be8a074..e6646e8503 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
 "
 
-SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
-SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
+SRC_URI[md5sum] = "7f84af1c3fe2078c35a7a991d1469921"
+SRC_URI[sha256sum] = "1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1




