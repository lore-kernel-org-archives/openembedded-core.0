Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A299577047
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 22:51:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Sep 2015 15:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,609,1437462000"; d="scan'208";a="815694257"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.83])
	by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2015 15:51:24 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 17:51:21 -0500
Message-Id: <cover.1443564436.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com, benjamin.esquivel@intel.com
Subject: [PATCH 0/2] qemuarm enable virtio devices
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
X-List-Received-Date: Tue, 29 Sep 2015 22:51:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use virtio block device into qemuarm for avoid qemu SCSI device problem that
is broken.

I tested (ran testimage) this patches using core-image-sato and core-image-lsb
with kernels 3.14, 3.19 and 4.1.

[YOCTO #8060]

The following changes since commit f78f90240a3041be426c6ba9085849352164ee8b:

  bitbake: prserv/serv.py: Better messaging when starting/stopping the server with port=0 (2015-09-28 12:00:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/qemuarm_virtio
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/qemuarm_virtio

Aníbal Limón (2):
  linux-yocto_{3.14,3.19,4.1}: qemuarm enable virtio drivers
  runqemu-internal: qemuarm enable usage of virtio devices

 meta/recipes-kernel/linux/linux-yocto_3.14.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_3.19.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_4.1.bb  |  1 +
 scripts/runqemu-internal                      | 14 ++++++++++++--
 4 files changed, 15 insertions(+), 2 deletions(-)

-- 
1.9.1


