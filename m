Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXCy-0003Ro-5v
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086445"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:46 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:11 +0800
Message-Id: <cover.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/8] Recipes upgrade for gtk+, busybox, Nov30, 2011
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 23:35:28 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
These are recipes upgrade for gtk+, busybox, libsoup-2.4... pls. help to review
and pull.

Thanks,
Edwin

  bitbake: Update users of getVar/setVar to use the data store functions directly (2011-11-27 10:35:30 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (8):
  gtk+: Upgrade to 2.24.8
  xz: Upgrade to 5.0.3
  polkit-gnome: Upgrade to 0.102
  libsoup-2.4: Upgrade to 2.36.1
  libcroco: Upgrade to 0.6.3
  x11perf: Upgrade to 1.5.4
  eee-acpi-scritps: Upgrade to 1.1.12 via git tag
  busybox: Upgrade to 1.19.3

 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    6 +-
 .../eee-acpi-scripts/files/remove-doc-check.patch  |   42 ++++++++--------
 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |   51 ++++++++++----------
 .../{busybox-1.18.5 => busybox-1.19.3}/defconfig   |    0
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |   25 +++++-----
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.18.5.bb => busybox_1.19.3.bb}       |    6 +-
 ...polkit-gnome_0.101.bb => polkit-gnome_0.102.bb} |    4 +-
 .../xz/{xz_5.0.2.bb => xz_5.0.3.bb}                |    4 +-
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configure-nm.patch                             |    0
 .../configurefix.patch                             |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/doc-fixes.patch   |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/entry-cairo.patch |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/no-demos.patch    |    0
 .../run-iconcache.patch                            |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/toggle-font.diff  |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/xsettings.patch   |    0
 .../gtk+/{gtk+_2.24.6.bb => gtk+_2.24.8.bb}        |    6 +-
 .../{x11perf_1.5.3.bb => x11perf_1.5.4.bb}         |    6 +-
 .../{libcroco_0.6.2.bb => libcroco_0.6.3.bb}       |    4 +-
 ...libsoup-2.4_2.34.2.bb => libsoup-2.4_2.36.1.bb} |    8 ++--
 28 files changed, 82 insertions(+), 80 deletions(-)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-udhcpc-no_deconfig.patch (74%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/run-parts.in.usr-bin.patch (46%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.18.5.bb => busybox_1.19.3.bb} (85%)
 rename meta/recipes-extended/polkit/{polkit-gnome_0.101.bb => polkit-gnome_0.102.bb} (86%)
 rename meta/recipes-extended/xz/{xz_5.0.2.bb => xz_5.0.3.bb} (82%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.6.bb => gtk+_2.24.8.bb} (93%)
 rename meta/recipes-graphics/xorg-app/{x11perf_1.5.3.bb => x11perf_1.5.4.bb} (76%)
 rename meta/recipes-support/libcroco/{libcroco_0.6.2.bb => libcroco_0.6.3.bb} (80%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.34.2.bb => libsoup-2.4_2.36.1.bb} (53%)



