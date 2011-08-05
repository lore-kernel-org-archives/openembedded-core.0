Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QpHoq-0001eA-Nk
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:39:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Aug 2011 03:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,322,1309762800"; d="scan'208";a="38181868"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2011 03:35:16 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 18:37:13 +0800
Message-Id: <cover.1312540193.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/6] Variable fixes for multilib
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
X-List-Received-Date: Fri, 05 Aug 2011 10:39:57 -0000

This series of patch fixed variable multilib issues, from bug #1333 to #1338.

The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:
  Richard Purdie (1):
        eglibc: Fix patch merge breakage

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/ml2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/ml2

Lianhao Lu (6):
  SRC_URI: Using BPN instaed of PN.
  tcp-wrappers: Using ${PN} in PACKAGES.
  qt4x11.bbclass: Using BPN instead of PN.
  Misc: Corrected the dependency on non-native for -native package.
  ghostscript: Fixed the incorrect DEPENDS.
  eglibc-locale: Added ${MLPREFIX} for task dependency.

 meta/classes/qt4x11.bbclass                        |    2 +-
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    2 +-
 meta/recipes-devtools/intltool/intltool.inc        |    1 +
 .../ghostscript/ghostscript_9.02.bb                |    2 +-
 .../net-tools/net-tools_1.60-23.bb                 |    4 ++--
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    6 +++---
 .../xorg-util/util-macros_1.14.0.bb                |    4 ++--
 9 files changed, 13 insertions(+), 12 deletions(-)



