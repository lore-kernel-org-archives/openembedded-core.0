Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.12891.1614608253264525312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 06:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 121EH5GU019972
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Mar 2021 06:17:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Mar 2021 06:16:41 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 1 Mar 2021 06:16:39 -0800
From: "kai" <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <kergoth@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <poky@lists.yoctoproject.org>
Subject: [meta-poky][PATCH v3 2/2] local.conf.sample.extended: sample value for SDk_PS1
Date: Mon, 1 Mar 2021 22:16:34 +0800
Message-ID: <20210301141634.6177-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301141634.6177-1-kai.kang@windriver.com>
References: <16683D655B45BE78.10373@lists.openembedded.org>
 <20210301141634.6177-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Provides a sample default value for SDk_PS1 in
local.conf.sample.extended. It will look like:

poky-glibc-x86_64--cortexa57-qemuarm64-pokysdk:$

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-poky/conf/local.conf.sample.extended | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
index ba1d0973b5..c241caa869 100644
--- a/meta-poky/conf/local.conf.sample.extended
+++ b/meta-poky/conf/local.conf.sample.extended
@@ -390,3 +390,8 @@ DISTRO_FEATURES_remove = "x11"
 #
 #require conf/distro/include/lto.inc
 #DISTRO_FEATURES_append = " lto"
+
+#
+# Set PS1 for SDK
+#
+#SDK_PS1 ?= "${SDK_NAME}${SDK_VENDOR}:\$ "
-- 
2.17.1

