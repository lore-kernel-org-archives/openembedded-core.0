Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAeuP-000679-NU
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 11:01:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 01:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,217,1301900400"; d="scan'208";a="909977727"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 01:59:23 -0700
Message-Id: <cover.1302857514.git.dexuan.cui@intel.com>
Old-Date: Fri, 15 Apr 2011 16:51:54 +0800
Date: Fri, 15 Apr 2011 16:57:16 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/2] fixed to bug 947 and 968
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
X-List-Received-Date: Fri, 15 Apr 2011 09:01:47 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Bug #968:
    changes from previous version:
    1) added Upstream-Status
    2) bumped PR

Bug #947:
    The patch fixes a parallel-make issue that blocked nightly lsb build for
days: when generating $(SHAREDDIR)/%.o, we should ensure the directory
${SHAREDDIR} exists.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/master
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (2):
  gnu-config-native: add dependency on perl-native
  libnewt: fix parallel-make issue

 .../gnu-config/config-guess-uclibc.patch           |    2 +
 .../gnu-config/gnu-config_20080123.bb              |    6 +++-
 .../newt/files/fix_SHAREDDIR.patch                 |   29 ++++++++++++++++++++
 .../newt/files/include-without-python.patch        |    2 +
 meta/recipes-extended/newt/libnewt_0.52.12.bb      |    7 +++-
 5 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/fix_SHAREDDIR.patch

-- 
1.7.2



