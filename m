Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.9767.1623141407792850203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 01:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1588aj0c018095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 01:36:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 8 Jun 2021 01:36:44 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 8 Jun 2021 01:36:43 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [PATCH] valgrind: fix a typo
Date: Tue, 8 Jun 2021 16:36:39 +0800
Message-ID: <20210608083639.19193-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index d0c60d0a3d..7fcb086789 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -120,7 +120,7 @@ VALGRINDARCH_mipsel = "mips32"
 VALGRINDARCH_mips64el = "mips64"
 VALGRINDARCH_powerpc = "ppc"
 VALGRINDARCH_powerpc64 = "ppc64"
-VALGRINDARCH_powerpc64el = "ppc64le"
+VALGRINDARCH_powerpc64le = "ppc64le"
 
 INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
 
-- 
2.17.1

