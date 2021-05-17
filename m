Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.16218.1621242205695875896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14H93OIJ009092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:03:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 02:03:23 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Mon, 17 May 2021 02:03:23 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] rt-tests: update SRCREV
Date: Mon, 17 May 2021 02:03:23 -0700
Message-ID: <20210517090323.9968-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The commit '6af88067da16c6e69243b376c3b6454ec694460b' is not available
in the repo any more. I think it's due to some mis-operation of the upstream
repo in the past few hours.

Update the SRCREV to use the latest commit on unstable/devel/latest branch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 0c89bad91f..1600f5813b 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
 # Version 1.8
-SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
+SRCREV = "c9051a36d934503b4673ca5615f631bae36dead0"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
-- 
2.30.2

