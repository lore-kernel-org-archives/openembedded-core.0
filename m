Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 48AC4731DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jan 2016 05:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="881270758"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2016 05:23:10 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:41 +0200
Message-Id: <cover.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] Bunch of upgrades
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:12 -0000

Fairly minor upgrades (maybe with the exception of gpgme).
FYI, all are based on AUH generated patches.

Cheers,
 Jussi


The following changes since commit 96a34e7f847ad34deac520b78809e7dd82dbc59e:

  conf/distro/poky-tiny: correctly disable python in opkg-utils (2016-01-12 15:35:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/auh-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/auh-upgrades

Jussi Kukkonen (9):
  gpgme: upgrade to 1.6.0
  gsettings-desktop-schemas: upgrade to 3.19.3
  libcroco: upgrade to 0.6.11
  libevdev: upgrade to 1.4.6
  libgpg-error: upgrade to 1.21
  librsvg: upgrade to 2.40.13
  libxi: upgrade to 1.7.6
  menu-cache: upgrade to 1.0.1
  xf86-input-evdev: upgrade to 2.10.1

 ...chemas_3.18.1.bb => gsettings-desktop-schemas_3.19.3.bb} |  4 ++--
 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch         | 13 +++++--------
 .../librsvg/{librsvg_2.40.11.bb => librsvg_2.40.13.bb}      |  4 ++--
 .../menu-cache/{menu-cache_1.0.0.bb => menu-cache_1.0.1.bb} |  4 ++--
 ...f86-input-evdev_2.10.0.bb => xf86-input-evdev_2.10.1.bb} |  4 ++--
 .../xorg-lib/{libxi_1.7.5.bb => libxi_1.7.6.bb}             |  4 ++--
 .../gpgme/{gpgme_1.5.4.bb => gpgme_1.6.0.bb}                |  6 +++---
 .../libcroco/{libcroco_0.6.9.bb => libcroco_0.6.11.bb}      |  5 ++---
 .../libevdev/{libevdev_1.4.2.bb => libevdev_1.4.6.bb}       |  4 ++--
 .../{libgpg-error_1.19.bb => libgpg-error_1.21.bb}          |  6 +++---
 10 files changed, 25 insertions(+), 29 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.18.1.bb => gsettings-desktop-schemas_3.19.3.bb} (69%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.11.bb => librsvg_2.40.13.bb} (91%)
 rename meta/recipes-graphics/menu-cache/{menu-cache_1.0.0.bb => menu-cache_1.0.1.bb} (79%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.0.bb => xf86-input-evdev_2.10.1.bb} (83%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.5.bb => libxi_1.7.6.bb} (81%)
 rename meta/recipes-support/gpgme/{gpgme_1.5.4.bb => gpgme_1.6.0.bb} (85%)
 rename meta/recipes-support/libcroco/{libcroco_0.6.9.bb => libcroco_0.6.11.bb} (80%)
 rename meta/recipes-support/libevdev/{libevdev_1.4.2.bb => libevdev_1.4.6.bb} (74%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.19.bb => libgpg-error_1.21.bb} (86%)

-- 
2.1.4


