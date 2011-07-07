Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QekAp-0005oN-Fp
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 10:43:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 01:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,492,1304319600"; d="scan'208";a="22541307"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 01:39:10 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:39:14 +0800
Message-Id: <cover.1310027619.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] the fix to bug 1208
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
X-List-Received-Date: Thu, 07 Jul 2011 08:43:03 -0000

The following changes since commit ad2363278f0ea86fcf3464f8f6073d3a3d06be63:

  uclibc: Fix compilation in thumb mode (2011-07-02 00:02:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro

Dexuan Cui (1):
  powertop: inherit update-alternatives and use a higher priority than
    busybox

 meta/recipes-kernel/powertop/powertop_1.13.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

-- 
1.7.6



