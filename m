Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1888A767A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:27:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 07:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779724734"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 07:27:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:28:40 +0300
Message-Id: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
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
X-List-Received-Date: Fri, 07 Aug 2015 14:27:49 -0000

This patchset contains more recipe reporting fixes, some of which are based
on the review comments to the previous patchset (which got partially merged
into master). Please see specific commits for details.

Version 2 of the patch improves the commit message for stess recipe patch,
and adds the use of BPN and BP to the same recipe. It also fixes build failures
for fotowall and distcc recipes (incorrectly set S), and xf86-video-omapfb
(incorrect commit id).

The following changes since commit 58197f345b203f55de202f8c91129e3d381359ed:

  bitbake: toastergui: layerBtn Fix build trigger mechanism (2015-08-06 16:04:50 -0500)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/recipe-reporting-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/recipe-reporting-fixes

Alexander Kanavin (7):
  fotowall: update SRC_URI to use github instead of qt-apps.org
  distcc: update SRC_URI to not use Google Code
  gptfdisk: update to 1.0.0
  oprofile: reorder SRC_URI lines to fix upstream version check
  xf86-video-omapfb: switch SRC_URI to debian git repo
  stress: update checksums to match upstream tarball, use BPN and BP in
    SRC_URI
  recipeutils.py: allow all characters in regexes used to parse version
    strings

 meta/lib/oe/recipeutils.py                         |  4 +--
 meta/recipes-devtools/distcc/distcc_3.1.bb         |  7 ++---
 .../fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb}   |  8 ++---
 meta/recipes-extended/stress/stress_1.0.4.bb       |  8 ++---
 ...apfb-from-from-crashing-when-pixelclock-o.patch | 35 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-omapfb_git.bb           |  5 ++--
 meta/recipes-kernel/oprofile/oprofile.inc          |  3 +-
 meta/recipes-kernel/oprofile/oprofile_1.0.0.bb     |  2 --
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |  8 ++---
 9 files changed, 55 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_git.bb => gptfdisk_1.0.0.bb} (75%)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch

-- 
2.1.4


