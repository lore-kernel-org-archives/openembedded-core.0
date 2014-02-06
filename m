Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 222036C83B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785119"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:37 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:19 +0200
Message-Id: <cover.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/13] package upgrades
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
X-List-Received-Date: Thu, 06 Feb 2014 15:29:58 -0000

Built tested on AB (including sanity tests) with
nightly-(x86|x86-64|ppc|mips|arm) and build-appliance which finished
successfully. Did a basic manual sanity test with a genericx86-64
core-image-sato image on real HW. Nothing obviously wrong spotted.

laurentiu

The following changes since commit 4e9eb77108c7e628ebd00ec848b8bc034802e197:

  sstate: Improve funciton checksums (2014-02-04 22:51:43 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/upgrades

for you to fetch changes up to e2e1b80e4ff468cb6788fc958538e6d82016f2fa:

  python-pycurl: upgrade to 7.19.3 (2014-02-06 17:17:06 +0200)

----------------------------------------------------------------
Laurentiu Palcu (13):
      nasm: upgrade to 2.11
      xextproto: upgrade to 7.3.0
      gdb: upgrade to 7.6.2
      xcb-util-wm: upgrade to 0.4.0
      xtrans: upgrade to 1.3.3
      libdrm: upgrade to 2.4.52
      xkeyboard-config: upgrade to 2.11
      libmpc: upgrade to 1.0.2
      xf86-input-synaptics: upgrade to 1.7.3
      presentproto_git.bb: add recipe
      xf86-video-intel: add compat patch for xorg >= 1.14.99.2
      xserver-xorg: upgrade to 1.15.0
      python-pycurl: upgrade to 7.19.3

 .../gdb/{gdb-7.6.1.inc => gdb-7.6.2.inc}           |    4 +--
 ...nadian_7.6.1.bb => gdb-cross-canadian_7.6.2.bb} |    0
 .../gdb/{gdb-cross_7.6.1.bb => gdb-cross_7.6.2.bb} |    0
 .../gdb/{gdb_7.6.1.bb => gdb_7.6.2.bb}             |    0
 .../nasm/{nasm_2.10.09.bb => nasm_2.11.bb}         |    4 +--
 .../python/python-pycurl/no-static-link.patch      |   20 ++++++++------
 ...-pycurl_7.19.0.2.bb => python-pycurl_7.19.3.bb} |   10 +++----
 meta/recipes-graphics/drm/libdrm_2.4.49.bb         |    8 ------
 meta/recipes-graphics/drm/libdrm_2.4.52.bb         |    8 ++++++
 ...tics_1.7.1.bb => xf86-input-synaptics_1.7.3.bb} |    4 +--
 ...Map-changes-of-DamageUnregister-API-in-1..patch |   29 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.21.15.bb        |    4 ++-
 .../{xcb-util-wm_0.3.9.bb => xcb-util-wm_0.4.0.bb} |    4 +--
 ...d-config_2.10.1.bb => xkeyboard-config_2.11.bb} |    4 +--
 .../xorg-lib/{xtrans_1.3.2.bb => xtrans_1.3.3.bb}  |    4 +--
 .../xorg-proto/presentproto_git.bb                 |   22 +++++++++++++++
 .../{xextproto_7.2.1.bb => xextproto_7.3.0.bb}     |    4 +--
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    4 +--
 ...erver-xorg_1.14.4.bb => xserver-xorg_1.15.0.bb} |    4 +--
 .../libmpc/{libmpc_1.0.1.bb => libmpc_1.0.2.bb}    |    4 +--
 20 files changed, 98 insertions(+), 43 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.6.1.inc => gdb-7.6.2.inc} (74%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.6.1.bb => gdb-cross-canadian_7.6.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.6.1.bb => gdb-cross_7.6.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.6.1.bb => gdb_7.6.2.bb} (100%)
 rename meta/recipes-devtools/nasm/{nasm_2.10.09.bb => nasm_2.11.bb} (81%)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.0.2.bb => python-pycurl_7.19.3.bb} (59%)
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.49.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.52.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.1.bb => xf86-input-synaptics_1.7.3.bb} (81%)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
 rename meta/recipes-graphics/xorg-lib/{xcb-util-wm_0.3.9.bb => xcb-util-wm_0.4.0.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.10.1.bb => xkeyboard-config_2.11.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.2.bb => xtrans_1.3.3.bb} (82%)
 create mode 100644 meta/recipes-graphics/xorg-proto/presentproto_git.bb
 rename meta/recipes-graphics/xorg-proto/{xextproto_7.2.1.bb => xextproto_7.3.0.bb} (81%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.14.4.bb => xserver-xorg_1.15.0.bb} (88%)
 rename meta/recipes-support/libmpc/{libmpc_1.0.1.bb => libmpc_1.0.2.bb} (64%)

