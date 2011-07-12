Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QgoKo-0002An-8V
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 03:33:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2011 18:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25172498"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2011 18:29:55 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 12:02:35 -0700
Message-Id: <cover.1310497097.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] commits for yocto.git tree for x32 work
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
X-List-Received-Date: Wed, 13 Jul 2011 01:33:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These are commits for yocto tree. I came up with as part of the x32 work. 
I think these commits does not belong in the x32 layer and should go
in the yocto/oecore tree.

The siteinfo.bbclass commit is a hacky way to get the the right siteinfo for 
x32 now. In the future a better solution will be implemented for that purpose.

The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:

  insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/x32
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32

Nitin A Kamble (5):
  siteinfo.bbclass: hack for x32
  udev-172: add a newer version for newer kernel
  runqemu: support qemux32 machine
  kernel.bbclass: fix the broken lines
  glibc: fix false failure

 meta/classes/kernel.bbclass                       |    4 +-
 meta/classes/siteinfo.bbclass                     |    3 +
 meta/recipes-core/glibc/glibc.inc                 |    2 +-
 meta/recipes-core/udev/udev-172/init              |   59 +++++++++
 meta/recipes-core/udev/udev-172/local.rules       |   35 ++++++
 meta/recipes-core/udev/udev-172/permissions.rules |  131 +++++++++++++++++++++
 meta/recipes-core/udev/udev-172/run.rules         |   14 +++
 meta/recipes-core/udev/udev-172/udev.rules        |  116 ++++++++++++++++++
 meta/recipes-core/udev/udev_172.bb                |    6 +
 scripts/qemuimage-testlib                         |    2 +-
 scripts/runqemu                                   |   12 ++-
 scripts/runqemu-internal                          |   25 ++++
 12 files changed, 401 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev-172/init
 create mode 100644 meta/recipes-core/udev/udev-172/local.rules
 create mode 100644 meta/recipes-core/udev/udev-172/permissions.rules
 create mode 100644 meta/recipes-core/udev/udev-172/run.rules
 create mode 100644 meta/recipes-core/udev/udev-172/udev.rules
 create mode 100644 meta/recipes-core/udev/udev_172.bb

-- 
1.7.5.4



