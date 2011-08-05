Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QpUWR-0005Jp-Kt
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 02:13:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 17:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,326,1309762800"; d="scan'208";a="35887726"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 17:09:21 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 10:42:56 -0700
Message-Id: <cover.1312565996.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/3] new x86 ABI x32 V2 patch series
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
X-List-Received-Date: Sat, 06 Aug 2011 00:13:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These are the commits for the new x86_64 ABI named x32. These are changed 
as per the feedback received on the mailing list.

The kernel related commits are dropped from this series as Bruce is pushing
them directly.

The following changes since commit da321ee54b26b11e2bd36c889c5568ae62b17ffd:

  linux-yocto: pass KMACHINE to updateme, not MACHINE (2011-08-05 10:00:33 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/x32.rebased
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32.rebased

Nitin A Kamble (3):
  siteinfo.bbclass: add entries for new x86_64 ABI x32 target
  insane.bbclass: add entries for linux-gnux32
  x86 tune inc files: add x32 abi tune parameters

 meta/classes/insane.bbclass                  |    3 +++
 meta/classes/siteinfo.bbclass                |   12 +++++++++++-
 meta/conf/machine/include/ia32/arch-ia32.inc |   19 +++++++++++++++++--
 meta/conf/machine/include/tune-core2.inc     |    4 ++++
 meta/conf/machine/include/tune-x86_64.inc    |    2 +-
 5 files changed, 36 insertions(+), 4 deletions(-)

-- 
1.7.6



