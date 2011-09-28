Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8mRd-0001ns-AN
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 07:12:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2011 22:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="71468331"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2011 22:07:05 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 13:02:42 +0800
Message-Id: <cover.1317185969.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4] Remove gnome-vfs completely
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
X-List-Received-Date: Wed, 28 Sep 2011 05:12:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
gnome-vfs need to be removed and taken place by gio. These patches remove the
dependece on it, and obsolete recipes that need it.

Pls. help to pull.

Thanks,
Edwin

The following changes since commit e3c5d7a90ae179af0ac128ea4dfc1a5a6602c2e4:

  libtool: Fix an issue where unnecessary rpaths were being injected (2011-09-26 17:56:44 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (4):
  oprofileui: remove dependence on gnome-vfs
  libgsf: remove dependence on gnome-vfs
  tables: remove it as obsolete recipe
  gnome-vfs: remove it as obsolete recipe in favor of GIO/GVFS

 .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |    8 ++-
 meta-demoapps/recipes-graphics/clutter/table.inc   |   13 -----
 .../recipes-graphics/clutter/table/fixes.patch     |   16 ------
 .../recipes-graphics/clutter/table_git.bb          |   15 ------
 .../conf/distro/include/distro_tracking_fields.inc |   11 ----
 meta/conf/multilib.conf                            |    1 -
 .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |   13 -----
 .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |   53 --------------------
 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |   50 ------------------
 meta/recipes-kernel/oprofile/oprofileui.inc        |    2 +-
 10 files changed, 7 insertions(+), 175 deletions(-)
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table.inc
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table/fixes.patch
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table_git.bb
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb



