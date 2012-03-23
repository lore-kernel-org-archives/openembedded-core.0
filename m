Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SB9pn-0002zz-BH
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 20:07:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Mar 2012 11:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122549426"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 23 Mar 2012 11:58:37 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 11:58:34 -0700
Message-Id: <cover.1332529018.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] fix linking rpaths for sdk binaries
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
X-List-Received-Date: Fri, 23 Mar 2012 19:07:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This issue was discovered in the sdk gdb debug effort. 

The following changes since commit 6c77a0f0fa0c97bfbe93f4a930a1549566a7f016:

  taglib: Refresh patch after recent accidental breakage (2012-03-23 18:36:20 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfix

Nitin A Kamble (1):
  bitbake.conf: fix rpath for sdk executables

 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.6.4



