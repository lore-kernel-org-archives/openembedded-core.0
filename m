Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD25577118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:18:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Oct 2015 08:18:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,182,1444719600"; d="scan'208";a="669605283"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.73])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 08:18:20 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 10:18:36 -0500
Message-Id: <cover.1445525963.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/3] runqemu improvements
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
X-List-Received-Date: Thu, 22 Oct 2015 15:18:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first patch enable support for use kvm without vhost a new option (kvm-vhost)
was added for use kvm with vhost,

The second and third patch enables usage of virtio devices/drivers in qemu machines
by default, I ran all oe-core qemu machines with core-image-minimal, i tested 
arm, arm64, arm-lsb, x86, x86-64, x86-64-lsb running sanity tests and x86 with
core-image-rt.

The following changes since commit 8578bc17b54da97d42b257b3c8f398ac52b91a9f:

  libc-package: Fix localedef multilib dependency issues (2015-10-20 10:12:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/runqemu_changes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/runqemu_changes

Aníbal Limón (3):
  runqemu: Enable support for kvm without vhost in x86 and x86_64
  linux-yocto{,-rt}: Enable support for virtio drivers in qemu machines.
  runqemu-internal: Enable support for use virtio devices.

 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb  |  1 +
 meta/recipes-kernel/linux/linux-yocto_3.14.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb     |  2 +-
 scripts/runqemu                                  | 31 +++++++++-----
 scripts/runqemu-internal                         | 53 +++++++-----------------
 7 files changed, 42 insertions(+), 50 deletions(-)

-- 
2.1.4


