Return-Path: <prvs=7067777c77=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id D43637E830
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:17:03 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5DKFimL008217 for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 15:17:04 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2t3wa1r0hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 15:17:04 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x5DKH3En013535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 15:17:03 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 13 Jun 2019 15:17:03 -0500
Received: from delcastillo3.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 13 Jun 2019 15:17:03 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2019 15:16:59 -0500
Message-ID: <20190613201701.31014-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-13_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 0/2] opkg & opkg-utils update to 0.4.1
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
X-List-Received-Date: Thu, 13 Jun 2019 20:17:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Alejandro del Castillo (2):
  opkg: upgrade to version 0.4.1
  opkg-utils: upgrade to version 0.4.1

 ...build-do-not-set-mtime-on-data.tar.X.patch |  33 ---
 ...fields-fix-to-print-the-fields-again.patch |  41 ---
 ...pkg-utils_0.4.0.bb => opkg-utils_0.4.1.bb} |   6 +-
 ...pkg-add-add-ignore-recommends-option.patch | 259 ------------------
 ...dd-target-for-testsuite-installation.patch |  43 ---
 ....py-resolve-paths-before-comparision.patch |  31 ---
 .../opkg/{opkg_0.4.0.bb => opkg_0.4.1.bb}     |   7 +-
 7 files changed, 4 insertions(+), 416 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.0.bb => opkg-utils_0.4.1.bb} (89%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-option.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-add-target-for-testsuite-installation.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-regress-issue72.py-resolve-paths-before-comparision.patch
 rename meta/recipes-devtools/opkg/{opkg_0.4.0.bb => opkg_0.4.1.bb} (87%)

-- 
2.21.0


