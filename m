Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BAAB072F0A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:24:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 07:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="232836765"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2017 07:24:04 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6AB096A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:24:00 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 17:10:08 +0200
Message-Id: <cover.1488812619.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] test efi images in qemu
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
X-List-Received-Date: Mon, 06 Mar 2017 15:24:03 -0000

Hi,

This patchset adds testing of efi images in qemu to the wic test suite,
related oe-selftest API changes and small improvements.

The following changes since commit 4188e53f803aefdb26768abfad591283662cd27e:

  poky: make 4.10 the qemu* default (2017-03-04 23:19:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (5):
  qemurunner: add runqemuparams argument to commands.runqemu
  targetcontrol: add image_fstype argument to commands.runqemu
  selftest: test wic efi image in qemu
  qemurunner.py: ignore decode errors
  selftest: remove extra backslashes from debug output

 meta/lib/oeqa/selftest/base.py        |  4 ++--
 meta/lib/oeqa/selftest/wic.py         | 14 ++++++++++++++
 meta/lib/oeqa/targetcontrol.py        |  8 ++++----
 meta/lib/oeqa/utils/commands.py       |  6 +++---
 meta/lib/oeqa/utils/qemurunner.py     |  6 +++---
 meta/lib/oeqa/utils/qemutinyrunner.py |  2 +-
 6 files changed, 27 insertions(+), 13 deletions(-)

--
Regards,
Ed


