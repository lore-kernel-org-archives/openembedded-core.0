Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf1-0004F2-AA
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 23:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163399"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:23 -0700
Message-Id: <cover.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 00/27] Updates and various fixes
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:31 -0000

Richard,t

This address some issues with the x11 and bluez patches recently,
it also has the latest kernel update. There is also a multi-lib 
change that needs your more detailed review.

The ofono patch from Anders had a question from Koen, so we might
want to hold on that one, otherwise it looks OK to me.

Thanks

Sau!


The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:

  distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Darander (5):
  qt4: allow a reduction in build time
  qmake_base: add uclibceabi
  connman: use DISTRO_FEATURES to enable wifi and bluetooth
  ofono: conditionally enable bluetooth
  create-pull-request: increase likelihood of detecting a rename

Bruce Ashfield (3):
  linux-yocto: bump version string to 3.0.1
  qemu: change default kernel to 3.0.x
  linux-yocto: meta SRCREV bump

Dexuan Cui (10):
  bluez-hcidump: upgrade from 2.0 to 2.1
  tcf-agent: add openssl into DEPENDS
  cronie: upgrade from 1.4.7 to 1.4.8
  mdadm: upgrade mdadm from 3.2.1 to 3.2.2
  util-macros: upgrade from 1.14.0 to the latest version 0.15.0
  freetype: upgrade from 2.4.4 to 2.4.6
  xproto: upgrade from 7.0.21 to 7.0.22
  glproto: upgrade from 1.4.13 to 1.4.14
  dri2proto: upgrade from 2.4 to 2.6
  distro_tracking_fields.inc: update the info for the following recipes

Dmitry Eremin-Solenikov (1):
  libxcb: enable native/nativesdk builds as was done previously in
    meta-oe

Dongxiao Xu (4):
  rootfs_rpm: Fix DEFAULTTUNE setting in multilib case
  package_rpm: enhance strip_multilib function
  package_rpm: Fix package rename issue in multilib case
  gtk-icon-cache: Adding MLPREFIX when dynamically set RDEPENDS

Lianhao Lu (1):
  package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS

Phil Blundell (2):
  cmake.bbclass, perlnative.bbclass: arrange for cmake to find
    perl-native
  libproxy: remove dependency on X libs

Zhai Edwin (1):
  qemu: Make qemu buildable inside qemux86/qemuppc target

 meta/classes/cmake.bbclass                         |    3 +-
 meta/classes/gtk-icon-cache.bbclass                |    2 +-
 meta/classes/package.bbclass                       |   13 +--
 meta/classes/package_ipk.bbclass                   |   30 +---
 meta/classes/package_rpm.bbclass                   |   22 ++--
 meta/classes/perlnative.bbclass                    |    1 +
 meta/classes/qmake_base.bbclass                    |    2 +-
 meta/classes/rootfs_rpm.bbclass                    |    4 -
 meta/classes/utils.bbclass                         |   24 ++-
 .../conf/distro/include/distro_tracking_fields.inc |   56 +++---
 meta/conf/machine/include/qemu.inc                 |    1 -
 .../{bluez-hcidump_2.0.bb => bluez-hcidump_2.1.bb} |    4 +-
 meta/recipes-connectivity/connman/connman_0.75.bb  |    4 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    3 +-
 meta/recipes-connectivity/ofono/ofono_0.50.bb      |    1 +
 meta/recipes-connectivity/ofono/ofono_git.bb       |    4 +
 meta/recipes-devtools/qemu/qemu.inc                |    5 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |   24 ++-
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    4 +-
 .../cronie/{cronie_1.4.7.bb => cronie_1.4.8.bb}    |    6 +-
 .../mdadm/fix_for_compilation_with_gcc-4.6.0.patch |  174 --------------------
 .../mdadm/{mdadm_3.2.1.bb => mdadm_3.2.2.bb}       |    9 +-
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.4.bb => freetype_2.4.6.bb}       |    8 +-
 meta/recipes-graphics/xcb/libxcb.inc               |    2 +
 .../restore_to_old_xDRI2BufferSwapComplete.patch   |   53 ------
 .../{dri2proto_2.4.bb => dri2proto_2.6.bb}         |    7 +-
 .../restore_the_old_xGLXBufferSwapComplete.patch   |   53 ------
 .../{glproto_1.4.13.bb => glproto_1.4.14.bb}       |    7 +-
 .../{xproto_7.0.21.bb => xproto_7.0.22.bb}         |    4 +-
 ...util-macros_1.14.0.bb => util-macros_1.15.0.bb} |    4 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    6 +-
 meta/recipes-qt/qt4/qt4.inc                        |   13 +-
 meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    2 +-
 scripts/create-pull-request                        |    2 +-
 35 files changed, 143 insertions(+), 414 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.0.bb => bluez-hcidump_2.1.bb} (83%)
 rename meta/recipes-extended/cronie/{cronie_1.4.7.bb => cronie_1.4.8.bb} (94%)
 delete mode 100644 meta/recipes-extended/mdadm/mdadm/fix_for_compilation_with_gcc-4.6.0.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.2.1.bb => mdadm_3.2.2.bb} (77%)
 rename meta/recipes-graphics/freetype/{freetype-2.4.4 => freetype-2.4.6}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.4.bb => freetype_2.4.6.bb} (82%)
 delete mode 100644 meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapComplete.patch
 rename meta/recipes-graphics/xorg-proto/{dri2proto_2.4.bb => dri2proto_2.6.bb} (66%)
 delete mode 100644 meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.13.bb => glproto_1.4.14.bb} (68%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.21.bb => xproto_7.0.22.bb} (72%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.14.0.bb => util-macros_1.15.0.bb} (80%)

-- 
1.7.6



