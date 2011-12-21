Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RdHcu-000776-Tf
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 09:34:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 00:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88828057"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 00:27:10 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 16:18:04 +0800
Message-Id: <cover.1324454963.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4] [RFC] Add mini X for self-hosted
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
X-List-Received-Date: Wed, 21 Dec 2011 08:34:17 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
    These patches add mini X, who will execute session files on behalf of file
owner without rootless X. By this way, a minimal X enviroment including
matchbox-wm is availale for the "builder" user to start auto-run apps.

Pls. help to review.

Thanks,
Edwin

The following changes since commit 4648aadfe161d2e0ec51408f35fdf8996727bd22:

  ui/crumbs/hobprefs: trigger a reparse after changing IMAGE_FSTYPES (2011-12-20 13:15:54 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2

Zhai Edwin (4):
  minix-session: Add this recipe as the session file for mini X
  Add mini X core tasks
  Add "builder" user for specific purpose.
  self-hosted-image: Add builder user and mini X

 meta/classes/core-image.bbclass                    |    2 +
 meta/recipes-core/images/self-hosted-image.bb      |    4 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |    3 +-
 meta/recipes-graphics/builder/builder_0.1.bb       |   27 ++++++++++++
 meta/recipes-graphics/builder/files/auto_start.sh  |   11 +++++
 .../minix-session/files/minix-session              |   32 ++++++++++++++
 .../minix-session/minix-session_0.1.bb             |   24 ++++++++++
 meta/recipes-sato/tasks/task-core-x11-mini.bb      |   45 ++++++++++++++++++++
 8 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/builder/builder_0.1.bb
 create mode 100644 meta/recipes-graphics/builder/files/auto_start.sh
 create mode 100644 meta/recipes-graphics/minix-session/files/minix-session
 create mode 100644 meta/recipes-graphics/minix-session/minix-session_0.1.bb
 create mode 100644 meta/recipes-sato/tasks/task-core-x11-mini.bb



