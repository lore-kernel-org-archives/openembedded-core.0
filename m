Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R3sdI-000649-0i
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 18:48:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 09:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,381,1312182000"; d="scan'208";a="48798202"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.105])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2011 09:43:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 17:43:02 +0100
Message-Id: <cover.1316018327.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Split task-core to reduce build time
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
X-List-Received-Date: Wed, 14 Sep 2011 16:48:20 -0000

This patch makes a significant reduction in the build time for
console-only images that use task-core-apps-console (from ~4000 down to
~2700 in my tests) by avoiding building X11 applications unnecessarily.

The following changes since commit 8df322abfd3fa8c460fd73c83c1ef0b5e419dc11:

  core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:27:08 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/task-core-split
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/task-core-split

Paul Eggleton (1):
  task-core: split into task-core-console and task-core-x11

 .../conf/distro/include/distro_tracking_fields.inc |   10 +++++--
 meta/conf/multilib.conf                            |    3 +-
 meta/recipes-core/tasks/task-core-console.bb       |   28 ++++++++++++++++++++
 .../tasks/{task-core.bb => task-core-x11.bb}       |   15 +---------
 4 files changed, 39 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-core/tasks/task-core-console.bb
 rename meta/recipes-sato/tasks/{task-core.bb => task-core-x11.bb} (82%)

-- 
1.7.4.1



