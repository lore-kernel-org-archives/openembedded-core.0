Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QqGMm-00015z-0O
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 05:19:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2011 20:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,335,1309762800"; d="scan'208";a="35476421"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2011 20:14:30 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 11:22:50 +0800
Message-Id: <cover.1312773154.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1]lsb: Fix hard code libdir issue for multilib
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
X-List-Received-Date: Mon, 08 Aug 2011 03:19:00 -0000

This pull request fixes some hard coded libdir issues, please review it.

Thanks,
Lei

The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:
  Kumar Gala (1):
        bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/lsb

Mei Lei (1):
  lsb: Fix hard code libdir issue for multilib

 meta/recipes-extended/lsb/lsb_1.4.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)



