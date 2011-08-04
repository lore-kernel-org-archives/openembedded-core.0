Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5Wx-0005MH-Gh
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 14:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; d="scan'208";a="35511606"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 14:28:14 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:52 -0700
Message-Id: <cover.1312469789.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 00/10] Commits to enable x32 infrastructure
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
X-List-Received-Date: Thu, 04 Aug 2011 21:32:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here are commits to enable infrastructure for use of x32 layer.

The kernel fixes from Bruce are for getting linux-korg recipe to work.

The following changes since commit 5561aaad28ed6db6d962f88db32814043044731f:

  eglibc: Fix patch merge breakage (2011-08-04 15:41:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/x32.rebased
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32.rebased

Bruce Ashfield (3):
  kern-tools: extend arbitrary repository support
  linux-yocto: process the existing branch for configuration
  linux-yocto: pass KMACHINE to updateme, not MACHINE

Nitin A Kamble (7):
  glibc: bring back the needed support for glibc recipes
  toolchain-scripts & other classes: add TARGET_LD_ARCH &
    TARGET_AS_ARCH vars
  kernel,module-base.bbclass: fix KERNEL_LD & KERNEL_AR vars
  siteinfo.bbclass: add entries for new x86_64 ABI targets
  insane.bbclass: add entries for linux-gnu<ABI>
  x86 tune inc files: add x32 abi tune parameters
  local.conf.sample: make BBMASK assignment weak

 meta-yocto/conf/local.conf.sample                  |    2 +-
 meta/classes/allarch.bbclass                       |    2 +
 meta/classes/cross-canadian.bbclass                |    2 +
 meta/classes/cross.bbclass                         |    2 +
 meta/classes/crosssdk.bbclass                      |    2 +
 meta/classes/insane.bbclass                        |    9 +++++
 meta/classes/kernel-yocto.bbclass                  |   11 +-----
 meta/classes/kernel.bbclass                        |    2 +-
 meta/classes/module-base.bbclass                   |    4 +-
 meta/classes/native.bbclass                        |   10 ++++--
 meta/classes/nativesdk.bbclass                     |    4 ++
 meta/classes/siteinfo.bbclass                      |   14 ++++++++-
 meta/classes/toolchain-scripts.bbclass             |    9 +++--
 meta/conf/bitbake.conf                             |   23 ++++++++++----
 meta/conf/distro/include/tclibc-glibc.inc          |   32 ++++++++++++++++++++
 meta/conf/distro/include/tcmode-default.inc        |    5 +++
 meta/conf/machine/include/ia32/arch-ia32.inc       |   23 ++++++++++++--
 meta/conf/machine/include/tune-core2.inc           |    4 ++
 meta/conf/machine/include/tune-x86_64.inc          |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 20 files changed, 132 insertions(+), 32 deletions(-)
 create mode 100644 meta/conf/distro/include/tclibc-glibc.inc

-- 
1.7.6



