Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1Qa1Hs-0006SS-Tn
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 09:58:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jun 2011 00:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,418,1304319600"; d="scan'208";a="17940575"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by azsmga001.ch.intel.com with ESMTP; 24 Jun 2011 00:54:06 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2011 16:11:24 +0800
Message-Id: <cover.1308902622.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] update cvs and iptables to newer version for toolchain test
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
X-List-Received-Date: Fri, 24 Jun 2011 07:58:49 -0000

The old versions of cvs and iptables may meet compile error under some architecture
- cvs 1.11.23 fails on x86-64 host and iptables 1.4.9 fails on arm host. Update them
to latest version could solve these build error.
Meanwhile, 240s timeout is set for sudoku becasue 120s is not enough to finish
compile.

The following changes since commit 7cd2ac0e40d854bab9a32512018aff6172500c0e:

  common-licenses: Additions and corrections (2011-06-23 23:44:49 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/master

Jiajun Xu (1):
  qemuimagetest: update cvs and iptables to newer version for toolchain
    test

 meta/classes/imagetest-qemu.bbclass             |    2 +-
 scripts/qemuimage-testlib                       |   52 ++++++++++++++++++----
 scripts/qemuimage-tests/toolchain/sudoku-savant |    2 +-
 3 files changed, 44 insertions(+), 12 deletions(-)



