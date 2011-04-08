Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q88YX-0008HX-RS
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 12:04:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Apr 2011 03:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,322,1299484800"; d="scan'208";a="676741321"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2011 03:01:29 -0700
Message-Id: <cover.1302256139.git.dexuan.cui@intel.com>
Old-Date: Fri, 8 Apr 2011 17:48:59 +0800
Date: Fri, 08 Apr 2011 17:59:31 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/2] PULL: fixes to bug 961, 964
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
X-List-Received-Date: Fri, 08 Apr 2011 10:04:46 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

[YOCTO #964]:
A recent commit 25a6e5f9(sstate: use only unique set of SSTATETASK) breaks
the ordered mapping between SSTATETASKS and SSTATETASKNAMES. As a result,
in sstate_cleanall, the line
taskname = tasks[namemap.index(name)]
gets an incorrect result, and "bitbake -c cleanall" doesn't really remove
the files populalted by do_populate_sysroot.

BTW: the bernard branch doesn't need this fix since commit 25a6e5f9 wasn't
pulled into it.



[YOCTO #961]:
lsbsetup: Fix LIC_FILE_CHKSUM
We need to pull this fix asap since nightly's lsb builds have been
blocked by this for 2 days.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/master
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (2):
  sstate: ensure an ordered mapping between SSTATETASKS and
    SSTATETASKNAMES
  lsbsetup: Fix LIC_FILE_CHKSUM

 meta/classes/sstate.bbclass               |    6 ++++--
 meta/recipes-extended/lsb/lsbsetup_0.9.bb |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.7.2



