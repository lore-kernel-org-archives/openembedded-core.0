Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.10857.1589092322956075176
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 23:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04A6VEvW012369
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 9 May 2020 23:31:51 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 23:31:22 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-git: 3.0.5 -> 3.1.2
Date: Sun, 10 May 2020 14:31:16 +0800
Message-ID: <20200510063116.29006-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python/{python3-git_3.0.5.bb => python3-git_3.1.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.0.5.bb => python3-git_3.1.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-git_3.0.5.bb b/meta/recipes-devtools/python/python3-git_3.1.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-git_3.0.5.bb
rename to meta/recipes-devtools/python/python3-git_3.1.2.bb
index 36313ef8b9..72280ec30d 100644
--- a/meta/recipes-devtools/python/python3-git_3.0.5.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.2.bb
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "7555ad89a22f663c25cced5f623bdef0"
-SRC_URI[sha256sum] = "9c2398ffc3dcb3c40b27324b316f08a4f93ad646d5a6328cafbb871aa79f5e42"
+SRC_URI[md5sum] = "2397bea2d7c36ef9f874ab6355abae59"
+SRC_URI[sha256sum] = "864a47472548f3ba716ca202e034c1900f197c0fb3a08f641c20c3cafd15ed94"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.17.1

