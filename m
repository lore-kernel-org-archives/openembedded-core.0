Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 594886DA6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2013 05:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337136"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:09 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:50:55 +0200
Message-Id: <cover.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/9] package upgrades
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:16 -0000

This patch set contains only package upgrades. Each package has been compiled
on all architectures successfully and basic functionality tests were done in
core-image-sato for qemux86.

Also, at Ross's sugestion, the xcb related recipes were moved to xorg-proto and
xorg-lib directories.

Laurentiu

The following changes since commit 0aef540dd8866c5d76dd1edd8936343258935c47:

  bitbake: fetch2: Correct a few calls to latest_revision() (2013-11-25 13:02:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (8):
  xtrans: upgrade to 1.3.2
  python-setuptools: upgrade to 1.4
  tar: upgrade to 1.27.1
  powertop: upgrade to 2.5
  libdrm: upgrade to 2.4.49
  xproto: upgrade to 7.0.25
  xcb-proto: upgrade to 1.9
  libxcb: upgrade to 1.9.3

Upgrade Helper (1):
  git: upgrade to 1.8.4.4

 .../git/{git_1.8.4.2.bb => git_1.8.4.4.bb}         |    4 +--
 ...etuptools_1.1.7.bb => python-setuptools_1.4.bb} |    4 +--
 ...ve_1.27.bb => tar-replacement-native_1.27.1.bb} |    0
 .../tar/{tar-1.27 => tar}/remove-gets.patch        |    0
 .../tar/{tar_1.27.bb => tar_1.27.1.bb}             |    4 +--
 .../drm/{libdrm_2.4.47.bb => libdrm_2.4.49.bb}     |    4 +--
 .../xcb/libxcb/automake_1.14_fix.patch             |   27 --------------------
 .../{xcb => xorg-lib}/libpthread-stubs_0.3.bb      |    0
 meta/recipes-graphics/{xcb => xorg-lib}/libxcb.inc |    4 ++-
 .../{xcb => xorg-lib}/libxcb/xcbincludedir.patch   |    0
 .../libxcb_1.9.1.bb => xorg-lib/libxcb_1.9.3.bb}   |    5 ++--
 .../{xcb => xorg-lib}/libxcb_git.bb                |    0
 .../{xcb => xorg-lib}/xcb-util-image_0.3.9.bb      |    0
 .../{xcb => xorg-lib}/xcb-util-keysyms_0.3.9.bb    |    0
 .../{xcb => xorg-lib}/xcb-util-renderutil_0.3.8.bb |    0
 .../{xcb => xorg-lib}/xcb-util-wm_0.3.9.bb         |    0
 .../{xcb => xorg-lib}/xcb-util.inc                 |    0
 .../{xcb => xorg-lib}/xcb-util_0.3.9.bb            |    0
 .../xorg-lib/{xtrans_1.3.0.bb => xtrans_1.3.2.bb}  |    4 +--
 .../{xcb => xorg-proto}/xcb-proto.inc              |    0
 .../xcb-proto_1.9.bb}                              |    4 +--
 .../{xcb => xorg-proto}/xcb-proto_git.bb           |    0
 .../{xproto_7.0.24.bb => xproto_7.0.25.bb}         |    4 +--
 .../powertop/{powertop_2.4.bb => powertop_2.5.bb}  |    4 +--
 24 files changed, 21 insertions(+), 47 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.4.2.bb => git_1.8.4.4.bb} (67%)
 rename meta/recipes-devtools/python/{python-setuptools_1.1.7.bb => python-setuptools_1.4.bb} (86%)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.27.bb => tar-replacement-native_1.27.1.bb} (100%)
 rename meta/recipes-extended/tar/{tar-1.27 => tar}/remove-gets.patch (100%)
 rename meta/recipes-extended/tar/{tar_1.27.bb => tar_1.27.1.bb} (53%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.47.bb => libdrm_2.4.49.bb} (46%)
 delete mode 100644 meta/recipes-graphics/xcb/libxcb/automake_1.14_fix.patch
 rename meta/recipes-graphics/{xcb => xorg-lib}/libpthread-stubs_0.3.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/libxcb.inc (94%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/libxcb/xcbincludedir.patch (100%)
 rename meta/recipes-graphics/{xcb/libxcb_1.9.1.bb => xorg-lib/libxcb_1.9.3.bb} (47%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/libxcb_git.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-image_0.3.9.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-keysyms_0.3.9.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-renderutil_0.3.8.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util-wm_0.3.9.bb (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util.inc (100%)
 rename meta/recipes-graphics/{xcb => xorg-lib}/xcb-util_0.3.9.bb (100%)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.0.bb => xtrans_1.3.2.bb} (82%)
 rename meta/recipes-graphics/{xcb => xorg-proto}/xcb-proto.inc (100%)
 rename meta/recipes-graphics/{xcb/xcb-proto_1.8.bb => xorg-proto/xcb-proto_1.9.bb} (60%)
 rename meta/recipes-graphics/{xcb => xorg-proto}/xcb-proto_git.bb (100%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.24.bb => xproto_7.0.25.bb} (74%)
 rename meta/recipes-kernel/powertop/{powertop_2.4.bb => powertop_2.5.bb} (87%)

-- 
1.7.9.5


