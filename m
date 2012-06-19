Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Sh4NP-0006yX-Lo
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 21:46:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jun 2012 12:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158311540"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.212])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2012 12:35:26 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 12:35:22 -0700
Message-Id: <cover.1340132548.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
Subject: [2011-1 PATCH 0/3] apt-native fixes
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
X-List-Received-Date: Tue, 19 Jun 2012 19:46:11 -0000

With the toolchain provided on modern distros apt-native fails to compile, this
series cherry-picks several patches from master which ensure that apt and 
apt-native can be built reliably.

Cheers,
Joshua

The following changes since commit 30c6ec403e1696b5fd94b92328ef9edec535a57a:

  scripts/qemuimage-testlib: fix typos (2012-06-14 11:17:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib josh/edison
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/edison

Richard Purdie (2):
  apt: Fix locale header and hardcoded libname issues
  apt: Fix parallel make race

Robert Yang (1):
  apt 0.7.14: do_compile failed with gcc 4.7

 .../apt/apt-0.7.14/localefixes.patch               |   91 ++++++++++++++++++++
 .../recipes-devtools/apt/apt-0.7.14/makerace.patch |   23 +++++
 .../apt/apt-0.7.14/remove-redeclaration.patch      |   63 ++++++++++++++
 meta/recipes-devtools/apt/apt-native.inc           |    9 +-
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt-package.inc          |    9 +-
 meta/recipes-devtools/apt/apt.inc                  |    3 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 8 files changed, 192 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/makerace.patch
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch

-- 
1.7.10.2



