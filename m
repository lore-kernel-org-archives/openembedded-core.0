Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jme-0004Xg-UW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551601"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:11 -0700
Message-Id: <cover.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 00/14] Warning Fixes and some Updates
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:13 -0000

Richard,

This has some warning fixes along with some update.

Biggest change is to bitbake.conf, which re-orders PACKAGE and addes 
${libdir}/${BPN}/*.a to the staticdev list, this was seen in a number 
of packages and seems to make sense.  But I would understand if there
are other issues I am not aware of.

The FILES_${PN} was grabbing from ${libdir}/${BPN}/* so we needed to 
get the staticdev in before that.

Other thoughts?

Sau!


The following changes since commit 81379dc141e245307ca391a02b7490b199128991:

  dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Saul Wold (14):
  owl-video: Fix unpackaged file warning
  ltp: Package static library in -staticdev
  quilt: Fix docs packaging warnings
  autoconf: remove emacs mode files to fix warnings
  qt4: package static libraries correctly to fix warnings
  rpm: Package python-rpm static archive correctly
  python: package static libraries correctly in -staticdev
  distro_tracking: Updates for manual checks
  avahi: Update to 0.6.31
  man-pages: Update to 3.36
  libgalago: Fix package warnings by not packaging autopackage
  gpgme: fix packaging warnings
  man: fix configure issue to solve warnings
  bitbake.conf: Modify PACKAGE list ordering to insert -staticdev file
    before PN

 meta/conf/bitbake.conf                             |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |   36 ++++++++++++++++----
 .../{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb}     |    8 ++--
 meta/recipes-connectivity/avahi/avahi.inc          |    6 ++--
 .../avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb}     |    6 ++--
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    5 +++
 meta/recipes-devtools/autoconf/autoconf.inc        |    4 ++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    2 +-
 .../python/python-2.7-manifest.inc                 |    6 +++-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 meta/recipes-devtools/quilt/quilt-0.51.inc         |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb          |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    5 ++-
 meta/recipes-extended/ltp/ltp_20120104.bb          |    4 ++
 .../{man-pages_3.32.bb => man-pages_3.36.bb}       |    8 ++--
 meta/recipes-extended/man/man_1.6f.bb              |    4 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   19 +++++++++--
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    4 ++-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    6 +++-
 20 files changed, 97 insertions(+), 38 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb} (93%)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb} (80%)
 rename meta/recipes-extended/man-pages/{man-pages_3.32.bb => man-pages_3.36.bb} (80%)

-- 
1.7.7.6



