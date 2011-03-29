Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q4Ujf-0002wx-WA
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 10:57:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Mar 2011 01:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,260,1299484800"; d="scan'208";a="410244514"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 29 Mar 2011 01:54:08 -0700
Message-Id: <cover.1301388474.git.dexuan.cui@intel.com>
Old-Date: Tue, 29 Mar 2011 16:47:54 +0800
Date: Tue, 29 Mar 2011 16:52:21 +0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/1] qt4: remove the option -feliminate-dwarf2-dups to fix the build
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
X-List-Received-Date: Tue, 29 Mar 2011 08:57:12 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

After commit 5ea06dc295b657383fd97545c15255b294cf1a79(bitbake.conf: Prune
global OPTIMIZATION flags) that adds an option -feliminate-dwarf2-dups,
gcc 4.5 reports such an internal compiler error when building Qt4 if the
option is used:

| graphicsview/qgridlayoutengine.cpp:1553:1: internal compiler error: in build_abbrev_table, at dwarf2out.c:9806
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.

This is a gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47361

At present we can remove the option as a workaround.

Thanks Robert Berger for reporting the bug and his investigation in gcc
bugzilla and thanks Khem Raj for the quick suggestion about removing
the option.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/master
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (1):
  qt4: remove the option -feliminate-dwarf2-dups to fix the build

 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.2



