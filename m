Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 67604615CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:29:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,462,1574092800"; d="scan'208";a="83594390"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Feb 2020 10:29:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6F46950A9975
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:19:49 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 20 Feb 2020 10:29:28 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 20 Feb 2020 10:29:34 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 01:41:25 -0800
Message-ID: <1582191685-130859-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6F46950A9975.A2484
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mesa: upgrade 19.3.3 -> 19.3.4
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
X-List-Received-Date: Thu, 20 Feb 2020 02:29:32 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../mesa/{mesa-gl_19.3.3.bb => mesa-gl_19.3.4.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.3.3.bb => mesa_19.3.4.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.3.3.bb => mesa-gl_19.3.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.3.3.bb => mesa_19.3.4.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.3.3.bb b/meta/recipes-graphics/mesa/mesa-gl_19.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.3.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.3.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.3.3.bb b/meta/recipes-graphics/mesa/mesa_19.3.4.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_19.3.3.bb
rename to meta/recipes-graphics/mesa/mesa_19.3.4.bb
index 7e0c5d6500..5f456c2429 100644
--- a/meta/recipes-graphics/mesa/mesa_19.3.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.3.4.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[md5sum] = "00010e0bb8f6641276ff6cb3e9386114"
-SRC_URI[sha256sum] = "81ce4810bb25d61300f8104856461f4d49cf7cb794aa70cb572312e370c39f09"
+SRC_URI[md5sum] = "09e7700d9af511384d131fb77b5802cb"
+SRC_URI[sha256sum] = "1da467e6ae2799a517e242462331eafd29ae77d9872f3a845df81f7c308e8fe4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1




