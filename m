Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SFlPM-0002YY-N2
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 14:03:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 04:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85630520"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 04:54:07 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 19:49:18 +0800
Message-Id: <cover.1333626413.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2] Some multilib fixings
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
X-List-Received-Date: Thu, 05 Apr 2012 12:03:20 -0000

This is some multilib fixings for Yocto bug #2216.

The following changes since commit 3e4562500956550dbae5467a5fe9289f1d32f775:
  Saul Wold (1):
        self-hosted-image: Increase space for build and allow builder user sudo access

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib

Lianhao Lu (2):
  package_ipk.bbclass: fixing muttilib prefix extracting.
  connman: Fixed multilib support.

 meta/classes/package_ipk.bbclass                  |    4 ++--
 meta/recipes-connectivity/connman/connman.inc     |    3 ++-
 meta/recipes-connectivity/connman/connman_0.79.bb |    1 +
 3 files changed, 5 insertions(+), 3 deletions(-)



