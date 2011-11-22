Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzO7-0003b9-Lz
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292550"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:55 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:43 -0800
Message-Id: <cover.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 00/10] Clutter tidy up & fixes
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
X-List-Received-Date: Tue, 22 Nov 2011 23:04:28 -0000

The theme of this series is removing some of the stale clutter recipes.

It also includes fixes for the cogl and clutter_git recipes.

Poky maintainers note: this series requires action; either merging my RFC series
to drop clutter bbappends or a separate patch to remove the 1.6 bbappend.

Cheers,
Joshua

The following changes since commit 381c7857a5b303bf9eadd7fffc39d17a2b8e31f2:

  matchbox-wm: Fix variable type in _NET_WORKAREA setting (2011-11-22 15:13:16 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/clutter
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter

Joshua Lock (10):
  mutter: switch to clutter-1.8 to satisfy dependency
  multilib.conf: update clutter
  task-core-clutter: use clutter-1.8
  distro-tracking-fields: add entries for clutter-1.8 recipes
  clutter-*-1.6: drop clutter 1.6 recipes
  clutter: PROVIDES clutter-1.6
  multilibs: remove clutter-1.6 recipes
  distro_tracking_fields: tidy up and claim clutter recipes
  cogl: add missing depends on libxcomposite
  clutter: move STDDEPENDS to inc

 .../conf/distro/include/distro_tracking_fields.inc |   59 +++++++------------
 meta/conf/multilib.conf                            |    4 +-
 .../recipes-graphics/clutter/clutter-1.6_1.6.18.bb |   26 ---------
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    4 +-
 .../clutter/clutter-gst-1.6_1.3.6.bb               |   21 -------
 meta/recipes-graphics/clutter/clutter.inc          |    3 +-
 meta/recipes-graphics/clutter/clutter_git.bb       |    4 +-
 meta/recipes-graphics/clutter/cogl.inc             |    2 +-
 meta/recipes-graphics/mutter/mutter.inc            |    2 +-
 meta/recipes-graphics/tasks/task-core-clutter.bb   |    9 ++-
 10 files changed, 37 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb

-- 
1.7.7.3



