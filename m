Return-Path: <prvs=39412d319b=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id D5CA87C3D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 15:58:01 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x17FuG0c017708 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2019 09:58:03 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2qgn8x0hbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:58:02 -0600
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x17Fw1Xu006172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2019 09:58:01 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Feb 2019 09:58:01 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Feb 2019 09:58:01 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 7 Feb 2019 09:58:01 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2019 09:57:56 -0600
Message-ID: <20190207155759.6082-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-07_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 0/3] use new opkg --add-ignore-recommends for BAD_RECOMMENDATIONS feature
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
X-List-Received-Date: Thu, 07 Feb 2019 15:58:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Add new opkg --add-ignore-recommends cli flag
- Fix libsolv segfaul triggered by --add-ignore-recommends
- Replace BAD_RECOMMENDATIONS backend in package_manager.py

Alejandro del Castillo (3):
  opkg: add --ignore-recommends flag
  libsolv: fix segfault when using SOLVER_DISFAVOR
  OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS

 meta/lib/oe/package_manager.py                |  41 +--
 meta/lib/oe/rootfs.py                         |   2 -
 ...pkg-add-add-ignore-recommends-option.patch | 259 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.0.bb      |   1 +
 ...y-disfavor-recommends-if-there-are-a.patch |  33 +++
 .../recipes-extended/libsolv/libsolv_0.7.3.bb |   4 +-
 6 files changed, 298 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-option.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-solver_solve-only-disfavor-recommends-if-there-are-a.patch

-- 
2.20.1


