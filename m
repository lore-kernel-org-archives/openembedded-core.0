Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BF15960BEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 12:28:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,413,1574092800"; d="scan'208";a="83001944"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Feb 2020 20:28:49 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A28B549DF14D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 20:19:17 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 7 Feb 2020 20:28:45 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 7 Feb 2020 20:28:47 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Feb 2020 12:27:55 -0800
Message-ID: <1581107275-6540-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A28B549DF14D.A51C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] pciutils: upgrade 3.6.2 -> 3.6.4
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
X-List-Received-Date: Fri, 07 Feb 2020 12:28:52 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../pciutils/{pciutils_3.6.2.bb => pciutils_3.6.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.6.2.bb => pciutils_3.6.4.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb b/meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
index 413421cd8a..034bb63dc9 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.6.4.bb
@@ -11,8 +11,8 @@ DEPENDS = "zlib kmod"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[md5sum] = "77963796d1be4f451b83e6da28ba4f82"
-SRC_URI[sha256sum] = "db452ec986edefd88af0d222d22f6102f8030a8633fdfe846c3ae4bde9bb93f3"
+SRC_URI[md5sum] = "4343b37e19f319ce8f3d59c30031790e"
+SRC_URI[sha256sum] = "f67ff732976e2db2a5ccdf3960020796526ba6b05f6b1cdd24b7b206af706055"
 
 inherit multilib_header pkgconfig
 
-- 
2.17.1




