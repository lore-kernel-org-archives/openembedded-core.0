Return-Path: <nitin.a.kamble@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 143FF70D30
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 19:45:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Aug 2014 12:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,872,1400050800"; d="scan'208";a="469217718"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by azsmga001.ch.intel.com with ESMTP; 15 Aug 2014 12:45:31 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com
Date: Fri, 15 Aug 2014 12:48:52 -0700
Message-Id: <cover.1408131949.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A bugfix for grub recipe
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
X-List-Received-Date: Fri, 15 Aug 2014 19:45:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

One of the bug reported for the grub-2 recipe is fixed in the following commit.

Thanks,
Nitin


The following changes since commit 093149d22461a3a76980635bc46cdba1c7c0b181:

  avahi: unset FILES_avahi to avoid packaging files there (2014-08-15 18:21:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  grub_2.00: strip the sparc64 files from building

 ...rub2-remove-sparc64-setup-from-x86-builds.patch | 104 +++++++++++++++++++++
 meta/recipes-bsp/grub/grub_2.00.bb                 |   3 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/grub-2.00/grub2-remove-sparc64-setup-from-x86-builds.patch

-- 
1.8.1.4


