Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QsakI-0002So-Oe
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Aug 2011 15:28:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 06:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38315909"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 06:24:15 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 21:32:21 +0800
Message-Id: <cover.1313328487.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Bug fix for 1362
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
X-List-Received-Date: Sun, 14 Aug 2011 13:28:55 -0000

Per discussion in mailing list, This patch make gcc honouring libdir,
to fix the bug 1362. it has been tested for qemux86, qemux86-64, qemuarm,
qemuppc

Signed-off-by: Yu Ke <ke.yu@intel.com>

The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:
  Darren Hart (1):
        rt-tests: use an explicit commit ID

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/bug-1362
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/bug-1362

Yu Ke (1):
  gcc-cross-intermediate: revise the 64bithack.patch for multilib case

 meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)



