Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.81043.1629444651724979637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 00:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17K7Uo8w001016
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 00:30:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17K7UopC000755
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 00:30:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 20 Aug 2021 00:30:49 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 20 Aug 2021 00:30:48 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] rng-tools: Upgrade to 6.14
Date: Fri, 20 Aug 2021 15:27:34 +0800
Message-ID: <20210820072735.40953-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.13.bb => rng-tools_6.14.bb} (100%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.13.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
similarity index 100%
rename from meta/recipes-support/rng-tools/rng-tools_6.13.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.14.bb
-- 
2.29.2

