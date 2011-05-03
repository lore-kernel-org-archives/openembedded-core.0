Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QHGFN-0004Xj-Ti
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 16:06:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2011 07:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,309,1301900400"; d="scan'208";a="637203480"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2011 07:03:59 -0700
Message-Id: <cover.1304431099.git.dexuan.cui@intel.com>
Old-Date: Tue, 3 May 2011 21:58:19 +0800
Date: Tue, 03 May 2011 22:01:32 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/2] fixes to bug #412 and #856
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
X-List-Received-Date: Tue, 03 May 2011 14:06:42 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

[YOCTO #856]
    Commit 320a641df18024265c3d2b3b08251a231f9fd6a0 omitted the line when being
merged into master branch.

[YOCTO #412]
    lttng-viewer: explicitly add linkage to lttvwindow.
    Without the fix, lttv-gui inside target can't run, complaining
    "undefined symbol: LTTV_VIEWER_CONSTRUCTORS".

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/distro
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (2):
  task-core-tools.bb: properly enable lttng-ust for ARM
  lttng-viewer: explicitly add linkage to lttvwindow

 meta/recipes-core/tasks/task-core-tools.bb         |    3 +-
 .../lttng-viewer/add_linkage_to_lttvwindow.patch   |   42 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |   10 +++--
 3 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch

-- 
1.7.2



