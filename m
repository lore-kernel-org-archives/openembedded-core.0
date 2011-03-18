Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q0cV0-00005p-69
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 17:26:04 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2011 09:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,205,1299484800"; d="scan'208";a="721654809"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2011 09:24:15 -0700
Message-Id: <cover.1300465259.git.nitin.a.kamble@intel.com>
Old-Date: Fri, 18 Mar 2011 09:20:59 -0700
Date: Fri, 18 Mar 2011  9:24:15 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/7] commits for GPLv2 poky-image-basic image
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
X-List-Received-Date: Fri, 18 Mar 2011 16:26:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


Richard,
  I have rrebased this to bernard branch. So you may not need all the commits
as you have already pulled some of the saul's commits in the OE & master 
branch.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  coreutils-6.9: fix man page building for the gplv2 recipe

Saul Wold (6):
  extended tasks: move binutils from basic to lsb
  poky-image-basic: remove POKY_BASE_INSTALL
  poky.conf: add additional Libraries to the LGPLv2 Whitelist
  poky.conf: remove gnome-common from WHITELIST_GPLV3
  gettext: Upgrade GPLv2 version to 0.16.1
  util-linux: Setup for GPLv2 Recipe

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
 meta/recipes-core/util-linux/util-linux.inc        |   14 +-
 meta/recipes-core/util-linux/util-linux_2.17.2.bb  |   31 +-
 meta/recipes-extended/images/poky-image-basic.bb   |    4 +-
 meta/recipes-extended/tasks/task-poky-basic.bb     |    2 -
 meta/recipes-extended/tasks/task-poky-lsb.bb       |    3 +-
 22 files changed, 1491 insertions(+), 1188 deletions(-)
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

-- 
1.7.3.4



