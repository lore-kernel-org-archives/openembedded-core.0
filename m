Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5C98F6CF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:22 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376039996"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:23 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:10 +0300
Message-Id: <cover.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/8] Other package upgrades
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:22 -0000

This patchset contains another bunch of package upgrades. Build tested on a
local autobuilder for all major architectures and basic functionality tests
were done on a core-image-sato/qemux86 image.

Thanks,
Laurentiu

The following changes since commit 529bf977e956175bd8405ebffc88194192e44740:

  update-rcd.bbclass: fix host/target test (2013-10-16 14:51:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades2

Laurentiu Palcu (8):
  xmodmap: upgrade to 1.0.8
  python-setuptools: upgrade to 1.1.6
  xinit: upgrade to 1.3.3
  m4: upgrade to 1.4.17
  tar: upgrade to 1.27
  tcl: upgrade to 8.6.1
  mdadm: upgrade to 3.3
  gdb: upgrade to 7.6.1

 .../gdb/{gdb-7.6.inc => gdb-7.6.1.inc}             |    4 +--
 ...canadian_7.6.bb => gdb-cross-canadian_7.6.1.bb} |    2 +-
 .../gdb/{gdb-cross_7.6.bb => gdb-cross_7.6.1.bb}   |    2 +-
 .../gdb/{gdb_7.6.bb => gdb_7.6.1.bb}               |    2 +-
 .../m4/{m4-1.4.16.inc => m4-1.4.17.inc}            |    9 ++---
 .../{m4-native_1.4.16.bb => m4-native_1.4.17.bb}   |    0
 meta/recipes-devtools/m4/m4/remove-gets.patch      |   18 +++++-----
 .../m4/{m4_1.4.16.bb => m4_1.4.17.bb}              |    0
 ...ptools_0.6c11.bb => python-setuptools_1.1.6.bb} |    7 ++--
 .../tcltk/tcl/let-DST-include-year-2099.patch      |   35 ------------------
 .../tcltk/tcl/tcl-add-soname.patch                 |   38 ++++++++++----------
 .../tcltk/{tcl_8.6.0.bb => tcl_8.6.1.bb}           |    7 ++--
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |   11 +++---
 .../mdadm/{mdadm_3.2.6.bb => mdadm_3.3.bb}         |    5 ++-
 .../tar/{tar-1.26 => tar-1.27}/remove-gets.patch   |   18 +++++-----
 ...tive_1.26.bb => tar-replacement-native_1.27.bb} |    0
 .../tar/{tar_1.26.bb => tar_1.27.bb}               |    6 ++--
 .../xorg-app/{xinit_1.3.2.bb => xinit_1.3.3.bb}    |    7 ++--
 .../{xmodmap_1.0.7.bb => xmodmap_1.0.8.bb}         |    7 ++--
 19 files changed, 68 insertions(+), 110 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.6.inc => gdb-7.6.1.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.6.bb => gdb-cross-canadian_7.6.1.bb} (71%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.6.bb => gdb-cross_7.6.1.bb} (74%)
 rename meta/recipes-devtools/gdb/{gdb_7.6.bb => gdb_7.6.1.bb} (96%)
 rename meta/recipes-devtools/m4/{m4-1.4.16.inc => m4-1.4.17.inc} (47%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.16.bb => m4-native_1.4.17.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.16.bb => m4_1.4.17.bb} (100%)
 rename meta/recipes-devtools/python/{python-setuptools_0.6c11.bb => python-setuptools_1.1.6.bb} (76%)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.6.0.bb => tcl_8.6.1.bb} (91%)
 rename meta/recipes-extended/mdadm/{mdadm_3.2.6.bb => mdadm_3.3.bb} (86%)
 rename meta/recipes-extended/tar/{tar-1.26 => tar-1.27}/remove-gets.patch (52%)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.26.bb => tar-replacement-native_1.27.bb} (100%)
 rename meta/recipes-extended/tar/{tar_1.26.bb => tar_1.27.bb} (51%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.2.bb => xinit_1.3.3.bb} (67%)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.7.bb => xmodmap_1.0.8.bb} (67%)

-- 
1.7.9.5


