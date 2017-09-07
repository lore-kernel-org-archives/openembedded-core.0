Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6F277D48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:05:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,357,1500912000"; d="scan'208";a="25382889"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Sep 2017 17:05:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6AD204727AA4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 17:05:09 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 7 Sep 2017 17:05:09 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Sep 2017 17:05:08 +0800
Message-ID: <1504775109-22042-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 6AD204727AA4.A5B9D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] diffutils: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 07 Sep 2017 09:05:15 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/diffutils/diffutils.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
index c81348b..7c5be50 100644
--- a/meta/recipes-extended/diffutils/diffutils.inc
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Diffutils contains tools used for finding differences between files"
+HOMEPAGE = "https://www.gnu.org/software/diffutils/diffutils.html"
 DESCRIPTION = "Diffutils contains the GNU diff, diff3, \
 sdiff, and cmp utilities. These programs are usually \
 used for creating patch files."
-- 
2.7.4




