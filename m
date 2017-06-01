Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F1D046093B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:36:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 01 Jun 2017 03:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="94302850"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2017 03:36:51 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 35DD258024C;
	Thu,  1 Jun 2017 03:36:51 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:44 +0300
Message-Id: <cover.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] More version upgrades
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
X-List-Received-Date: Thu, 01 Jun 2017 10:36:53 -0000

Xorg and some unrelated individual upgrades.
The only major release here is libinput.

I've tested this on top of the previous batch of upgrades but this
should work fine independently as well.

Thanks,
 Jussi

The following changes since commit bd063fa288b49b6e3ea77982d0ccc46610feb1ad:

  tune-mips32*.inc: use consistent comments across all three .inc files (2017-05-30 10:15:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/more-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/more-updates

Jussi Kukkonen (10):
  vte: Upgrade 0.46.1 -> 0.48.3
  libinput: Upgrade 1.6.1 -> 1.7.2
  xdg-utils: Upgrade 1.1.1 -> 1.1.2
  libevdev: Upgrade 1.5.6 -> 1.5.7
  clutter-1.0: Upgrade 1.26.0 -> 1.26.2
  clutter-gst-3.0: Upgrade 3.0.22 -> 3.0.24
  xf86-input-libinput: Upgrade 0.24.0 -> 0.25.1
  xserver-xorg: Upgrade 1.19.1 -> 1.19.3
  xkbcomp: Upgrade 1.3.1 -> 1.4.0
  xkeyboard-config: Upgrade 2.20 -> 2.21

 .../xdg-utils/{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb}      |  6 +++---
 .../clutter/{clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb}  |  4 ++--
 .../{clutter-gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb}  |  4 ++--
 .../wayland/{libinput_1.6.1.bb => libinput_1.7.2.bb}          | 10 +++++++---
 .../xorg-app/{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb}           |  4 ++--
 ...input-libinput_0.24.0.bb => xf86-input-libinput_0.25.1.bb} |  4 ++--
 .../{xkeyboard-config_2.20.bb => xkeyboard-config_2.21.bb}    |  4 ++--
 .../{xserver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb}        |  4 ++--
 .../libevdev/{libevdev_1.5.6.bb => libevdev_1.5.7.bb}         |  4 ++--
 meta/recipes-support/vte/{vte_0.46.1.bb => vte_0.48.3.bb}     | 11 ++++++++---
 10 files changed, 32 insertions(+), 23 deletions(-)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb} (83%)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb} (67%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb} (58%)
 rename meta/recipes-graphics/wayland/{libinput_1.6.1.bb => libinput_1.7.2.bb} (74%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.24.0.bb => xf86-input-libinput_0.25.1.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.20.bb => xkeyboard-config_2.21.bb} (87%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb} (89%)
 rename meta/recipes-support/libevdev/{libevdev_1.5.6.bb => libevdev_1.5.7.bb} (74%)
 rename meta/recipes-support/vte/{vte_0.46.1.bb => vte_0.48.3.bb} (84%)

-- 
2.1.4


