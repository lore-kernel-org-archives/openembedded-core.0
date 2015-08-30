Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0D30E76BC5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 21:14:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 30 Aug 2015 14:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,436,1437462000"; d="scan'208";a="635079645"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Aug 2015 14:14:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 4727A6A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 14:13:41 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 00:14:22 +0300
Message-Id: <cover.1440969020.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] V4: Build wic images with bitbake
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
X-List-Received-Date: Sun, 30 Aug 2015 21:14:35 -0000

Hi,

This is hopefully last version of the patchset.
I've changed location of .wks and .bb files as Richard suggested.

The following changes since commit 0f84702f0811cba4b6e6e890d478f6e98937b831:

  image_types.bbclass: add wic image type (2015-08-30 21:38:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wic-image-type
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wic-image-type

Ed Bartosh (5):
  image.py: write bitbake variables to .env file
  oe-selftest: test generation of <image>.env
  wic-image-minimal: add wic image recipe and .wks
  oe-selftest: test building wic image by bitbake
  wic: use bitbake variable ROOTFS_SIZE

 .../recipes-test/images/wic-image-minimal.bb       | 14 +++++++++
 .../recipes-test/images/wic-image-minimal.wks      | 10 +++++++
 meta/classes/image_types.bbclass                   |  4 +++
 meta/lib/oe/image.py                               | 18 ++++++++++++
 meta/lib/oeqa/selftest/wic.py                      | 34 ++++++++++++++++++++++
 scripts/lib/wic/imager/direct.py                   | 14 +++++++++
 6 files changed, 94 insertions(+)
 create mode 100644 meta-selftest/recipes-test/images/wic-image-minimal.bb
 create mode 100644 meta-selftest/recipes-test/images/wic-image-minimal.wks

--
Ed


