Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxl-0007DK-HL
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:30:49 +0100
Received: by wwe15 with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:22 -0800 (PST)
Received: by 10.216.19.66 with SMTP id m44mr3546928wem.86.1298798961251;
	Sun, 27 Feb 2011 01:29:21 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 16sm989019wet.8.2011.02.27.01.29.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:28:54 +0100
Message-Id: <cover.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Subject: [PATCH 00/50] Merge in yocto changes made since split
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
X-List-Received-Date: Sun, 27 Feb 2011 09:30:49 -0000

This merges in the yocto changes that were made since we split off oe-core, minus changes made to bitbake since oe-core doesn't ship that anymore.

Pull URL: git://dominion.thruhere.net/var/cache/git/openembedded-core.git
  Branch: poky-merge-20110227
  Browse: http://dominion.thruhere.net/git/cgit.cgi/openembedded-core//log/?h=poky-merge-20110227

Thanks,
     Koen Kooi <koen@dominion.thruhere.net>
---


Beth Flanagan (5):
  Emenlow Removal from Poky Core: meta-emenlow
  Fix LICENSE parsing: license.bblcass
  Fixing my bad license parsing: license.bbclass
  Fix to the libtool LICENSE field: libtool.inc
  Fixing type: license.bbclass

Bruce Ashfield (2):
  linux-yocto: update to 2.6.37.2
  linux-yocto: add crownbay BSP infrastructure

Dongxiao Xu (1):
  package.bbclass: Use hard link for package split instead of copy

Gary Thomas (1):
  Suppress useless warnings during udev startup

Jingdong Lu (2):
  task-poky-lsb: add necessary packages name
  libxml-parser-perl: remove FILES_${PN}

Joshua Lock (2):
  Ensure Bash is used when spawning terminals
  dropbear: add SRC_URI checksums

Mark Hatle (6):
  Revise stripping and splitting of debug information
  package.bbclass: Refactor split and strip function
  rootfs_rpm: Fix rootfs generation using RPM packages
  rpm: Fix rpm usage of prelink on the target
  rpm: Fix rpm-dbg package split
  prelink: Add missing macro.prelink file

Nitin A Kamble (1):
  perl: import parallel build fixes from upstream git tree

Richard Purdie (9):
  poky.conf: Weakly set PREMIRRORS
  mtd-utils: Set the revision to use explicitly else failures occur
    with BB_NO_NETWORK
  poky-setup-builddir: Update references to the manual
  package.bbclass: Unbreak per file dependencies and blacklist doc
    packages
  package.bbclass: Ensure dependency version information is preserved
  package.bbclass: Fix debug sources directory creation to reference
    the target system
  linux-libc-headers: Update to 2.6.37.2
  conf/machine: Use linux-libc-headers instead of
    linux-libc-headers-yocto
  package.bbclass: Rewrite package_do_filedeps() to reduce the amount
    of subprocesses created and improve speed

Saul Wold (8):
  bitbake.conf: Add DISTROOVERRIDES variable
  poky-lsb.conf: Add DISTROOVERRIDES variable for poky
  poky-lsb.conf: remove OVERRIDES
  poky-qemu: Update -sdk image name due to recent change to sato-sdk
  poky-image-lsb-sdk.bb: add image for LSB SDK Build
  utils.bbclass: add new wrapper script
  file: add wrapper to file-native
  task-poky-lsb: libqtopenqgl4 should be for qemux86 and atom-pc only

Scott Garman (5):
  gtk+: disable build of faq and tutorial docs
  linuxdoc-tools-native: new recipe v0.99.6
  libuser: enable documentation
  poky-qemu: handle cases where an nfs directory contains -image-
  linuxdoc-tools-native: disable doc builds requriing latex and dvips

