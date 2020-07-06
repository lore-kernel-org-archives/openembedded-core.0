Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.49899.1594002470069517938
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 19:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0662RBCM020372
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 5 Jul 2020 19:27:21 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Sun, 5 Jul 2020
 19:27:00 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] iso-codes: switch upstream branch master -> main
Date: Mon, 6 Jul 2020 10:26:59 +0800
Message-ID: <20200706022659.10377-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/iso-codes/iso-codes_4.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
index 6f9868ffea..9d02f5c794 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.5.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
 SRCREV = "a36019e5014bff251f83d522ddcfebaecf52afd3"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-- 
2.18.2

