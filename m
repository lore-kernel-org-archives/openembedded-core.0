Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SSEVS-0003lD-TT
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 23:33:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2012 14:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142052106"
Received: from mukti.sc.intel.com ([143.183.140.52])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2012 14:23:16 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 14:20:07 -0700
Message-Id: <cover.1336598125.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/1] eglibc-2.15 fix for poky-tiny
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
X-List-Received-Date: Wed, 09 May 2012 21:33:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 6841abd17268a1c1ca5e3634f0ae9e21426ca9c9:

  Hob: change the workflow about click 'Run Image' to run directly after builded a qemu image (2012-05-09 21:56:47 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/eglibc-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/eglibc-fix

Nitin A Kamble (1):
  eglibc: fix build with poky-tiny distro

 .../eglibc_fix_findidx_parameters.patch            |   38 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    3 +-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_findidx_parameters.patch

-- 
1.7.7.6



