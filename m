Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RcfVN-0003em-HR
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 16:51:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 07:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97940375"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 07:44:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 15:43:59 +0000
Message-Id: <cover.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/8] Fix old o-hand.com references
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
X-List-Received-Date: Mon, 19 Dec 2011 15:51:57 -0000

Most of the old o-hand.com sites are no longer available, so fix up
SRC_URIs that reference them.

The following changes since commit ae4118a1f78f113c3d687c3aa6a86007cf977cae:

  libsdl 1.2.14: fix packaging (2011-12-19 12:17:36 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/o-hand
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/o-hand

Paul Eggleton (8):
  xrestop: fix SRC_URI and LICENSE
  matchbox-desktop: fix SRC_URI
  matchbox-themes-extra: fix SRC_URI
  libmatchbox: fix SRC_URI
  libxsettings-client: fix SRC_URI
  mtools: fix SRC_URI for GPLv2 version
  libsync: move to git.yoctoproject.org
  eds-dbus: replace o-hand example contact

 .../opensync/{libsync_svn.bb => libsync_git.bb}    |    9 +-
 .../matchbox-themes-extra_0.3.bb                   |    5 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |   11 +-
 .../libmatchbox/libmatchbox_1.9.bb                 |    2 +-
 .../libxsettings-client_0.10.bb                    |    2 +-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb       |    6 +-
 .../eds/eds-dbus-2.20.0/oh-contact.patch           |  149 ++++++++++++++------
 meta/recipes-sato/eds/eds-dbus/oh-contact.patch    |  149 ++++++++++++++------
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    5 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |    2 +-
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |    5 +-
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |    5 +-
 12 files changed, 250 insertions(+), 100 deletions(-)
 rename meta-demoapps/recipes-connectivity/opensync/{libsync_svn.bb => libsync_git.bb} (72%)

-- 
1.7.5.4



