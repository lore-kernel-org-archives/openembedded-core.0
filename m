Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4363C608A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 11:11:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,409,1574092800"; d="scan'208";a="82957620"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Feb 2020 19:11:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1F92850A9961
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 19:02:21 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 6 Feb 2020 19:11:34 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 6 Feb 2020 19:11:42 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Feb 2020 11:02:54 -0800
Message-ID: <1581015774-46438-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1F92850A9961.A1B4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mesa: upgrade 19.3.1 -> 19.3.3
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
X-List-Received-Date: Thu, 06 Feb 2020 11:11:52 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../mesa/{mesa-gl_19.3.1.bb => mesa-gl_19.3.3.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.3.1.bb => mesa_19.3.3.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.3.1.bb => mesa-gl_19.3.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.3.1.bb => mesa_19.3.3.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.3.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.3.1.bb b/meta/recipes-graphics/mesa/mesa_19.3.3.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_19.3.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.3.3.bb
index b889f092e3..7e0c5d6500 100644
--- a/meta/recipes-graphics/mesa/mesa_19.3.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.3.3.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[md5sum] = "5c5965db31993af47fee82c9a7ccba5e"
-SRC_URI[sha256sum] = "cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb8274723e033beae59"
+SRC_URI[md5sum] = "00010e0bb8f6641276ff6cb3e9386114"
+SRC_URI[sha256sum] = "81ce4810bb25d61300f8104856461f4d49cf7cb794aa70cb572312e370c39f09"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1




