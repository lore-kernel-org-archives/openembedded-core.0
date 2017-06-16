Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0C36678479
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:21:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 16 Jun 2017 06:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="981662049"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 16 Jun 2017 06:20:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 76411580399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:20:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:19:26 +0300
Message-Id: <cover.1497618833.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] wic: fix for #11633 and code cleanup
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
X-List-Received-Date: Fri, 16 Jun 2017 13:21:05 -0000

Hi,

This patchset contains a fix for long standing wic bug: in some cases wic
can leave updated fstab in a rootfs directory and produce duplicate fstab
entries.

A bit of code cleanup is also included into the patchset.

The following changes since commit 27917fa9e14c1f0b0c3ed20c504772cf7d07b9df:

  image.bbclass: use prependVarFlag for postfuncs (2017-06-16 15:11:22 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (4):
  runner.py: move runtool API to misc.py
  wic: flatten directory structure
  wic: code cleanup
  wic: fix restoring of original fstab

 scripts/lib/wic/engine.py                          |  2 +-
 scripts/lib/wic/filemap.py                         |  8 +---
 scripts/lib/wic/{utils => }/misc.py                | 43 +++++++++++++++---
 scripts/lib/wic/partition.py                       |  3 +-
 scripts/lib/wic/pluginbase.py                      |  3 +-
 scripts/lib/wic/plugins/imager/direct.py           | 11 ++---
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  4 +-
 .../lib/wic/plugins/source/bootimg-partition.py    |  2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  5 +--
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |  2 +-
 scripts/lib/wic/plugins/source/rootfs.py           |  2 +-
 scripts/lib/wic/utils/__init__.py                  |  0
 scripts/lib/wic/utils/runner.py                    | 52 ----------------------
 scripts/wic                                        |  2 +-
 15 files changed, 58 insertions(+), 83 deletions(-)
 rename scripts/lib/wic/{utils => }/misc.py (86%)
 delete mode 100644 scripts/lib/wic/utils/__init__.py
 delete mode 100644 scripts/lib/wic/utils/runner.py

--
Regards,
Ed

