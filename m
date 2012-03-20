Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S9p5o-00025z-UY
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 03:46:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Mar 2012 19:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130773049"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2012 19:37:43 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 10:36:09 +0800
Message-Id: <cover.1332210868.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V2 0/1] warning fix of sysvinit-inittab.
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
X-List-Received-Date: Tue, 20 Mar 2012 02:46:37 -0000

This fixed the warning in do_populate_lic task in sysvinit-inittab.

The following changes since commit c981fa4fad8a457882293157b7bdca05aad5a778:
  Tom Zanussi (1):
        blktrace: update to version 1.0.5

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/warningfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix

Lianhao Lu (1):
  sysvinit-inittab: Fixed license warning.

 .../recipes-core/sysvinit/sysvinit-inittab/COPYING |  339 --------------------
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    9 +-
 2 files changed, 2 insertions(+), 346 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/COPYING



