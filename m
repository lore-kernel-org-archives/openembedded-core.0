Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.8620.1631088558234256163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 01:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18889Hgj006581
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 01:09:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 01:09:16 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 8 Sep 2021 01:09:15 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] tar: add pkgconfig for selinux
Date: Wed, 8 Sep 2021 16:05:05 +0800
Message-ID: <20210908080505.29681-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908080505.29681-1-mingli.yu@windriver.com>
References: <20210908080505.29681-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add pkgconfig setting for selinux.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/tar/tar_1.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 98755a11cc..a6a417a1a5 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -16,6 +16,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG:append:class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
 
 PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
-- 
2.17.1

