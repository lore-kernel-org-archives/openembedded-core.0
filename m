Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.4647.1617787446855416879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 02:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1379O5G2010048
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Apr 2021 02:24:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 02:24:05 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 7 Apr 2021 02:24:04 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] packagegroup-core-tools-testapps.bb: Remove kexec for riscv32
Date: Wed, 7 Apr 2021 17:24:03 +0800
Message-ID: <20210407092403.45721-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

kexec is not yet ported to riscv32.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index a5fc152859..015810cb6b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -16,6 +16,7 @@ KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_microblaze ?= ""
 KEXECTOOLS_nios2 ?= ""
 KEXECTOOLS_riscv64 ?= ""
+KEXECTOOLS_riscv32 ?= ""
 
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES_riscv64 = ""
-- 
2.17.1

