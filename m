Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C9D897E093
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 08:04:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,547,1559491200"; d="scan'208";a="75988500"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Sep 2019 16:04:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D6CB4CE14F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 16:04:49 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 25 Sep 2019 16:04:50 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 16:04:44 +0800
Message-ID: <20190925080444.22289-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4D6CB4CE14F8.AE23E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] e2fsprogs:upgrade 1.45.3 -> 1.45.4
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
X-List-Received-Date: Wed, 25 Sep 2019 08:04:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../e2fsprogs/{e2fsprogs_1.45.3.bb => e2fsprogs_1.45.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.3.bb => e2fsprogs_1.45.4.bb} (99%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
index fdc9454..90db71d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
@@ -11,7 +11,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "1f56fb81236fe3e25e2c60c1e89ea0aa7cb36260"
+SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.7.4




