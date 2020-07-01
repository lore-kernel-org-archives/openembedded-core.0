Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.13045.1593570992901659321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 19:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0612aBZ8014420
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 19:36:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 19:35:48 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] python3-libarchive-c: add the missing rdepends
Date: Wed, 1 Jul 2020 10:33:17 +0800
Message-ID: <20200701023318.3887430-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import libarchive
 [snip]
 ModuleNotFoundError: No module named 'ctypes'
 ModuleNotFoundError: No module named 'mmap'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3-libarchive-c_2.9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
index 4983ae527a..3a2d8733e9 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
@@ -12,6 +12,10 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = "083bd2cb0043c1e22a52cb9a05e31532"
 SRC_URI[sha256sum] = "9919344cec203f5db6596a29b5bc26b07ba9662925a05e24980b84709232ef60"
 
-RDEPENDS_${PN} += "libarchive"
+RDEPENDS_${PN} += "\
+  libarchive \
+  ${PYTHON_PN}-ctypes \
+  ${PYTHON_PN}-mmap \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

