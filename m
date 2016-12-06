Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AA405719B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 15:05:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13658154"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Dec 2016 23:05:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id B239B467048A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 23:05:19 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 6 Dec 2016 23:05:19 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2016 15:05:05 -0800
Message-ID: <1481065505-49663-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: B239B467048A.A5069
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] less: 481 -> 487
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
X-List-Received-Date: Tue, 06 Dec 2016 15:05:22 -0000
Content-Type: text/plain

Upgrade less from 481 to 487.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/less/{less_481.bb => less_487.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/less/{less_481.bb => less_487.bb} (83%)

diff --git a/meta/recipes-extended/less/less_481.bb b/meta/recipes-extended/less/less_487.bb
similarity index 83%
rename from meta/recipes-extended/less/less_481.bb
rename to meta/recipes-extended/less/less_487.bb
index 0fcd819..23ae484 100644
--- a/meta/recipes-extended/less/less_481.bb
+++ b/meta/recipes-extended/less/less_487.bb
@@ -21,14 +21,14 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE;md5=48c26a307f91af700e1f00585f215aaf"
+                    file://LICENSE;md5=2ef3e4b8dafc85612bc5254b8081e234"
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "50ef46065c65257141a7340123527767"
-SRC_URI[sha256sum] = "3fa38f2cf5e9e040bb44fffaa6c76a84506e379e47f5a04686ab78102090dda5"
+SRC_URI[md5sum] = "dcc8bf183a83b362d37fe9ef8df1fb60"
+SRC_URI[sha256sum] = "f3dc8455cb0b2b66e0c6b816c00197a71bf6d1787078adeee0bcf2aea4b12706"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.7.4




