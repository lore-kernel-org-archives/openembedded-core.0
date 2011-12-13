Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RaZ0W-00053B-SH
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:31:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95781349"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.215])
	by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2011 12:24:28 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 12:24:22 -0800
Message-Id: <cover.1323807692.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.4
Subject: [PATCH 0/5] Clutter upgrades
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
X-List-Received-Date: Tue, 13 Dec 2011 20:31:25 -0000

All,

A fairly boring series. I've upgraded the clutter and cogl recipes to the
recently released 1.8.2 versions.

Further I've updated the SRCREV in the _git recipes to match the tagged
releases and updated the distro tracking file to reflect these changes.

For the clutter curious I'm thinking of sending out an RFC series in the
coming days to drop the namespacing from the clutter recipes.

Cheers,
Joshua

The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:

  gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/updates

Joshua Lock (5):
  cogl: upgrade to latest stable cogl 1.8.2
  clutter: upgrade to 1.8.2
  cogl: update git recipe to 1.8.2
  clutter_git: update to 1.8.2 tag
  distro_tracking_fields: update cogl and clutter

 .../conf/distro/include/distro_tracking_fields.inc |   13 +++++++------
 .../{clutter-1.8_1.8.0.bb => clutter-1.8_1.8.2.bb} |    4 ++--
 meta/recipes-graphics/clutter/clutter_git.bb       |    5 +++--
 .../clutter/{cogl_1.8.0.bb => cogl_1.8.2.bb}       |    4 ++--
 meta/recipes-graphics/clutter/cogl_git.bb          |    5 +++--
 5 files changed, 17 insertions(+), 14 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.8_1.8.0.bb => clutter-1.8_1.8.2.bb} (83%)
 rename meta/recipes-graphics/clutter/{cogl_1.8.0.bb => cogl_1.8.2.bb} (59%)

-- 
1.7.7.4



