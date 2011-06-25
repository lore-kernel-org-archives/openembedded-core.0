Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QaK1p-00037A-AZ
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 05:59:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jun 2011 20:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,422,1304319600"; d="scan'208";a="19582152"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 24 Jun 2011 20:55:49 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jun 2011 11:54:18 +0800
Message-Id: <cover.1308973924.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Enable https pages for web browser
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
X-List-Received-Date: Sat, 25 Jun 2011 03:59:29 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

For accessing https web page, libsoup requres modules from glib-networking for TLS/SSL support. These patches add and install it.

The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:

  runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master

Zhai Edwin (2):
  glib-networking: Add 2.28.7 as new recipe
  webkit-gtk: recommends glib-networking to access https web page

 meta/recipes-sato/web/glib-networking_2.28.7.bb |   21 +++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_svn.bb      |    3 +++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-sato/web/glib-networking_2.28.7.bb



