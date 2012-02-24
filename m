Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S10Uc-0000GI-Bn
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 20:07:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2012 10:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129141162"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.58])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2012 10:59:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 10:59:19 -0800
Message-Id: <cover.1330109787.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
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
X-List-Received-Date: Fri, 24 Feb 2012 19:07:46 -0000

Richard,

These patches address a couple of issues, the gnupg fixes the GPLv2 version
of that recipe, it was orignally pushed (by me as a mistake, got pulled too 
soon).  This version is correct and builds.

The syslinux change removes about 60 WARNINGS by packaging the remaining files
in syslinux-misc

Sau!

The following changes since commit 22194a04f224864dd687660e351a3a10da1f06fa:

  scripts/hob: Launch the new hob (2012-02-24 18:05:46 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  gnupg: Update checksum, fix configure and compliation issues
  syslinux: Package unpackaged files in -misc

 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    3 ++-
 .../gnupg/gnupg-1.4.7/configure.patch              |   17 +++++++++++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   17 +++++++++--------
 3 files changed, 28 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch

-- 
1.7.7.6



