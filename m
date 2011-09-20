Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6A3R-0006Tf-3K
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 01:48:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 16:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50889688"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2011 16:43:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 16:43:16 -0700
Message-Id: <cover.1316562083.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RC Fixes 0/8] Avahi, OpenSUSE and other fixes
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
X-List-Received-Date: Tue, 20 Sep 2011 23:48:45 -0000

Richard,

This set contains fixes from other folks that have been vetted,
it also contains my (hopefully) final pass at the avahi refactor
along with a bunch of Distro Data Fixes and updates prior to release.

Sau!

The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:

  freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/stage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/stage

Anders Darander (3):
  libzypp: git repo moved to github
  sat-solver: git repo moved to github
  zypper: git repo moved to github

Dexuan Cui (1):
  deb packages support: switch from /var/dpkg to /var/lib/dpkg

Paul Eggleton (1):
  scripts/combo-layer: fix still overzealous regex in default hook
    script

Saul Wold (3):
  distrodata: fix distro_check code
  distro tracking: Update Distro Aliases
  avahi: Refactor recipe to move UI to avahi-ui

 meta/classes/distrodata.bbclass                    |   19 ++++-
 meta/classes/package_deb.bbclass                   |   10 +-
 meta/classes/populate_sdk_deb.bbclass              |    4 +-
 meta/classes/rootfs_deb.bbclass                    |   20 +++---
 .../conf/distro/include/distro_tracking_fields.inc |   83 ++++++++++++++++++-
 meta/lib/oe/distro_check.py                        |    8 +-
 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |   37 +++++++++
 meta/recipes-connectivity/avahi/avahi.inc          |   86 ++++++++++---------
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb    |    6 +-
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 meta/recipes-devtools/apt/files/apt.conf           |    4 +-
 .../dpkg/run-postinsts/run-postinsts               |    2 +-
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 .../update-alternatives-dpkg.inc                   |    6 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
 meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
 scripts/combo-layer-hook-default.sh                |    2 +-
 20 files changed, 220 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb

-- 
1.7.6



