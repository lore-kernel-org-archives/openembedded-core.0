Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1321778856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 01:25:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37311869"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Feb 2018 09:25:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 780B348AE761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 09:25:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 28 Feb 2018 09:25:35 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Feb 2018 09:25:14 +0800
Message-ID: <1519781114-1825-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 780B348AE761.A6297
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mesa: 17.3.5 -> 17.3.6
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
X-List-Received-Date: Wed, 28 Feb 2018 01:25:41 -0000
Content-Type: text/plain

Upgrade mesa form 17.3.5 to 17.3.6.

Signed-off-by: HuangQiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_17.3.5.bb => mesa-gl_17.3.6.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.3.5.bb => mesa_17.3.6.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.5.bb => mesa-gl_17.3.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.5.bb => mesa_17.3.6.bb} (87%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.5.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.5.bb b/meta/recipes-graphics/mesa/mesa_17.3.6.bb
similarity index 87%
rename from meta/recipes-graphics/mesa/mesa_17.3.5.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.6.bb
index 3ce7135..1ace5fd 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.6.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
 
-SRC_URI[md5sum] = "bf73288c33cf12abe62045c25e2196b4"
-SRC_URI[sha256sum] = "eb9228fc8aaa71e0205c1481c5b157752ebaec9b646b030d27478e25a6d7936a"
+SRC_URI[md5sum] = "ba66ae0f09b9b84482268608557cd175"
+SRC_URI[sha256sum] = "e5915680d44ac9d05defdec529db7459ac9edd441c9845266eff2e2d3e57fbf8"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.7.4




