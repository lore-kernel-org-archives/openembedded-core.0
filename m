Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28DF56F8BC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 15:47:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Mar 2014 08:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,761,1389772800"; d="scan'208";a="502765346"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2014 08:47:39 -0700
Received: from sstanacx-mobl1.ger.corp.intel.com (sstanacx-mobl1.rb.intel.com
	[10.237.105.81])
	by linux.intel.com (Postfix) with ESMTP id D66406A4083
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 08:47:23 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Mar 2014 17:47:32 +0300
Message-Id: <cover.1396188987.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/3] Master image generation and hw testing
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
X-List-Received-Date: Sun, 30 Mar 2014 15:47:47 -0000

Hello,

This is what I currently use for doing automated deployment
for a genericx86-64 image on NUC. More details on the commit
messages. There is nothing particular to genericx86-64,
it should work on any EFI-enabled device with gummiboot as bootloader.
Also see YB#1596 and it's sub-bug #5614 for a bit of background.

Cheers,
Stefan

V4: this is almost identical to the RFC sent but:
  - squased the first two patches
  - adress Otavio's comments - rename the class and use a constant for one
of the deploy commands
  - cosmetic changes, mostly comments/typos, nothing functional


The following changes since commit 790cc61a754d156c15f77c95539e17ec4d9f2c41:

  bitbake: user-manual-execution.xml: Added how BB processes curly braces. (2014-03-30 10:19:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/masterimage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/masterimage

Stefan Stanacar (3):
  initrdscripts: add install scripts with a second rootfs
  recipes-extended: add master image for testing purposes
  lib/oeqa: add a test target controller for EFI targets

 meta/lib/oeqa/controllers/masterimage.py           | 133 +++++++++++++
 meta/lib/oeqa/runtime/ssh.py                       |   2 +
 .../initrdscripts/files/init-install-efi-testfs.sh | 199 +++++++++++++++++++
 .../initrdscripts/files/init-install-testfs.sh     | 211 +++++++++++++++++++++
 .../initramfs-live-install-efi-testfs_1.0.bb       |  14 ++
 .../initramfs-live-install-testfs_1.0.bb           |  14 ++
 .../images/core-image-testmaster-initramfs.bb      |  19 ++
 .../images/core-image-testmaster.bb                |  18 ++
 8 files changed, 610 insertions(+)
 create mode 100644 meta/lib/oeqa/controllers/masterimage.py
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-testfs.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
 create mode 100644 meta/recipes-extended/images/core-image-testmaster-initramfs.bb
 create mode 100644 meta/recipes-extended/images/core-image-testmaster.bb

-- 
1.8.5.3


