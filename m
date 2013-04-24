Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7eU-0007Ug-PL
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916377"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:36:53 -0700
Message-Id: <cover.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 00/18] Package Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 21:55:00 -0000

Nothing really suprising here, I am doing a glib update 
and will have some other changes pending after that is
complete.

I am also testing an update to pkgconfig, which now carries
a mini glib to prevent circular issues, the first to was to
move patches from the .inc to the .bb file.

Sau!

The following changes since commit 395b90054eccddc1c9062a9a8657ed4482b7710a:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-22 15:48:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (18):
  less: Update to 458
  lsbinitscripts: Update to 9.46
  sysstat: Update to 10.1.5
  sqlite: Update to 3071602
  dhcp: Update to 4.2.5-P1
  resolvconf: Update to 1.71
  dpkg: Update to 1.16.10
  file: Update to 5.14
  libffi: Update to 3.0.13
  nspr: Update to 4.9.6
  libgcrypt: Update to 1.5.1
  pkgconfig: Move patches in prep for 0.28 update
  libxkbcommon: Update to 0.3.0
  glew: fix generation of glew.pc needed by mesa-demos
  mesa-demos: Update to 8.1.0
  glib-2.0: Update to 2.36
  glib-networking: Update to 2.36
  build-appliance: Add version info

 .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
 .../{dhcp-4.2.5 => dhcp}/fix-client-path.patch     |    0
 .../{dhcp-4.2.5 => dhcp}/fix-external-bind.patch   |    0
 .../dhcp/{dhcp-4.2.5 => dhcp}/fixincludes.patch    |    0
 .../dhcp/{dhcp-4.2.5 => dhcp}/fixsepbuild.patch    |    0
 .../{dhcp-4.2.5 => dhcp}/link-with-lcrypto.patch   |    0
 .../dhcp/{dhcp-4.2.5 => dhcp}/noattrmode.patch     |    0
 .../dhcp/{dhcp-4.2.5 => dhcp}/site.h               |    0
 .../dhcp/{dhcp_4.2.5.bb => dhcp_4.2.5-P1.bb}       |    4 +-
 .../{resolvconf_1.70.bb => resolvconf_1.71.bb}     |    5 +-
 .../glib-2.0/obsolete_automake_macros.patch        |   13 -
 .../{glib-2.0_2.34.3.bb => glib-2.0_2.36.0.bb}     |   12 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 ...working_2.28.7.bb => glib-networking_2.36.0.bb} |   10 +-
 ...iance-image.bb => build-appliance-image_8.0.bb} |    0
 .../dpkg/{dpkg_1.16.9.bb => dpkg_1.16.10.bb}       |    4 +-
 .../file/{file_5.13.bb => file_5.14.bb}            |    4 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |    8 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  |    7 +
 .../less/{less_457.bb => less_458.bb}              |    5 +-
 ...binitscripts_9.45.bb => lsbinitscripts_9.46.bb} |    7 +-
 .../{sysstat_10.1.4.bb => sysstat_10.1.5.bb}       |    4 +-
 .../libffi/0001-libffi-update-for-3.0.11.patch     |  171 --
 .../libffi/aarch64-adding-build-support.patch      |   63 -
 .../libffi/libffi/add-aarch64-support.patch        | 2672 --------------------
 .../libffi/libffi/fix-libffi.la-location.patch     |   18 +
 .../libffi/{libffi_3.0.11.bb => libffi_3.0.13.bb}  |   11 +-
 .../glew/files/fix-glew.pc-install.patch           |   44 +
 meta/recipes-graphics/glew/glew_1.9.0.bb           |    1 +
 ...glgears-Make-EGL_KHR_image-usage-portable.patch |   95 -
 .../mesa-demos/dso_linking_change_build_fix.patch  |   24 -
 .../mesa/mesa-demos/gles2-info.patch               |   21 -
 .../{mesa-demos_8.0.1.bb => mesa-demos_8.1.0.bb}   |   11 +-
 ...libxkbcommon_0.2.0.bb => libxkbcommon_0.3.0.bb} |   11 +-
 .../libgcrypt-1.5.0/obsolete_automake_macros.patch |   15 -
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb  |    9 -
 meta/recipes-support/libgcrypt/libgcrypt_1.5.1.bb  |    4 +
 .../nspr/{nspr_4.9.5.bb => nspr_4.9.6.bb}          |    7 +-
 .../{sqlite3_3071502.bb => sqlite3_3071602.bb}     |    9 +-
 39 files changed, 118 insertions(+), 3153 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fixsepbuild.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.5.bb => dhcp_4.2.5-P1.bb} (66%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.70.bb => resolvconf_1.71.bb} (87%)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.34.3.bb => glib-2.0_2.36.0.bb} (85%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.28.7.bb => glib-networking_2.36.0.bb} (71%)
 rename meta/recipes-core/images/{build-appliance-image.bb => build-appliance-image_8.0.bb} (100%)
 rename meta/recipes-devtools/dpkg/{dpkg_1.16.9.bb => dpkg_1.16.10.bb} (71%)
 rename meta/recipes-devtools/file/{file_5.13.bb => file_5.14.bb} (86%)
 rename meta/recipes-extended/less/{less_457.bb => less_458.bb} (87%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.45.bb => lsbinitscripts_9.46.bb} (77%)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.4.bb => sysstat_10.1.5.bb} (44%)
 delete mode 100644 meta/recipes-gnome/libffi/libffi/0001-libffi-update-for-3.0.11.patch
 delete mode 100644 meta/recipes-gnome/libffi/libffi/aarch64-adding-build-support.patch
 delete mode 100644 meta/recipes-gnome/libffi/libffi/add-aarch64-support.patch
 create mode 100644 meta/recipes-gnome/libffi/libffi/fix-libffi.la-location.patch
 rename meta/recipes-gnome/libffi/{libffi_3.0.11.bb => libffi_3.0.13.bb} (76%)
 create mode 100644 meta/recipes-graphics/glew/files/fix-glew.pc-install.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-xeglgears-Make-EGL_KHR_image-usage-portable.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
 rename meta/recipes-graphics/mesa/{mesa-demos_8.0.1.bb => mesa-demos_8.1.0.bb} (69%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.2.0.bb => libxkbcommon_0.3.0.bb} (67%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.1.bb
 rename meta/recipes-support/nspr/{nspr_4.9.5.bb => nspr_4.9.6.bb} (95%)
 rename meta/recipes-support/sqlite/{sqlite3_3071502.bb => sqlite3_3071602.bb} (41%)

-- 
1.8.0.2



