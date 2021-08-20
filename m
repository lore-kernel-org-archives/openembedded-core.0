Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.81732.1629446848277155294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 01:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17K87RJX025801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 01:07:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 20 Aug 2021 01:07:26 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 20 Aug 2021 01:07:25 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/2] rng-tools: Upgrade to 6.14
Date: Fri, 20 Aug 2021 16:04:11 +0800
Message-ID: <20210820080412.23461-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <169CF3472372B2C5.3513@lists.openembedded.org>
References: <169CF3472372B2C5.3513@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb} (97%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.13.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
similarity index 97%
rename from meta/recipes-support/rng-tools/rng-tools_6.13.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.14.bb
index 84dbc76855..ff6c5e98d7 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.13.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://default \
     file://rngd.service \
 "
-SRCREV = "d8dac0e8bede73e42b3d59f3b48c662ad0032e8c"
+SRCREV = "c16176d3800b91f4d016b66733b384493b06f294"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

