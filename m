Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0597D77CD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:44:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 30 Mar 2017 11:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="82827701"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2017 11:44:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6EBF42C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:44:27 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:42 +0300
Message-Id: <cover.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] wic: Fix fstype handling
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
X-List-Received-Date: Thu, 30 Mar 2017 18:44:34 -0000

Hi,

This patchset adds support for msdos(FAT16) fstype (#11137) and fixes number of issues
in handling fstypes in wic code:
   - restricted supported fstypes in wks parser code
   - fixed the code that creates partitions of certain fstypes
   - removed support of empty squashfs partitions

The following changes since commit 6bbf3176fe227712a478f5b4b1fdcf9417a89568:

  oe-selftest: add test_image_bootpart_globbed test for wic (2017-03-30 13:27:19 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (9):
  oe-selftest: fix incorrect fstype
  wic: allow only supported fstypes
  wic: don't silently skip unknown fstypes
  wic: support 'msdos' fstype
  wic: set FAT 16 for msdos partitions
  wic: set correct system id for msdos partitions
  wic: fix list of supported fstypes in help content
  oe-selftest: test creation of msdos partition
  wic: remove prepare_empty_partition_squashfs

 meta/lib/oeqa/selftest/wic.py            |  4 +-
 scripts/lib/wic/help.py                  |  2 +
 scripts/lib/wic/ksparser.py              |  4 +-
 scripts/lib/wic/partition.py             | 99 +++++++++++++-------------------
 scripts/lib/wic/plugins/imager/direct.py | 15 +----
 5 files changed, 48 insertions(+), 76 deletions(-)

--
Regards,
Ed


