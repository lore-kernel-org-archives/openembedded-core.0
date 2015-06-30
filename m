Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A487C75C54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:52:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2015 01:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="597305080"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Jun 2015 01:52:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B577C6A4005;
	Tue, 30 Jun 2015 01:52:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:32 +0300
Message-Id: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH v2 00/20] miscellaneous fixes. poky-conrib:ed/wic/misc
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
X-List-Received-Date: Tue, 30 Jun 2015 08:52:46 -0000

Hi,

This patchset includes usability fixes, new functionality,
code cleanup, refactoring and 2 new test cases for wic.

The work was done during verification of multi-rootfs EFI images.

Fixes YOCTO #7854 and #7912

Changes in v2:
 - removed global statement in get_bitbake_var. Thanks to Christopher Larson to point that out to me
 - added one indentation fix

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
 scripts/lib/wic/imager/direct.py                   |  91 ++++-----
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
 scripts/lib/wic/utils/oe/misc.py                   |  87 ++++-----
 scripts/lib/wic/utils/partitionedfs.py             |  41 ++--
 scripts/lib/wic/utils/runner.py                    |   2 +-
 scripts/wic                                        |  66 +++----
 22 files changed, 282 insertions(+), 391 deletions(-)
 create mode 100644 scripts/lib/image/canned-wks/directdisk-multi-rootfs.wks

--
Ed


