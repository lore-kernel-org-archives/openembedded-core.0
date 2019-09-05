Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4787F214
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 06:17:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74875492"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 14:17:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 91C354CE14E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:17:37 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 14:17:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2019 14:17:05 +0800
Message-ID: <20190905061705.15613-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 91C354CE14E6.A9658
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dtc:upgrade 1.5.0 -> 1.5.1
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
X-List-Received-Date: Thu, 05 Sep 2019 06:17:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update:
-file://GPL : Updated mailing address.
-file://libfdt/libfdt.h : Removed part of the copyright description of this file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-kernel/dtc/dtc_1.5.0.bb | 10 ----------
 meta/recipes-kernel/dtc/dtc_1.5.1.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc_1.5.0.bb
 create mode 100644 meta/recipes-kernel/dtc/dtc_1.5.1.bb

diff --git a/meta/recipes-kernel/dtc/dtc_1.5.0.bb b/meta/recipes-kernel/dtc/dtc_1.5.0.bb
deleted file mode 100644
index a9c1317..0000000
--- a/meta/recipes-kernel/dtc/dtc_1.5.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require dtc.inc
-
-LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
-
-SRCREV = "d37f6b20107e952064e3f77e9d6915a9c09d10a6"
-
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/dtc/dtc_1.5.1.bb b/meta/recipes-kernel/dtc/dtc_1.5.1.bb
new file mode 100644
index 0000000..9df8a06
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc_1.5.1.bb
@@ -0,0 +1,10 @@
+require dtc.inc
+
+LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
+
+SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
+
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4




