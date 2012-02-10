Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Rvhae-0005l8-Cf
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 04:56:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Feb 2012 19:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105220669"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 09 Feb 2012 19:47:57 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 11:47:35 +0800
Message-Id: <cover.1328845545.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Ensure gcc family recipes having same sstate hash
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
X-List-Received-Date: Fri, 10 Feb 2012 03:56:04 -0000

Ensure the gcc family recipes having the same sstate hash for do_patch task,
because they share the same source directory.

The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:
  Christopher Larson (1):
        tcmode-default: add preference for gdb/gdbserver

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/gccfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/gccfix

Lianhao Lu (1):
  gcc: Ensure same sstate hashes for shared soruce directory

 meta/recipes-devtools/gcc/gcc-common.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)



