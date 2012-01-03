Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RhuCJ-0000ym-Cf
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 03:33:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2012 18:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102521736"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.153])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2012 18:26:34 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 18:26:30 -0800
Message-Id: <cover.1325557342.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
Subject: [RFC PATCH 0/2] Add alsa-state from OE Classic
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
X-List-Received-Date: Tue, 03 Jan 2012 02:33:55 -0000

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The small series following introduces the alsa-state recipe from oe-classic.
The reason for doing so is to remove the requirement for recipes like the
beagleboard-audio recipe in meta-yocto, which ensures the beagleboards sound
device has the volume turned up.

Long term I'd like to implement something more generic for handling device quirks,
but alsa-state is a simple fix for an immediate need that should standardise how
alsa configuration is handled in layers.

Cheers.
Joshua

The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/devices
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/devices

Joshua Lock (2):
  alsa-state: add alsa-state from oe classic
  task-base: add alsa-state to task-base-alsa

 meta/recipes-bsp/alsa-state/alsa-state.bb          |   57 ++++++++++++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 ++++++++++
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 ++++
 .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
 meta/recipes-core/tasks/task-base.bb               |    5 +-
 5 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
 create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state

-- 
1.7.7.4



