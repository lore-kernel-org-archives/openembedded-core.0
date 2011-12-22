Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Rdhoz-0001bx-5Q
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:32:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Dec 2011 04:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88519429"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 22 Dec 2011 04:25:21 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 20:16:00 +0800
Message-Id: <cover.1324555824.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4] self-hosted-image: Add mini X
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
X-List-Received-Date: Thu, 22 Dec 2011 12:32:29 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This is the new version modified according to Paul and Saul's comments:
Use mini-x-session, change script name, and more accurate license.

The following changes since commit 4648aadfe161d2e0ec51408f35fdf8996727bd22:

  ui/crumbs/hobprefs: trigger a reparse after changing IMAGE_FSTYPES (2011-12-20 13:15:54 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2

Zhai Edwin (4):
  mini-x-session: Add this recipe as the session file for mini X
  Add mini X core tasks
  Add "builder" user for specific purpose.
  self-hosted-image: Add builder user and mini X

 meta/classes/core-image.bbclass                    |    2 +
 meta/recipes-core/images/self-hosted-image.bb      |    4 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |    3 +-
 meta/recipes-graphics/builder/builder_0.1.bb       |   27 ++++++++++++
 .../builder/files/builder_hob_start.sh             |   11 +++++
 .../mini-x-session/files/mini-x-session            |   32 ++++++++++++++
 .../mini-x-session/mini-x-session_0.1.bb           |   24 ++++++++++
 meta/recipes-sato/tasks/task-core-x11-mini.bb      |   45 ++++++++++++++++++++
 8 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/builder/builder_0.1.bb
 create mode 100644 meta/recipes-graphics/builder/files/builder_hob_start.sh
 create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-session
 create mode 100644 meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
 create mode 100644 meta/recipes-sato/tasks/task-core-x11-mini.bb



