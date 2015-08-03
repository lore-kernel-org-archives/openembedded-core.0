Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 74484757A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 16:28:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2015 09:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,602,1432623600"; d="scan'208";a="618370890"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 03 Aug 2015 09:28:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 19:29:47 +0300
Message-Id: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/7] More recipe reporting fixes
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
X-List-Received-Date: Mon, 03 Aug 2015 16:28:53 -0000

This patchset contains more recipe reporting fixes, some of which are based
on the review comments to the previous patchset (which got partially merged
into master). Please see specific commits for details.

The following changes since commit a8b723498c9a7106210db140452886894494b4d6:

  bitbake: cooker: Resolve file monitoring race issues when using memres bitbake (2015-08-03 07:36:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/recipe-reporting-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/recipe-reporting-fixes

Alexander Kanavin (7):
  fotowall: update SRC_URI to use github instead of qt-apps.org
  distcc: update SRC_URI to not use Google Code
  gptfdisk: update to 1.0.0
  oprofile: reorder SRC_URI lines to fix upstream version check
  xf86-video-omapfb: switch SRC_URI to debian git repo
  stress: update checksums to match upstream tarball
  recipeutils.py: allow all characters in regexes used to parse version
    strings

 meta/lib/oe/recipeutils.py                                        | 4 ++--
 meta/recipes-devtools/distcc/distcc_3.1.bb                        | 6 ++----
 .../recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb} | 8 +++-----
 meta/recipes-extended/stress/stress_1.0.4.bb                      | 6 +++---
 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb        | 2 +-
 meta/recipes-kernel/oprofile/oprofile.inc                         | 3 ++-
 meta/recipes-kernel/oprofile/oprofile_1.0.0.bb                    | 2 --
 meta/recipes-qt/qt-apps/fotowall_0.9.bb                           | 6 ++----
 8 files changed, 15 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb} (75%)

-- 
2.1.4


