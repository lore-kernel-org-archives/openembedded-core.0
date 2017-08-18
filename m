Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C22A78353
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:14:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IAEWR0023043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 03:14:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 Aug 2017 03:14:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Aug 2017 18:19:12 +0800
Message-ID: <cover.1503049300.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix runqemu startup failure
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
X-List-Received-Date: Fri, 18 Aug 2017 10:14:32 -0000
Content-Type: text/plain

The following changes since commit 55bf88603927469de9aa9f6fd4d449230d2e61e3:

  poky: Add nios2 to list of qemu targets (2017-08-17 00:21:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runqemu_boot_error
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runqemu_boot_error

Chen Qi (2):
  qemu: backport patches to fix boot failure
  qemu conf: replace deprecated option with new option

 meta/conf/machine/include/qemuboot-mips.inc        |   2 +-
 meta/conf/machine/include/qemuboot-x86.inc         |   2 +-
 meta/conf/machine/qemuarm.conf                     |   2 +-
 meta/conf/machine/qemuppc.conf                     |   2 +-
 ...0001-osdep-Add-runtime-OFD-lock-detection.patch | 141 +++++++++++++++++++++
 ...e-posix-Do-runtime-check-for-ofd-lock-API.patch |  71 +++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb      |   2 +
 7 files changed, 218 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch

-- 
1.9.1


