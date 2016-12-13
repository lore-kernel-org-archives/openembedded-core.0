Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DF7996025F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 03:31:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13853778"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Dec 2016 11:31:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 147254670486
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 11:31:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 13 Dec 2016 11:31:34 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 11:30:39 +0800
Message-ID: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 147254670486.A4FF5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 13 Dec 2016 03:31:42 -0000
Content-Type: text/plain

Upgrade util-linux from 2.28.1 to 2.29

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../util-linux/{util-linux_2.28.1.bb => util-linux_2.29.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.28.1.bb => util-linux_2.29.bb} (84%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.28.1.bb b/meta/recipes-core/util-linux/util-linux_2.29.bb
similarity index 84%
rename from meta/recipes-core/util-linux/util-linux_2.28.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.29.bb
index f232cb9..80638bd 100644
--- a/meta/recipes-core/util-linux/util-linux_2.28.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.29.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.28"
+MAJOR_VERSION = "2.29"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -16,8 +16,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
             file://uuid-test-error-api.patch \
 "
-SRC_URI[md5sum] = "e2d863efaf4fd330a42c5efe9f1b02b4"
-SRC_URI[sha256sum] = "3ece4ea4a34ef786b68f5c415e848390424232abd1ee00f7ee5bddc30657b60f"
+SRC_URI[md5sum] = "07b6845f48a421ad5844aa9d58edb837"
+SRC_URI[sha256sum] = "2c59ea67cc7b564104f60532f6e0a95fe17a91acb870ba8fd7e986f273abf9e7"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
2.7.4




