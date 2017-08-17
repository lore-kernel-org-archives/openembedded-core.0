Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8299783BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:45:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H6j7OJ006687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:45:07 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 23:45:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 14:44:26 +0800
Message-ID: <cover.1502952233.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/3] libsndfile1: Fix several CVE issues
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
X-List-Received-Date: Thu, 17 Aug 2017 06:45:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 55bf88603927469de9aa9f6fd4d449230d2e61e3:

  poky: Add nios2 to list of qemu targets (2017-08-17 00:21:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_libsndfile1_CVE_170817_1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_libsndfile1_CVE_170817_1

Jackie Huang (3):
  libsndfile1: Fix CVE-2017-8361 and CVE-2017-8365
  libsndfile1: Fix CVE-2017-8362
  libsndfile1: Fix CVE-2017-8363

 .../libsndfile1/CVE-2017-8361-8365.patch           | 73 ++++++++++++++++++++++
 .../libsndfile/libsndfile1/CVE-2017-8362.patch     | 59 +++++++++++++++++
 .../libsndfile/libsndfile1/CVE-2017-8363.patch     | 37 +++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  3 +
 4 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8361-8365.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8362.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363.patch

-- 
2.11.0


