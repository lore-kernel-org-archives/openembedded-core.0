Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SBJGb-00069j-66
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 06:11:53 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Mar 2012 22:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="81086509"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Mar 2012 22:02:55 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 22:02:53 -0700
Message-Id: <cover.1332565237.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [patch v2 0/1] fix linker rpath for sdk binaries
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
X-List-Received-Date: Sat, 24 Mar 2012 05:11:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Also added rpath-link fix in v2.

Thanks,
Nitin


The following changes since commit 1c19181599c41d8f0bd7f06efc654fe61c3d0bb1:

  iptables: fix build error against 3.2+ kernel headers (2012-03-24 00:12:05 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfix

Nitin A Kamble (1):
  bitbake.conf: fix rpath for sdk executables

 meta/conf/bitbake.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.6.4



