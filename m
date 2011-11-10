Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ROJYr-0000IY-Ul
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:36:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 17:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,486,1315206000"; d="scan'208";a="72645338"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.15])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 17:29:56 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 17:29:47 -0800
Message-Id: <cover.1320888203.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/7] Tidy Clutter recipes
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
X-List-Received-Date: Thu, 10 Nov 2011 01:36:14 -0000

This series tidies up the Clutter recipes by dropping the -1.6 recipes, as
Clutter 1.8 is API/ABI compatible with 1.6.

I added a PROVIDES += "clutter-1.6" to the clutter-1.8 recipe to ease the
pain for layers using Clutter but I'm not wed to the idea - RFC?

Further the clutter-box2d recipe doesn't build due to, I think, stricter
warnings and -Werror with gcc 4.6 - I haven't had time to look into this
yet but I'm not sure the upstream is very active.

Thoughts on dropping or keeping this recipe?

Cheers,
Joshua

The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:

  python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/clutter
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter

Joshua Lock (7):
  mutter: switch to clutter-1.8 to satisfy dependency
  multilib.conf: update clutter
  task-core-clutter: use clutter-1.8
  distro-tracking-fields: add entries for clutter-1.8 recipes
  clutter-*-1.6: drop clutter 1.6 recipes
  clutter: PROVIDES clutter-1.6
  multilibs: remove clutter-1.6 recipes

 .../conf/distro/include/distro_tracking_fields.inc |   36 ++++++++++++--------
 meta/conf/multilib.conf                            |    4 ++-
 .../recipes-graphics/clutter/clutter-1.6_1.6.18.bb |   26 --------------
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    3 ++
 .../clutter/clutter-gst-1.6_1.3.6.bb               |   21 -----------
 meta/recipes-graphics/mutter/mutter.inc            |    2 +-
 meta/recipes-graphics/tasks/task-core-clutter.bb   |    9 +++--
 7 files changed, 34 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb

-- 
1.7.7



