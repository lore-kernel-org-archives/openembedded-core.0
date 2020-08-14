Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.13016.1597386158795151084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 23:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07E6Mbbv013182
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 23:22:38 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 23:22:37 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <kai.kang@windriver.com>
Subject: [PATCH] libffi: fix multilib header conflict
Date: Fri, 14 Aug 2020 14:17:52 +0800
Message-ID: <20200814061752.313995-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/ffitarget.h conflicts between attempted installs of lib32-libffi-dev-3.3-r0.armv7vet2hf_vfp and libffi-dev-3.3-r0.cortexa57

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/libffi/libffi_3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libffi/libffi_3.3.bb b/meta/recipes-support/libffi/libffi_3.3.bb
index e5beb985c6..4ec058b116 100644
--- a/meta/recipes-support/libffi/libffi_3.3.bb
+++ b/meta/recipes-support/libffi/libffi_3.3.bb
@@ -29,6 +29,7 @@ inherit autotools texinfo multilib_header
 
 do_install_append() {
 	oe_multilib_header ffi.h
+        oe_multilib_header ffitarget.h
 }
 
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
-- 
2.17.1

