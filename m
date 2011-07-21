Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QjxDc-0003Km-DE
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 19:39:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2011 10:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="30832958"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2011 10:35:19 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 04:09:52 -0700
Message-Id: <cover.1311246527.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] redo the glib-2.0 fix
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
X-List-Received-Date: Thu, 21 Jul 2011 17:39:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit db0eff4b964055b18ca5f91e55b7cf0d4a55c832:

  python: fix security vulnerability (2011-07-21 02:23:27 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  glib-2.0: fix a compilation issue due to dtrace

 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.6



