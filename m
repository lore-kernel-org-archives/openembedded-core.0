Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzEf-0007Oa-Ib
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:15:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2012 17:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155894261"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 22 May 2012 17:05:19 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:05:18 -0700
Message-Id: <cover.1337731469.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/9] fixes for misc issue discovered by automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:15:29 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit f12429468d44d3782eca38603d58b707954996c3:

  make-3.81: fix build with automake 1.12 (2012-05-22 16:24:31 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/automake-1.12-related-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake-1.12-related-fixes

Nitin A Kamble (9):
  tar: fix build
  libgcrypt: fix build
  gpgme: fix build
  telepathy-glib: fix build
  xf86-video-vmware: fix build issue
  avahi: fix install issue
  pango: fix dependencies to avoid build issue
  libfm: fix a build issue
  evolution-data-server: fix with automake work in progress

 meta/recipes-connectivity/avahi/avahi.inc          |    6 +-
 .../avahi/files/avahi_fix_install_issue.patch      |   32 +++++++++
 .../telepathy/telepathy-glib_0.18.1.bb             |   12 +++-
 meta/recipes-extended/tar/tar.inc                  |    8 ++-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 .../xorg-driver/xf86-video-vmware_12.0.2.bb        |    4 +-
 ...olution-data-server_fix_for_automake-1.12.patch |   73 ++++++++++++++++++++
 meta/recipes-sato/eds/evolution-data-server_git.bb |    1 +
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    4 +-
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    8 ++-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 +-
 11 files changed, 141 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/evolution-data-server_fix_for_automake-1.12.patch

-- 
1.7.7



