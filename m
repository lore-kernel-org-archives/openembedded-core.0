Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QjveD-0000KU-Ih
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 17:59:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2011 08:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="33030641"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2011 08:54:41 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 02:29:10 -0700
Message-Id: <cover.1311240498.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] Misc Fixes
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
X-List-Received-Date: Thu, 21 Jul 2011 15:59:06 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 35f20c5aacc9b23affe0380e8451ccc41cbc1799:

  eglibc: Tighten LICENSE Fields (2011-07-19 17:34:21 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (2):
  python: fix security vulnerability
  glib-2.0: fix a compilation issue due to dtrace

 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |    1 -
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-devtools/python/python.inc            |    2 +-
 .../python/python/security_issue_2254_fix.patch    |  184 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 5 files changed, 188 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch

-- 
1.7.6



