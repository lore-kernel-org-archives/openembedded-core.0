Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S9RvY-00063U-DJ
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 03:02:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Mar 2012 18:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="78971840"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Mar 2012 18:53:36 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2012 09:52:01 +0800
Message-Id: <cover.1332121842.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] warning fix of sysvinit-inittab.
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
X-List-Received-Date: Mon, 19 Mar 2012 02:02:28 -0000

This fixed the warning in do_populate_lic task in sysvinit-inittab.

The following changes since commit efd80fd23cb96ccc203893017938c1163d20b898:
  Richard Purdie (1):
        tcl: Fix bad RPATH QA warning

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/warningfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix

Lianhao Lu (1):
  sysvinit-inittab: Fixed license warning.

 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)



