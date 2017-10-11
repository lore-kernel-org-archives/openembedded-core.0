Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AA7396FFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945691"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:33:52 +0300
Message-Id: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 00/50] Recipe updates and fixes.
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:19 -0000

'Alex's patchbombs' have become a sort of running gag between Ross and me,
so here's the biggest, bestest bomb yet. Do have a look if there's a recipe
that you care about, and let me know. I have also updated the recipes for
which Jussi Kukkonen was previously responsible, but I don't necessarily want
to take up his recipes permanently :)

The following changes since commit 96967261993f8b583b51cdeccbb1fd06042d2192:

  bitbake: toaster/highlight.pack.js: Fix corrupted file (2017-10-10 11:05:08 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (49):
  oprofile: remove the recipe
  libpfm4: remove the recipe
  glib-2.0: update to 2.54.1
  glib-networking: update to 2.54.0
  eudev: fix upstream version check
  tcf-agent: latest upstream version is now known
  go-helloworld: add an acknowledgement of unknown upstream version
  dtc: update to 1.4.5
  lz4: fix upstream version check
  freetype: fix upstream version check
  libxslt: update to 1.1.31
  vala: update to 0.38.2
  btrfs-tools: update to 4.13.2
  mpg123: update to 1.25.7
  libsolv: update to 0.6.29
  libdnf: update to 0.11.0
  librepo: update to 1.8.1
  dnf: update to 2.7.3
  gobject-introspection: update to 1.54.1
  boost: update to 1.65.1
  gnome-desktop3: Update to 3.26.1
  iso-codes: update to 3.76
  sysprof: update to 3.26.1
  gtk-doc.bbclass: correctly make the list of directories with shared
    libraries
  webkitgtk: update to 2.18.0
  gtk+3: update to 3.22.24
  freetype: update to 2.8.1
  vulkan: update to 1.0.61.1
  xdg-utils: update to 1.1.2
  gsettings-desktop-schemas: update to 3.24.1
  libsoup-2.4: update to 2.60.1
  adwaita-icon-theme: update to 3.26.0
  shared-mime-info: update to 1.9
  assimp: update to 4.0.1
  gdk-pixbuf: update to 2.36.11
  hicolor-icon-theme: update to 0.17
  libgudev: update to 232
  pango: update to 1.40.12
  fontconfig: update to 2.12.6
  libinput: update to 1.8.3
  vte: update to 0.50.1
  librsvg: update to 2.40.19
  clutter-gtk-1.0: update to 1.8.4
  at-spi2-core: update to 2.26.0
  at-spi2-atk: update to 2.26.0
  atk: update to 2.26.0
  glew: update to 2.1.0
  maintainers.inc: add Mark Hatle for libmnl
  maintainers.inc: add Otavio Salvador for go-dep

Chen Qi (1):
  ffmpeg: upgrade to 3.3.4

 meta/classes/gtk-doc.bbclass                       |   2 +-
 meta/conf/distro/include/distro_alias.inc          |   1 -
 meta/conf/distro/include/maintainers.inc           |   2 +
 meta/conf/layer.conf                               |   1 -
 ...warning-about-deprecated-paths-in-schemas.patch |  25 +-
 ...t-hardcode-python-path-into-various-tools.patch |  46 ++
 .../Enable-more-tests-while-cross-compiling.patch  |  30 +-
 .../glib-2.0/glib-2.0/configure-libtool.patch      |  38 +-
 .../{glib-2.0_2.52.3.bb => glib-2.0_2.54.1.bb}     |   5 +-
 meta/recipes-core/glib-2.0/glib.inc                |  16 +-
 ...working_2.50.0.bb => glib-networking_2.54.0.bb} |   4 +-
 meta/recipes-core/udev/eudev_3.2.2.bb              |   1 -
 ...ith-musl-missing-header-include-for-dev_t.patch |  26 +
 .../{btrfs-tools_4.12.bb => btrfs-tools_4.13.2.bb} |   3 +-
 ...eck-conf.releasever-instead-of-releasever.patch |  31 --
 .../dnf/{dnf_2.6.3.bb => dnf_2.7.3.bb}             |   3 +-
 .../libdnf/{libdnf_0.9.3.bb => libdnf_0.11.0.bb}   |   2 +-
 ...ly-set-the-library-installation-directory.patch |  28 -
 ...to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch |  49 +-
 ...-race-when-deleting-temporary-directories.patch |  41 --
 ...rrect-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch |  40 --
 .../librepo/{librepo_git.bb => librepo_1.8.1.bb}   |   6 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |   1 -
 meta/recipes-devtools/vala/vala.inc                |   2 +
 .../vala/vala/0001-Disable-valadoc.patch           |  32 ++
 .../vala/vala/disable-graphviz.patch               | 223 ++++++++
 .../vala/{vala_0.36.4.bb => vala_0.38.2.bb}        |   6 +-
 .../go-examples/go-helloworld_0.1.bb               |   1 +
 .../{libsolv_0.6.28.bb => libsolv_0.6.29.bb}       |   2 +-
 .../{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb}     |   4 +-
 ...-Fix-without-libtiff-not-having-an-effect.patch |  27 +
 ...ueryloaders-Make-output-more-reproducible.patch |  56 --
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch       |  39 +-
 ...{gdk-pixbuf_2.36.8.bb => gdk-pixbuf_2.36.11.bb} |   6 +-
 ...ble-libseccomp-sycall-filtering-mechanism.patch |  38 ++
 ...op-thumbnail-don-t-convert-time_t-to-long.patch |  31 +-
 ...desktop3_3.24.2.bb => gnome-desktop3_3.26.1.bb} |  14 +-
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch         |  11 +-
 ...heme_3.24.0.bb => adwaita-icon-theme_3.26.0.bb} |   4 +-
 ...n_1.52.1.bb => gobject-introspection_1.54.1.bb} |   7 +-
 ...22.0.bb => gsettings-desktop-schemas_3.24.1.bb} |   4 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch |  22 +-
 .../0003-Add-disable-opengl-configure-option.patch | 244 +++------
 .../gtk+/{gtk+3_3.22.17.bb => gtk+3_3.22.24.bb}    |   4 +-
 ...on-theme_0.15.bb => hicolor-icon-theme_0.17.bb} |   4 +-
 .../libgudev/{libgudev_231.bb => libgudev_232.bb}  |   4 +-
 .../{librsvg_2.40.18.bb => librsvg_2.40.19.bb}     |   4 +-
 .../clutter/clutter-gtk-1.0_1.8.2.bb               |   6 -
 .../clutter/clutter-gtk-1.0_1.8.4.bb               |   6 +
 ...src-fcxml.c-avoid-double-free-of-filename.patch |  28 +
 .../{fontconfig_2.12.4.bb => fontconfig_2.12.6.bb} |   7 +-
 .../{freetype_2.8.bb => freetype_2.8.1.bb}         |   6 +-
 .../glew/{glew_2.0.0.bb => glew_2.1.0.bb}          |   4 +-
 .../pango/{pango_1.40.6.bb => pango_1.40.12.bb}    |   4 +-
 .../vulkan/{assimp_4.0.0.bb => assimp_4.0.1.bb}    |   2 +-
 .../{vulkan_1.0.51.0.bb => vulkan_1.0.61.1.bb}     |   6 +-
 .../0001-tools-Fix-race-in-autotools-install.patch |  37 --
 .../{libinput_1.8.1.bb => libinput_1.8.3.bb}       |   8 +-
 meta/recipes-kernel/dtc/dtc.inc                    |   3 +-
 .../dtc/{dtc_1.4.4.bb => dtc_1.4.5.bb}             |   2 +-
 ...Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch |  31 --
 .../files/fix-misleading-indentation-error.patch   |  38 --
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb        |  33 --
 meta/recipes-kernel/oprofile/oprofile.inc          |  65 ---
 ...Add-rmb-definition-for-NIOS2-architecture.patch |  30 --
 .../0001-Fix-FTBFS-problem-with-GCC-6.patch        |  51 --
 meta/recipes-kernel/oprofile/oprofile/acinclude.m4 | 581 ---------------------
 .../oprofile/oprofile/automake-foreign.patch       |  12 -
 meta/recipes-kernel/oprofile/oprofile/musl.patch   |  46 --
 .../oprofile/oprofile-cross-compile-tests.patch    |  98 ----
 .../oprofile/oprofile/root-home-dir.patch          |  44 --
 meta/recipes-kernel/oprofile/oprofile/run-ptest    |  19 -
 meta/recipes-kernel/oprofile/oprofile_1.1.0.bb     |  10 -
 .../{sysprof_3.24.1.bb => sysprof_3.26.1.bb}       |   4 +-
 .../ffmpeg/ffmpeg/CVE-2017-14054.patch             |  39 --
 .../ffmpeg/ffmpeg/CVE-2017-14055.patch             |  34 --
 .../ffmpeg/ffmpeg/CVE-2017-14056.patch             |  51 --
 .../ffmpeg/ffmpeg/CVE-2017-14057.patch             |  44 --
 .../ffmpeg/ffmpeg/CVE-2017-14058.patch             |  94 ----
 .../ffmpeg/ffmpeg/CVE-2017-14059.patch             |  40 --
 .../ffmpeg/ffmpeg/CVE-2017-14169.patch             |  39 --
 .../ffmpeg/ffmpeg/CVE-2017-14170.patch             |  49 --
 .../ffmpeg/ffmpeg/CVE-2017-14171.patch             |  44 --
 .../ffmpeg/ffmpeg/CVE-2017-14222.patch             |  40 --
 .../ffmpeg/ffmpeg/CVE-2017-14223.patch             |  38 --
 .../ffmpeg/ffmpeg/CVE-2017-14225.patch             |  49 --
 .../ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb}    |  16 +-
 .../mpg123/{mpg123_1.25.6.bb => mpg123_1.25.7.bb}  |   4 +-
 .../webkitgtk/0001-Fix-build-with-musl.patch       |  77 +++
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |  23 +-
 ...c-settings-so-that-gtkdoc-generation-work.patch |  21 +-
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 182 +++----
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  24 +-
 .../detect-atomics-during-configure.patch          |  26 +-
 meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 -
 .../recipes-sato/webkit/webkitgtk/musl-fixes.patch |  48 --
 .../webkit/webkitgtk/ppc-musl-fix.patch            |  26 -
 .../{webkitgtk_2.16.6.bb => webkitgtk_2.18.0.bb}   |  10 +-
 ...at-spi2-atk_2.24.1.bb => at-spi2-atk_2.26.0.bb} |   4 +-
 .../0001-build-Add-with-systemduserunitdir.patch   |  29 +-
 .../0001-nls.m4-Take-it-from-gettext-0.15.patch    |  54 --
 ...-spi2-core_2.24.1.bb => at-spi2-core_2.26.0.bb} |   9 +-
 .../atk/{atk_2.24.0.bb => atk_2.26.0.bb}           |   6 +-
 ...bjam-native_1.64.0.bb => bjam-native_1.65.1.bb} |   3 +-
 .../boost/{boost-1.64.0.inc => boost-1.65.1.inc}   |   4 +-
 ...detail-socket_types.hpp-fix-poll.h-includ.patch |  49 --
 .../boost/{boost_1.64.0.bb => boost_1.65.1.bb}     |   1 -
 ...ge-assert-typo-how-was-this-released-with.patch |  37 ++
 .../{iso-codes_3.75.bb => iso-codes_3.76.bb}       |   4 +-
 ...libsoup-2.4_2.58.2.bb => libsoup-2.4_2.60.1.bb} |   4 +-
 ...for-integer-overflow-in-xsltAddTextString.patch |  80 ---
 .../libxslt/0001-Link-libraries-with-libm.patch    |  48 --
 ...Use-pkg-config-to-find-gcrypt-and-libxml2.patch | 130 -----
 .../{libxslt_1.1.29.bb => libxslt_1.1.31.bb}       |   9 +-
 meta/recipes-support/lz4/lz4_1.7.4.bb              |   1 +
 ...ed-mime-info_1.8.bb => shared-mime-info_1.9.bb} |   4 +-
 .../vte/{vte_0.48.3.bb => vte_0.50.1.bb}           |   4 +-
 117 files changed, 990 insertions(+), 2902 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.52.3.bb => glib-2.0_2.54.1.bb} (79%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.50.0.bb => glib-networking_2.54.0.bb} (88%)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.12.bb => btrfs-tools_4.13.2.bb} (90%)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Check-conf.releasever-instead-of-releasever.patch
 rename meta/recipes-devtools/dnf/{dnf_2.6.3.bb => dnf_2.7.3.bb} (95%)
 rename meta/recipes-devtools/libdnf/{libdnf_0.9.3.bb => libdnf_0.11.0.bb} (95%)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch
 rename meta/recipes-devtools/librepo/{librepo_git.bb => librepo_1.8.1.bb} (68%)
 create mode 100644 meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch
 create mode 100644 meta/recipes-devtools/vala/vala/disable-graphviz.patch
 rename meta/recipes-devtools/vala/{vala_0.36.4.bb => vala_0.38.2.bb} (44%)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.28.bb => libsolv_0.6.29.bb} (95%)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb} (89%)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-without-libtiff-not-having-an-effect.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-queryloaders-Make-output-more-reproducible.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.8.bb => gdk-pixbuf_2.36.11.bb} (94%)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.24.2.bb => gnome-desktop3_3.26.1.bb} (66%)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.24.0.bb => adwaita-icon-theme_3.26.0.bb} (93%)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.52.1.bb => gobject-introspection_1.54.1.bb} (97%)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.22.0.bb => gsettings-desktop-schemas_3.24.1.bb} (70%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.17.bb => gtk+3_3.22.24.bb} (84%)
 rename meta/recipes-gnome/hicolor-icon-theme/{hicolor-icon-theme_0.15.bb => hicolor-icon-theme_0.17.bb} (74%)
 rename meta/recipes-gnome/libgudev/{libgudev_231.bb => libgudev_232.bb} (74%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.18.bb => librsvg_2.40.19.bb} (91%)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.4.bb => fontconfig_2.12.6.bb} (90%)
 rename meta/recipes-graphics/freetype/{freetype_2.8.bb => freetype_2.8.1.bb} (90%)
 rename meta/recipes-graphics/glew/{glew_2.0.0.bb => glew_2.1.0.bb} (92%)
 rename meta/recipes-graphics/pango/{pango_1.40.6.bb => pango_1.40.12.bb} (92%)
 rename meta/recipes-graphics/vulkan/{assimp_4.0.0.bb => assimp_4.0.1.bb} (92%)
 rename meta/recipes-graphics/vulkan/{vulkan_1.0.51.0.bb => vulkan_1.0.61.1.bb} (94%)
 delete mode 100644 meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
 rename meta/recipes-graphics/wayland/{libinput_1.8.1.bb => libinput_1.8.3.bb} (81%)
 rename meta/recipes-kernel/dtc/{dtc_1.4.4.bb => dtc_1.4.5.bb} (81%)
 delete mode 100644 meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
 delete mode 100644 meta/recipes-kernel/libpfm/files/fix-misleading-indentation-error.patch
 delete mode 100644 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile.inc
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-NIOS2-architecture.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/acinclude.m4
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/musl.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
 rename meta/recipes-kernel/sysprof/{sysprof_3.24.1.bb => sysprof_3.26.1.bb} (88%)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14054.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14055.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14056.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14057.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14058.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14059.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14169.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14170.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14171.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14222.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14223.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2017-14225.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb} (91%)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.6.bb => mpg123_1.25.7.bb} (94%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc7.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.6.bb => webkitgtk_2.18.0.bb} (94%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.24.1.bb => at-spi2-atk_2.26.0.bb} (83%)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.24.1.bb => at-spi2-core_2.26.0.bb} (80%)
 rename meta/recipes-support/atk/{atk_2.24.0.bb => atk_2.26.0.bb} (72%)
 rename meta/recipes-support/boost/{bjam-native_1.64.0.bb => bjam-native_1.65.1.bb} (68%)
 rename meta/recipes-support/boost/{boost-1.64.0.inc => boost-1.65.1.inc} (85%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch
 rename meta/recipes-support/boost/{boost_1.64.0.bb => boost_1.65.1.bb} (85%)
 create mode 100644 meta/recipes-support/boost/files/0001-Fix-a-strange-assert-typo-how-was-this-released-with.patch
 rename meta/recipes-support/iso-codes/{iso-codes_3.75.bb => iso-codes_3.76.bb} (76%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.58.2.bb => libsoup-2.4_2.60.1.bb} (89%)
 delete mode 100644 meta/recipes-support/libxslt/libxslt/0001-Check-for-integer-overflow-in-xsltAddTextString.patch
 delete mode 100644 meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
 delete mode 100644 meta/recipes-support/libxslt/libxslt/0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch
 rename meta/recipes-support/libxslt/{libxslt_1.1.29.bb => libxslt_1.1.31.bb} (77%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.8.bb => shared-mime-info_1.9.bb} (43%)
 rename meta/recipes-support/vte/{vte_0.48.3.bb => vte_0.50.1.bb} (91%)

-- 
2.14.1


