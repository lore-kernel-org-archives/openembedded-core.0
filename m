Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CE7D260616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 07:01:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20530367"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jun 2017 15:01:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5CCC2467021F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:01:25 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 27 Jun 2017 15:01:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jun 2017 15:01:06 +0800
Message-ID: <1498546866-6751-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 5CCC2467021F.A8156
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: susanbian <bianyq@cn.fujitsu.com>
Subject: [PATCH] sysstat:11.5.5 -> 11.5.6
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
X-List-Received-Date: Tue, 27 Jun 2017 07:01:28 -0000
Content-Type: text/plain

From: susanbian <bianyq@cn.fujitsu.com>

Upgrade sysstat from 11.5.5 to 11.5.6.

Signed-off-by: susanbian <bianyq@cn.fujitsu.com>
---
 .../recipes-extended/sysstat/{sysstat_11.5.5.bb => sysstat_11.5.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.5.bb => sysstat_11.5.6.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.5.5.bb b/meta/recipes-extended/sysstat/sysstat_11.5.6.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.5.5.bb
rename to meta/recipes-extended/sysstat/sysstat_11.5.6.bb
index 65c81e9..cdf9b12 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.5.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.5.6.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "f6072bcfd5d2b02f033722f863171d0f"
-SRC_URI[sha256sum] = "f4c5b333827cb588df1842d7a8f46947f486c95b305edbbce7565925e88e86c3"
+SRC_URI[md5sum] = "92735f1be44c676960b53ee28e3a4984"
+SRC_URI[sha256sum] = "83a81e0a6c1d39a0985310dc2944ac6214c963adb4dc8af24ae03a9ae8d0f3ac"
-- 
2.7.4




