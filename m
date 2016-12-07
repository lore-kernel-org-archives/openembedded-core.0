Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A668571984
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 09:18:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13688002"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Dec 2016 17:18:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 167BA46704A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 17:18:53 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 7 Dec 2016 17:18:53 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 09:18:39 -0800
Message-ID: <1481131119-52173-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 167BA46704A5.A1F92
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] pciutils: 3.5.1 -> 3.5.2
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
X-List-Received-Date: Wed, 07 Dec 2016 09:18:55 -0000
Content-Type: text/plain

Upgrade pciutils from 3.5.1 to 3.5.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.5.1.bb => pciutils_3.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.5.1.bb => pciutils_3.5.2.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
index d32b119..9a7297e 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.2.bb
@@ -13,8 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "0879a8f7ac51f4e874cfc6b3521a13cc"
-SRC_URI[sha256sum] = "2bf3a4605a562fb6b8b7673bff85a474a5cf383ed7e4bd8886b4f0939013d42f"
+SRC_URI[md5sum] = "1bf5b068bd9f7512e8c68b060b25a1b2"
+SRC_URI[sha256sum] = "3a99141a9f40528d0a0035665a06dc37ddb1ae341658e51b50a76ecf86235efc"
 
 inherit multilib_header
 
-- 
2.7.4