Laurentiu Palcu (13):
  nasm: upgrade to 2.11
  xextproto: upgrade to 7.3.0
  gdb: upgrade to 7.6.2
  xcb-util-wm: upgrade to 0.4.0
  xtrans: upgrade to 1.3.3
  libdrm: upgrade to 2.4.52
  xkeyboard-config: upgrade to 2.11
  libmpc: upgrade to 1.0.2
  xf86-input-synaptics: upgrade to 1.7.3
  presentproto_git.bb: add recipe
  xf86-video-intel: add compat patch for xorg >= 1.14.99.2
  xserver-xorg: upgrade to 1.15.0
  python-pycurl: upgrade to 7.19.3

 .../gdb/{gdb-7.6.1.inc => gdb-7.6.2.inc}           |    4 +--
 ...nadian_7.6.1.bb => gdb-cross-canadian_7.6.2.bb} |    0
 .../gdb/{gdb-cross_7.6.1.bb => gdb-cross_7.6.2.bb} |    0
 .../gdb/{gdb_7.6.1.bb => gdb_7.6.2.bb}             |    0
 .../nasm/{nasm_2.10.09.bb => nasm_2.11.bb}         |    4 +--
 .../python/python-pycurl/no-static-link.patch      |   20 ++++++++------
 ...-pycurl_7.19.0.2.bb => python-pycurl_7.19.3.bb} |   10 +++----
 .../drm/{libdrm_2.4.49.bb => libdrm_2.4.52.bb}     |    4 +--
 ...tics_1.7.1.bb => xf86-input-synaptics_1.7.3.bb} |    4 +--
 ...Map-changes-of-DamageUnregister-API-in-1..patch |   29 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.21.15.bb        |    4 ++-
 .../{xcb-util-wm_0.3.9.bb => xcb-util-wm_0.4.0.bb} |    4 +--
 ...d-config_2.10.1.bb => xkeyboard-config_2.11.bb} |    4 +--
 .../xorg-lib/{xtrans_1.3.2.bb => xtrans_1.3.3.bb}  |    4 +--
 .../xorg-proto/presentproto_git.bb                 |   22 +++++++++++++++
 .../{xextproto_7.2.1.bb => xextproto_7.3.0.bb}     |    4 +--
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    4 +--
 ...erver-xorg_1.14.4.bb => xserver-xorg_1.15.0.bb} |    4 +--
 .../libmpc/{libmpc_1.0.1.bb => libmpc_1.0.2.bb}    |    4 +--
 19 files changed, 92 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.6.1.inc => gdb-7.6.2.inc} (74%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.6.1.bb => gdb-cross-canadian_7.6.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.6.1.bb => gdb-cross_7.6.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.6.1.bb => gdb_7.6.2.bb} (100%)
 rename meta/recipes-devtools/nasm/{nasm_2.10.09.bb => nasm_2.11.bb} (81%)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.0.2.bb => python-pycurl_7.19.3.bb} (59%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.49.bb => libdrm_2.4.52.bb} (46%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.1.bb => xf86-input-synaptics_1.7.3.bb} (81%)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
 rename meta/recipes-graphics/xorg-lib/{xcb-util-wm_0.3.9.bb => xcb-util-wm_0.4.0.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.10.1.bb => xkeyboard-config_2.11.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.2.bb => xtrans_1.3.3.bb} (82%)
 create mode 100644 meta/recipes-graphics/xorg-proto/presentproto_git.bb
 rename meta/recipes-graphics/xorg-proto/{xextproto_7.2.1.bb => xextproto_7.3.0.bb} (81%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.14.4.bb => xserver-xorg_1.15.0.bb} (88%)
 rename meta/recipes-support/libmpc/{libmpc_1.0.1.bb => libmpc_1.0.2.bb} (64%)

-- 
1.7.9.5


