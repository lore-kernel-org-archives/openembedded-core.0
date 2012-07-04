Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmJUs-0003Qc-8q
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 08:55:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2012 23:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163871327"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.176])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2012 23:44:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 23:44:29 -0700
Message-Id: <cover.1341384038.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/40] Updates and patches (Summary Only)
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
X-List-Received-Date: Wed, 04 Jul 2012 06:55:34 -0000

Richard,

This is a batch of changes that I have built against world, lsb and
core images on x866-64 and mips.  I have not done a full build out 
with these. These changes all look sane.

Please pull as you see fit.

I did not grab Kai's changes up yet as an updated change set came 
in late my evening, if they look good, please take them also.

I will be back Thursday (after US 4th of July Holiday) and pick up 
the pieces then.

Sau!



The following changes since commit a6b6df1350149c116050cb93c3c7b4802c709d31:

  task-core-tools-debug: Added openssh-sftp-server. (2012-07-03 14:52:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (4):
  linux-yocto/3.4: add qemumipsel machine mapping
  linux-yocto/3.4: v3.4.4 + configuration updates
  linux-yocto/3.4: update preempt-rt to 3.4.4-rt13
  linux-yocto-tiny: add KMETA specification

Cristian Iorga (1):
  telepathy-glib: update to ver. 0.19.1

Darren Hart (1):
  kernel: Add kernel headers to kernel-dev package

Laurentiu Palcu (10):
  xf86-input-vmmouse: upgrade to 12.9.0
  xf86-input-synaptics: upgrade to 1.6.2
  xcb-util: upgrade to 0.3.9
  libdrm: upgrade to 2.4.35
  ethtool: upgrade to 3.4.1
  libxft: upgrade to 2.3.1
  xcb-util-wm: upgrade to 0.3.9
  xcb-util-image: upgrade to 0.3.9
  xcb-util-keysyms: upgrade to 0.3.9
  lighttpd: upgrade to 1.4.31

Mark Hatle (1):
  oprofile: Change /root to /home/root

Raymond Danks (2):
  image_types: Add elf image type
  mkelfimage: Add stable git build (initial recipe)

Richard Purdie (1):
  subversion-native: Enable subversion-native 1.7 and remove it from
    ASSUME_PROVIDED

Robert P. J. Day (2):
  pcmcia-cs: Remove references to long-deprecated pcmcia-cs.
  prexport.bbclass: Fix typo in warning: "AUROPR" -> "AUTOPR".

Saul Wold (9):
  bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES
  lib_package: use PACKAGE_BEFORE_PN
  libacpi: use lib_package bbclass
  pulseaudio: use lib_package bbclass
  db: use lib_package bbclass
  gnutls: use lib_package bbclass
  speex: use lib_package bbclass
  package.bbclass: enable the use of package_qa_handle_error
  lsbinitiscripts: Add glib-2.0 to DEPENDS list

Tom Zanussi (9):
  perl: keep original libperl location
  perl: add @STAGINGDIR@ for config.sh substitions
  perl: use @STAGINGDIR@ in config.sh
  perf: enable Python bindings
  perf: enable Perl binding
  perf: add libexec/perf-core and contents
  perf: add perf-scripting MACHINE_FEATURE
  qemumachines: make MACHINE_FEATURES append follow qemu.inc include
  perf: add perf-tui MACHINE_FEATURE

 meta/classes/image_types.bbclass                   |   18 +++-
 meta/classes/kernel.bbclass                        |   27 ++---
 meta/classes/lib_package.bbclass                   |    3 +-
 meta/classes/package.bbclass                       |   10 ++-
 meta/classes/prexport.bbclass                      |    2 +-
 meta/conf/bitbake.conf                             |    8 +-
 meta/conf/documentation.conf                       |    2 +-
 meta/conf/machine/qemux86-64.conf                  |    4 +-
 meta/conf/machine/qemux86.conf                     |    4 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    7 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
 ...thy-glib_0.19.0.bb => telepathy-glib_0.19.1.bb} |    4 +-
 meta/recipes-core/udev/udev/network.sh             |    3 -
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   17 +++
 meta/recipes-devtools/perl/perl-5.14.2/config.sh   |    2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    4 +-
 .../subversion/subversion_1.7.2.bb                 |    4 -
 .../ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb}   |    4 +-
 .../{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb}     |    6 +-
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb   |    4 +-
 .../drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb}     |    4 +-
 ...util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} |    4 +-
 ...-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} |    4 +-
 .../{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} |    4 +-
 .../xcb/{xcb-util_0.3.8.bb => xcb-util_0.3.9.bb}   |    4 +-
 ...tics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} |    4 +-
 ...ouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} |    4 +-
 .../xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb}  |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +
 meta/recipes-kernel/linux/linux-yocto.inc          |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   17 ++--
 meta/recipes-kernel/oprofile/oprofile.inc          |    3 +-
 .../oprofile/oprofile/oprofile-root.patch          |  108 ++++++++++++++++++++
 meta/recipes-kernel/perf/perf_3.4.bb               |   36 ++++++-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    3 +-
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    8 +-
 meta/recipes-support/db/db_5.3.15.bb               |    4 +-
 meta/recipes-support/gnutls/gnutls.inc             |   14 +--
 40 files changed, 262 insertions(+), 111 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.0.bb => telepathy-glib_0.19.1.bb} (82%)
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
 rename meta/recipes-extended/ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb} (79%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb} (92%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb} (62%)
 rename meta/recipes-graphics/xcb/{xcb-util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} (66%)
 rename meta/recipes-graphics/xcb/{xcb-util-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} (52%)
 rename meta/recipes-graphics/xcb/{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} (74%)
 rename meta/recipes-graphics/xcb/{xcb-util_0.3.8.bb => xcb-util_0.3.9.bb} (62%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} (81%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} (75%)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb} (88%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch

-- 
1.7.7.6



