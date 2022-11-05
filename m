Return-Path: <cp0613@linux.alibaba.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A105DC43219
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 08:27:12 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by mx.groups.io with SMTP id smtpd.web08.4161.1667636822902337934
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 01:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.alibaba.com, ip: 115.124.30.56, mailfrom: cp0613@linux.alibaba.com)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0VTzhccQ_1667636819;
Received: from DESKTOP-AMMB16H.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0VTzhccQ_1667636819)
          by smtp.aliyun-inc.com;
          Sat, 05 Nov 2022 16:26:59 +0800
From: cp0613@linux.alibaba.com
To: openembedded-core@lists.openembedded.org
Cc: cp0613 <cp0613@linux.alibaba.com>
Subject: [OE-core] [PATCH v2 5/5] update meta/recipes-devtools/python/python3-brotli_1.0.9.bb
Date: Sat,  5 Nov 2022 16:25:35 +0800
Message-Id: <20221105082535.554-5-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221105082535.554-1-cp0613@linux.alibaba.com>
References: <20221105082535.554-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 08:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172732

From: cp0613 <cp0613@linux.alibaba.com>

Signed-off-by: cp0613 <cp0613@linux.alibaba.com>
---
 meta/conf/distro/include/maintainers.inc            |  1 +
 .../recipes-devtools/python/python3-brotli_1.0.9.bb | 13 ++++++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

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
index db2b217aef..cd0dff9c4b 100644
--- a/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
+++ b/meta/recipes-devtools/python/python3-brotli_1.0.9.bb
@@ -1,16 +1,15 @@
 SUMMARY = "Brotli compression format"
+HOMEPAGE = "https://pypi.org/project/Brotli/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-# there is no valid file in pypi, so download from github
-SRC_URI = "http://codeload.github.com/google/brotli/tar.gz/v${PV};downloadfilename=brotli-${PV}.tar.gz"
+PYPI_PACKAGE = "Brotli"
+PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46"
+SRC_URI[sha256sum] = "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
 
-S = "${WORKDIR}/brotli-${PV}"
-
-inherit setuptools3
+inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
   ${PYTHON_PN}-cffi \
-- 
2.25.1


