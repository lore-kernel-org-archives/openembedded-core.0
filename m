Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVYDt-0008Eo-Bc
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:40:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 16:33:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81378088"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 16:33:47 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:33:36 -0800
Message-Id: <cover.1322606832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 00/11] Clutter tidy-up and fixes
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
X-List-Received-Date: Wed, 30 Nov 2011 00:40:29 -0000

All,

This is the third attempt at this series. Since the v2 I've:
* Squashed the distro_tracking_fields changes together (Note: I'm claiming
I maintain clutter* now).
* Fixed clutter-box2d by dropping the extremely old clutter-box2d-1.6 and
updating the clutter-box2_git recipe.

Note: Poky maintainers, without my RFC patch to drop the clutter bbappends this
series will introduce failures at parse time for Poky.

Cheers,
Joshua

The following changes since commit 177df2c51927f44e3536856f4604364b38695bc2:

  qt-mobility: Add missing patch (2011-11-29 14:36:09 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/clutter
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter

Joshua Lock (11):
  multilib.conf: remove clutter-1.6 and add clutter-1.8
  clutter: PROVIDES clutter-1.6
  task-core-clutter: use clutter-1.8
  mutter: switch to clutter-1.8 to satisfy dependency
  clutter-*-1.6: drop clutter 1.6 recipes
  cogl: add missing depends on libxcomposite
  clutter: move STDDEPENDS to inc
  clutter-box2d: Update git recipe
  clutter-box2d: fix LICENSE field - LGPL-2.1
  clutter-box2d: drop unbuildable clutter-box2d-1.6_0.10.0
  distro-tracking-fields: update entries for clutter recipes

 .../conf/distro/include/distro_tracking_fields.inc |   68 ++++++++-----------
 meta/conf/multilib.conf                            |    6 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    4 +-
 .../recipes-graphics/clutter/clutter-1.6_1.6.18.bb |   26 --------
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    4 +-
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |   24 -------
 meta/recipes-graphics/clutter/clutter-box2d.inc    |    2 +-
 .../clutter-box2d/fix-disable-introspection.patch  |   30 ---------
 .../clutter/clutter-box2d/isfinite.patch           |   19 ------
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    7 +-
 .../clutter/clutter-gst-1.6_1.3.6.bb               |   21 ------
 meta/recipes-graphics/clutter/clutter.inc          |    3 +-
 meta/recipes-graphics/clutter/clutter_git.bb       |    4 +-
 meta/recipes-graphics/clutter/cogl.inc             |    2 +-
 meta/recipes-graphics/mutter/mutter.inc            |    2 +-
 meta/recipes-graphics/tasks/task-core-clutter.bb   |    9 ++-
 16 files changed, 52 insertions(+), 179 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb

-- 
1.7.7.3



