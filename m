Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F32F76FF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:46:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H7kRei013279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:46:27 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 00:46:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 00:46:26 -0700
Message-ID: <cover.1442475786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] meta: fix build with gettext 0.16.1
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
X-List-Received-Date: Thu, 17 Sep 2015 07:46:28 -0000
Content-Type: text/plain

The world build will be OK with this patch when buidling low versions:

PREFERRED_VERSION_bash = "3.2.48"
PREFERRED_VERSION_bison = "2.3"
PREFERRED_VERSION_busybox = "1.23.2"
PREFERRED_VERSION_coreutils = "6.9"
PREFERRED_VERSION_cpio = "2.8"
PREFERRED_VERSION_db = "5.3.28"
PREFERRED_VERSION_diffutils = "2.8.1"
PREFERRED_VERSION_dri2proto = "2.8"
PREFERRED_VERSION_ed = "0.5"
PREFERRED_VERSION_elfutils = "0.148"
PREFERRED_VERSION_findutils = "4.2.31"
PREFERRED_VERSION_gawk = "3.1.5"
PREFERRED_VERSION_gdbm = "1.8.3"
PREFERRED_VERSION_gettext = "0.16.1"
PREFERRED_VERSION_gnu-config = "20120814"
PREFERRED_VERSION_gnupg = "1.4.7"
PREFERRED_VERSION_gperf = "3.0.3"
PREFERRED_VERSION_grep = "2.5.1a"
PREFERRED_VERSION_groff = "1.18.1.4"
PREFERRED_VERSION_gzip = "1.3.12"
PREFERRED_VERSION_inputproto = "2.3.1"
PREFERRED_VERSION_libgfortran = "4.8"
PREFERRED_VERSION_libiconv = "1.11.1"
PREFERRED_VERSION_libidn = "0.6.14"
PREFERRED_VERSION_libxcb = "1.11"
PREFERRED_VERSION_libxext = "1.3.3"
PREFERRED_VERSION_m4 = "1.4.9"
PREFERRED_VERSION_make = "3.81"
PREFERRED_VERSION_mc = "4.7.5.2"
PREFERRED_VERSION_mesa = "10.6.3"
PREFERRED_VERSION_mtools = "3.9.9"
PREFERRED_VERSION_ofono = "1.16"
PREFERRED_VERSION_patch = "2.5.9"
PREFERRED_VERSION_readline = "5.2"
PREFERRED_VERSION_rsync = "2.6.9"
PREFERRED_VERSION_rxvt-unicode = "9.20"
PREFERRED_VERSION_sed = "4.1.2"
PREFERRED_VERSION_tar = "1.17"
PREFERRED_VERSION_texinfo = "4.8"
PREFERRED_VERSION_usbutils = "007"
PREFERRED_VERSION_which = "2.18"
PREFERRED_VERSION_xcb-proto = "1.11"
PREFERRED_VERSION_xf86-input-keyboard = "1.8.1"
PREFERRED_VERSION_xf86-input-mouse = "1.9.1"
PREFERRED_VERSION_xf86-input-synaptics = "1.8.2"

PREFERRED_VERSION_coreutils-native = "6.9"
PREFERRED_VERSION_db-native = "5.3.28"
PREFERRED_VERSION_gdbm-native = "1.8.3"
PREFERRED_VERSION_elfutils-native = "0.148"
PREFERRED_VERSION_findutils-native = "4.2.31"
PREFERRED_VERSION_gnu-config-native = "20120814"
PREFERRED_VERSION_gperf-native = "3.0.3"
PREFERRED_VERSION_inputproto-native = "2.3.1"
PREFERRED_VERSION_libxcb-native = "1.11"
PREFERRED_VERSION_libxext-native = "1.3.3"
PREFERRED_VERSION_mtools-native = "3.9.9"
PREFERRED_VERSION_readline-native = "5.2"
PREFERRED_VERSION_xcb-proto-native = "1.11"

PREFERRED_VERSION_nativesdk-db = "5.3.28"
PREFERRED_VERSION_nativesdk-gdbm = "1.8.3"
PREFERRED_VERSION_nativesdk-elfutils = "0.148"
PREFERRED_VERSION_nativesdk-findutils = "4.2.31"
PREFERRED_VERSION_nativesdk-gnu-config = "20120814"
PREFERRED_VERSION_nativesdk-inputproto = "2.3.1"
PREFERRED_VERSION_nativesdk-libxcb = "1.11"
PREFERRED_VERSION_nativesdk-libxext = "1.3.3"
PREFERRED_VERSION_nativesdk-mtools = "3.9.9"
PREFERRED_VERSION_nativesdk-qemu = "2.2.0"
PREFERRED_VERSION_nativesdk-readline = "5.2"
PREFERRED_VERSION_nativesdk-xcb-proto = "1.11"

// Robert

The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:

  qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/low_version
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/low_version

Robert Yang (1):
  meta: fix build with gettext 0.16.1

 .../connman/connman-gnome_0.7.bb                   |    2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    2 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |    2 +-
 meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb   |    2 +-
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-support/atk/at-spi2-core_2.16.0.bb    |    2 +-
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |    2 +-
 meta/recipes-support/libfm/libfm_1.2.3.bb          |    2 +-
 meta/recipes-support/pinentry/pinentry_0.9.2.bb    |    2 ++
 13 files changed, 14 insertions(+), 12 deletions(-)

-- 
1.7.9.5


