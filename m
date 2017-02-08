Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E23D671CAF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2017 11:14:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="931635298"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 Feb 2017 11:14:03 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E6B5C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:01 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:24 +0200
Message-Id: <cover.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] #10619: refactor wic codebase (continuation)
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:04 -0000

Hi,

This patchset simplifies interfaces of DirectPlugin and underlying
set of APIs located in partitionedfs module. It also removes one of
two different structures for partitioning info.

The following changes since commit a624cf7f95c8cf4ff764cc997fd1db4601b97dcc:

  oeqa/selftest/pkgdata: use m4 instead of bash (2017-02-07 14:50:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (9):
  wic: partitionedfs: merged __format_disks and create
  wic: partitionedfs: get rid of __add_partition
  wic: partitionedfs: rename __create_partition and __add_disk
  wic: direct: get rid of _get_parts getter
  wic: use the same partition object in direct and partitionedfs
  wic: make sure layout_partitions is called once
  wic: direct: remove unused plugin attributes
  wic: direct: remove unused import
  wic: remove unused argument scripts_path

 scripts/lib/wic/engine.py                |   7 +-
 scripts/lib/wic/partition.py             |   2 +
 scripts/lib/wic/plugins/imager/direct.py |  54 ++-------
 scripts/lib/wic/utils/partitionedfs.py   | 197 ++++++++++++-------------------
 scripts/wic                              |   2 +-
 5 files changed, 95 insertions(+), 167 deletions(-)

--
Regards,
Ed


