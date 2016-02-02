Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACB67718A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 09:37:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 02 Feb 2016 01:37:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="903702426"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 01:37:45 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id CCA396A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:25:37 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:27:52 +0200
Message-Id: <cover.1454397260.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 00/15] Support for wic images in runqemu and oe-selftest
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
X-List-Received-Date: Tue, 02 Feb 2016 09:37:47 -0000

Hi,

This patchset contains set of fixes for wic, runqemu and oe-selftest to
support booting and testing wic images in qemu.

This work is based on Cristian's work from poky-contrib:ciorga/wic-testing
Thank you Cristian!

The patchset also includes bugfix for wic --use-uuid option and a bit of
code cleanup for wic tests.

[YOCTO #8691]
[YOCTO #8498]
[YOCTO #8499]

The following changes since commit 1ba62f9e53f5e2d0da9fe6ee52007562deb77f32:

  pth: Remove dead code (2016-02-01 17:16:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe-core/qemuRunner-wic-8498
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe-core/qemuRunner-wic-8498

Ed Bartosh (15):
  runqemu: add support for wic images
  runqemu: don't use virtio for wic images
  runqemu: don't set KERNEL for wic images
  runqemu: support path/to/<image>-<machine>.wic
  oe-selftest: remove unused parameter
  qemurunner: add parameter to method 'start'
  oeqa/targetcontrol: make ssh control optional
  oeqa/targetcontrol: support wic image type
  wic-image-minimal: change IMAGE_FSTYPES
  wic-image-minimal: updated .wks to boot by qemu
  oe-selftest: add new wic testcase
  wic: fix processing of --use-uuid
  wic-image-minimal: use uuid for root partition
  oe-selftest: pylinted wic tests
  oe-selftest: don't use specific tasks

 .../recipes-test/images/wic-image-minimal.bb       |  2 +-
 .../recipes-test/images/wic-image-minimal.wks      | 10 ++---
 meta/lib/oeqa/selftest/devtool.py                  |  2 +-
 meta/lib/oeqa/selftest/imagefeatures.py            |  6 +--
 meta/lib/oeqa/selftest/wic.py                      | 32 +++++++++------
 meta/lib/oeqa/targetcontrol.py                     | 20 +++++-----
 meta/lib/oeqa/utils/commands.py                    |  4 +-
 meta/lib/oeqa/utils/qemurunner.py                  | 45 +++++++++++-----------
 scripts/lib/wic/partition.py                       |  3 ++
 scripts/runqemu                                    | 15 +++++---
 scripts/runqemu-internal                           | 21 +++++-----
 11 files changed, 90 insertions(+), 70 deletions(-)

--
Regards,
Ed


