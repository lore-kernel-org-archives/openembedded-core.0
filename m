Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EF063608CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 13:58:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 22 Jul 2013 06:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,719,1367996400"; d="scan'208";a="369134469"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2013 06:58:35 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 16:58:31 +0300
Message-Id: <cover.1374501371.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] elfutils: fix backends' Makefile.am
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
X-List-Received-Date: Mon, 22 Jul 2013 13:58:36 -0000

The following changes since commit 31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9:

  poky-tiny.conf: blacklist core-image-weston option (2013-07-18 21:26:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4849_install_toolchain_errors
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4849_install_toolchain_errors

Laurentiu Palcu (1):
  elfutils: fix backends' Makefile.am

 .../elfutils/elfutils-0.155/hppa_backend.diff      |   15 ++++++++++-----
 .../elfutils/elfutils-0.155/m68k_backend.diff      |   12 +++++++++---
 .../elfutils/elfutils-0.155/mips_backend.diff      |   16 +++++++++++-----
 3 files changed, 30 insertions(+), 13 deletions(-)

-- 
1.7.9.5


