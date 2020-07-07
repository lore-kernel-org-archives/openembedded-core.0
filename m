Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.8877.1594090556109997974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 19:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0672tsGh027686
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2020 19:55:54 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 6 Jul 2020 19:55:53 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] dpkg: update SRC_URI
Date: Tue, 7 Jul 2020 10:53:05 +0800
Message-ID: <20200707025305.3408244-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

dpkg_1.20.0.tar.xz is removed from original SRC_URI
http://ftp.debian.org/debian/pool/main/d/dpkg/dpkg_1.20.0.tar.xz,
update it to use http://snapshot.debian.org/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg_1.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
index c98a9e58e2..089caeffb5 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian-debug/20200308T085219Z/pool/main/d/dpkg/${BPN}_${PV}.tar.xz \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
-- 
2.17.1

