Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R9J1K-0007R6-Jp
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 17:59:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Sep 2011 08:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,461,1312182000"; d="scan'208";a="56990211"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.50])
	by azsmga001.ch.intel.com with ESMTP; 29 Sep 2011 08:54:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 08:54:03 -0700
Message-Id: <cover.1317311558.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Python RPATH Fix with patch header this time
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
X-List-Received-Date: Thu, 29 Sep 2011 15:59:35 -0000

All I can say here is Doh!

Sau!

The following changes since commit 946cd8df49a8873ff93ef5ec1e3cc745a21e2a8f:

  Add autoconf cache for screen on powerpc64 (2011-09-29 16:45:45 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-updates

Saul Wold (1):
  python: fix sqlite RPATH issue

 .../python/python/remove_sqlite_rpath.patch        |   19 +++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/remove_sqlite_rpath.patch

-- 
1.7.6



