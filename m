Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A9CFC6BD9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 16:41:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Aug 2013 09:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,992,1367996400"; d="scan'208";a="288974860"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.186])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Aug 2013 09:41:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 09:41:02 -0700
Message-Id: <cover.1377880667.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/11] Bug Fixes
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
X-List-Received-Date: Fri, 30 Aug 2013 16:41:04 -0000

Richard,

Here is a set of patches queued up post Kernel Update.

Thanks
	Sau!

The following changes since commit ef38a0aed35357d035ca587162158cd2f55b958f:

  runqemu-ifdown: clean up the remaining iptables rules (2013-08-30 16:21:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chunrong Guo (1):
  gcc-4.8: fix ICE of cross-compile for PowerPC e500v2 targets

Jackie Huang (2):
  multilib.bbclass: Expand the WHITELISTs with multilib prefix
  syslinux.bbclass: pull files from correct places for multilib

Jonathan Liu (2):
  mesa: add missing elfutils dependency for r600 PACKAGECONFIG
  systemd: use /bin/mkdir instead of host mkdir path

Peter A. Bigot (2):
  oe-setup-rpmrepo: add native sysroot so nativepython can be found by
    env
  bluez4: fix network Connect parameter validation

Roy.Li (2):
  libsamplerate0: add PACKAGECONFIG for fftw
  btrfs-tools: Add dependency on lzo acl e2fsprogs

Saul Wold (2):
  perl: Backport 2 CVE Patches
  python: Backport 2 CVE from upstream

 meta/classes/multilib.bbclass                      |   7 +
 meta/classes/syslinux.bbclass                      |   8 +-
 ...ork-fix-network-Connect-method-parameters.patch |  30 +++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   1 +
 ...-Use-bin-mkdir-instead-of-host-mkdir-path.patch |  31 +++
 meta/recipes-core/systemd/systemd_206.bb           |   1 +
 .../btrfs-tools/btrfs-tools_git.bb                 |   2 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
 .../0045-gcc-4.8-PR57717-PowerPC-E500v2.patch      |  21 ++
 .../0001-Fix-misparsing-of-maketext-strings.patch  |  86 +++++++
 ...mature-hsplit-calls-and-only-trigger-REHA.patch | 178 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.3.bb          |   3 +
 .../python/python/CVE-2013-4073_py27.patch         | 251 +++++++++++++++++++++
 .../python/python/pypirc-secure.patch              |  35 +++
 meta/recipes-devtools/python/python_2.7.3.bb       |   2 +
 meta/recipes-graphics/mesa/mesa.inc                |   6 +-
 .../libsamplerate/libsamplerate0_0.1.8.bb          |   2 +
 scripts/oe-setup-rpmrepo                           |   1 +
 18 files changed, 659 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Fix-misparsing-of-maketext-strings.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Prevent-premature-hsplit-calls-and-only-trigger-REHA.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2013-4073_py27.patch
 create mode 100644 meta/recipes-devtools/python/python/pypirc-secure.patch

-- 
1.8.3.1


