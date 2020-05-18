Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.36688.1589780034944774214
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 22:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04I5XroR011791
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 22:33:53 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 17 May 2020 22:33:52 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-setuptools: add the missing rdepends
Date: Mon, 18 May 2020 13:33:36 +0800
Message-ID: <20200518053336.38274-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import setuptools.lib2to3_ex
 [snip]
 ModuleNotFoundError: No module named 'lib2to3'
 ModuleNotFoundError: No module named 'pickle'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 6726e06bef..e9ad93dbee 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -18,6 +18,7 @@ SRC_URI[sha256sum] = "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b407fe67992a
 DEPENDS += "${PYTHON_PN}"
 
 RDEPENDS_${PN} = "\
+  ${PYTHON_PN}-2to3 \
   ${PYTHON_PN}-compile \
   ${PYTHON_PN}-compression \
   ${PYTHON_PN}-ctypes \
@@ -27,6 +28,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-json \
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
+  ${PYTHON_PN}-pickle \
   ${PYTHON_PN}-pkgutil \
   ${PYTHON_PN}-plistlib \
   ${PYTHON_PN}-shell \
-- 
2.24.1

