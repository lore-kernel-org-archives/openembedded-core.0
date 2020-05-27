Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8736.1590593644905851187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 08:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,441,1583164800"; 
   d="scan'208";a="93220351"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 May 2020 23:34:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 31C3D50A9974
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 23:33:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 May 2020 23:33:56 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libyaml: upgrade 0.2.2 -> 0.2.4
Date: Wed, 27 May 2020 23:33:55 +0800
Message-ID: <1590593635-63448-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 31C3D50A9974.A61BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: file name changed from LICENSE to License.
                 Copyright year updated to 2020.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libyaml/{libyaml_0.2.2.bb => libyaml_0.2.4.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libyaml/{libyaml_0.2.2.bb => libyaml_0.2.4.bb} (66%)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.2.bb b/meta/recipes-support/libyaml/libyaml_0.2.4.bb
similarity index 66%
rename from meta/recipes-support/libyaml/libyaml_0.2.2.bb
rename to meta/recipes-support/libyaml/libyaml_0.2.4.bb
index 5105ce69db..e1817748bc 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.4.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
+LIC_FILES_CHKSUM = "file://License;md5=7bbd28caa69f81f5cd5f48647236663d"
 
 SRC_URI = "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
-SRC_URI[md5sum] = "54bf11ccb8bc488b5b3bec931f5b70dc"
-SRC_URI[sha256sum] = "4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9"
+SRC_URI[md5sum] = "0532bb32548ee92f1c0328aa8a87dec7"
+SRC_URI[sha256sum] = "d80aeda8747b7c26fbbfd87ab687786e58394a8435ae3970e79cb97882e30557"
 
 S = "${WORKDIR}/yaml-${PV}"
 
-- 
2.17.1



