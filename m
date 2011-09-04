Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R04Fe-0007MM-1K
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 06:24:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2011 21:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,326,1312182000"; d="scan'208";a="47948255"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.30])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2011 21:19:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 21:19:06 -0700
Message-Id: <cover.1315109841.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] sstate relocation patches
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
X-List-Received-Date: Sun, 04 Sep 2011 04:24:10 -0000

This fixese 2 issues for doc generation discovered in the 
new autobuilder infrastruture with shared state.  opensp and 
groff both had hard coded locations to look for data files.

Sau!

The following changes since commit 0616557a8c29b42bae0ffd5fd665a046810047e4:

  populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH (2011-09-02 23:38:00 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/oe-fix2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/oe-fix2

Saul Wold (2):
  groff: Fix sstate relocation issue
  opensp: Fix sstate relocation issue

 meta/recipes-devtools/opensp/opensp_1.5.bb  |    9 ++++++++-
 meta/recipes-extended/groff/groff_1.20.1.bb |    9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
1.7.6



