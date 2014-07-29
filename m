Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 17D6F7017F
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 18:30:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jul 2014 11:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,758,1400050800"; d="scan'208";a="550845232"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 29 Jul 2014 11:30:07 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, darren.hart@intel.com,
	ross.burton@intel.com, richard.purdie@linuxfoundation.org
Date: Tue, 29 Jul 2014 11:34:37 -0700
Message-Id: <cover.1406658528.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A commit to extend the INITRD variable
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
X-List-Received-Date: Tue, 29 Jul 2014 18:31:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit extends the INITRD variable, so that it can accommodate multiple
filesystems as expected by the Linux kernel.

Thanks to Ross Burton for this suggestion to simplify the early microcode
loading support in the meta-intel Layer.

Thanks,
Nitin

The following changes since commit 2d1660112e54653f7bb763939d0416472c49fe01:

  populate_sdk_base: Fix grep command usage on old hosts (2014-07-29 09:58:27 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  INITRD var: make it a list of filesystem images

 documentation/ref-manual/ref-classes.xml   |  4 ++--
 documentation/ref-manual/ref-variables.xml |  2 +-
 meta/classes/boot-directdisk.bbclass       | 13 ++++++++++---
 meta/classes/bootimg.bbclass               | 27 ++++++++++++++++++++++-----
 meta/classes/grub-efi.bbclass              |  2 +-
 meta/classes/syslinux.bbclass              |  2 +-
 meta/conf/documentation.conf               |  2 +-
 7 files changed, 38 insertions(+), 14 deletions(-)

-- 
1.8.1.4


