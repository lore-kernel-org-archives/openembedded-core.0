Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QovKH-0004M4-Jp
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 12:38:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 03:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,315,1309762800"; d="scan'208";a="37785659"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2011 03:34:21 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 18:36:21 +0800
Message-Id: <cover.1312454023.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fixed error in referencing PKGSUFFIX
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
X-List-Received-Date: Thu, 04 Aug 2011 10:38:54 -0000

$ was missing when referencing PKGSUFFIX in eglibc-package.inc.

This patch fixed the BUG #1329.

The following changes since commit fbb734e5753655de30c82c0a036c9043820e02cb:
  Dongxiao Xu (1):
        multilib: Use BPN instead of PN for style like lib${PN}

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1329
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1329

Lianhao Lu (1):
  eglibc-package.inc: Fixed error in referencing PKGSUFFIX

 meta/recipes-core/eglibc/eglibc-package.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)



