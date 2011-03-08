Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pwkr9-0002Nt-Oe
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 01:32:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Mar 2011 16:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,280,1297065600"; d="scan'208";a="717410553"
Received: from unknown (HELO localhost) ([10.255.12.99])
	by orsmga001.jf.intel.com with ESMTP; 07 Mar 2011 16:29:29 -0800
Message-Id: <cover.1299544029.git.sgw@linux.intel.com>
Old-Date: Mon, 7 Mar 2011 16:27:09 -0800
Date: Mon, 07 Mar 2011 16:29:28 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Tue, 08 Mar 2011 08:18:44 +0100
Cc: Koen Kooi <koen@dominion.thruhere.net>, Liping Ke <liping.ke@intel.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 0/8] Numerous bug fixes
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
X-List-Received-Date: Tue, 08 Mar 2011 00:32:56 -0000

From: Saul Wold <sgw@linux.intel.com>

This set address a number of bugs found during testing of
the Bernard release, they may not all be accepeted, I send 
them here for reference also.


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-dist
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-dist

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Dexuan Cui (1):
  util-macros: fix DEPENDS in the case of native/nativesdk

Dongxiao Xu (1):
  connman: add xuser to the dbus permission list

Koen Kooi (1):
  libgpg-error: extend to nativesdk to catch up with metadata changes

Liping Ke (1):
  adt: Update to svn r596 to fix symbolic link issues

Nitin A Kamble (1):
  gcc-runtime: fix LSB library checks for libstdc++.so.6

Saul Wold (3):
  gst-plugins: Added hal to DEPENDS
  attr: Added ncurses to depends
  lsb-live image: add lsb-live and lsb-sdk-live image types

 meta/conf/bitbake.conf                             |    2 +-
 .../conf/distro/include/poky-default-revisions.inc |    1 +
 meta/conf/distro/include/poky-eglibc.inc           |    2 +-
 meta/conf/distro/include/poky-glibc.inc            |    2 +-
 meta/conf/distro/include/poky-uclibc.inc           |    2 +-
 .../connman-0.65/add_xuser_dbus_permission.patch   |   21 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.65.bb  |    3 +-
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    1 +
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-
 .../installer/adt-installer/adt_installer          |    2 +-
 .../installer/adt-installer_1.0.bb                 |    8 +++---
 .../recipes-extended/images/poky-image-lsb-live.bb |   11 ++++++++++
 .../images/poky-image-lsb-sdk-live.bb              |   11 ++++++++++
 .../xorg-util/util-macros_1.11.0.bb                |    5 ++-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 +-
 meta/recipes-support/attr/attr.inc                 |    2 +
 .../libgpg-error/libgpg-error_1.9.bb               |    5 ++-
 17 files changed, 66 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch
 create mode 100644 meta/recipes-extended/images/poky-image-lsb-live.bb
 create mode 100644 meta/recipes-extended/images/poky-image-lsb-sdk-live.bb



