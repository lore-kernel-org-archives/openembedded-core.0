Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 831566E5DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CFHQ022764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:15 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:11:54 -0800
Message-ID: <cover.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/21] remove and fixes for low version recipes
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:17 -0000
Content-Type: text/plain

These patches remove several low native version since they don't work
any more or we don't need them. There are still the following native
versions, they work well, but I think we can remove: (need verify one by
one if remove)

coreutils-native_6.9
db-native_5.3.28
gdbm-native_1.8.3
elfutils-native_0.148
findutils-native_4.2.31
gnu-config-native_20120814
gperf-native_3.0.3
inputproto-native_2.3.1
libxcb-native_1.11
libxext-native_1.3.3
mtools-native_3.9.9
pkgconfig-native_0.28
qemu-native_2.2.0
readline-native_5.2
xcb-proto-native_1.11

There are also subversion-native_1.6.15 and texinfo-native_4.8, I think
that we need keep them since subversion-native_1.6.15 and 1.8.10's
checkout format are different as Martin said. And for
texinfo-native_4.8, the target texinfo_4.8 needs it.

I'd like to remov them in later patches if no objections.

BTW, do we need keep nativesdk's GPLv2 version if there is a GPLv3,
please? If no, I will remove the nativesdk ones, too, we have them
following low nativesdk versions:

nativesdk-db_5.3.28
nativesdk-gdbm_1.8.3
nativesdk-elfutils_0.148
nativesdk-findutils_4.2.31
nativesdk-gnu-config_20120814
nativesdk-inputproto_2.3.1
nativesdk-libxcb_1.11
nativesdk-libxext_1.3.3
nativesdk-mtools_3.9.9
nativesdk-pkgconfig_0.28
nativesdk-qemu_2.2.0
nativesdk-readline_5.2
nativesdk-xcb-proto_1.11

// Robert

The following changes since commit 818bcba063819b80d5a99827c5adb8ee157dbfe1:

  build-appliance-image: Update to master head revision (2015-02-02 14:57:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/low_version
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/low_version

Robert Yang (21):
  which 2.18: fix SRC_URI
  matchbox-wm 1.2: remove it
  matchbox-desktop: remove 0.9.1 and 2.0 version
  xf86-video-intel 2.21.15: remove it
  groff 1.18.1.4: fix HOMEPAGE and SRC_URI
  findutils 4.2.31: fix SRC_URI
  libidn 0.6.14: fixed installed-vs-shipped
  m4 1.4.9: fix unknown-configure-option
  patch 2.5.9: fix unknown-configure-option
  gzip 1.3.12: a few fixes
  grep 2.5.1a: fix unknown-configure-option
  tar 1.17: fix unknown-configure-option
  coreutils 6.9: fix unknown-configure-option
  rxvt-unicode: fix for 9.20 and 9.21
  subversion 1.6.15: fix unknown-configure-option
  meta: fix build with gettext 0.16.1
  elfutils 0.148: use BPN in SRC_URI
  coreutils 6.9: disable native
  gettext 0.6.1: disable native
  bison 2.3: disable native
  m4-native 1.4.9: remove it

 .../connman/connman-gnome_0.7.bb                   |    2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   14 ++---
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    4 +-
 meta/recipes-devtools/bison/bison_2.3.bb           |   15 +----
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    2 +-
 meta/recipes-devtools/m4/m4-1.4.17.inc             |    2 +
 meta/recipes-devtools/m4/m4-native_1.4.9.bb        |   12 ----
 meta/recipes-devtools/m4/m4.inc                    |    1 -
 meta/recipes-devtools/patch/patch.inc              |    3 -
 .../subversion/subversion_1.6.15.bb                |    2 +-
 .../recipes-extended/findutils/findutils_4.2.31.bb |    7 ++-
 meta/recipes-extended/grep/grep_2.5.1a.bb          |    2 +-
 meta/recipes-extended/groff/groff_1.18.1.4.bb      |    4 +-
 meta/recipes-extended/gzip/gzip.inc                |    6 --
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |   27 +--------
 meta/recipes-extended/gzip/gzip_1.6.bb             |    8 +++
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |    2 +
 meta/recipes-extended/tar/tar.inc                  |    2 -
 meta/recipes-extended/tar/tar_1.28.bb              |    3 +
 meta/recipes-extended/which/which_2.18.bb          |    2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    2 +-
 .../matchbox-wm/matchbox-wm/configure_fix.patch    |   15 -----
 .../matchbox-wm/matchbox-wm/gconf-2.m4             |   39 -------------
 .../matchbox-wm/matchbox-wm_1.2.bb                 |   39 -------------
 meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb   |    2 +-
 ...Map-changes-of-DamageUnregister-API-in-1..patch |   29 ----------
 .../xf86-video-intel/disable-dri2-tests.patch      |   50 ----------------
 .../xorg-driver/xf86-video-intel_2.21.15.bb        |   32 ----------
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    2 +-
 .../files/dso_linking_change_build_fix.patch       |   28 ---------
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |   27 ---------
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |   15 -----
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc    |   58 +++++++++++++++++++
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb |   61 +-------------------
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb |   61 +-------------------
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb    |    2 +-
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |    2 +-
 meta/recipes-support/libfm/libfm_1.2.3.bb          |    2 +-
 meta/recipes-support/pinentry/pinentry_0.9.0.bb    |    2 +
 43 files changed, 107 insertions(+), 489 deletions(-)
 delete mode 100644 meta/recipes-devtools/m4/m4-native_1.4.9.bb
 delete mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch
 delete mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/gconf-2.m4
 delete mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
 delete mode 100644 meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
 delete mode 100644 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc

-- 
1.7.9.5


