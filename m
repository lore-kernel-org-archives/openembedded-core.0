Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F4DC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 08:43:12 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by mx.groups.io with SMTP id smtpd.web09.4522.1667637783083930496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 01:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.43, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VTzqGyV_1667637774;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VTzqGyV_1667637774)
          by smtp.aliyun-inc.com;
          Sat, 05 Nov 2022 16:42:59 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: cp0613 <cp0613@linux.alibaba.com>
Subject: [OE-core] [PATCH v2] add python3-brotli_1.0.9 in meta/recipes-devtools/python
Date: Sat,  5 Nov 2022 16:42:42 +0800
Message-Id: <20221105084242.666-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 08:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172736

From: cp0613 <cp0613@linux.alibaba.com>

Signed-off-by: cp0613 <cp0613@linux.alibaba.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-brotli_1.0.9.bb            | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-brotli_1.0.9.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 57319cd8f5..ac708239b4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -593,6 +593,7 @@ RECIPE_MAINTAINER:pn-python3-atomicwrites = "Tim Orling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-python3-attrs = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-babel = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-bcrypt = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-brotli = "Chen Pei <cp0613@linux.alibaba.com>"
 RECIPE_MAINTAINER:pn-python3-certifi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cffi = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
new file mode 100644
index 0000000000..cd0dff9c4b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Brotli compression format"
+HOMEPAGE = "https://pypi.org/project/Brotli/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
+
+PYPI_PACKAGE = "Brotli"
+PYPI_PACKAGE_EXT = "zip"
+
+SRC_URI[sha256sum] = "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = "\
+  ${PYTHON_PN}-cffi \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.25.1


