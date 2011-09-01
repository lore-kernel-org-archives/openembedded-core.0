Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qyzov-0002jo-8i
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 07:28:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Aug 2011 22:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,310,1312182000"; d="scan'208";a="44570438"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.3])
	by azsmga001.ch.intel.com with ESMTP; 31 Aug 2011 22:23:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2011 22:23:08 -0700
Message-Id: <cover.1314854414.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/3] Sato recipes and tzcode/tzdata update
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
X-List-Received-Date: Thu, 01 Sep 2011 05:28:09 -0000

Richard,

This set of patches convertes the Sato recipes from SVN O-hand server
to yoctoproject git servers.  Since we converted to git, I needed to bump
some recipes PR to ensure they got the correct versioning (svnr vs git).

Also update the tz* to the latest version

Sau!


The following changes since commit bf9e9961ec4e7b2d10f25b550b902df62b3939b1:

  Fix powerpc term and provide more template for different arches (2011-08-31 20:10:14 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (3):
  o-hand recipes: convert from svn.o-hand.org to git.yoctoproject.org
  sato recipes: Update PR because of libowl conversion to git
  tzcode: Update to 2011i

 .../zaurusd/{zaurusd_svn.bb => zaurusd_git.bb}     |   11 ++++++-----
 .../{dbus-wait_svn.bb => dbus-wait_git.bb}         |   11 ++++++-----
 .../psplash/{psplash_svn.bb => psplash_git.bb}     |   12 ++++++------
 ...code-native_2011g.bb => tzcode-native_2011i.bb} |   10 +++++-----
 .../tzdata/{tzdata_2011h.bb => tzdata_2011i.bb}    |    4 ++--
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |   17 +++++++----------
 .../fstests/{fstests_svn.bb => fstests_git.bb}     |   15 ++++++++-------
 .../matchbox-wm-2/matchbox-wm-2_svn.bb             |   10 +++++-----
 .../{xvideo-tests_svn.bb => xvideo-tests_git.bb}   |    8 ++++----
 .../recipes-sato/gaku/{gaku_svn.bb => gaku_git.bb} |   11 +++++------
 ...k-sato-engine_svn.bb => gtk-sato-engine_git.bb} |   12 ++++++------
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    2 +-
 .../libowl/{libowl_svn.bb => libowl_git.bb}        |   10 +++++-----
 ...op-sato_svn.bb => matchbox-desktop-sato_git.bb} |   10 ++++++----
 ...-sato-2_svn.bb => matchbox-theme-sato-2_git.bb} |    8 ++++----
 ...heme-sato_svn.bb => matchbox-theme-sato_git.bb} |    8 ++++----
 .../{libowl-av_svn.bb => libowl-av_git.bb}         |   11 ++++++-----
 .../{owl-video_svn.bb => owl-video_git.bb}         |   10 +++++-----
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb         |    2 +-
 meta/recipes-sato/pimlico/contacts_0.9.bb          |    2 +-
 meta/recipes-sato/pimlico/contacts_git.bb          |    2 +-
 meta/recipes-sato/pimlico/dates_0.4.8.bb           |    2 +-
 meta/recipes-sato/pimlico/dates_git.bb             |    2 +-
 meta/recipes-sato/pimlico/tasks_0.19.bb            |    2 +-
 meta/recipes-sato/pimlico/tasks_git.bb             |    2 +-
 .../{oh-puzzles_svn.bb => oh-puzzles_git.bb}       |   14 +++++++-------
 .../{screenshot_svn.bb => screenshot_git.bb}       |   10 +++++-----
 .../web/{web-webkit_svn.bb => web-webkit_git.bb}   |   10 +++++-----
 meta/recipes-sato/web/web_git.bb                   |    2 +-
 29 files changed, 116 insertions(+), 114 deletions(-)
 rename meta/recipes-bsp/zaurusd/{zaurusd_svn.bb => zaurusd_git.bb} (70%)
 rename meta/recipes-core/dbus-wait/{dbus-wait_svn.bb => dbus-wait_git.bb} (50%)
 rename meta/recipes-core/psplash/{psplash_svn.bb => psplash_git.bb} (81%)
 rename meta/recipes-extended/tzcode/{tzcode-native_2011g.bb => tzcode-native_2011i.bb} (56%)
 rename meta/recipes-extended/tzdata/{tzdata_2011h.bb => tzdata_2011i.bb} (97%)
 rename meta/recipes-graphics/fstests/{fstests_svn.bb => fstests_git.bb} (65%)
 rename meta/recipes-graphics/xvideo-tests/{xvideo-tests_svn.bb => xvideo-tests_git.bb} (64%)
 rename meta/recipes-sato/gaku/{gaku_svn.bb => gaku_git.bb} (80%)
 rename meta/recipes-sato/gtk-engines/{gtk-sato-engine_svn.bb => gtk-sato-engine_git.bb} (69%)
 rename meta/recipes-sato/libowl/{libowl_svn.bb => libowl_git.bb} (78%)
 rename meta/recipes-sato/matchbox-desktop-sato/{matchbox-desktop-sato_svn.bb => matchbox-desktop-sato_git.bb} (68%)
 rename meta/recipes-sato/matchbox-theme-sato/{matchbox-theme-sato-2_svn.bb => matchbox-theme-sato-2_git.bb} (48%)
 rename meta/recipes-sato/matchbox-theme-sato/{matchbox-theme-sato_svn.bb => matchbox-theme-sato_git.bb} (50%)
 rename meta/recipes-sato/owl-video-widget/{libowl-av_svn.bb => libowl-av_git.bb} (80%)
 rename meta/recipes-sato/owl-video-widget/{owl-video_svn.bb => owl-video_git.bb} (89%)
 rename meta/recipes-sato/puzzles/{oh-puzzles_svn.bb => oh-puzzles_git.bb} (92%)
 rename meta/recipes-sato/screenshot/{screenshot_svn.bb => screenshot_git.bb} (79%)
 rename meta/recipes-sato/web/{web-webkit_svn.bb => web-webkit_git.bb} (78%)

-- 
1.7.6



