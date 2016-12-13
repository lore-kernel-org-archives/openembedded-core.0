Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7067B71B29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 06:37:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13859109"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Dec 2016 14:37:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 56D504670486
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 14:37:00 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 13 Dec 2016 14:37:00 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 06:36:55 -0800
Message-ID: <1481639815-62811-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 56D504670486.A3057
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libxi: 1.7.7 -> 1.7.8
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
X-List-Received-Date: Tue, 13 Dec 2016 06:37:09 -0000
Content-Type: text/plain

Upgrade libxi from 1.7.7 to 1.7.8.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.7.bb => libxi_1.7.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.7.bb => libxi_1.7.8.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.8.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.8.bb
index 934de08..cc3e09e 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.8.bb
@@ -17,6 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "cc0883a898222d50ff79af3f83595823"
-SRC_URI[sha256sum] = "996f834fa57b9b33ba36690f6f5c6a29320bc8213022943912462d8015b1e030"
+SRC_URI[md5sum] = "94afc83e553d3c38a153f8f60301fd62"
+SRC_URI[sha256sum] = "d8f2fa8d53141c41ff521627df9b2fa9c05f6f142fd9881152bab36549ac27bb"
 
-- 
2.7.4




