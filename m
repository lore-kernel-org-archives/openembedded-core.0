Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 87BFA6011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:19:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13439357"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Nov 2016 09:19:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C3AD047AC8C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:19:39 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 30 Nov 2016 09:19:38 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2016 01:19:22 -0800
Message-ID: <1480497562-10241-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: C3AD047AC8C1.A89C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sqlite3: 3.14.1 -> 3.15.1
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
X-List-Received-Date: Wed, 30 Nov 2016 01:19:47 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade sqlite3 from 3.14.1 to 3.15.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.14.1.bb => sqlite3_3.15.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.14.1.bb => sqlite3_3.15.1.bb} (66%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.14.1.bb b/meta/recipes-support/sqlite/sqlite3_3.15.1.bb
similarity index 66%
rename from meta/recipes-support/sqlite/sqlite3_3.14.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.15.1.bb
index 7c8fa40..c315a53 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.14.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.15.1.bb
@@ -8,5 +8,5 @@ SRC_URI = "\
   file://0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch \
   "
 
-SRC_URI[md5sum] = "3634a90a3f49541462bcaed3474b2684"
-SRC_URI[sha256sum] = "bc7182476900017becb81565ecea7775d46ab747a97281aa610f4f45881c47a6"
+SRC_URI[md5sum] = "0259d52be88f085d104c6d2aaa8349ac"
+SRC_URI[sha256sum] = "5dfa89b7697ee3c2ac7b44e8e157e7f204bf999c866afcaa8bb1c7ff656ae2c5"
-- 
2.7.4




