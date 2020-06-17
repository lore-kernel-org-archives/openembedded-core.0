Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.479.1592366960044915795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 21:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05H49ITM004422
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 21:09:19 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 21:09:18 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xinit: add xterm to RDEPENDS
Date: Wed, 17 Jun 2020 12:07:31 +0800
Message-ID: <20200617040731.1195528-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

startx RDEPENDS on xterm, fix below error:
/etc/X11/xinit/xinitrc: line 55: exec: xterm: not found

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
index c9e28d9bba..5f8c370c59 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
@@ -19,4 +19,4 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-RDEPENDS_${PN} += "util-linux-mcookie"
+RDEPENDS_${PN} += "util-linux-mcookie xterm"
-- 
2.17.1

