Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5C13076E04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 08:49:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 17 Sep 2015 01:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,545,1437462000"; d="scan'208";a="563417747"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Sep 2015 01:49:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id E41256A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 01:48:43 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 11:49:29 +0300
Message-Id: <cover.1442479528.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic] [PATCH v2 0/4] wic bugfix and improvements
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
X-List-Received-Date: Thu, 17 Sep 2015 08:49:39 -0000

Hi,

This patchset contains a changes suggested by QA team.
Daniel, thank you for suggestions!

Changes in v2: added one more patch

The following changes since commit ea562de57590c966cd5a75fda8defecd397e6436:

  qemu: Update to upstream patches (2015-09-14 20:46:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/misc

Ed Bartosh (4):
  wic: add dependencies to wic-image-minimal recipe
  wic: use ext4 in wic-image-minimal.wks
  wic: fix partition size calculation
  wic-image-minimal: add dependency to .wks

 meta-selftest/recipes-test/images/wic-image-minimal.bb  | 4 ++++
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 6 +++---
 scripts/lib/wic/imager/direct.py                        | 3 +--
 3 files changed, 8 insertions(+), 5 deletions(-)

--
Ed


