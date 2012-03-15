Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8BkH-0005uO-ML
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 15:33:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 07:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77933621"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.170])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Mar 2012 07:24:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 14:24:42 +0000
Message-Id: <cover.1331821447.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] A couple of fixes
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
X-List-Received-Date: Thu, 15 Mar 2012 14:33:38 -0000

The following changes since commit b055075ba5b9ff5250bc66be1cd8b222bdb86161:

  slang: Fix rpath QA warnings (2012-03-15 00:07:43 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes15
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes15

Paul Eggleton (2):
  util-linux: restore zlib and ncurses dependencies for native
  python-imaging: bring in fixes from meta-oe

 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
 ...ng-setup.py-force-paths-for-zlib-freetyp.patch} |   36 +++++++++++++++----
 .../python/python-imaging_1.1.7.bb                 |    9 +++--
 4 files changed, 36 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/python-imaging/{path.patch => 0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch} (47%)

-- 
1.7.5.4



