Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0261177E30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 05:20:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17738304"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Apr 2017 13:20:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E290447CE23B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 13:20:19 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 14 Apr 2017 13:20:18 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Apr 2017 13:20:01 +0800
Message-ID: <1492147201-4374-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: E290447CE23B.A5AB7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] byacc: 20161202 -> 20170201
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
X-List-Received-Date: Fri, 14 Apr 2017 05:20:23 -0000
Content-Type: text/plain

1)Upgrade byacc from 20161202 to 20170201.
2)License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-extended/byacc/{byacc_20161202.bb => byacc_20170201.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20161202.bb => byacc_20170201.bb} (58%)

diff --git a/meta/recipes-extended/byacc/byacc_20161202.bb b/meta/recipes-extended/byacc/byacc_20170201.bb
similarity index 58%
rename from meta/recipes-extended/byacc/byacc_20161202.bb
rename to meta/recipes-extended/byacc/byacc_20170201.bb
index 755f8ab..702c4c9 100644
--- a/meta/recipes-extended/byacc/byacc_20161202.bb
+++ b/meta/recipes-extended/byacc/byacc_20170201.bb
@@ -4,9 +4,9 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=74533d32ffd38bca4cbf1f1305f8bc60"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=9176bfb16dab43ebcb8e50d9ee9550b6"
 require byacc.inc
 
+SRC_URI[md5sum] = "4bb274bbd7b648d4251c2b9ca36ed0c9"
+SRC_URI[sha256sum] = "90b768d177f91204e6e7cef226ae1dc7cac831b625774cebd3e233a917754f91"
 
-SRC_URI[md5sum] = "48ef38447f2cc864c70ef864b26cf817"
-SRC_URI[sha256sum] = "30dc58cfcdb708eea7ba022db29b41d2d392f20727491b956954366f2f2117f0"
-- 
2.7.4




