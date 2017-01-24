Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BDCB8719FA
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Jan 2017 02:42:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="34687988"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2017 02:42:05 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 191A76A4006;
	Tue, 24 Jan 2017 02:41:07 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:41:01 +0200
Message-Id: <cover.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] Minor version upgrades
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:06 -0000

Uneventful version upgrades around the graphics stack. Notably missing
is mesa: the 17.0 release should happen shortly.

There's no reason to squeeze these into M2.

Thanks,
  Jussi


The following changes since commit 62d7d4130202d8ede16abf9e7d779361ca70847e:

  build-appliance-image: Update to master head revision (2017-01-23 23:32:23 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades

Jussi Kukkonen (9):
  freetype: Upgrade 2.7.0 -> 2.7.1
  gtk+3: Upgrade 3.22.5 -> 3.22.7
  libevdev: Upgrade 1.5.4 -> 1.5.6
  libinput: Upgrade 1.5.0 -> 1.6.0
  libxi: Upgrade 1.7.8 -> 1.7.9
  libxkbcommon: Upgrade 0.7.0 -> 0.7.1
  libxpm: Upgrade 3.5.11 -> 3.5.12
  xf86-input-evdev: Upgrade 2.10.4 -> 2.10.5
  xserver-xorg: Upgrade 1.19.0 -> 1.19.1

 meta/recipes-gnome/gtk+/{gtk+3_3.22.5.bb => gtk+3_3.22.7.bb}         | 4 ++--
 ...k-icon-utils-native_3.22.5.bb => gtk-icon-utils-native_3.22.7.bb} | 4 ++--
 .../recipes-graphics/freetype/{freetype_2.7.bb => freetype_2.7.1.bb} | 4 ++--
 .../wayland/{libinput_1.5.0.bb => libinput_1.6.0.bb}                 | 4 ++--
 .../{xf86-input-evdev_2.10.4.bb => xf86-input-evdev_2.10.5.bb}       | 5 +++--
 meta/recipes-graphics/xorg-lib/{libxi_1.7.8.bb => libxi_1.7.9.bb}    | 4 ++--
 .../xorg-lib/{libxkbcommon_0.7.0.bb => libxkbcommon_0.7.1.bb}        | 4 ++--
 .../recipes-graphics/xorg-lib/{libxpm_3.5.11.bb => libxpm_3.5.12.bb} | 4 ++--
 .../xorg-xserver/{xserver-xorg_1.19.0.bb => xserver-xorg_1.19.1.bb}  | 4 ++--
 .../libevdev/{libevdev_1.5.4.bb => libevdev_1.5.6.bb}                | 4 ++--
 10 files changed, 21 insertions(+), 20 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.5.bb => gtk+3_3.22.7.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.5.bb => gtk-icon-utils-native_3.22.7.bb} (93%)
 rename meta/recipes-graphics/freetype/{freetype_2.7.bb => freetype_2.7.1.bb} (93%)
 rename meta/recipes-graphics/wayland/{libinput_1.5.0.bb => libinput_1.6.0.bb} (85%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.4.bb => xf86-input-evdev_2.10.5.bb} (83%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.8.bb => libxi_1.7.9.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.7.0.bb => libxkbcommon_0.7.1.bb} (83%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.11.bb => libxpm_3.5.12.bb} (81%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.0.bb => xserver-xorg_1.19.1.bb} (88%)
 rename meta/recipes-support/libevdev/{libevdev_1.5.4.bb => libevdev_1.5.6.bb} (74%)

-- 
2.1.4


