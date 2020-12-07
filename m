Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.8.1607381043765012009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 14:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=561068abc0=alejandro.delcastillo@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7MhmLA016447
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Dec 2020 16:44:03 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 358744ka1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 16:44:03 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.43/8.16.0.43) with ESMTPS id 0B7Mi2SD027588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Dec 2020 16:44:02 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 7 Dec 2020 16:44:02 -0600
Received: from delcastillo3.natinst.com (172.18.68.32) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 id 15.0.1395.4 via Frontend Transport; Mon, 7 Dec 2020 16:44:01 -0600
From: "Alejandro del Castillo" <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Subject: [PATCH] opkg: upgrade to version 0.4.4
Date: Mon, 7 Dec 2020 16:44:00 -0600
Message-ID: <20201207224400.1008323-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-07_16:2020-12-04,2020-12-07 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} (95%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.3.bb b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
similarity index 95%
rename from meta/recipes-devtools/opkg/opkg_0.4.3.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.4.bb
index 46b7aa2523..0f29e1d41b 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "86ec5eee9362aca0990994a402e077e9"
-SRC_URI[sha256sum] = "dda452854bc0cd1334f7ba18a66003d1c12a98600c894111b56919b1ea434718"
+SRC_URI[md5sum] = "345900c1d4747d58455867f9fe88ca43"
+SRC_URI[sha256sum] = "2217acc58b8eb31300631ebae75e222ebc700c9c1cf6408088705d19a472c839"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.28.0

