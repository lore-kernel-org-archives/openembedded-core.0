Return-Path: <prvs=325539a752=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id F1FF67FEB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 00:16:10 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xBI0DNmE027406 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:11 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2wx633wmuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:11 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xBI0GABk013723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:10 -0600
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 17 Dec 2019 18:16:10 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 17 Dec 2019 18:16:09 -0600
Received: from delcastillo3.natinst.com (172.18.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Tue, 17 Dec 2019 18:16:09 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2019 18:16:07 -0600
Message-ID: <20191218001609.3750899-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-12-17_05:2019-12-17,2019-12-17 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Subject: [PATCH 0/2] opkg & opkg-utils update to 0.4.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 00:16:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Alejandro del Castillo (2):
  opkg-utils: upgrade to version 0.4.2
  opkg: upgrade to version 0.4.2

 ...0001-Switch-all-scripts-to-use-Python-3.x.patch | 113 ---------------------
 ...g-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch |  44 --------
 .../opkg-utils/opkg-utils/pipefail.patch           |  31 ------
 .../{opkg-utils_0.4.1.bb => opkg-utils_0.4.2.bb}   |  12 +--
 meta/recipes-devtools/opkg/opkg/open_inner.patch   |  46 ---------
 meta/recipes-devtools/opkg/opkg/opkg_archive.patch |  54 ----------
 .../opkg/{opkg_0.4.1.bb => opkg_0.4.2.bb}          |  18 +---
 7 files changed, 7 insertions(+), 311 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.1.bb => opkg-utils_0.4.2.bb} (83%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch
 rename meta/recipes-devtools/opkg/{opkg_0.4.1.bb => opkg_0.4.2.bb} (82%)

-- 
2.11.0


