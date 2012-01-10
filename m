Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rkg0m-0006J8-OM
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:01:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jan 2012 09:39:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94381672"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.3])
	by azsmga001.ch.intel.com with ESMTP; 10 Jan 2012 09:39:17 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 09:39:13 -0800
Message-Id: <cover.1326216024.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
Subject: [PATCH 0/3] Add alsa-state from OE Classic v2
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
X-List-Received-Date: Tue, 10 Jan 2012 18:01:29 -0000

The small series following introduces the alsa-state recipe from oe-classic.
The reason for doing so is to remove the requirement for recipes like the
beagleboard-audio recipe in meta-yocto, which ensures the beagleboards sound
device has the volume turned up.

Long term I'd like to implement something more generic for handling device
quirks, but alsa-state is a simple fix for an immediate need that should
standardise how alsa configuration is handled in layers.

Since v1 I've added an extra commit which:
a) defaults to /var/lib/alsa/ for state files, as this is the directory
alsactl writes to by default.
b) sed's the path to the state files into the init script, rather than hard
codes them.

The following changes since commit fff18970706913e7fd7f4a119d798dddb44b388a:

  base-files: filesystems: fix mount order (2012-01-06 14:41:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/devices
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/devices

Joshua Lock (3):
  alsa-state: add alsa-state from oe classic
  alsa-state: move state files to localstatedir
  task-base: add alsa-state to task-base-alsa

 meta/recipes-bsp/alsa-state/alsa-state.bb          |   59 ++++++++++++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 ++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 ++++
 .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
 meta/recipes-core/tasks/task-base.bb               |    5 +-
 5 files changed, 104 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
 create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state

-- 
1.7.7.5



