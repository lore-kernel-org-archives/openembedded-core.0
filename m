Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D44D77116
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:03:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD83R7C028068
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:03:27 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 00:03:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 16:03:24 +0800
Message-ID: <cover.1447401669.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] libav: fix 5 CVE issues
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
X-List-Received-Date: Fri, 13 Nov 2015 08:03:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

---
The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_libav-cve_151113-1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_libav-cve_151113-1

Jackie Huang (4):
  libav: fix CVE-2015-3395
  libav: fix CVE-2015-6820
  libav: fix CVE-2015-6823
  libav: fix CVE-2015-6824

Kai Kang (1):
  libav: fix CVE-2015-1872

 .../libav/libav/libav-fix-CVE-2015-1872.patch      |  35 +++++++
 .../libav/libav/libav-fix-CVE-2015-3395.patch      | 113 +++++++++++++++++++++
 .../libav/libav/libav-fix-CVE-2015-6820.patch      |  66 ++++++++++++
 .../libav/libav/libav-fix-CVE-2015-6823.patch      |  45 ++++++++
 .../libav/libav/libav-fix-CVE-2015-6824.patch      |  46 +++++++++
 meta/recipes-multimedia/libav/libav_9.18.bb        |   8 +-
 6 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-1872.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-3395.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6820.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6823.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6824.patch

-- 
1.9.1


