Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DE54D77302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 02:37:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14118840"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Dec 2016 10:37:35 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0C6DB477B1E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 10:37:34 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 21 Dec 2016 10:37:33 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2016 02:37:22 -0800
Message-ID: <1482316642-14646-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 0C6DB477B1E5.A87B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] file: 5.28 -> 5.29
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
X-List-Received-Date: Wed, 21 Dec 2016 02:37:41 -0000
Content-Type: text/plain

Upgrade file from 5.28 to 5.29.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/file/{file_5.28.bb => file_5.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.28.bb => file_5.29.bb} (96%)

diff --git a/meta/recipes-devtools/file/file_5.28.bb b/meta/recipes-devtools/file/file_5.29.bb
similarity index 96%
rename from meta/recipes-devtools/file/file_5.28.bb
rename to meta/recipes-devtools/file/file_5.29.bb
index e64a89c..29af874 100644
--- a/meta/recipes-devtools/file/file_5.28.bb
+++ b/meta/recipes-devtools/file/file_5.29.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://0001-Add-P-prompt-into-Usage-info.patch \
         "
 
-SRCREV = "3c521817322a6bf5160cfeb09b9145ccde587b2a"
+SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4




