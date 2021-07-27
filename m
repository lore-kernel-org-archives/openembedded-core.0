Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.8462.1627372867908227734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 01:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16R816sk019401
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 01:01:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16R816SS029508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 01:01:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 27 Jul 2021 01:01:06 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 27 Jul 2021 01:01:05 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] netbase: use git fetcher
Date: Tue, 27 Jul 2021 15:59:00 +0800
Message-ID: <20210727075900.35651-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Use git repo as the the previous URL only stores the latest
source file and fails to locate the source file which isn't
the latest.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/netbase/netbase_6.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.2.bb
index a54d2e7764..c016d32dd3 100644
--- a/meta/recipes-core/netbase/netbase_6.2.bb
+++ b/meta/recipes-core/netbase/netbase_6.2.bb
@@ -6,11 +6,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI = "git://salsa.debian.org/md/netbase.git;protocol=https"
+SRCREV = "1c892c96a078ef28ec1a94681b3a0da7a3d545f7"
 
 inherit allarch
 
-SRC_URI[sha256sum] = "309a24146a06347d654b261e9e07a82fab844b173674a42e223803dd8258541e"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 
-- 
2.17.1

