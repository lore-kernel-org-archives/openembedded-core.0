Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qk6ZD-0008BF-EV
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 05:38:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 20:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,245,1309762800"; d="scan'208";a="30175939"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 20:34:14 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 14:08:43 -0700
Message-Id: <cover.1311282465.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/2] Misc Fixes
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
X-List-Received-Date: Fri, 22 Jul 2011 03:38:23 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 8bd302b16dbd708fb9446fdc534ac64d873a34f5:

  glib-2.0: fix a compilation issue due to dtrace (2011-07-21 14:01:33 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (2):
  python: fix security vulnerability
  fix Upstream-Status line for few patches

 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |    2 +-
 .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |    2 +-
 .../elfutils/elfutils/fix_for_gcc-4.7.patch        |    2 +-
 meta/recipes-devtools/python/python.inc            |    2 +-
 .../python/python/security_issue_2254_fix.patch    |  184 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 6 files changed, 190 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch

-- 
1.7.6



