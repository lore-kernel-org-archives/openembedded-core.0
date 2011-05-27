Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QQ1co-00049P-PG
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 20:19:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2011 11:16:00 -0700
X-ExtLoop1: 1
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2011 11:16:00 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 11:15:54 -0700
Message-Id: <cover.1306520012.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
Subject: [bugfix 0/2] internal compiler fix for gcc 4.6.0
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
X-List-Received-Date: Fri, 27 May 2011 18:19:07 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes the gcc taking out the need of the workaround we had earlier.

This also fixes compile issue for qt4-x11-free recipe for beagleboard machine

The following changes since commit 62e3f0ff7b27d8beb21b4b226051c3db654ea4e4:

  License Field Cleanup: Non-standard field names (2011-05-27 18:27:22 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (2):
  gcc-4.6.0: fix ICE with armv7 target
  Revert "tcmode-default: workaround for gcc 4.6.0 failure on
    beagleboard"

 meta/conf/distro/include/tcmode-default.inc        |    4 --
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    3 +-
 .../gcc/gcc-4.6.0/ICE_fix_for_arm.patch            |   44 ++++++++++++++++++++
 3 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch

-- 
1.7.3.5



