Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 427006057A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2016 09:51:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10345741"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2016 17:51:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4FEE042EB270
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2016 17:51:48 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sat, 27 Aug 2016 17:51:48 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Aug 2016 05:51:43 -0400
Message-ID: <1472291503-1650-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 4FEE042EB270.A6CC6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] qemu: 2.6.0 -> 2.6.1
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
X-List-Received-Date: Sat, 27 Aug 2016 09:51:52 -0000
Content-Type: text/plain

Upgrade qemu from 2.6.0 to 2.6.1.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/qemu/{qemu_2.6.0.bb => qemu_2.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_2.6.0.bb => qemu_2.6.1.bb} (85%)

diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.1.bb
similarity index 85%
rename from meta/recipes-devtools/qemu/qemu_2.6.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.6.1.bb
index c4a0435..f60775e 100644
--- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.6.1.bb
@@ -13,8 +13,8 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
-SRC_URI[sha256sum] = "c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec"
+SRC_URI[md5sum] = "6a183b192018192943b6781e1bb9b72f"
+SRC_URI[sha256sum] = "4942fd1b6ee31f2f55ffc2201dd7397e6b9c55a2ef332e6d660c730d268e08d1"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.7.4