Scott Rifenbark (6):
  documentation/yocto-project-qs/yocto-project-qs.xml: [BUGID# 628] -
    Added note about Python 2.6 bitbake requirement
  documentation/poky-ref-manual/faq.xml: [BUGID# 628] - Added new
    question for Python 2.6 requirement.
  documentation/poky-ref-manual/poky-ref-manual.xml: updated copyright
    date
  documentation/bsp-guide/bsp-guide.xml: Updated copyright
  documentation/kernel-manual/kernel-manual.xml: Updated copyright date
  documentation/yocto-project-qs/yocto-project-qs.xml: Added Copyright
    dates

Yu Ke (2):
  xf86-video-intel: add config option to support rootless X
  xserver-nodm-init: add rootless-x support

 documentation/bsp-guide/bsp-guide.xml              |    2 +-
 documentation/kernel-manual/kernel-manual.xml      |    2 +-
 documentation/poky-ref-manual/faq.xml              |   41 +
 documentation/poky-ref-manual/poky-ref-manual.xml  |    2 +-
 .../yocto-project-qs/yocto-project-qs.xml          |    7 +
 meta-emenlow/COPYING.MIT                           |   17 -
 meta-emenlow/README                                |   78 -
 meta-emenlow/conf/checksums.ini                    |   23 -
 meta-emenlow/conf/layer.conf                       |   10 -
 meta-emenlow/conf/machine/emenlow.conf             |   48 -
 .../formfactor/formfactor/emenlow/machconfig       |    3 -
 .../recipes-bsp/formfactor/formfactor_0.0.bbappend |    3 -
 .../libdrm-poulsbo-2.3.0/libdrm-poulsbo.patch      |   61 -
 .../libdrm-poulsbo/libdrm-poulsbo_2.3.0.bb         |   19 -
 .../libva-0.31.0/033_g45_add_rgba_subpic.patch     |  111 -
 .../034_g45_fix_return_for_unimpl.patch            |   83 -
 .../035_g45_add_yv12_image_format.patch            |  102 -
 .../libva-0.31.0/036_g45_add_vaGetImage.patch      |   71 -
 .../libva-0.31.0/037_g45_add_vaPutImage.patch      |  111 -
 .../038_g45_vaPutSurface_cliprects.patch           |  531 --
 .../libva-0.31.0/102_attribute_visibility.patch    |   47 -
 .../libva/libva-0.31.0/103_fix_vainfo_deps.patch   |   24 -
 .../104_fix_libva_pkgconfig_deps.patch             |   18 -
 .../105_dont_search_LIBGL_DRIVERS_PATH.patch       |   21 -
 .../libva/libva-0.31.0/108_drivers_path.patch      |   25 -
 .../libva-0.31.0/203_fix_fglrx_detection.patch     |  542 --
 .../libva-0.31.0/204_check_ATIFGLEXTENSION.patch   |  312 -
 .../libva/libva-0.31.0/300_sds_version.patch       |   87 -
 .../libva/libva-0.31.0/301_vdpau_mpeg4.patch       |   26 -
 .../320_move_vaPutSurface_flags_def.patch          |   60 -
 .../libva/libva-0.31.0/321_libva_glx.base.patch    |  212 -
 .../libva/libva-0.31.0/322_libva_glx.patch         | 2024 ------
 .../libva/libva-0.31.0/390_compat.base.patch       |  135 -
 .../libva/libva-0.31.0/391_compat.patch            | 3273 ----------
 .../libva/libva-0.31.0/392_compat.dso.patch        |  183 -
 .../libva/libva-0.31.0/libdrm-poulsbo.patch        |   26 -
 .../recipes-graphics/libva/libva_0.31.0.bb         |   40 -
 .../psb-firmware/psb-firmware_0.30.bb              |   15 -
 .../psb-kernel-source-4.42.0/build.patch           |  175 -
 .../psb-kernel-source/psb-kernel-source_4.42.0.bb  |   24 -
 .../xorg-xserver/files/crosscompile.patch          |   19 -
 .../files/fix_open_max_preprocessor_error.patch    |   13 -
 .../xorg-xserver/files/libdrm-poulsbo.patch        |   26 -
 .../xorg-xserver/files/macro_tweak.patch           |   18 -
 .../xorg-xserver/files/nodolt.patch                |   12 -
 .../xorg-xserver/xserver-psb_1.7.99.2.bb           |   21 -
 .../xserver-xf86-config/emenlow/xorg.conf          |   13 -
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    3 -
 .../xpsb-glx/xpsb-glx-0.18/cross-compile.patch     |   58 -
 .../xpsb-glx/xpsb-glx-0.18/libdrmname.patch        |   63 -
 .../xpsb-glx/xpsb-glx-0.18/native-matypes.patch    |   20 -
 .../recipes-graphics/xpsb-glx/xpsb-glx_0.18.bb     |   46 -
 .../01_disable_lid_timer.patch                     |   12 -
 .../xserver-xorg-video-psb-0.32.1/dri-h.patch      |   20 -
 .../libdrm-poulsbo.patch                           |   13 -
 .../xserver-xorg-video-psb-0.32.1/psb_mixed.patch  |   35 -
 .../psb_xvtempfix.patch                            |   17 -
 .../xserver-xorg-video-psb-0.32.1/stubs.patch      |   23 -
 .../xserver-xorg-video-psb-0.32.1/visibility.patch |   12 -
 .../xorg-x11-drv-psb-0.31.0-ignoreacpi.patch       |   11 -
 .../xorg-x11-drv-psb-0.31.0-xserver17.patch        |   85 -
 .../xserver-xorg-video-psb-0.31.0-assert.patch     |   11 -
 ...rver-xorg-video-psb-0.31.0-comment_unused.patch |   75 -
 .../xserver-xorg-video-psb-0.31.0-greedy.patch     |   19 -
 .../xserver-xorg-video-psb-0.31.0-loader.patch     |   84 -
 .../xserver-xorg-video-psb_0.32.1.bb               |   34 -
 .../recipes-kernel/linux/linux-2.6.33.2/defconfig  |   68 -
 .../linux/linux-yocto-stable_git.bbappend          |    3 -
 .../recipes-kernel/linux/linux_2.6.33.2.bbappend   |    3 -
 meta/classes/devshell.bbclass                      |    4 +-
 meta/classes/image-prelink.bbclass                 |    2 +-
 meta/classes/insane.bbclass                        |    4 +-
 meta/classes/kernel.bbclass                        |    2 +-
 meta/classes/license.bbclass                       |    4 +-
 meta/classes/package.bbclass                       |  417 +-
 meta/classes/package_rpm.bbclass                   |   15 +-
 meta/classes/populate_sdk_rpm.bbclass              |   13 +-
 meta/classes/rootfs_rpm.bbclass                    |    5 +-
 meta/classes/utils.bbclass                         |   23 +
 meta/conf/bblayers.conf.sample                     |    3 +-
 meta/conf/bitbake.conf                             |   12 +-
 .../conf/distro/include/poky-default-revisions.inc |   26 +-
 meta/conf/distro/poky-lsb.conf                     |    3 +
 meta/conf/distro/poky.conf                         |    2 +-
 meta/conf/local.conf.sample                        |   31 +
 meta/conf/machine/atom-pc.conf                     |    2 +
 meta/conf/machine/beagleboard.conf                 |    2 +-
 meta/conf/machine/include/qemu.inc                 |    2 +-
 meta/conf/machine/mpc8315e-rdb.conf                |    2 +-
 meta/conf/machine/routerstationpro.conf            |    2 +-
 meta/conf/sanity.conf                              |    2 +-
 meta/files/common-licenses/MIT                     |    6 +
 meta/files/common-licenses/MIT-style               |    1 +
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    3 +
 meta/recipes-core/udev/udev-164/init               |    2 +-
 meta/recipes-devtools/file/file_5.04.bb            |    8 +-
 meta/recipes-devtools/libtool/libtool.inc          |    2 +-
 .../linuxdoc-tools-native/disable_dvips_doc.patch  |   29 +
 .../linuxdoc-tools-native/disable_sgml2rtf.patch   |   49 +
 .../linuxdoc-tools-native/disable_tex_doc.patch    |   25 +
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb |   23 +
 meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb       |    2 +-
 .../perl/libxml-parser-perl_2.36.bb                |    6 +-
 .../perl/perl-5.12.2/parallel_build_fix.patch      |   18 -
 .../perl/perl-5.12.2/parallel_build_fix_1.patch    |   25 +
 .../perl/perl-5.12.2/parallel_build_fix_2.patch    |   22 +
 .../perl/perl-5.12.2/parallel_build_fix_3.patch    | 6583 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    6 +-
 meta/recipes-devtools/perl/perl_5.12.2.bb          |    6 +-
 .../prelink/prelink/macros.prelink                 |    5 +
 meta/recipes-devtools/prelink/prelink_git.bb       |    8 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    7 +-
 meta/recipes-extended/images/poky-image-lsb-sdk.bb |    9 +
 .../libuser/libuser-0.57.1/disable-sgml-doc.patch  |   18 -
 meta/recipes-extended/libuser/libuser_0.57.1.bb    |    9 +-
 meta/recipes-extended/tasks/task-poky-lsb.bb       |   68 +-
 .../recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch |   44 +-
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb             |    2 +-
 .../x11-common/xserver-nodm-init.bb                |   22 +-
 .../x11-common/xserver-nodm-init/Xusername         |    1 +
 .../x11-common/xserver-nodm-init/xserver-nodm      |    4 +
 .../xorg-driver/xf86-video-intel_2.14.0.bb         |    5 +
 ...rs_2.6.36.bb => linux-libc-headers_2.6.37.2.bb} |    0
 meta/recipes-kernel/linux/linux-yocto_git.bb       |    3 +-
 scripts/poky-qemu                                  |   16 +-
 scripts/poky-setup-builddir                        |    8 +-
 126 files changed, 7436 insertions(+), 9618 deletions(-)
 delete mode 100644 meta-emenlow/COPYING.MIT
 delete mode 100644 meta-emenlow/README
 delete mode 100644 meta-emenlow/binary/.gitignore
 delete mode 100644 meta-emenlow/conf/checksums.ini
 delete mode 100644 meta-emenlow/conf/layer.conf
 delete mode 100644 meta-emenlow/conf/machine/emenlow.conf
 delete mode 100644 meta-emenlow/recipes-bsp/formfactor/formfactor/emenlow/machconfig
 delete mode 100644 meta-emenlow/recipes-bsp/formfactor/formfactor_0.0.bbappend
 delete mode 100644 meta-emenlow/recipes-graphics/libdrm-poulsbo/libdrm-poulsbo-2.3.0/libdrm-poulsbo.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libdrm-poulsbo/libdrm-poulsbo_2.3.0.bb
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/033_g45_add_rgba_subpic.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/034_g45_fix_return_for_unimpl.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/035_g45_add_yv12_image_format.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/036_g45_add_vaGetImage.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/037_g45_add_vaPutImage.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/038_g45_vaPutSurface_cliprects.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/102_attribute_visibility.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/103_fix_vainfo_deps.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/104_fix_libva_pkgconfig_deps.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/105_dont_search_LIBGL_DRIVERS_PATH.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/108_drivers_path.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/203_fix_fglrx_detection.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/204_check_ATIFGLEXTENSION.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/300_sds_version.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/301_vdpau_mpeg4.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/320_move_vaPutSurface_flags_def.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/321_libva_glx.base.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/322_libva_glx.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/390_compat.base.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/391_compat.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/392_compat.dso.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva-0.31.0/libdrm-poulsbo.patch
 delete mode 100644 meta-emenlow/recipes-graphics/libva/libva_0.31.0.bb
 delete mode 100644 meta-emenlow/recipes-graphics/psb-firmware/psb-firmware_0.30.bb
 delete mode 100644 meta-emenlow/recipes-graphics/psb-kernel-source/psb-kernel-source-4.42.0/build.patch
 delete mode 100644 meta-emenlow/recipes-graphics/psb-kernel-source/psb-kernel-source_4.42.0.bb
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/files/crosscompile.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/files/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/files/libdrm-poulsbo.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/files/macro_tweak.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/files/nodolt.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/xserver-xf86-config/emenlow/xorg.conf
 delete mode 100644 meta-emenlow/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
 delete mode 100644 meta-emenlow/recipes-graphics/xpsb-glx/xpsb-glx-0.18/cross-compile.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xpsb-glx/xpsb-glx-0.18/libdrmname.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xpsb-glx/xpsb-glx-0.18/native-matypes.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xpsb-glx/xpsb-glx_0.18.bb
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/01_disable_lid_timer.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/dri-h.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/libdrm-poulsbo.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/psb_mixed.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/psb_xvtempfix.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/stubs.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/visibility.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/xorg-x11-drv-psb-0.31.0-ignoreacpi.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/xorg-x11-drv-psb-0.31.0-xserver17.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/xserver-xorg-video-psb-0.31.0-assert.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/xserver-xorg-video-psb-0.31.0-comment_unused.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/xserver-xorg-video-psb-0.31.0-greedy.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb-0.32.1/xserver-xorg-video-psb-0.31.0-loader.patch
 delete mode 100644 meta-emenlow/recipes-graphics/xserver-xorg-video-psb/xserver-xorg-video-psb_0.32.1.bb
 delete mode 100644 meta-emenlow/recipes-kernel/linux/linux-2.6.33.2/defconfig
 delete mode 100644 meta-emenlow/recipes-kernel/linux/linux-yocto-stable_git.bbappend
 delete mode 100644 meta-emenlow/recipes-kernel/linux/linux_2.6.33.2.bbappend
 create mode 100644 meta/files/common-licenses/MIT
 create mode 120000 meta/files/common-licenses/MIT-style
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch
 create mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_1.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_2.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_3.patch
 create mode 100644 meta/recipes-devtools/prelink/prelink/macros.prelink
 create mode 100644 meta/recipes-extended/images/poky-image-lsb-sdk.bb
 delete mode 100644 meta/recipes-extended/libuser/libuser-0.57.1/disable-sgml-doc.patch
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_2.6.36.bb => linux-libc-headers_2.6.37.2.bb} (100%)



