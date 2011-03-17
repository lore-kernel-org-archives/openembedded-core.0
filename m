Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q0LoM-0007DG-PO
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 23:36:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Mar 2011 15:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,201,1299484800"; d="scan'208";a="614375609"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2011 15:34:45 -0700
Message-Id: <cover.1300401016.git.nitin.a.kamble@intel.com>
Old-Date: Thu, 17 Mar 2011 15:30:16 -0700
Date: Thu, 17 Mar 2011 15:34:45 -0700
To: poky@yoctoprojectorg,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/7] non-gplv3 poky-image-basic image
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
X-List-Received-Date: Thu, 17 Mar 2011 22:36:55 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These commits enable poky-image-basic image with non-gplv3 packages.
Non glv3 packages/images can be built by, setting 
INCOMPATIBLE_LICENSE = "GPLv3"
in the local.conf
                                   

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  coreutils-6.9: fix man page building for the gplv2 recipe

Saul Wold (6):
  util-linux: Setup for GPLv2 Recipe
  extended tasks: move binutils from basic to lsb
  poky-image-basic: remove POKY_BASE_INSTALL
  poky.conf: add additional Libraries to the LGPLv2 Whitelist
  poky.conf: remove gnome-common from WHITELIST_GPLV3
  gettext: Upgrade GPLv2 version to 0.16.1

 meta/conf/distro/poky.conf                         |    4 +-
 .../coreutils-6.9/fix_for_manpage_building.patch   |   83 ++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   10 +-
 .../gettext/gettext-0.14.1/gettext-vpath.patch     |   15 -
 .../gettext/gettext-0.14.1/linklib_from_0.17.patch | 1135 --------------------
 .../disable_java.patch                             |   19 +-
 .../gettext-0.16.1/fix_aclocal_version.patch       |  107 ++
 .../gettext-0.16.1/fix_gnu_source_circular.patch   |  345 ++++++
 .../fixchicken.patch                               |    0
 .../getline.m4.patch                               |    0
 .../gettext-autoconf-lib-link-no-L.patch           |    4 +
 .../gettext-error_print_progname.patch             |    0
 .../gettext/gettext-0.16.1/gettext-vpath.patch     |   17 +
 .../gettext-0.16.1/hardcode_macro_version.patch    |   48 +
 .../gettext/gettext-0.16.1/linklib_from_0.17.patch |  717 ++++++++++++
 .../{gettext_0.14.1.bb => gettext_0.16.1.bb}       |   20 +-
 .../util-linux-2.17.2/remove-lscpu.patch           |  101 ++
 meta/recipes-core/util-linux/util-linux.inc        |    5 +-
 meta/recipes-core/util-linux/util-linux_2.17.2.bb  |   10 +-
 meta/recipes-core/util-linux/util-linux_gplv2.bb   |   26 +
 meta/recipes-extended/images/poky-image-basic.bb   |    4 +-
 meta/recipes-extended/tasks/task-poky-basic.bb     |    2 -
 meta/recipes-extended/tasks/task-poky-lsb.bb       |    3 +-
 23 files changed, 1491 insertions(+), 1184 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.14.1/gettext-vpath.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.14.1/linklib_from_0.17.patch
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/disable_java.patch (53%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/fixchicken.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/getline.m4.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/gettext-autoconf-lib-link-no-L.patch (88%)
 rename meta/recipes-core/gettext/{gettext-0.14.1 => gettext-0.16.1}/gettext-error_print_progname.patch (100%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
 rename meta/recipes-core/gettext/{gettext_0.14.1.bb => gettext_0.16.1.bb} (74%)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux_gplv2.bb

-- 
1.7.3.4



