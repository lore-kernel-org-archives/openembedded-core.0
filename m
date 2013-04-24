Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV477-0004Uk-2s
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2013 10:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632402"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:37 +0100
Message-Id: <cover.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/21] Improve recipe meta-information in OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 18:08:42 -0000
X-List-Received-Date: Wed, 24 Apr 2013 18:08:42 -0000
X-List-Received-Date: Wed, 24 Apr 2013 18:08:42 -0000

A number of recipes have inadequate DESCRIPTION and SUMMARY values,
and some don't have either. Set values for those in the latter category
and fix up the values for others (as well as taking care of HOMEPAGE in
some cases).

Many of these fixes were originally contributed by Belen Barros Pena <belen.barros.pena@intel.com>.

Note that we still have a lot of recipes with missing SUMMARY, which
results in output packages getting fairly useless values "xyz version 1.2.3";
as a rule, recipes should set SUMMARY rather than DESCRIPTION if they are
only going to set a short description anyway (since DESCRIPTION will get
the value of SUMMARY if not set, but the reverse is not true).


The following changes since commit 395b90054eccddc1c9062a9a8657ed4482b7710a:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-22 15:48:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/descs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/descs

Paul Eggleton (21):
  connman-conf: add SUMMARY and DESCRIPTION
  eglibc: add common HOMEPAGE and SUMMARY for eglibc-locale
  gettext-minimal-native: add SUMMARY and DESCRIPTION
  build-appliance-image: add SUMMARY, HOMEPAGE and improve DESCRIPTION
  libcgroup: add SUMMARY and better DESCRIPTION
  readline: add SUMMARY
  external-sourcery-toolchain: add SUMMARY
  icon-naming-utils: add SUMMARY and DESCRIPTION
  mtools: use same SUMMARY as newer version of mtools recipe
  which: use the same meta fields for both versions
  libxml-simple-perl: add SUMMARY, DESCRIPTION and HOMEPAGE
  python-smartpm: fix HOMEPAGE and adjust DESCRIPTION
  gnome-doc-utils: add SUMMARY and DESCRIPTION
  packagegroup-core-x11-xserver: set SUMMARY instead of SUMMARY_${PN}
  rgb: add SUMMARY and DESCRIPTION
  xeyes: add SUMMARY and DESCRIPTION
  gst-openmax: add SUMMARY, DESCRIPTION and HOMEPAGE
  hwlatdetect: add SUMMARY and DESCRIPTION
  ptest-runner: add SUMMARY, DESCRIPTION and HOMEPAGE
  core-image-directfb: add SUMMARY
  gpgme: add short SUMMARY

 meta/recipes-connectivity/connman/connman-conf.bb           |    5 +++--
 meta/recipes-core/eglibc/eglibc-collateral.inc              |    1 +
 meta/recipes-core/eglibc/eglibc-locale.inc                  |    2 ++
 meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb  |    5 +++++
 meta/recipes-core/images/build-appliance-image.bb           |    8 +++++---
 meta/recipes-core/libcgroup/libcgroup_0.38.bb               |    5 ++++-
 meta/recipes-core/meta/external-sourcery-toolchain.bb       |    1 +
 meta/recipes-core/readline/readline.inc                     |    1 +
 meta/recipes-core/readline/readline_5.2.bb                  |    1 +
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb           |   10 ++++++++++
 meta/recipes-devtools/mtools/mtools_3.9.9.bb                |    1 +
 meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb       |    7 +++++++
 meta/recipes-devtools/python/python-smartpm_1.4.1.bb        |    6 ++----
 meta/recipes-extended/which/which_2.18.bb                   |    6 +++---
 meta/recipes-extended/which/which_2.20.bb                   |   11 ++++++++---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc                |    6 ++++++
 meta/recipes-graphics/images/core-image-directfb.bb         |    1 +
 .../packagegroups/packagegroup-core-x11-xserver.bb          |    2 +-
 meta/recipes-graphics/xorg-app/rgb_1.0.5.bb                 |    7 +++++++
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb               |    5 +++++
 meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb     |    6 ++++++
 meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb                |    3 ++-
 meta/recipes-support/gpgme/gpgme_1.4.0.bb                   |    1 +
 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb       |    5 +++++
 24 files changed, 88 insertions(+), 18 deletions(-)

-- 
1.7.10.4



