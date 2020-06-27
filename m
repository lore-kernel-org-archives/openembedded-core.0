Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.19495.1593301249166273821
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 16:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=9447524c43=alejandro.delcastillo@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05RNWaD6028003
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:48 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 31x3mu12qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:48 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.42/8.16.0.42) with ESMTPS id 05RNeltI007764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 18:40:47 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sat, 27 Jun 2020 18:40:47 -0500
Received: from delcastillo3.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1395.4 via Frontend Transport; Sat, 27 Jun 2020 18:40:47 -0500
From: "Alejandro del Castillo" <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Subject: [PATCH 0/2] opkg & opkg-utils update to 0.4.3
Date: Sat, 27 Jun 2020 18:40:44 -0500
Message-ID: <20200627234046.568502-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-27_10:2020-06-26,2020-06-27 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Alejandro del Castillo (2):
  opkg-utils: upgrade to 0.4.3
  opkg: upgrade to version 0.4.3

 .../opkg-utils/fix-reproducibility.patch      | 32 -------------------
 ...pkg-utils_0.4.2.bb => opkg-utils_0.4.3.bb} |  5 ++-
 .../opkg/{opkg_0.4.2.bb => opkg_0.4.3.bb}     |  4 +--
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.2.bb => opkg-utils_0.4.3.bb} (92%)
 rename meta/recipes-devtools/opkg/{opkg_0.4.2.bb => opkg_0.4.3.bb} (95%)

-- 
2.20.1

