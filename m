Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4E41A71B57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 04:45:23 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id u10so22789664qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2aqeUgN4APtrIRaHuaeCAvzjcFdPMfD+XAk9+9gUCu4=;
	b=nfbH3cOS7QMvGZ1Bd7bjDFAfqO75b+gDIa/IaYi7T0Th45I/orGRosJ3l4uHcYiVKe
	Ualpoq2DgyBQ3RLhAmdkOXW7+pDrLN7CN/ROh2egciwbPzoSY9AWYprilvSG8LYSWFiS
	oQeaWb8ZglnPV+Ch2jMPZyXl0TUXcM5MvW8uiUTDW8FjfMDWsM4l40hHuDzildWDCTtJ
	ysHeVekeJXiKow/c6iXwSwH9TUJ8W8s0cqwcJwj2xm0MULenvPG/WfcYinbB3af8xJyM
	vks3STCPlUqgis9teoG022FMvJpBSQiAZP0h/Xgu7Lf0S2CY2w/WgGk0fwBBgOfQmPJc
	mURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2aqeUgN4APtrIRaHuaeCAvzjcFdPMfD+XAk9+9gUCu4=;
	b=iEQ6VdwKNk4gRAmQqrrqQqI6ea1Vbbhvfk6VNJsr22WAvov9k+Fulzvp1jrsFNUok5
	S4qgxmGu9YMTDQd2dxoDuwHO2XkUxIrSjQ4Vd3HwpT1wiRFZbuS9XXejD0ps1ONjVX/r
	xbTVVjkU/pR/Bq5g6TLyz9KMyjw9mGa3IOD5UAqceyFqv/StKKyv5GfijXmbf8Z4Qsdv
	FgtsS+mqxMDwoJQg47K114VY1kgLHILbvsYs2d8+a9fk5JH/+BOjmouMM0yKmHQ17Lqv
	3caiL4pu0qJtn6DKrg9hDRUG1h6aswwl50x4MopOm4/0E8RnCwjq7gQZGiS13hWQ2GkX
	JR9Q==
X-Gm-Message-State: AKGB3mJgnWdh9DQaEyGtwBYO367L1tqBPQbc/6F6Nl6GSIRlDzgXQEBp
	dixR1jcxOcXNhBGg7h1nQpPDvDXoEOyRzpHxq7c=
X-Google-Smtp-Source: ACJfBot+epNCOiuqmfyXuDhpPktZsCKAFesVtEPc2jlLl7A21NEkr6GbLAXHfe5OcJ3kGOFLydH5sBEIVh1Lw8SoFdQ=
X-Received: by 10.237.62.67 with SMTP id m3mr3148839qtf.289.1513658724637;
	Mon, 18 Dec 2017 20:45:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 18 Dec 2017 20:45:24 -0800 (PST)
