Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RvlBS-0008Rw-FO
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 08:46:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2012 23:38:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116199512"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2012 23:38:11 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 15:37:52 +0800
Message-Id: <cover.1328859334.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fixing guile cross configure failure
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
X-List-Received-Date: Fri, 10 Feb 2012 07:46:18 -0000

This patch fixed the cross configure failure of guile, as for yocto bug #1978.

The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:
  Christopher Larson (1):
        tcmode-default: add preference for gdb/gdbserver

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1978
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1978

Lianhao Lu (1):
  guile: fix cross configure failure

 meta/recipes-devtools/guile/guile_2.0.3.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)



