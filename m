Return-Path: <cristiana.voicu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC6D608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:43:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2013 06:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,839,1367996400"; d="scan'208";a="383265901"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2013 06:43:15 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 16:46:06 +0300
Message-Id: <cover.1375969277.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/5] Package upgrades
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
X-List-Received-Date: Thu, 08 Aug 2013 13:43:16 -0000

Hi,

Tests done:
 * build tested on AB running following nightlies: x86, x86_64, ppc, mips, arm;
 * checked with rpm if the packages were installed; basic functionality for kmod,
systemtap, atk, mkfontscale and ed

Thanks,
Cristiana

The following changes since commit f63e7f4323368c0d6fe7a1d44393a7e15652d4f2:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work2

Cristiana Voicu (5):
  ed: upgrade to 1.9
  mkfontscale: upgrade to 1.1.1
  atk: upgrade to 2.9.3
  systemtap: upgrade to 2.3
  kmod: upgrade to 14

 meta/recipes-extended/ed/{ed_1.8.bb => ed_1.9.bb}  |    7 +++----
 .../{mkfontscale_1.1.0.bb => mkfontscale_1.1.1.bb} |    6 ++----
 meta/recipes-kernel/kmod/kmod-native_git.bb        |    1 -
 meta/recipes-kernel/kmod/kmod.inc                  |    5 ++---
 ...-man-page-generation-because-we-don-t-hav.patch |   21 ++++++++++----------
 .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        |    5 ++---
 meta/recipes-kernel/kmod/kmod_git.bb               |    3 +--
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 --
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 ++--
 .../atk/{atk_2.8.0.bb => atk_2.9.3.bb}             |    4 ++--
 10 files changed, 25 insertions(+), 33 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.8.bb => ed_1.9.bb} (68%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.0.bb => mkfontscale_1.1.1.bb} (78%)
 rename meta/recipes-support/atk/{atk_2.8.0.bb => atk_2.9.3.bb} (79%)

-- 
1.7.9.5


