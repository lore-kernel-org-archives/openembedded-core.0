Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755C4C433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 08:16:12 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by mx.groups.io with SMTP id smtpd.web12.4096.1667636166590527514
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 01:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.57, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VTzgV7G_1667636155;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VTzgV7G_1667636155)
          by smtp.aliyun-inc.com;
          Sat, 05 Nov 2022 16:16:03 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: cp0613 <cp0613@linux.alibaba.com>
Subject: [OE-core] [PATCH v2 1/5] add python3-brotli_1.0.9 in meta/recipes-devtools/python
Date: Sat,  5 Nov 2022 16:15:13 +0800
Message-Id: <20221105081517.368-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 08:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172729

From: cp0613 <cp0613@linux.alibaba.com>

Signed-off-by: cp0613 <cp0613@linux.alibaba.com>
---
 .../python/python3-brotli_1.0.9.bb            | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-brotli_1.0.9.bb

diff --git a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
new file mode 100644
index 0000000000..590ef8ac2f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Brotli compression format"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/brotli-${PV}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
+
+# pypi package does not have a valid license file
+SRC_URI = "http://codeload.github.com/google/brotli/tar.gz/v${PV};downloadfilename=brotli-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c2274f0c7af8470ad514637c35bcee7d"
+SRC_URI[sha256sum] = "f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46"
+
+S = "${WORKDIR}/brotli-${PV}"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "\
+  ${PYTHON_PN}-cffi \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


