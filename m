Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rq8eu-0006xz-Vx
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 20:37:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2012 11:29:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100524970"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2012 11:29:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:29:35 -0800
Message-Id: <cover.1327519635.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/4] Misc Fixes
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
X-List-Received-Date: Wed, 25 Jan 2012 19:37:29 -0000

Richard,

This set address a build issue, and fixes a couple of bugs,
I split the staticdev QA test into 2 part for the libgcc 
change.

Thanks
	Sau!


The following changes since commit 746e8ffa66850bf9050cd6baf94eb76c492eb535:

  uclibc-git: Update to latest RC (2012-01-25 14:33:52 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Marc Ferland (1):
  pm-utils: Add grep to RDEPENDS to avoid command failures.

Saul Wold (3):
  default-providers: add kbd as PREFERRED_PROVIDER for console-tools
  insane.bbclass: Add test for static .a libraries in non-staticdev
    packages
  libgcc: Add INSANE_SKIP of staticdev for libgcc-dev and libgcov-dev

 meta/classes/insane.bbclass                    |   15 ++++++++++++++-
 meta/conf/distro/include/default-providers.inc |    2 +-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb    |    4 +++-
 meta/recipes-devtools/gcc/libgcc_4.6.bb        |    3 +++
 4 files changed, 21 insertions(+), 3 deletions(-)

-- 
1.7.6.5



