Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoYsT-0000MP-1O
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 13:45:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jul 2012 04:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175472093"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2012 04:34:01 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 04:32:49 -0700
Message-Id: <cover.1341917396.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/4] more commits related to automake update
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
X-List-Received-Date: Tue, 10 Jul 2012 11:45:13 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

With the "world" build, found out that more recipes are failing due to automake 1.12.x
All these remainling recipes are fixed and the world build succeeds with automake 1.12.1 now.

Thanks,
Nitin

The following changes since commit 45d7793f0e3092f3ba4e03c52195ea13179ad1d8:

  pango: fix dependencies to avoid build issue (2012-07-09 09:22:00 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/automake_update
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake_update

Nitin A Kamble (4):
  libunistring: fix build with automake 1.12
  telepathy-python: fix build with automake 1.12
  libidn: fix build with automake 1.12
  webgit-gtk: fix build with automake 1.12.1

 .../telepathy-python_fix_for_automake_1.12.patch   |   26 ++++++
 .../telepathy/telepathy-python_0.15.19.bb          |    5 +-
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   25 ++++++
 meta/recipes-extended/libidn/libidn_1.24.bb        |    5 +-
 .../webgit-gtk_fix_build_with_automake_1.12.patch  |   62 +++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    3 +-
 .../libunistring_fix_for_automake_1.12.patch       |   81 ++++++++++++++++++++
 .../libunistring/libunistring_0.9.3.bb             |    5 +-
 8 files changed, 205 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
 create mode 100644 meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch

-- 
1.7.3.4



