Return-Path: <prvs=18989725c3=alejandro.delcastillo@ni.com>
X-Greylist: delayed 2621 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Dec 2018 00:41:11 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 162756C0AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 00:41:11 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	wBQNqtFk005515 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 17:57:32 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2phj62aq7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 17:57:31 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	wBQNvVsV024099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 17:57:31 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 26 Dec 2018 17:57:30 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 26 Dec 2018 17:57:30 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Dec 2018 17:59:03 -0600
Message-ID: <20181226235906.22007-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-12-26_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 0/3] opkg & opkg-utils upgrade to 0.4.0
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
X-List-Received-Date: Thu, 27 Dec 2018 00:41:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Alejandro del Castillo (3):
  opkg: upgrade to version 0.4.0
  opkg-utils: upgrade to version 0.4.0
  package_ip.bbclass: add xz threading

 meta/classes/package_ipk.bbclass              |  2 +-
 ...me-on-versions-of-tar-which-support-.patch | 51 -----------------
 ...Switch-all-scripts-to-use-Python-3.x.patch |  5 +-
 ...rnatives-Fix-link-relocation-support.patch | 40 -------------
 ...ocal-time-for-build_date-since-opkg-.patch | 44 ---------------
 .../opkg-utils/opkg-utils/pigz.patch          | 51 -----------------
 .../opkg-utils/tar_ignore_error.patch         | 48 ----------------
 .../opkg-utils/opkg-utils/threaded-xz.patch   | 18 ------
 ...pkg-utils_0.3.6.bb => opkg-utils_0.4.0.bb} | 10 +---
 ...intainer_scripts-use-strict-matching.patch | 56 -------------------
 .../opkg/{opkg_0.3.6.bb => opkg_0.4.0.bb}     |  5 +-
 11 files changed, 8 insertions(+), 322 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.3.6.bb => opkg-utils_0.4.0.bb} (82%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.6.bb => opkg_0.4.0.bb} (90%)

-- 
2.20.1


