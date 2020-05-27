Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.6341.1590587327847890913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 06:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04RDmjWw001346
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 06:48:46 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 27 May 2020
 06:48:44 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id E923890059A;
 Wed, 27 May 2020 06:48:44 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] llvm: upgrade 9.0.1 -> 10.0.0
Date: Wed, 27 May 2020 06:48:44 -0700
Message-ID: <20200527134844.105405-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index d24ed761bf..787cc3adcf 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,9 +19,9 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-MAJOR_VERSION = "9"
+MAJOR_VERSION = "10"
 MINOR_VERSION = "0"
-PATCH_VERSION = "1"
+PATCH_VERSION = "0"
 
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
 
@@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
+SRCREV = "d32170dbd5b0d54436537b6b75beaf44324e0c28"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.24.1

