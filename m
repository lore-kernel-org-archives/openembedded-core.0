Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.27067.1595446571034356845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 12:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06MJZdr6005759
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 12:35:59 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 12:35:31 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id 811101FFFE;
 Wed, 22 Jul 2020 15:35:30 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH] ltp: remove --with-power-management-testsuite from EXTRA_OECONF
Date: Wed, 22 Jul 2020 15:35:30 -0400
Message-ID: <20200722193530.7519-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit [b74bbed51b0c0d44b70b136326a8a23cbc64db01 power_management:
compile testcases/kernel/power_management by default] from ltp upstream
removed --with-power-management-testsuite option, it's on by default.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20200515.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index b283add12f..ece3acf0f9 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -50,7 +50,7 @@ export exec_prefix = "/opt/${PN}"
 
 PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
 EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
-EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite --with-open-posix-testsuite "
+EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
 # ltp network/rpc test cases ftbfs when libtirpc is found
 EXTRA_OECONF += " --without-tirpc "
 
-- 
2.27.0

