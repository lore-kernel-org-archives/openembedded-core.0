Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2515F70975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 22:54:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2014 15:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,768,1400050800"; d="scan'208";a="463358289"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.249])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2014 15:54:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 15:54:45 -0700
Message-Id: <cover.1406760824.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Package Upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 22:54:55 -0000


The following changes since commit 7986adeac16550b33f65fded39a55f668e0e543f:

  populate_sdk_base: Fix grep command usage on old hosts (2014-07-29 09:57:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (4):
  help2man-native: Upgrade to 1.46.1
  lsbinitscripts: Upgrade to 9.55
  libcheck: Upgrade to 0.9.14
  libnl: Upgrade to 3.2.25

 ...-native_1.45.1.bb => help2man-native_1.46.1.bb} |  4 +--
 ...binitscripts_9.54.bb => lsbinitscripts_9.55.bb} |  6 ++--
 .../{libcheck_0.9.13.bb => libcheck_0.9.14.bb}     |  4 +--
 ...fix-lib-cache_mngr.c-two-parentheses-bugs.patch | 37 ----------------------
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     | 14 ++++----
 .../libnl/{libnl_3.2.24.bb => libnl_3.2.25.bb}     |  6 ++--
 6 files changed, 17 insertions(+), 54 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.45.1.bb => help2man-native_1.46.1.bb} (79%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.54.bb => lsbinitscripts_9.55.bb} (78%)
 rename meta/recipes-support/libcheck/{libcheck_0.9.13.bb => libcheck_0.9.14.bb} (79%)
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-lib-cache_mngr.c-two-parentheses-bugs.patch
 rename meta/recipes-support/libnl/{libnl_3.2.24.bb => libnl_3.2.25.bb} (87%)

-- 
1.8.3.1


