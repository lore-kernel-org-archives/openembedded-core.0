Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6853.1627547150099600414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 01:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16T8Pm1N001094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 01:25:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 29 Jul 2021 01:25:48 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 29 Jul 2021 01:25:48 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] zstd: fix CVE_PRODUCT
Date: Thu, 29 Jul 2021 01:25:48 -0700
Message-ID: <20210729082548.41406-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

zstd uses 'zstandard' in NVD database. e.g. CVE-2021-24031

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/zstd/zstd_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.0.bb b/meta/recipes-extended/zstd/zstd_1.5.0.bb
index 3786058731..978812fddb 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.0.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.0.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
 SRCREV = "a488ba114ec17ea1054b9057c26a046fc122b3b6"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
+CVE_PRODUCT = "zstandard"
+
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.30.2

