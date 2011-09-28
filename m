Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1R90hS-0005N1-HA
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 22:25:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Sep 2011 13:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56889886"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2011 13:20:22 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 13:38:05 -0700
Message-Id: <cover.1317242070.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fix a type for setting up OECORE_ACLOCAL_OPTS for adt-installer, need go in edison
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
X-List-Received-Date: Wed, 28 Sep 2011 20:25:50 -0000

The following changes since commit 7eb193fc4994b880ce115fc00fb52b4d9cda530e:
  Paul Eggleton (1):
        bitbake/lib/bb/msg.py: fix setting debug and verbosity levels

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/OECORE_ACLOCAL_OPTS
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jzhang/OECORE_ACLOCAL_OPTS

Jessica Zhang (1):
  Fixed a typo for setting up OECORE_ACLOCAL_OPTS for adt-installer
    case

 meta/classes/toolchain-scripts.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



