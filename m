Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.19365.1593301249543104385
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 16:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=9447524c43=alejandro.delcastillo@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05RNcj39022655
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:49 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 31x251h785-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:49 -0500
Received: from us-aus-exch1.ni.corp.natinst.com (us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.42/8.16.0.42) with ESMTPS id 05RNemFO007770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:48 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sat, 27 Jun 2020 18:40:48 -0500
Received: from delcastillo3.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1395.4 via Frontend Transport; Sat, 27 Jun 2020 18:40:48 -0500
From: "Alejandro del Castillo" <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Subject: [PATCH 2/2] opkg: upgrade to version 0.4.3
Date: Sat, 27 Jun 2020 18:40:46 -0500
Message-ID: <20200627234046.568502-3-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627234046.568502-1-alejandro.delcastillo@ni.com>
References: <20200627234046.568502-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-27_10:2020-06-26,2020-06-27 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-devtools/opkg/{opkg_0.4.2.bb => opkg_0.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.4.2.bb => opkg_0.4.3.bb} (95%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.2.bb b/meta/recipes-devtools/opkg/opkg_0.4.3.bb
similarity index 95%
rename from meta/recipes-devtools/opkg/opkg_0.4.2.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.3.bb
index 66a74dc5ed..46b7aa2523 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.3.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "bd13e5dfc1c2536f0c7b2e15f795278e"
-SRC_URI[sha256sum] = "86887852c43457edfff9d8b6d9520f3f1cdd55f25eb600a6eb31e1c4e151e106"
+SRC_URI[md5sum] = "86ec5eee9362aca0990994a402e077e9"
+SRC_URI[sha256sum] = "dda452854bc0cd1334f7ba18a66003d1c12a98600c894111b56919b1ea434718"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.20.1

