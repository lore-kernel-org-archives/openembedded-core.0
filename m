Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q0A0b-0005b2-1A
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 11:00:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Mar 2011 02:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,198,1299484800"; d="scan'208";a="404009539"
Received: from unknown (HELO localhost) ([10.255.12.145])
	by azsmga001.ch.intel.com with ESMTP; 17 Mar 2011 02:58:42 -0700
Message-Id: <cover.1300355683.git.sgw@linux.intel.com>
Old-Date: Thu, 17 Mar 2011 02:54:43 -0700
Date: Thu, 17 Mar 2011  2:58:42 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 0/7] Non-GPLv3 Changes & a dependency Fix
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
X-List-Received-Date: Thu, 17 Mar 2011 10:00:45 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

This set of changes enables both poky-image-minimal and poky-image-basic
to build non-gplv3 core image. These are bound for bernard

There is also a fix for the gnome-vfs dependency on ACL. This is
a potential build stopper and should be considered for bernard

Sau!


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/non-gplv3
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/non-gplv3

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Saul Wold (7):
  util-linux: Setup for GPLv2 Recipe
  extended tasks: move binutils from basic to lsb
  poky-image-basic: remove POKY_BASE_INSTALL
  poky.conf: add additional Libraries to the LGPLv2 Whitelist
  poky.conf: remove gnome-common from WHITELIST_GPLV3
  gettext: Upgrade GPLv2 version to 0.16.1
  gnome-vfs: add DEPENDS for acl

 meta/conf/distro/poky.conf                         |    4 +-
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
 meta/recipes-core/util-linux/util-linux.inc        |    5 +-
 meta/recipes-core/util-linux/util-linux_2.17.2.bb  |    9 +-
 meta/recipes-core/util-linux/util-linux_gplv2.bb   |   24 +
 meta/recipes-extended/images/poky-image-basic.bb   |    4 +-
 meta/recipes-extended/tasks/task-poky-basic.bb     |    2 -
 meta/recipes-extended/tasks/task-poky-lsb.bb       |    3 +-
 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |    2 +-
 21 files changed, 1298 insertions(+), 1182 deletions(-)
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
 create mode 100644 meta/recipes-core/util-linux/util-linux_gplv2.bb



