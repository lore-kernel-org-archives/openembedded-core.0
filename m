Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RoUVh-0003rI-Ik
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 07:33:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2012 22:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114669691"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2012 22:25:23 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 22:25:21 -0800
Message-Id: <cover.1327127051.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/4] Misc recipe fixes
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
X-List-Received-Date: Sat, 21 Jan 2012 06:33:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


These are misc fixes.
Nitin


The following changes since commit 3fe81df6400448b54b47a13f27e1389b1e824ab0:

  distro_tracking: update libpng, libgdbus, opensp, nfs-utils manual check dates (2012-01-20 16:47:51 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (4):
  ltp: disable elf binary stripping
  guile: fix a quote in description
  distutils: Bandaid against wrong libdir computation
  python-pyrex: force recompilation

 meta/classes/distutils.bbclass                     |    7 +++++++
 meta/recipes-devtools/guile/guile_2.0.3.bb         |    4 ++--
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
 meta/recipes-extended/ltp/ltp_20110915.bb          |    6 +++++-
 4 files changed, 15 insertions(+), 4 deletions(-)

-- 
1.7.6.4



