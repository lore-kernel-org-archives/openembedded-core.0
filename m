Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R5YzJ-0007h3-5s
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 10:14:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 01:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="49994446"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2011 01:08:43 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 16:08:49 +0800
Message-Id: <cover.1316419662.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix to bug 1086
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
X-List-Received-Date: Mon, 19 Sep 2011 08:14:01 -0000

The following changes since commit 843f9af47ffccb7ffdf3039c560bc3e4c88175a2:

  sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD (2011-09-18 15:58:58 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/bug-1086
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bug-1086

Dexuan Cui (1):
  deb packages support: switch from /var/dpkg to /var/lib/dpkg

 meta/classes/package_deb.bbclass                   |   10 +++++-----
 meta/classes/populate_sdk_deb.bbclass              |    4 ++--
 meta/classes/rootfs_deb.bbclass                    |   20 ++++++++++----------
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 meta/recipes-devtools/apt/files/apt.conf           |    4 ++--
 .../dpkg/run-postinsts/run-postinsts               |    2 +-
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 .../update-alternatives-dpkg.inc                   |    6 +++---
 10 files changed, 27 insertions(+), 27 deletions(-)

-- 
1.7.6



