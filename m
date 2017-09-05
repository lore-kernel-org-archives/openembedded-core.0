Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEC377B96
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:55:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 04:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="897215269"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2017 04:55:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AE893580A2D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:35 +0300
Message-Id: <cover.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH 0/7] implement wic ls/cp/rm for ext partitions
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
X-List-Received-Date: Tue, 05 Sep 2017 11:55:11 -0000

Hi,

This patchset implements listing directory contents, copying and removing
files on ext[2,3,4] partitions of partitioned images.

The following changes since commit ee5bce2d11e783c0921df47b629025a6b67c44bf:

  kernel-dev: Removed bad reference for creating patches. (2017-09-02 00:52:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (7):
  wic: implement ext fs support for 'wic ls'
  wic: implement ext fs support for 'wic cp'
  wic: implement ext fs support for 'wic rm'
  wic: update help content
  wic: selftest: add test_wic_ls_ext test case
  wic: selftest: add test_wic_cp_ext test case
  wic: selftest: add test_wic_rm_ext test case

 meta/lib/oeqa/selftest/cases/wic.py | 69 +++++++++++++++++++++++++++++++++++++
 scripts/lib/wic/engine.py           | 55 ++++++++++++++++++-----------
 scripts/lib/wic/help.py             | 64 +++++++++++++++++-----------------
 3 files changed, 136 insertions(+), 52 deletions(-)

--
Regards,
Ed


