Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QYvDF-0008QU-Bs
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 09:17:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jun 2011 00:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,399,1304319600"; d="scan'208";a="20750968"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2011 00:13:53 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 15:12:18 +0800
Message-Id: <cover.1308639329.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Remove obsolete gnome-vfs
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
X-List-Received-Date: Tue, 21 Jun 2011 07:17:29 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This patch removed obsolete gnome-vfs in favor of GIO/GVFS.
Pls. help to review.

Thanks,
edwin


The following changes since commit 4ff7af11ef69849ef9c16f585eae58ac920b222b:

  machine confs: Add xserver-kdrive as PREFERRED_PROVIDER (2011-05-27 15:30:19 -0700)

are available in the git repository at:
  git@git.pokylinux.org:poky-contrib.git gzhai/master
  http://git.pokylinux.org/cgit.cgi//log/?h=gzhai/master

Zhai Edwin (1):
  gnome-vfs: remove gnome-vfs as it is deprecated in favour of GVFS and
    GIO

 .../oprofileui/migrate-from-gnomevfs-to-gio.patch  |  219 ++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    1 +
 .../gstreamer/gst-meta-base_0.10.bb                |    2 +-
 .../gstreamer/gst-plugins-base_0.10.32.bb          |    6 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
 5 files changed, 224 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch



