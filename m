Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9186D75716
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 08:40:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 06 Aug 2015 01:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="536995175"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2015 01:40:21 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 11:41:42 +0300
Message-Id: <cover.1438849692.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] Bunch of version upgrades
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
X-List-Received-Date: Thu, 06 Aug 2015 08:40:24 -0000

libinput goes to 0.21 which should be last release before 1.0. Other
upgrades are minor.

The vte change is just for LICENSE variable: our version is still
LGPL2.0 instead of LGPL2.1+ like recent releases.



The following changes since commit a8b723498c9a7106210db140452886894494b4d6:

  bitbake: cooker: Resolve file monitoring race issues when using memres bitbake (2015-08-03 07:36:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades

Jussi Kukkonen (6):
  gtk+3: Upgrade 3.16.4 -> 3.16.6
  gtk-icon-utils-native: Upgrade 3.16.4 -> 3.16.6
  fontconfig: Upgrade 2.11.93 -> 2.11.94
  vte: Fix LICENSE to LGPL2.0
  libinput: Upgrade 0.18.0 -> 0.21.0
  which: Upgrade 2.20 -> 2.21

 .../which/which-2.20/remove-declaration.patch      | 18 ------
 .../{which-2.20 => which-2.21}/automake.patch      | 14 +++--
 .../which/{which_2.20.bb => which_2.21.bb}         |  6 +-
 meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch  | 28 ---------
 .../gtk+/{gtk+3_3.16.4.bb => gtk+3_3.16.6.bb}      |  5 +-
 ...e_3.16.4.bb => gtk-icon-utils-native_3.16.6.bb} |  4 +-
 ...fontconfig_2.11.93.bb => fontconfig_2.11.94.bb} |  4 +-
 ...ics-need-to-fake-new-touches-on-TRIPLETAP.patch | 72 ++++++++++++++++++++++
 .../{libinput_0.18.0.bb => libinput_0.21.0.bb}     |  8 ++-
 meta/recipes-support/vte/vte.inc                   |  2 +-
 10 files changed, 96 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-extended/which/which-2.20/remove-declaration.patch
 rename meta/recipes-extended/which/{which-2.20 => which-2.21}/automake.patch (56%)
 rename meta/recipes-extended/which/{which_2.20.bb => which_2.21.bb} (84%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-pango.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.16.4.bb => gtk+3_3.16.6.bb} (77%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.16.4.bb => gtk-icon-utils-native_3.16.6.bb} (94%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.93.bb => fontconfig_2.11.94.bb} (92%)
 create mode 100644 meta/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
 rename meta/recipes-graphics/wayland/{libinput_0.18.0.bb => libinput_0.21.0.bb} (63%)

-- 
2.1.4


