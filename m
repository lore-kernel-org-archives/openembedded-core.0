Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 448846FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 07:13:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,483,1498492800"; d="scan'208";a="25271294"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Sep 2017 15:13:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C60AD4725555
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 15:13:52 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 6 Sep 2017 15:13:52 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Sep 2017 15:13:53 +0800
Message-ID: <1504682033-907-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: C60AD4725555.A3EE3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xdg-utils: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Wed, 06 Sep 2017 07:13:54 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
index 5007498..34f8d10 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Basic desktop integration functions"
-
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/xdg-utils/"
 DESCRIPTION = "The xdg-utils package is a set of simple scripts that provide basic \
 desktop integration functions for any Free Desktop, such as Linux. \
 They are intended to provide a set of defacto standards. \
-- 
2.7.4




