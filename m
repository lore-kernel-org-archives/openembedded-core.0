Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 57B166AB9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2015 12:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="737098950"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2015 12:11:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0E52D6A4083;
	Mon, 29 Jun 2015 12:10:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:13 +0300
Message-Id: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 00/20] miscellaneous fixes. poky-conrib:ed/wic/misc
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:25 -0000

Hi,

This patchset includes usability fixes, new functionality,
code cleanup, refactoring and 2 new test cases for wic.

The work was done during verification of multi-rootfs EFI images.

Fixes YOCTO #7854 and #7912

Ed Bartosh (20):
  wic: Fix misleading message
  wic: Test rootfs plugin using image recipes
  wic: Test rootfs plugin using rootfs paths
  wic: Refactor getting bitbake variables
  wic: Include mount point into image report
  wic: Remove annoing debug message
  wic: Turn off debug output for 'bitbake -e'
  wic: Refactor prepare_rootfs API
  wic: Rename partition images
  wic: Get rid of useless variable 'image_rootfs'
  wic: Call methods better way
  wic: Refactor prepare_empty_partition API
  wic: Remove duplicated code
  wic: Fix naming conflict
  wic: Add --uuid partition option
  wic: Refactor fstab update code
  wic: Remove __write_partition method
  wic: Fix confusing error message
  wic: Code cleanup: long lines, identation and whitespaces
  wic: Code cleanup: unused imports

 meta/lib/oeqa/selftest/wic.py                      |  27 +++
 .../image/canned-wks/directdisk-multi-rootfs.wks   |  23 +++
 scripts/lib/image/engine.py                        |  38 +---
 scripts/lib/image/help.py                          |   5 +
 scripts/lib/wic/conf.py                            |  28 ++-
 scripts/lib/wic/imager/baseimager.py               |   3 +-
 scripts/lib/wic/imager/direct.py                   |  87 ++++-----
 .../lib/wic/kickstart/custom_commands/micboot.py   |   2 +-
 .../lib/wic/kickstart/custom_commands/partition.py | 209 +++++++--------------
 scripts/lib/wic/msger.py                           |  23 +--
 scripts/lib/wic/plugin.py                          |   2 -
 scripts/lib/wic/pluginbase.py                      |   1 -
 scripts/lib/wic/plugins/imager/direct_plugin.py    |   4 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   1 -
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   4 +-
 scripts/lib/wic/plugins/source/rootfs.py           |   9 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |   6 +-
 scripts/lib/wic/utils/cmdln.py                     |   1 -
 scripts/lib/wic/utils/oe/misc.py                   |  89 ++++-----
 scripts/lib/wic/utils/partitionedfs.py             |  41 ++--
 scripts/lib/wic/utils/runner.py                    |   2 +-
 scripts/wic                                        |  66 +++----
 22 files changed, 282 insertions(+), 389 deletions(-)
 create mode 100644 scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks

--
Ed

