Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8cWN-0004dU-51
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Mar 2012 12:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119894989"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 16 Mar 2012 12:00:09 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 12:00:07 -0700
Message-Id: <cover.1331924359.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/7] Misc Fixes and upgrades
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:03 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 0676db79755b49b660f34e1c00769327fc299c58:

  tcl: Fix bad RPATH QA warning (2012-03-16 16:47:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (7):
  automake: upgrade from 1.11.2 to 1.11.3
  distro-tracking: update status of recipes
  python: fix install when libdir is not "lib"
  pciutils: fix a do_compile failure
  python-pyrex: quite packaging warnings
  python-pycurl: fix packaging warnings
  git: fix packaging warnings

 .../conf/distro/include/distro_tracking_fields.inc |   24 ++--
 meta/recipes-bsp/pciutils/pciutils_3.1.9.bb        |    5 +
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 ...utomake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch |  118 --------------------
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   30 +++--
 .../automake/automake/python-libdir.patch          |   32 +++---
 .../{automake_1.11.2.bb => automake_1.11.3.bb}     |    8 +-
 meta/recipes-devtools/git/git.inc                  |    2 +
 .../python/python-pycurl_7.19.0.bb                 |    4 +
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    4 +-
 .../python/fix_for_using_different_libdir.patch    |   78 +++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +
 12 files changed, 143 insertions(+), 166 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
 rename meta/recipes-devtools/automake/{automake_1.11.2.bb => automake_1.11.3.bb} (85%)
 create mode 100644 meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch

-- 
1.7.7.6



