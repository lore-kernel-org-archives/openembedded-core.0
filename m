Return-Path: <costin.c.constantin@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B1628731A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Dec 2015 04:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="863931614"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2015 04:28:34 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 52C5C6A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:35 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:40:52 +0200
Message-Id: <cover.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/12] Include binaries in test cases and update runexported.py
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:37 -0000

The set of patches addresses Yocto binararies inclusion related features and
updates to the runexported.py test launcher script for machines where poky
environment is not available.
As a result runtime test cases can be written to include native and target
specific binaries, both packed as .rpm files or pre-unpacked for the situation
where the remote target has no package manager. runexported.py includes new
functionality.

For all the above, enhancements are described in:
[YOCTO #7850], [YOCTO #8478], [YOCTO #8479], [YOCTO #8481], [YOCTO #8530]
[YOCTO #8534], [YOCTO #8535], [YOCTO #8536]

The following changes since commit f1f3716776078d68bd9e3734bca881a486dc2ea3:

  meta: more removals of redunant FILES_${PN}-dbg (2015-12-16 12:12:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/CI2-YOCTO7850
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/CI2-YOCTO7850

Costin Constantin (4):
  oeqa/utils/testexport.py: add functionality for exporting binaries
  classes/testimage.bbclass: add support for binaries export
  utils/decorators.py: add TestNeedsBin() decorator
  buildtools-with-tc.bb: extend buildtools-tarball to include test cases

Lucian Musat (8):
  oeqa/runexported: Add option to run arbitrary tests.
  oeqa/runexported: Fix a problem with ssh_target_log symlink.
  oeqa/testimage: Added support for folder names in TEST_SUITES.
  oeqa/runexported: Added support for folder names in TEST_SUITES.
  oeqa/runexported: The runner supports tests from other layers.
  oeqa/runexported: Add parameter support for machine arch.
  oeqa/testimage: Added export features.
  oeqa/runtime: Copy all __init__.py files from all layers.

 meta/classes/testimage.bbclass               | 257 ++++++++++++++++++++++++--
 meta/lib/oeqa/runexported.py                 |  57 +++++-
 meta/lib/oeqa/utils/decorators.py            |  48 +++++
 meta/lib/oeqa/utils/testexport.py            | 263 +++++++++++++++++++++++++++
 meta/recipes-core/meta/buildtools-with-tc.bb |  37 ++++
 5 files changed, 641 insertions(+), 21 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/testexport.py
 create mode 100644 meta/recipes-core/meta/buildtools-with-tc.bb

-- 
2.5.0


