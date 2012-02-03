Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RtCBn-0003lG-8p
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 07:00:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Feb 2012 21:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="62793536"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Feb 2012 21:52:04 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 21:51:55 -0800
Message-Id: <cover.1328248259.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] x32 fix for strace
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
X-List-Received-Date: Fri, 03 Feb 2012 06:00:03 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 02b6b4158c9567d5cea7f553201fd23a5d6f156f:

  distro_tracking: update for current upgrades (2012-02-02 21:46:15 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (1):
  strace: add x32 support

 .../strace-4.6/strace-4.6_add_x32_support.patch    | 1242 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.6.bb         |    3 +-
 2 files changed, 1244 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace-4.6/strace-4.6_add_x32_support.patch

-- 
1.7.6.4



