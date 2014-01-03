Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E1F0D60DC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 07:58:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 02 Jan 2014 23:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,596,1384329600"; d="scan'208";a="453139544"
Received: from cvoicu-vostro-460.rb.intel.com (HELO google.com.com)
	([10.237.105.151])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2014 23:58:47 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 10:05:39 +0200
Message-Id: <cover.1388735980.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Package upgrade
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
X-List-Received-Date: Fri, 03 Jan 2014 07:58:48 -0000

The package has been succesfully compiled for all major architectures.
Tested on a core-image-sato, functionalities like lsmod, kmod list or kmod -V.

The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work2

Cristiana Voicu (1):
  kmod: Update to Rev 16 via git

 meta/recipes-kernel/kmod/kmod-native_git.bb        |    3 +-
 meta/recipes-kernel/kmod/kmod.inc                  |    5 +--
 .../kmod/0001-Fix-build-with-older-gcc-4.6.patch   |   44 --------------------
 .../kmod/kmod/fix-seperatebuilddir.patch           |   34 ---------------
 4 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Fix-build-with-older-gcc-4.6.patch
 delete mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch

-- 
1.7.9.5


