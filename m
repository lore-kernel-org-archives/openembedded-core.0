Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SwXcy-00046B-LW
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:02:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71BoU4o006998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2012 04:50:30 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 04:50:29 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 19:50:01 +0800
Message-ID: <cover.1343821674.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, wfan@windriver.com
Subject: [PATCH 0/1] qt4: fix qt4-native build failure on SLED-11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 12:02:13 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Workaround kernel headers using "new" as variable name. The problem
is specific to SLED-11, other distros use "newev" rather than "new".

[YOCTO #2845]

The following changes since commit fd6251ef548da7dbca354754cc0b666b2ccd0c45:

  imagetest-qemu.bbclass: Fix whitespace issues (2012-08-01 09:10:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/2845
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2845

Wenzong Fan (1):
  qt4: fix qt4-native build failure on SLED-11

 meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch |   26 +++++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-native.inc              |    6 ++++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/fix_qkbdtty_qws.patch

-- 
1.7.9.5



