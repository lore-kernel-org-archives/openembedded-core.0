Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RL9RD-0007l3-I3
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 09:11:15 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Nov 2011 01:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="69903251"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2011 01:05:07 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 16:05:12 +0800
Message-Id: <cover.1320134607.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix bug 487
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
X-List-Received-Date: Tue, 01 Nov 2011 08:11:15 -0000

The following changes since commit 4ce1f57e723cb6ccfd67ed1570228602547bd112:

  distro_tracking: polkit, libsndfile, etc (2011-10-31 23:03:11 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/bug487
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bug487

Dexuan Cui (1):
  bash: make job control really work

 meta/recipes-extended/bash/bash.inc    |    1 +
 meta/recipes-extended/bash/bash_4.2.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.6



