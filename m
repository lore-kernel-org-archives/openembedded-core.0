Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7C0C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 02:36:41 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.6918.1638931000228241518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 18:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B82accF015731
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Dec 2021 18:36:39 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Dec 2021 18:36:38 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 7 Dec 2021 18:36:37 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cmake: upgrade 3.22.0 -> 3.22.1
Date: Wed, 8 Dec 2021 10:33:27 +0800
Message-ID: <20211208023327.14778-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 02:36:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159339

From: Changqing Li <changqing.li@windriver.com>

This upgrade include a bug fix:
Refer:
https://gitlab.kitware.com/cmake/cmake/-/issues/22963
https://gitlab.kitware.com/cmake/cmake/-/commit/643fc46bdc13dd57584d5d77eee30a99308ba896

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../cmake/{cmake-native_3.22.0.bb => cmake-native_3.22.1.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.22.0.bb => cmake_3.22.1.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.22.0.bb => cmake-native_3.22.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.22.0.bb => cmake_3.22.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.22.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.22.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 2cd8193d6f..628734ac73 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "998c7ba34778d2dfdb3df8a695469e24b11e2bfa21fbe41b361a3f45e1c9345e"
+SRC_URI[sha256sum] = "0e998229549d7b3f368703d20e248e7ee1f853910d42704aa87918c213ea82c0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.0.bb b/meta/recipes-devtools/cmake/cmake_3.22.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.22.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.22.1.bb
-- 
2.17.1


