Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 82C0460E07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 16:36:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2014 09:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,695,1389772800"; d="scan'208";a="476505350"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 09:29:30 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id 4B57B6A4087
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:29:16 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 18:29:32 +0200
Message-Id: <cover.1395332218.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [RFC PATCH 0/4] Master image generation and testing
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
X-List-Received-Date: Thu, 20 Mar 2014 16:36:27 -0000


Hello,

This is what I currently use for doing automated deployment
for a genericx86-64 image. More details on the commit
messages. There is nothing particular to genericx86-64,
it should work on any EFI-enabled device with gummiboot as bootloader.

Also see YB#1596 and it's sub-bug #5614 for a bit of background.
Any comments, questions, most welcome.

Cheers,
Stefan

--

Note that this is actually v3.
v1 and v2 [1] were sent on the poky mailing list, as everything was added to meta-yocto-bsp layer.
Nothing much changed since v2 except moving the files around.
Changes in this version include:
 - rebase on top of meta
 - add to the master image only the required utilities instead of an entire packagegroup
 - use TEST_POWERCONTROL_EXTRA_ARGS with TEST_POWERCONTROL_CMD
 - split the second patch in the earlier series in two

[1] https://lists.yoctoproject.org/pipermail/poky/2014-March/009631.html






Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 49aad7da07e187f206e963001844605731b01247:

  bitbake: runqueue: Remove use of waitpid on worker processes (2014-03-19 17:46:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/masterimage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/masterimage

Stefan Stanacar (4):
  initrdscripts: copy of the default install scripts
  initrdscripts: add install scripts with a second rootfs
  recipes-extended: add master image for testing purposes
  lib/oeqa: add a test target controller for EFI targets

 meta/lib/oeqa/controllers/masterimage.py           | 124 ++++++++++++
 meta/lib/oeqa/runtime/ssh.py                       |   2 +
 .../initrdscripts/files/init-install-efi-testfs.sh | 199 +++++++++++++++++++
 .../initrdscripts/files/init-install-testfs.sh     | 211 +++++++++++++++++++++
 .../initramfs-live-install-efi-testfs_1.0.bb       |  20 ++
 .../initramfs-live-install-testfs_1.0.bb           |  20 ++
 .../images/core-image-testmaster-initramfs.bb      |  20 ++
 .../images/core-image-testmaster.bb                |  13 ++
 8 files changed, 609 insertions(+)
 create mode 100644 meta/lib/oeqa/controllers/masterimage.py
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-testfs.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
 create mode 100644 meta/recipes-extended/images/core-image-testmaster-initramfs.bb
 create mode 100644 meta/recipes-extended/images/core-image-testmaster.bb

-- 
1.8.5.3