In-Reply-To: <cover.1513612975.git.ross.burton@intel.com>
References: <cover.1513612975.git.ross.burton@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Dec 2017 23:45:24 -0500
Message-ID: <CADkTA4NgB4VWEi+F+dQqzQ8pYWWbG8DFRQX9ZLs13t1Q2O52zw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/49] Consolidated pull
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
X-List-Received-Date: Tue, 19 Dec 2017 04:45:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 18, 2017 at 11:03 AM, Ross Burton <ross.burton@intel.com> wrote:
>
> Hi,
>
> Another batch of patches from the list which have passed autobuilder testing and
> review.
>
> Ross
>
> The following changes since commit d6b6508e0be4452eb285495403b73fa9fcf51e3e:
>
>   temp disable inode checking on sstate (2017-12-13 14:02:02 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib ross/mut
>
> for you to fetch changes up to f64e867d1ff5e559a96f44fac8a2434ad2643502:
>
>   meta-selftest: wic: Add test for --use-uuid / --fsuuid (2017-12-16 00:21:42 +0000)
>
> ----------------------------------------------------------------
> Alejandro Hernandez (4):
>       busybox: Add mkfs.EXT2 support on poky-tiny
>       linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
>       linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.12
>       linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
>
> Alexander Kanavin (9):
>       gobject-introspection: update to 1.54.1
>       webkitgtk: update to 2.18.3
>       psmisc: update to 23.0
>       ffmpeg: update to 3.4
>       devtool: add a 'latest-version' command
>       devtool: provide useful defaults for version/commit when upgrading recipes
>       devtool: add license checksum change handling to 'devtool upgrade'
>       maintainers.inc: add an entry for dwarfsrcfiles
>       maintainers.inc: add an entry for pkgconf
>
> Chang Rebecca Swee Fun (1):
>       recipetool: create: fix conflict between SRCREV and tag
>
> Chen Qi (4):
>       coreutils: upgrade to 8.28
>       coreutils: add PACKAGECONFIG for single-binary
>       dbus: upgrade to 1.12.2
>       dbus-test: upgrade to 1.12.2


Anyone else seeing dbus blow up during configure after this update ?

--------------------------------
Initialising tasks: 100%
|########################################################################################################################################|
Time: 0:00:00

NOTE: Executing SetScene Tasks

NOTE: Executing RunQueue Tasks

ERROR: dbus-native-1.12.2-r0 do_configure: autoreconf execution failed.

ERROR: dbus-native-1.12.2-r0 do_configure: Function failed:
do_configure (log file is located at
/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)

ERROR: Logfile of failure stored in:
/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425

Log data follows:

| DEBUG: Executing shell function autotools_preconfigure

| DEBUG: Shell function autotools_preconfigure finished

| DEBUG: Executing python function autotools_aclocals

| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']

| DEBUG: Python function autotools_aclocals finished

| DEBUG: Executing shell function do_configure

| automake (GNU automake) 1.15.1

| Copyright (C) 2017 Free Software Foundation, Inc.

| License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl-2.0.html>

| This is free software: you are free to change and redistribute it.

| There is NO WARRANTY, to the extent permitted by law.

|

| Written by Tom Tromey <tromey@redhat.com>

|        and Alexandre Duret-Lutz <adl@gnu.org>.


<snip>

| autoreconf: running:
/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
--include=/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/dbus-1.12.2/m4/
--force

| configure.ac:95: error: Unexpanded AX_ macro found. Please install
GNU autoconf-archive

|       If this token and others are legitimate, please use m4_pattern_allow.

|       See the Autoconf documentation.

| configure.ac:374: error: Unexpanded AX_ macro found. Please install
GNU autoconf-archive

| autoreconf: /home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/recipe-sysroot-native/usr/bin/autoconf
failed with exit status: 1

| ERROR: autoreconf execution failed.

| WARNING: exit code 1 from a shell command.

| ERROR: Function failed: do_configure (log file is located at
/home/bruce/poky/build/tmp/work/x86_64-linux/dbus-native/1.12.2-r0/temp/log.do_configure.30425)

ERROR: Task (virtual:native:/home/bruce/poky/meta/recipes-core/dbus/dbus_1.12.2.bb:do_configure)
failed with exit code '1'

NOTE: Tasks Summary: Attempted 458 tasks of which 451 didn't need to
be rerun and 1 failed.

--------------------------------

Is there something I should have cleaned besides dbus and dbus-native
? This is a
build directory that I've been using for ages (if that makes a difference).

Reverting the uprev of the dbus packages, fixed my build.

Bruce


>
> Jackie Huang (1):
>       glib-2.0: fix for non-utf8 encoded files
>
> Jason Wessel (2):
>       ovmf: Fix build failure for PARALLEL_MAKE with no space
>       libgfortran: Work around libbacktrace build failures
>
> Joe Slater (1):
>       systemd: fix segfault when terminating systemd --test
>
> Kevin Hao (1):
>       meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86 BSPs
>
> Maxin B. John (3):
>       mc: upgrade to 4.8.20
>       orc: upgrade to 0.4.28
>       libunistring: upgrade to 0.9.8
>
> Nathan Rossi (5):
>       prelink_git.bb: Update recipe to newest commit
>       autoconf: Override config.guess/.sub in source tree
>       packagegroup-core-sdk: Disable SANITIZERS for MicroBlaze
>       packagegroup-core-tools-testapps: kexec does not support MicroBlaze
>       conf/machine/include/microblaze: Add MicroBlaze architecture includes
>
> Otavio Salvador (1):
>       mesa: Upgrade to 17.2.6 stable release
>
> Paul Eggleton (1):
>       swig: add patch to support Node.js 7+
>
> Robert Yang (1):
>       targetcontrol.py: use oe.types.boolean for QEMU_USE_KVM
>
> Ross Burton (8):
>       knotty: use unicode block characters for progress bars
>       weston: remove patch that isn't applied anymore
>       gtk+3: remove redundant Wayland patch
>       xserver-xorg: remove redundant Wayland patch
>       gstreamer1.0-plugins-bad: remove redundant Wayland patch
>       libxslt: use HTTP instead of FTP in SRC_URI
>       libxslt: remove inappropriate patch
>       packagegroups: don't mention lrzsz explicity
>
> Saul Wold (2):
>       image_types: btrfs use sparse file creation
>       image.bbclass: Add additional bb.debug to help track 12304
>
> Tom Rini (4):
>       wic: kparser.py: Check for SquashFS and use-uuid
>       wic: partition.py: Update comments slightly
>       wic: Introduce --fsuuid and have --use-uuid make use of UUID too
>       meta-selftest: wic: Add test for --use-uuid / --fsuuid
>
> Yi Zhao (1):
>       icu: fix libicudata corruption on big endian system
>
>  bitbake/lib/bb/ui/knotty.py                        |   4 +-
>  .../busybox/busybox/poky-tiny/defconfig            |   2 +-
>  .../recipes-test/images/wic-image-minimal.wks      |   1 +
>  .../recipes-kernel/linux/linux-yocto_4.12.bbappend |  20 +-
>  .../recipes-kernel/linux/linux-yocto_4.4.bbappend  |  20 +-
>  .../recipes-kernel/linux/linux-yocto_4.9.bbappend  |  20 +-
>  meta/classes/image.bbclass                         |  28 +-
>  meta/classes/image_types.bbclass                   |   2 +-
>  meta/classes/testimage.bbclass                     |   2 +-
>  meta/conf/distro/include/maintainers.inc           |   2 +
>  .../machine/include/microblaze/arch-microblaze.inc |  53 ++++
>  .../include/microblaze/feature-microblaze-math.inc |  33 +++
>  .../microblaze/feature-microblaze-versions.inc     |  67 +++++
>  meta/conf/machine/include/tune-microblaze.inc      |   8 +
>  meta/lib/oeqa/selftest/cases/wic.py                |   7 +-
>  meta/lib/oeqa/targetcontrol.py                     |   4 +-
>  ...c-fix-Up-field-of-realpath-usage-examples.patch |  40 +++
>  .../{coreutils_8.27.bb => coreutils_8.28.bb}       |  10 +-
>  .../{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb}  |   4 +-
>  meta/recipes-core/dbus/dbus/os-test.patch          |  35 ---
>  .../dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb}       |  12 +-
>  .../glib-mkenums-replace-and-warn-decoding.patch   | 104 +++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb      |   1 +
>  meta/recipes-core/ovmf/ovmf_git.bb                 |   2 +-
>  .../packagegroups/packagegroup-base.bb             |   3 +-
>  .../packagegroups/packagegroup-core-sdk.bb         |   1 +
>  .../packagegroup-core-tools-testapps.bb            |   4 +-
>  .../packagegroups/packagegroup-self-hosted.bb      |   1 -
>  ...te-presets-after-generators-have-run-6526.patch |  69 +++++
>  ...any-initialization-steps-when-running-in-.patch | 163 ++++++++++
>  meta/recipes-core/systemd/systemd_234.bb           |   2 +
>  meta/recipes-devtools/autoconf/autoconf.inc        |   4 +
>  meta/recipes-devtools/gcc/libgfortran.inc          |   7 +
>  .../orc/{orc_0.4.27.bb => orc_0.4.28.bb}           |   4 +-
>  meta/recipes-devtools/prelink/prelink_git.bb       |   2 +-
>  .../0001-Add-Node-7.x-aka-V8-5.2-support.patch     | 330 +++++++++++++++++++++
>  meta/recipes-devtools/swig/swig_3.0.12.bb          |   1 +
>  ...3697-tty_init-unify-curses-initialization.patch |  66 -----
>  .../mc/{mc_4.8.19.bb => mc_4.8.20.bb}              |   5 +-
>  .../packagegroups/packagegroup-core-lsb.bb         |   1 -
>  ...001-Typo-in-fuser-makes-M-on-all-the-time.patch |  46 ---
>  .../files/0002-Include-limits.h-for-PATH_MAX.patch |  29 --
>  meta/recipes-extended/psmisc/psmisc.inc            |   9 +
>  ...-create-src-directory-before-attempting-t.patch |  30 ++
>  meta/recipes-extended/psmisc/psmisc_22.21.bb       |  12 -
>  meta/recipes-extended/psmisc/psmisc_23.0.bb        |  10 +
>  ...n_1.52.1.bb => gobject-introspection_1.54.1.bb} |   7 +-
>  ...4-configure.ac-Fix-wayland-protocols-path.patch |  36 ---
>  meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb           |   1 -
>  .../mesa/{mesa-gl_17.2.5.bb => mesa-gl_17.2.6.bb}  |   0
>  .../mesa/{mesa_17.2.5.bb => mesa_17.2.6.bb}        |   4 +-
>  ...1-configure.ac-Fix-wayland-protocols-path.patch |  29 --
>  ...c-Fix-wayland-scanner-and-protocols-locat.patch |  38 ---
>  .../xorg-xserver/xserver-xorg_1.19.5.bb            |   1 -
>  .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    |  44 ---
>  .../ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb}      |   8 +-
>  ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  38 ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb   |   1 -
>  .../webkitgtk/0001-Fix-build-with-musl.patch       |  77 +++++
>  ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |  23 +-
>  ...c-settings-so-that-gtkdoc-generation-work.patch |  21 +-
>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 182 +++++-------
>  ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  24 +-
>  .../detect-atomics-during-configure.patch          |  26 +-
>  meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 --
>  .../recipes-sato/webkit/webkitgtk/musl-fixes.patch |  48 ---
>  .../webkit/webkitgtk/ppc-musl-fix.patch            |  26 --
>  .../{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb}   |  13 +-
>  meta/recipes-support/icu/icu.inc                   |  13 +
>  ...conv-m4-remove-the-test-to-convert-euc-jp.patch |  56 ++--
>  ...libunistring_0.9.7.bb => libunistring_0.9.8.bb} |   6 +-
>  .../libxslt/libxslt/pkgconfig_fix.patch            |  24 --
>  meta/recipes-support/libxslt/libxslt_1.1.32.bb     |   5 +-
>  scripts/lib/devtool/upgrade.py                     | 117 +++++++-
>  scripts/lib/recipetool/create.py                   |   8 +-
>  scripts/lib/wic/help.py                            |  10 +-
>  scripts/lib/wic/ksparser.py                        |   6 +
>  scripts/lib/wic/partition.py                       |  36 +--
>  scripts/lib/wic/plugins/imager/direct.py           |  17 +-
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |   3 +-
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   3 +-
>  81 files changed, 1465 insertions(+), 789 deletions(-)
>  create mode 100644 meta/conf/machine/include/microblaze/arch-microblaze.inc
>  create mode 100644 meta/conf/machine/include/microblaze/feature-microblaze-math.inc
>  create mode 100644 meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
>  create mode 100644 meta/conf/machine/include/tune-microblaze.inc
>  create mode 100644 meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch
>  rename meta/recipes-core/coreutils/{coreutils_8.27.bb => coreutils_8.28.bb} (93%)
>  rename meta/recipes-core/dbus/{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb} (93%)
>  delete mode 100644 meta/recipes-core/dbus/dbus/os-test.patch
>  rename meta/recipes-core/dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb} (93%)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>  rename meta/recipes-devtools/orc/{orc_0.4.27.bb => orc_0.4.28.bb} (84%)
>  create mode 100644 meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch
>  delete mode 100644 meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch
>  rename meta/recipes-extended/mc/{mc_4.8.19.bb => mc_4.8.20.bb} (90%)
>  delete mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
>  delete mode 100644 meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
>  create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
>  delete mode 100644 meta/recipes-extended/psmisc/psmisc_22.21.bb
>  create mode 100644 meta/recipes-extended/psmisc/psmisc_23.0.bb
>  rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.52.1.bb => gobject-introspection_1.54.1.bb} (97%)
>  delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_17.2.5.bb => mesa-gl_17.2.6.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_17.2.5.bb => mesa_17.2.6.bb} (88%)
>  delete mode 100644 meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} (95%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc7.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb} (93%)
>  rename meta/recipes-support/libunistring/{libunistring_0.9.7.bb => libunistring_0.9.8.bb} (85%)
>  delete mode 100644 meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
>
> Alejandro Hernandez (4):
>   busybox: Add mkfs.EXT2 support on poky-tiny
>   linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9
>   linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.12
>   linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
>
> Alexander Kanavin (9):
>   gobject-introspection: update to 1.54.1
>   webkitgtk: update to 2.18.3
>   psmisc: update to 23.0
>   ffmpeg: update to 3.4
>   devtool: add a 'latest-version' command
>   devtool: provide useful defaults for version/commit when upgrading
>     recipes
>   devtool: add license checksum change handling to 'devtool upgrade'
>   maintainers.inc: add an entry for dwarfsrcfiles
>   maintainers.inc: add an entry for pkgconf
>
> Chang Rebecca Swee Fun (1):
>   recipetool: create: fix conflict between SRCREV and tag
>
> Chen Qi (4):
>   coreutils: upgrade to 8.28
>   coreutils: add PACKAGECONFIG for single-binary
>   dbus: upgrade to 1.12.2
>   dbus-test: upgrade to 1.12.2
>
> Jackie Huang (1):
>   glib-2.0: fix for non-utf8 encoded files
>
> Jason Wessel (2):
>   ovmf: Fix build failure for PARALLEL_MAKE with no space
>   libgfortran: Work around libbacktrace build failures
>
> Joe Slater (1):
>   systemd: fix segfault when terminating systemd --test
>
> Kevin Hao (1):
>   meta-yocto-bsp: bump to the latest linux stable kernel for the non-x86
>     BSPs
>
> Maxin B. John (3):
>   mc: upgrade to 4.8.20
>   orc: upgrade to 0.4.28
>   libunistring: upgrade to 0.9.8
>
> Nathan Rossi (5):
>   prelink_git.bb: Update recipe to newest commit
>   autoconf: Override config.guess/.sub in source tree
>   packagegroup-core-sdk: Disable SANITIZERS for MicroBlaze
>   packagegroup-core-tools-testapps: kexec does not support MicroBlaze
>   conf/machine/include/microblaze: Add MicroBlaze architecture includes
>
> Otavio Salvador (1):
>   mesa: Upgrade to 17.2.6 stable release
>
> Paul Eggleton (1):
>   swig: add patch to support Node.js 7+
>
> Robert Yang (1):
>   targetcontrol.py: use oe.types.boolean for QEMU_USE_KVM
>
> Ross Burton (8):
>   knotty: use unicode block characters for progress bars
>   weston: remove patch that isn't applied anymore
>   gtk+3: remove redundant Wayland patch
>   xserver-xorg: remove redundant Wayland patch
>   gstreamer1.0-plugins-bad: remove redundant Wayland patch
>   libxslt: use HTTP instead of FTP in SRC_URI
>   libxslt: remove inappropriate patch
>   packagegroups: don't mention lrzsz explicity
>
> Saul Wold (2):
>   image_types: btrfs use sparse file creation
>   image.bbclass: Add additional bb.debug to help track 12304
>
> Tom Rini (4):
>   wic: kparser.py: Check for SquashFS and use-uuid
>   wic: partition.py: Update comments slightly
>   wic: Introduce --fsuuid and have --use-uuid make use of UUID too
>   meta-selftest: wic: Add test for --use-uuid / --fsuuid
>
> Yi Zhao (1):
>   icu: fix libicudata corruption on big endian system
>
>  bitbake/lib/bb/ui/knotty.py                        |   4 +-
>  .../busybox/busybox/poky-tiny/defconfig            |   2 +-
>  .../recipes-test/images/wic-image-minimal.wks      |   1 +
>  .../recipes-kernel/linux/linux-yocto_4.12.bbappend |  20 +-
>  .../recipes-kernel/linux/linux-yocto_4.4.bbappend  |  20 +-
>  .../recipes-kernel/linux/linux-yocto_4.9.bbappend  |  20 +-
>  meta/classes/image.bbclass                         |  28 +-
>  meta/classes/image_types.bbclass                   |   2 +-
>  meta/classes/testimage.bbclass                     |   2 +-
>  meta/conf/distro/include/maintainers.inc           |   2 +
>  .../machine/include/microblaze/arch-microblaze.inc |  53 ++++
>  .../include/microblaze/feature-microblaze-math.inc |  33 +++
>  .../microblaze/feature-microblaze-versions.inc     |  67 +++++
>  meta/conf/machine/include/tune-microblaze.inc      |   8 +
>  meta/lib/oeqa/selftest/cases/wic.py                |   7 +-
>  meta/lib/oeqa/targetcontrol.py                     |   4 +-
>  ...c-fix-Up-field-of-realpath-usage-examples.patch |  40 +++
>  .../{coreutils_8.27.bb => coreutils_8.28.bb}       |  10 +-
>  .../{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb}  |   4 +-
>  meta/recipes-core/dbus/dbus/os-test.patch          |  35 ---
>  .../dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb}       |  12 +-
>  .../glib-mkenums-replace-and-warn-decoding.patch   | 104 +++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb      |   1 +
>  meta/recipes-core/ovmf/ovmf_git.bb                 |   2 +-
>  .../packagegroups/packagegroup-base.bb             |   3 +-
>  .../packagegroups/packagegroup-core-sdk.bb         |   1 +
>  .../packagegroup-core-tools-testapps.bb            |   4 +-
>  .../packagegroups/packagegroup-self-hosted.bb      |   1 -
>  ...te-presets-after-generators-have-run-6526.patch |  69 +++++
>  ...any-initialization-steps-when-running-in-.patch | 163 ++++++++++
>  meta/recipes-core/systemd/systemd_234.bb           |   2 +
>  meta/recipes-devtools/autoconf/autoconf.inc        |   4 +
>  meta/recipes-devtools/gcc/libgfortran.inc          |   7 +
>  .../orc/{orc_0.4.27.bb => orc_0.4.28.bb}           |   4 +-
>  meta/recipes-devtools/prelink/prelink_git.bb       |   2 +-
>  .../0001-Add-Node-7.x-aka-V8-5.2-support.patch     | 330 +++++++++++++++++++++
>  meta/recipes-devtools/swig/swig_3.0.12.bb          |   1 +
>  ...3697-tty_init-unify-curses-initialization.patch |  66 -----
>  .../mc/{mc_4.8.19.bb => mc_4.8.20.bb}              |   5 +-
>  .../packagegroups/packagegroup-core-lsb.bb         |   1 -
>  ...001-Typo-in-fuser-makes-M-on-all-the-time.patch |  46 ---
>  .../files/0002-Include-limits.h-for-PATH_MAX.patch |  29 --
>  meta/recipes-extended/psmisc/psmisc.inc            |   9 +
>  ...-create-src-directory-before-attempting-t.patch |  30 ++
>  meta/recipes-extended/psmisc/psmisc_22.21.bb       |  12 -
>  meta/recipes-extended/psmisc/psmisc_23.0.bb        |  10 +
>  ...n_1.52.1.bb => gobject-introspection_1.54.1.bb} |   7 +-
>  ...4-configure.ac-Fix-wayland-protocols-path.patch |  36 ---
>  meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb           |   1 -
>  .../mesa/{mesa-gl_17.2.5.bb => mesa-gl_17.2.6.bb}  |   0
>  .../mesa/{mesa_17.2.5.bb => mesa_17.2.6.bb}        |   4 +-
>  ...1-configure.ac-Fix-wayland-protocols-path.patch |  29 --
>  ...c-Fix-wayland-scanner-and-protocols-locat.patch |  38 ---
>  .../xorg-xserver/xserver-xorg_1.19.5.bb            |   1 -
>  .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    |  44 ---
>  .../ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb}      |   8 +-
>  ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  38 ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb   |   1 -
>  .../webkitgtk/0001-Fix-build-with-musl.patch       |  77 +++++
>  ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |  23 +-
>  ...c-settings-so-that-gtkdoc-generation-work.patch |  21 +-
>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 182 +++++-------
>  ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  24 +-
>  .../detect-atomics-during-configure.patch          |  26 +-
>  meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 --
>  .../recipes-sato/webkit/webkitgtk/musl-fixes.patch |  48 ---
>  .../webkit/webkitgtk/ppc-musl-fix.patch            |  26 --
>  .../{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb}   |  13 +-
>  meta/recipes-support/icu/icu.inc                   |  13 +
>  ...conv-m4-remove-the-test-to-convert-euc-jp.patch |  56 ++--
>  ...libunistring_0.9.7.bb => libunistring_0.9.8.bb} |   6 +-
>  .../libxslt/libxslt/pkgconfig_fix.patch            |  24 --
>  meta/recipes-support/libxslt/libxslt_1.1.32.bb     |   5 +-
>  scripts/lib/devtool/upgrade.py                     | 117 +++++++-
>  scripts/lib/recipetool/create.py                   |   8 +-
>  scripts/lib/wic/help.py                            |  10 +-
>  scripts/lib/wic/ksparser.py                        |   6 +
>  scripts/lib/wic/partition.py                       |  36 +--
>  scripts/lib/wic/plugins/imager/direct.py           |  17 +-
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |   3 +-
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   3 +-
>  81 files changed, 1465 insertions(+), 789 deletions(-)
>  create mode 100644 meta/conf/machine/include/microblaze/arch-microblaze.inc
>  create mode 100644 meta/conf/machine/include/microblaze/feature-microblaze-math.inc
>  create mode 100644 meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
>  create mode 100644 meta/conf/machine/include/tune-microblaze.inc
>  create mode 100644 meta/recipes-core/coreutils/coreutils/0001-doc-fix-Up-field-of-realpath-usage-examples.patch
>  rename meta/recipes-core/coreutils/{coreutils_8.27.bb => coreutils_8.28.bb} (93%)
>  rename meta/recipes-core/dbus/{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb} (93%)
>  delete mode 100644 meta/recipes-core/dbus/dbus/os-test.patch
>  rename meta/recipes-core/dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb} (93%)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>  rename meta/recipes-devtools/orc/{orc_0.4.27.bb => orc_0.4.28.bb} (84%)
>  create mode 100644 meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch
>  delete mode 100644 meta/recipes-extended/mc/files/0002-Ticket-3697-tty_init-unify-curses-initialization.patch
>  rename meta/recipes-extended/mc/{mc_4.8.19.bb => mc_4.8.20.bb} (90%)
>  delete mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
>  delete mode 100644 meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
>  create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
>  delete mode 100644 meta/recipes-extended/psmisc/psmisc_22.21.bb
>  create mode 100644 meta/recipes-extended/psmisc/psmisc_23.0.bb
>  rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.52.1.bb => gobject-introspection_1.54.1.bb} (97%)
>  delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_17.2.5.bb => mesa-gl_17.2.6.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_17.2.5.bb => mesa_17.2.6.bb} (88%)
>  delete mode 100644 meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} (95%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc7.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.16.6.bb => webkitgtk_2.18.3.bb} (93%)
>  rename meta/recipes-support/libunistring/{libunistring_0.9.7.bb => libunistring_0.9.8.bb} (85%)
>  delete mode 100644 meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core




-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

