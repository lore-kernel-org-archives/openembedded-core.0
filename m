Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC2071AB7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 08 Jun 2017 09:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="865936365"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2017 09:14:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 097855806E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:14:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:42 +0300
Message-Id: <cover.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/25] #11283 wic ls & cp & rm
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:01 -0000

Hi,

This is a consolidated patchet made of previously sent 'wic ls' 'wic cp' and
'wic rm' patchset. It doesn't depend on generic efi implementation, which
made these 3 patchsets pending.

Please, review and merge.

Thanks

The following changes since commit 4a7612c7a12b9a381fb8343ba9586272b889fc15:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (25):
  filemap: fix skip logic
  filemap: add parameter 'length' to sparse_copy
  bootimg-pcbios: make boot image file unique
  wic: add wic_init_parser_ls
  wic: add help and usage content for 'wic ls'
  wic: add 'wic ls' command
  engine: implement listing wic images
  selftest: add new test case test_wic_ls
  wic: add wic_init_parser_cp
  wic: add help and usage content for 'wic cp'
  wic: add 'wic cp' command
  wic: add Disk._prop helper
  wic: add mcopy property
  filemap: change signature of sparse_copy function
  filemap: check if dest is written for every block
  filemap: calculate dst size correctly
  wic: add Disk._put_part_image method
  wic: fully implement 'wic cp'
  selftest: add test_wic_cp test case
  wic: add wic_init_parser_rm
  wic: add help and usage content for 'wic rm'
  wic: add 'wic rm' command
  wic: implement removing files
  wic: implement removing directories
  selftest: add test_wic_rm test case

 meta/lib/oeqa/selftest/cases/wic.py              |  96 +++++++++++-
 scripts/lib/wic/engine.py                        | 152 ++++++++++++++++++-
 scripts/lib/wic/filemap.py                       |  50 ++++--
 scripts/lib/wic/help.py                          | 184 +++++++++++++++++++++++
 scripts/lib/wic/plugins/imager/direct.py         |   2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |   2 +-
 scripts/wic                                      |  89 +++++++++++
 7 files changed, 562 insertions(+), 13 deletions(-)

-- 
2.1.4


