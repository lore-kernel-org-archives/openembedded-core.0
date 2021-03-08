Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.3752.1615239764360678481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 13:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: anmolbir.mann@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 128LgSXh014393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Mar 2021 13:42:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Mar 2021 13:42:28 -0800
Received: from soho-Anmolbir-L1.corp.ad.wrs.com (147.11.15.178) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 8 Mar 2021 13:42:28 -0800
From: anmolbir.mann@windriver.com
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mingw: Remove 'nativesdk-glibc-utils' for windows sdk
Date: Mon, 8 Mar 2021 13:42:28 -0800
Message-ID: <20210308214228.1682-1-anmolbir.mann@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: amann <anmolbir.mann@windriver.com>

Certain recipes require the "glibc-utils" recipe to include Glibc utility tools.
However, the native version is incompatible with the Windows host, and thus these
recipes will cause the Windows SDK to fail to build, particularly the kernel
development recipes.

[YOCTO #14286]

Signed-off-by: amann <anmolbir.mann@windriver.com>
Signed-off-by: dreyna <david.reyna@windriver.com>
---
 conf/machine-sdk/include/mingw32-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine-sdk/include/mingw32-common.inc b/conf/machine-sdk/include/mingw32-common.inc
index bc6c91e..0109e75 100644
--- a/conf/machine-sdk/include/mingw32-common.inc
+++ b/conf/machine-sdk/include/mingw32-common.inc
@@ -24,6 +24,7 @@ SDK_PACKAGING_FUNC = "do_compile"
 SDKUSE_NLS = "no"
 SDKIMAGE_LINGUAS = ""
 SDK_DEPENDS_remove = "nativesdk-glibc-locale"
+SDK_DEPENDS_remove = "nativesdk-glibc-utils"
 
 SDKPKGSUFFIX = "nativesdk-mingw32"
 
-- 
2.25.1

