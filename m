Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R94F8-0001Dx-A4
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 02:12:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 17:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,458,1312182000"; d="scan'208";a="21629672"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.50])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 17:07:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 17:07:13 -0700
Message-Id: <cover.1317254761.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/3] Python RPATH Fix and some updates
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
X-List-Received-Date: Thu, 29 Sep 2011 00:12:50 -0000

Richard,

This addresses the python-sqlite3 RPATH issue in the most clean
way I could figure out.

Also a couple of package updates.

Sau!

The following changes since commit 18ad3a84dacc0d6c107b56874bb23d2a3c0a429f:

  util-linux: Ensure perl scripts reference the correct perl (2011-09-28 21:51:36 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-updates

Saul Wold (3):
  glew: update to 1.7.0
  sysstat: update to 10.0.2
  python: fix sqlite RPATH issue

 .../python/python/remove_sqlite_rpath.patch        |   12 ++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 ++-
 meta/recipes-extended/sysstat/sysstat_10.0.0.bb    |   10 ----------
 meta/recipes-extended/sysstat/sysstat_10.0.2.bb    |   10 ++++++++++
 .../glew/{glew_1.6.0.bb => glew_1.7.0.bb}          |    4 ++--
 5 files changed, 26 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.0.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.2.bb
 rename meta/recipes-graphics/glew/{glew_1.6.0.bb => glew_1.7.0.bb} (80%)

-- 
1.7.6



