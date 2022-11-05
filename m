Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E413C433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 08:27:12 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by mx.groups.io with SMTP id smtpd.web08.4158.1667636821876624478
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 01:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.56, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VTzhcc7_1667636818;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VTzhcc7_1667636818)
          by smtp.aliyun-inc.com;
          Sat, 05 Nov 2022 16:26:58 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: cp0613 <cp0613@linux.alibaba.com>
Subject: [OE-core] [PATCH v2 2/5] update meta/recipes-devtools/python/python3-brotli_1.0.9.bb
Date: Sat,  5 Nov 2022 16:25:32 +0800
Message-Id: <20221105082535.554-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221105082535.554-1-cp0613@linux.alibaba.com>
References: <20221105082535.554-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 08:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172731

From: cp0613 <cp0613@linux.alibaba.com>

---
 meta/recipes-devtools/python/python3-brotli_1.0.9.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
index 590ef8ac2f..db2b217aef 100644
--- a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
+++ b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
@@ -1,20 +1,20 @@
 SUMMARY = "Brotli compression format"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/brotli-${PV}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-# pypi package does not have a valid license file
+# there is no valid file in pypi, so download from github
 SRC_URI = "http://codeload.github.com/google/brotli/tar.gz/v${PV};downloadfilename=brotli-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c2274f0c7af8470ad514637c35bcee7d"
 SRC_URI[sha256sum] = "f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46"
 
 S = "${WORKDIR}/brotli-${PV}"
 
 inherit setuptools3
 
-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
   ${PYTHON_PN}-cffi \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
-- 
2.25.1


