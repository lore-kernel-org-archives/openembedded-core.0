Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 82E0C71987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 07:05:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13452230"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Nov 2016 15:05:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 414C347AC8CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 15:05:50 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 30 Nov 2016 15:05:49 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2016 07:05:34 -0800
Message-ID: <1480518334-11500-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 414C347AC8CB.A6D4D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] man-pages: 4.07 -> 4.08
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
X-List-Received-Date: Wed, 30 Nov 2016 07:05:56 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade man-pages from 4.07 to 4.08.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../man-pages/{man-pages_4.07.bb => man-pages_4.08.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.07.bb => man-pages_4.08.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.07.bb b/meta/recipes-extended/man-pages/man-pages_4.08.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.07.bb
rename to meta/recipes-extended/man-pages/man-pages_4.08.bb
index 76a3fd8..8fc6cb0 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.07.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.08.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "05ba1cb21e99d02bd7bc1a59378965d2"
-SRC_URI[sha256sum] = "c973351131931f7700f5e9fbf4ef366c43ea7c1515d282e8d5db9c77590c4c93"
+SRC_URI[md5sum] = "88760ffa6cf92495327758b828850015"
+SRC_URI[sha256sum] = "1fa6529ab2784e7db2a498feb2c5307f4afb87dff0e3321e5964265e2e8433fd"
 
 RDEPENDS_${PN} = "man"
 
-- 
2.7.4




