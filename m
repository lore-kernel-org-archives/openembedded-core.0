Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.8612.1631088556839343876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 01:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18889GZS017702
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 01:09:16 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18889F4T021020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 01:09:15 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 01:09:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 8 Sep 2021 01:09:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 8 Sep 2021 01:09:14 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] findutils: add pkgconfig for selinux
Date: Wed, 8 Sep 2021 16:05:04 +0800
Message-ID: <20210908080505.29681-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210908080505.29681-1-mingli.yu@windriver.com>
References: <20210908080505.29681-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add pkgconfig setting for selinux.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/findutils/findutils_4.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/findutils/findutils_4.8.0.bb b/meta/recipes-extended/findutils/findutils_4.8.0.bb
index 675e53c0da..d8ccf4b8e1 100644
--- a/meta/recipes-extended/findutils/findutils_4.8.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.8.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "bison-native"
 
 SRC_URI[sha256sum] = "57127b7e97d91282c6ace556378d5455a9509898297e46e10443016ea1387164"
 
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 # http://savannah.gnu.org/bugs/?27299
 CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 
-- 
2.17.1

