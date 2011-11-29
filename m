Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVWzn-0002m1-CS
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:21:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 15:14:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81082397"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:14:56 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:14:51 -0800
Message-Id: <cover.1322608290.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 0/4] Update gthumb & json-glib, fix packaging for clutter-1.8
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
X-List-Received-Date: Tue, 29 Nov 2011 23:21:51 -0000

Couple of minor updates. gthumb and json-glib updated to the latest version.
distro_tracking updated for some untracked recipes (mx, json-glib, xdg-utils)
and fix clutter-1.8 to package the examples as we did for clutter-1.6.

Cheers,
Joshua

The following changes since commit 177df2c51927f44e3536856f4604364b38695bc2:

  qt-mobility: Add missing patch (2011-11-29 14:36:09 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/updates

Joshua Lock (4):
  gthumb: update to 2.12.4
  json-glib: update to 0.14.2
  clutter-1.8: package examples
  distro_tracking_fields: additions and updates

 .../conf/distro/include/distro_tracking_fields.inc |   14 +++++++++++++-
 .../gthumb/{gthumb_2.12.3.bb => gthumb_2.12.4.bb}  |    6 +++---
 .../{json-glib_0.14.0.bb => json-glib_0.14.2.bb}   |    4 ++--
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    3 ++-
 4 files changed, 20 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/gthumb/{gthumb_2.12.3.bb => gthumb_2.12.4.bb} (76%)
 rename meta/recipes-gnome/json-glib/{json-glib_0.14.0.bb => json-glib_0.14.2.bb} (78%)

-- 
1.7.7.3



