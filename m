Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToERV-0001tt-22
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 15:28:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2012 06:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,362,1355126400"; d="scan'208";a="239466175"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2012 06:13:18 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 16:13:51 +0200
Message-Id: <cover.1356617488.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/6] Multilib fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Dec 2012 14:28:17 -0000

This is another set of multilib fixes.
The following changes since commit 4a36a32567ecfbc7ce7b967803e6e23314953ef5:

  libpng: fix packaging (2012-12-26 11:34:09 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/multilib4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/multilib4

Constantin Musca (6):
  libpam: enable multilib
  vte: add missing unpackaged files
  package.bbclass: don't prepend MLPREFIX to LOCALEBASEPN
  eglibc-locale: enable multilib
  sysstat: fix sa_lib_dir
  rpm: replace /usr/lib with ${libdir}

 meta/classes/package.bbclass               |  2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc |  4 ++--
 meta/recipes-devtools/rpm/rpm_5.4.9.bb     |  4 ++--
 meta/recipes-extended/pam/libpam_1.1.6.bb  | 15 ++++++++-------
 meta/recipes-extended/sysstat/sysstat.inc  |  6 +++++-
 meta/recipes-support/vte/vte.inc           |  3 ++-
 meta/recipes-support/vte/vte_0.28.2.bb     |  2 +-
 7 files changed, 21 insertions(+), 15 deletions(-)

-- 
1.7.11.7



