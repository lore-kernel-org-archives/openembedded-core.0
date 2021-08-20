Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.80848.1629446849077295203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 01:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17K87SIM003613
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 01:07:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17K87RpP006326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 01:07:28 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 20 Aug 2021 01:07:27 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 20 Aug 2021 01:07:26 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] libjitterentropy: Upgrade to 3.1.0
Date: Fri, 20 Aug 2021 16:04:12 +0800
Message-ID: <20210820080412.23461-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210820080412.23461-1-mingli.yu@windriver.com>
References: <169CF3472372B2C5.3513@lists.openembedded.org>
 <20210820080412.23461-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

License update:
copyright year updated to 2021 and the file name changed from
COPYING* to LICENSE*.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ibjitterentropy_3.0.2.bb => libjitterentropy_3.1.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.0.2.bb => libjitterentropy_3.1.0.bb} (77%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
similarity index 77%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
index 8e39974ef3..450af3260d 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.2.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
@@ -5,12 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPLv2+ | BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c69090e97c8fd6372d03099c0a5bc382 \
-                    file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
-                    file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
+                    file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
+                    file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
-SRCREV = "a0c51e21c2d4322681a320a22de5e2ef13c08196"
+SRCREV = "409828cfccf4b3b07edc40a7840a821ce074e2c3"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.29.2

