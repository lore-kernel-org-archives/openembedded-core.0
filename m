Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SpbBr-0006qR-09
	for Openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 10:25:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Jul 2012 01:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121896843"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jul 2012 01:14:15 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 01:12:53 -0700
Message-Id: <cover.1342167069.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/3] more automake 1.12.x related fixes
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
X-List-Received-Date: Fri, 13 Jul 2012 08:25:31 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

nongplv3 & commercial licence recipe testing revelaed more issue, and the fixes
for these are here.
Thanks,
Nitin

The following changes since commit 581d9dc2d148b67332a255cc1e7ce0679ff82c23:

  tar: fix build with automake 1.12.x (2012-07-12 21:13:42 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/automake_update_on_master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake_update_on_master

Nitin A Kamble (3):
  gawk-3.1.5: fix build with automake 1.12.x
  sed-4.1.2: fix build with automake 1.12.x
  lame: fix build with automake 1.12.x

 ...atch => gawk-3.1.5_fix_for_automake-1.12.patch} |    0
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    5 +-
 .../sed-4.1.2_fix_for_automake-1.12.patch          |   37 ++++++++++++
 meta/recipes-extended/sed/sed_4.1.2.bb             |    5 +-
 .../lame/lame-3.99.5_fix_for_automake-1.12.x.patch |   59 ++++++++++++++++++++
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |   14 +----
 6 files changed, 105 insertions(+), 15 deletions(-)
 rename meta/recipes-extended/gawk/gawk-3.1.5/{gawk_fix_for_automake-1.12.patch => gawk-3.1.5_fix_for_automake-1.12.patch} (100%)
 create mode 100644 meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch

-- 
1.7.3.4



