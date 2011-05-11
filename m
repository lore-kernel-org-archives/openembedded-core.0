Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QK2CR-0006Sa-Qd
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 07:43:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 22:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="641075140"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 22:40:20 -0700
Message-Id: <cover.1305092348.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 22:39:08 -0700
Date: Tue, 10 May 2011 22:40:19 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/5] more fixes related to gcc 4.6.0
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
X-List-Received-Date: Wed, 11 May 2011 05:43:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (5):
  libunique: Fix for compilation with gcc 4.6.0
  matchbox-wm-2: fix typo in Makefile
  web: fix typo in Makefile
  zaurusd: fix a typo in Makefile
  dtc: fix compilation with gcc 4.6.0

 .../recipes-bsp/zaurusd/zaurusd/fix_makefile.patch |   19 +++++++
 meta/recipes-bsp/zaurusd/zaurusd_svn.bb            |    5 +-
 .../libunique/fix_for_compile_with_gcc-4.6.0.patch |   36 ++++++++++++++
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    5 +-
 .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |   19 +++++++
 .../matchbox-wm-2/matchbox-wm-2_svn.bb             |    3 +-
 .../dtc/fix_for_compilation_with_gcc_4.6.0.patch   |   51 ++++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_git.inc                |    5 +-
 meta/recipes-sato/web/web/fix_makefile.patch       |   20 ++++++++
 meta/recipes-sato/web/web_git.bb                   |    3 +-
 10 files changed, 158 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-bsp/zaurusd/zaurusd/fix_makefile.patch
 create mode 100644 meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
 create mode 100644 meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch
 create mode 100644 meta/recipes-sato/web/web/fix_makefile.patch

-- 
1.7.3.4



