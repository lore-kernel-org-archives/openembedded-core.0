Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbT1r-0005tX-T5
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 09:48:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2011 00:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="21367607"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 00:44:33 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 15:42:56 +0800
Message-Id: <cover.1309246787.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3] Enable https pages for web brower, v2
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
X-List-Received-Date: Tue, 28 Jun 2011 07:48:16 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

For accessing https web page, libsoup requres modules from glib-networking for TLS/SSL support. These patches add and install it.
V2 modified according to Koen's comments: relocate the glib-networking, and no name in SRC_URI.

Also upgrade tracking info for manual check recipes.


The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:

  runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master

Zhai Edwin (3):
  glib-networking: Add 2.28.7 as new recipe
  webkit-gtk: recommends glib-networking to access https web page
  distro-tracking: Update manual check date for puzzles, gpgme,
    x11vnc..

 .../conf/distro/include/distro_tracking_fields.inc |  172 ++++++++++----------
 .../glib-networking/glib-networking_2.28.7.bb      |   21 +++
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    3 +
 3 files changed, 114 insertions(+), 82 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking_2.28.7.bb



