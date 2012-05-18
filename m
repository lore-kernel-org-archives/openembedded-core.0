Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVOAb-0000XG-0L
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:28:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2012 07:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145583533"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2012 07:18:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:18:10 +0300
Message-Id: <cover.1337350637.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 0/9] Kernel & Multi-lib updates
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
X-List-Received-Date: Fri, 18 May 2012 14:28:41 -0000

Richard:

Here are some fixes including the PPC xserver issue

Sau!


The following changes since commit 7163ebd92a799b8f000b2b6f303b20de468b5f90:

  Revert "kmod: Use base_libdir for installing libkmod" (2012-05-17 21:12:33 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (3):
  linux-yocto: intel BSP config changes
  kern-tools: update LICENSE field to GPLv2
  linux-yocto: policy cleanups

Gary Thomas (1):
  xserver-kdrive: Fix X server on PowerPC when built with GCC 4.7.x

Jiajun Xu (1):
  test-reexec: Add script to address issues when task re-execution

Lianhao Lu (3):
  (libc-)package.bbclass: Added MLPREFIX to locale packages.
  multilib.conf: Added multilib support for kmod.
  multilib.bbclass: Added multilib specific package QA.

Mark Hatle (1):
  sstate.bbclass: Make sure we don't have an empty fixmepath file

 meta/classes/libc-package.bbclass                  |    4 +-
 meta/classes/multilib.bbclass                      |   31 +++
 meta/classes/package.bbclass                       |    5 +-
 meta/classes/sstate.bbclass                        |   17 +-
 meta/conf/multilib.conf                            |    1 +
 .../fix-bogus-stack-variables.patch                |  233 ++++++++++++++++++++
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
 scripts/test-reexec                                |  123 ++++++++++
 12 files changed, 411 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
 create mode 100755 scripts/test-reexec

-- 
1.7.7.6



