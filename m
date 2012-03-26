Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1SCHSo-00075B-Gv
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 23:28:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2012 14:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125347758"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 14:19:13 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 14:31:11 -0700
Message-Id: <cover.1332796964.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fix for multilib rpm build failure
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
X-List-Received-Date: Mon, 26 Mar 2012 21:28:30 -0000

The following changes since commit db529f9f7d9015656c67c548975d918a1908de1a:
  Scott Rifenbark (1):
        documentation/poky-ref-manual/development.xml: another env var clarification

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/multilib-rpm-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jzhang/multilib-rpm-fix

Jessica Zhang (1):
  Fix empty file case that caused build error at do_rootfs

 meta/classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



