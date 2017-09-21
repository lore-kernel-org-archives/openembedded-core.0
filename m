Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF6A77F4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 06:41:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,424,1500912000"; d="scan'208";a="27557126"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Sep 2017 14:41:30 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 24BA147CA56C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:41:29 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 21 Sep 2017 14:41:28 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 14:41:41 +0800
Message-ID: <1505976104-45895-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 24BA147CA56C.A87D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] hdparm: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 21 Sep 2017 06:41:31 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/hdparm/hdparm_9.52.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.52.bb b/meta/recipes-extended/hdparm/hdparm_9.52.bb
index 599cd30..49fdc94 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.52.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.52.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Utility for viewing/manipulating IDE disk drive/driver parameters"
+HOMEPAGE = "http://sourceforge.net/projects/hdparm/"
 DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
-- 
2.7.4




