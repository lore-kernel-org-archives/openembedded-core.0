Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.11824.1589544779708334389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 05:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04FCCtLG003771
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 05:12:55 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 05:12:55 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] lttng-ust: upgrade to 2.12.0
Date: Fri, 15 May 2020 15:11:04 +0300
Message-ID: <20200515121106.27860-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515121106.27860-1-ovidiu.panait@windriver.com>
References: <20200515121106.27860-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Upgrade lttng-ust 2.11.1 -> 2.12.0.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.12.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.12.0.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
index 3bd0dfad61..ad544d1b4a 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
@@ -31,8 +31,8 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            "
 
-SRC_URI[md5sum] = "7de04a8ff1f0a4effa09a42620ec4081"
-SRC_URI[sha256sum] = "7fbab963d60741ffd4d8dd0a246f6cf168cdfe3b2385798bd90550f5f0bba869"
+SRC_URI[md5sum] = "3bf4a04c305271d13cf6596c4e7b9b3c"
+SRC_URI[sha256sum] = "1983edb525f3f27e3494088d8d5389b4c71af66bbfe63c6f1df2ad95aa44a528"
 
 CVE_PRODUCT = "ust"
 
-- 
2.17.1

