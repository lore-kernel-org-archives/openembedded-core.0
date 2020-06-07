Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.3578.1591514353766495281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 00:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0577JAr5017750
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Jun 2020 00:19:11 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 7 Jun 2020 00:18:54 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] encodings: rdepends on mkfontscale
Date: Sun, 7 Jun 2020 15:18:51 +0800
Message-ID: <20200607071851.24949-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It runs mkfontdir and mkfontdir during postinst script which are from
package mkfontscale. So make encodings rdepends on mkfontscale.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index 4d61aed183..a299bf2fb2 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -10,7 +10,7 @@ PE = "1"
 PR = "r3"
 
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
-RDEPENDS_${PN} = ""
+RDEPENDS_${PN} = "mkfontscale"
 
 SRC_URI += "file://nocompiler.patch"
 SRC_URI[md5sum] = "bbae4f247b88ccde0e85ed6a403da22a"
-- 
2.17.1

