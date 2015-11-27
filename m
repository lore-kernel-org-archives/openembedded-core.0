Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1569C6012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:03:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 27 Nov 2015 04:03:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="830114209"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2015 04:03:19 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:06:44 +0200
Message-Id: <cover.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] Various upgrades
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
X-List-Received-Date: Fri, 27 Nov 2015 12:03:22 -0000

Mostly minor or uneventful upgrades.

The xdg-utils upgade might look a little weird but it really is a
bunch of shell scripts that require xsltproc and xmlto at build time.
As far as I can tell the scripts are also mostly useless (and unused).
Unfortunately they're required by LSB. 

Cheers, 
  Jussi


The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades-xdg-etc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades-xdg-etc

Jussi Kukkonen (10):
  cogl-1.0: Upgrade 1.20.0 -> 1.22.0
  clutter-1.0: Upgrade 1.24.2
  clutter-gst-3.0: Upgrade 3.0.8 -> 3.0.14
  clutter-gtk-1.0: Upgrade 1.6.2 -> 1.6.6
  gnome-common: Upgrade 3.14.0 -> 3.18.0
  gsettings-desktop-schemas: Upgrade 2.16.1 -> 3.18.1
  xdg-utils: Upgrade to 1.1.1
  shared-mime-info: Upgrade 1.4 -> 1.5
  libcroco: Upgrade 0.6.8 -> 0.6.9
  dropbear: Upgrade 2015.68 -> 2015.70

 meta/recipes-core/dropbear/dropbear_2015.68.bb     |   4 -
 meta/recipes-core/dropbear/dropbear_2015.70.bb     |   5 +
 .../xdg-utils/0001-Reinstate-xdg-terminal.patch    | 665 +--------------------
 .../{xdg-utils_1.1.0-rc1.bb => xdg-utils_1.1.1.bb} |   5 +-
 ...ome-common_3.14.0.bb => gnome-common_3.18.0.bb} |   4 +-
 ...16.1.bb => gsettings-desktop-schemas_3.18.1.bb} |   5 +-
 ...clutter-1.0_1.22.4.bb => clutter-1.0_1.24.2.bb} |   5 +-
 ...-gst-3.0_3.0.8.bb => clutter-gst-3.0_3.0.14.bb} |   4 +-
 .../clutter/clutter-gtk-1.0_1.6.2.bb               |   6 -
 .../clutter/clutter-gtk-1.0_1.6.6.bb               |   6 +
 .../cogl-framebuffer-gl-Work-again-on-GLESv2.patch |  41 --
 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb      |   8 -
 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb      |   5 +
 .../{libcroco_0.6.8.bb => libcroco_0.6.9.bb}       |   4 +-
 ...ed-mime-info_1.4.bb => shared-mime-info_1.5.bb} |   4 +-
 15 files changed, 43 insertions(+), 728 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.70.bb
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.0-rc1.bb => xdg-utils_1.1.1.bb} (82%)
 rename meta/recipes-gnome/gnome/{gnome-common_3.14.0.bb => gnome-common_3.18.0.bb} (71%)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.16.1.bb => gsettings-desktop-schemas_3.18.1.bb} (69%)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.22.4.bb => clutter-1.0_1.24.2.bb} (59%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.8.bb => clutter-gst-3.0_3.0.14.bb} (58%)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
 rename meta/recipes-support/libcroco/{libcroco_0.6.8.bb => libcroco_0.6.9.bb} (81%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.4.bb => shared-mime-info_1.5.bb} (43%)

-- 
2.1.4


