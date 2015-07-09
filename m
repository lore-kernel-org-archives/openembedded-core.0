Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C67D6017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 07:51:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2015 00:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,438,1432623600"; d="scan'208";a="521246635"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jul 2015 00:51:19 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:51:59 +0300
Message-Id: <cover.1436427694.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] Upgrades for clutter and X related recipes
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
X-List-Received-Date: Thu, 09 Jul 2015 07:51:23 -0000

xproto and xf86-input-vmmouse are small point upgrades.

Clutter/Cogl upgrades are new releases: clutter ptests pass and test
apps look fine.

The following changes since commit 0aaa67a790ab211b35eed58173efa115ceb6e243:

  oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-08 13:09:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/graphics-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/graphics-upgrades

Jussi Kukkonen (5):
  xproto: Upgrade 7.0.27 -> 7.0.28
  xf86-input-vmmouse: Upgrade 13.0.0 -> 13.1.0
  cogl-1.0: Upgrade 1.18.2 -> 1.20.0
  clutter-1.0: Upgrade 1.20.0 -> 1.22.4
  clutter-gtk-1.0: Upgrade 1.4.4 -> 1.6.2

 .../run-installed-tests-with-tap-output.patch      | 30 +++++---
 ...clutter-1.0_1.20.0.bb => clutter-1.0_1.22.4.bb} |  4 +-
 .../clutter/clutter-gtk-1.0_1.4.4.bb               |  6 --
 .../clutter/clutter-gtk-1.0_1.6.2.bb               |  6 ++
 .../cogl-framebuffer-gl-Work-again-on-GLESv2.patch | 41 +++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb      |  6 --
 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb      |  8 +++
 .../always_include_config.h.patch                  | 81 ----------------------
 ...ouse_13.0.0.bb => xf86-input-vmmouse_13.1.0.bb} |  6 +-
 .../{xproto_7.0.27.bb => xproto_7.0.28.bb}         |  5 +-
 10 files changed, 83 insertions(+), 110 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.20.0.bb => clutter-1.0_1.22.4.bb} (60%)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.4.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse/always_include_config.h.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_13.0.0.bb => xf86-input-vmmouse_13.1.0.bb} (79%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.27.bb => xproto_7.0.28.bb} (73%)

-- 
2.1.4


