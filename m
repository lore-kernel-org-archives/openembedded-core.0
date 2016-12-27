Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 1221 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Dec 2016 21:10:23 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EFD3170101
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 21:10:23 +0000 (UTC)
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBRKo3Bv011943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 14:50:03 -0600
Received: from us-aus-exch7.ni.corp.natinst.com (130.164.68.17) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 27 Dec 2016 14:50:03 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch7.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 27 Dec 2016 14:50:03 -0600
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 27 Dec 2016 14:50:03 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Dec 2016 14:49:59 -0600
Message-ID: <1482871801-4357-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-27_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612270333
Subject: [PATCH 0/2] opkg & opkg-utils upgrade to 0.3.4
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
X-List-Received-Date: Tue, 27 Dec 2016 21:10:24 -0000
Content-Type: text/plain

Alejandro del Castillo (2):
  opkg: upgrade to v0.3.4
  opkg-utils: bump SRCREV to 0.3.4 tag

 ...e-defined-bindir-and-mandir-as-installati.patch | 30 ++++++++++++++++++++++
 .../opkg-utils/opkg-utils/tar_ignore_error.patch   |  2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  8 +++---
 ...reate-opkg.lock-in-run-instead-of-var-run.patch |  8 +++---
 .../opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb}          |  6 +++--
 5 files changed, 44 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb} (88%)

-- 
2.7.4


