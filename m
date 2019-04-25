Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id ECDAA7D687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 02:34:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,392,1549900800"; d="scan'208";a="60496952"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Apr 2019 10:34:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E186B4CDAD99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 10:34:45 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 25 Apr 2019 10:34:51 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2019 10:35:37 +0800
Message-ID: <20190425023537.27791-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: E186B4CDAD99.AC660
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCHv2] mesa:upgrade 19.0.1 -> 19.0.3
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
X-List-Received-Date: Thu, 25 Apr 2019 02:34:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from mesa-gl_19.0.1.bb to mesa-gl_19.0.3.bb.

-Upgrade from mesa_19.0.1.bb to mesa_19.0.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.3.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.3.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.3.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.3.bb
index d90be8a074..585c3ede23 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
 "
 
-SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
-SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
+SRC_URI[md5sum] = "d03bf14e42c0e54ebae5730712ccc408"
+SRC_URI[sha256sum] = "f027244e38dc309a4c12db45ef79be81ab62c797a50a88d566e4edb6159fc4d5"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1




