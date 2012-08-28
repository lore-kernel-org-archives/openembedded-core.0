Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6NeG-0000vW-H5
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:24:14 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Aug 2012 08:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,327,1344236400"; d="scan'208";a="138763287"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.20])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2012 08:11:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:11:54 -0700
Message-Id: <cover.1346166469.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/15] Misc Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 15:24:14 -0000

Richard,

This includes some build related fixes for perf along with
the cleanup's in the archiver from Robert.

There are also 2 changes for meta-yocto pending (one left over
from Tom bsp-yocto set, and a local.conf.sample.extended for
the achiver class changes).

I removed the kernel updates and one of your patches due to 
failures.

Thanks
	Sau!


The following changes since commit 1677b736bca5dc46db522da1874459d2de77209d:

  terminal.py: use unique ids for screen sessions (2012-08-25 14:44:31 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (1):
  ethtool: package update 3.4.1 -> 3.5

Peter Seebach (1):
  runqemu-export-rootfs and friends: don't put pseudo db in target fs

Richard Purdie (4):
  e2fsprogs: Fully remove/disable blkid
  e2fsprogs: Drop fsck binary
  udev: Drop hid2hci, its provided by bluez4 now
  staging.bbclass: Might as well drop the applications, fonts and
    pixmap directories from ${datadir}

Robert Yang (6):
  archiver.bbclass: indent fixes
  archiver.bbclass: fix the coding style
  archiver.bbclass: fix the fakeroot and other issues
  archiver.bbclass: remove the "upper()" function
  copyleft_compliance.bbclass: remove the duplicated code
  archiver.bbclass: fix the remove error

Roy.Li (1):
  bitbake: compile tar-replacement firstly

Tom Zanussi (2):
  ia32-base.inc: new include file
  perf: add bison and flex to DEPENDS

 meta/classes/archive-configured-source.bbclass     |    9 +-
 meta/classes/archive-original-source.bbclass       |    9 +-
 meta/classes/archive-patched-source.bbclass        |    9 +-
 meta/classes/archiver.bbclass                      |  884 ++++++++++----------
 meta/classes/copyleft_compliance.bbclass           |   51 +--
 meta/classes/package_rpm.bbclass                   |   43 +-
 meta/classes/staging.bbclass                       |    1 +
 meta/conf/machine/include/ia32-base.inc            |   58 ++
 meta/recipes-core/udev/udev.inc                    |    3 +
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |    1 -
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb |   13 +-
 .../installer/adt-installer/scripts/extract_rootfs |    8 +-
 .../ethtool/{ethtool_3.4.1.bb => ethtool_3.5.bb}   |    4 +-
 meta/recipes-kernel/perf/perf_3.4.bb               |    3 +-
 scripts/bitbake                                    |    7 +-
 scripts/runqemu-export-rootfs                      |    2 +-
 scripts/runqemu-extract-sdk                        |   15 +-
 18 files changed, 595 insertions(+), 527 deletions(-)
 create mode 100644 meta/conf/machine/include/ia32-base.inc
 rename meta/recipes-extended/ethtool/{ethtool_3.4.1.bb => ethtool_3.5.bb} (79%)

-- 
1.7.7.6



