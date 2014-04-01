Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44AB46E4CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 09:10:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s319A1qT015649
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 02:10:01 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 1 Apr 2014 02:10:00 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 17:09:49 +0800
Message-ID: <cover.1396343261.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/3] miscellaneous patches
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
X-List-Received-Date: Tue, 01 Apr 2014 09:10:01 -0000
Content-Type: text/plain

The following changes since commit dee07bee84361eb58cdc0e267b22d71155b89b65:

  beaglebone: fix typo in the U-Boot config name (2014-03-31 23:04:36 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/misc
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/misc

Kai Kang (1):
  xorg: Fix for CVE-2013-6424

Li Wang (1):
  cmake: follow ptest output format

yanjun.zhu (1):
  util-linux-native: Remove SYS_setns system call in linux kernel 2.6.x

 meta/recipes-core/util-linux/util-linux.inc        |   6 ++
 meta/recipes-devtools/cmake/cmake.inc              |   1 +
 .../cmake/cmake/follow_ptest_output_format.patch   | 118 +++++++++++++++++++++
 .../xserver-xorg/xorg-CVE-2013-6424.patch          |  31 ++++++
 .../xorg-xserver/xserver-xorg_1.15.0.bb            |   1 +
 5 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/follow_ptest_output_format.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch

-- 
1.8.1.2


