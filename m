Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.3189.1617774567243069956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 22:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1375nM4s014524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Apr 2021 22:49:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 6 Apr 2021 22:49:22 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 6 Apr 2021 22:49:21 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] packagegroup-core-tools-profile: Remove valgrind for riscv32
Date: Wed, 7 Apr 2021 13:49:20 +0800
Message-ID: <20210407054920.16818-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

valgrind is not yet ported to riscv32.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index b8e2c718e6..194dca76d0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -57,6 +57,7 @@ VALGRIND_armv6 = ""
 VALGRIND_armeb = ""
 VALGRIND_aarch64 = ""
 VALGRIND_riscv64 = ""
+VALGRIND_riscv32 = ""
 VALGRIND_powerpc = "${@bb.utils.contains('TARGET_FPU', 'soft', '', 'valgrind', d)}"
 VALGRIND_linux-gnux32 = ""
 VALGRIND_linux-gnun32 = ""
-- 
2.17.1

