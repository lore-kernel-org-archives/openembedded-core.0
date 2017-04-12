Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4626B71AB9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:09:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17635045"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Apr 2017 11:09:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F0A647DDB69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 11:09:36 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 12 Apr 2017 11:09:36 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Apr 2017 11:09:12 +0800
Message-ID: <1491966552-782-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 8F0A647DDB69.AA6DD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ed: 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 12 Apr 2017 03:09:47 -0000
Content-Type: text/plain

Upgrade ed from 1.14.1 to 1.14.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} (84%)

diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb b/meta/recipes-extended/ed/ed_1.14.2.bb
similarity index 84%
rename from meta/recipes-extended/ed/ed_1.14.1.bb
rename to meta/recipes-extended/ed/ed_1.14.2.bb
index 5d89a87..8cd9392 100644
--- a/meta/recipes-extended/ed/ed_1.14.1.bb
+++ b/meta/recipes-extended/ed/ed_1.14.2.bb
@@ -13,8 +13,8 @@ bindir = "${base_bindir}"
 
 SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
 
-SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
-SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
+SRC_URI[md5sum] = "273d04778b2a51f7c3cbfcd2001876bf"
+SRC_URI[sha256sum] = "f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.7.4




