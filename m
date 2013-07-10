Return-Path: <radu.moisan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 370E360886
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 12:22:15 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2013 05:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1036,1363158000"; d="scan'208";a="329274340"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 10 Jul 2013 05:22:14 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 15:24:10 +0300
Message-Id: <cover.1373451815.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package Upgrades
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
X-List-Received-Date: Wed, 10 Jul 2013 12:22:15 -0000

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/branch-upgrades-last
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/branch-upgrades-last

Radu Moisan (2):
  iputils: Upgrade to v20121221
  diffutils: Upgrade to v3.3

 .../diffutils-3.2/obsolete_automake_macros.patch   |   14 -------
 .../diffutils/diffutils-3.2/remove-gets.patch      |   22 ----------
 meta/recipes-extended/diffutils/diffutils.inc      |    4 --
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    7 ++--
 .../{diffutils_3.2.bb => diffutils_3.3.bb}         |   12 ++----
 .../files/debian/add-icmp-return-codes.diff        |   43 --------------------
 .../iputils/files/debian/fix-arping-timeouts.diff  |   26 ------------
 .../files/debian/fix-dead-host-ping-stats.diff     |   16 --------
 .../iputils/files/debian/targets.diff              |   14 +++----
 .../iputils/files/debian/use_gethostbyname2.diff   |   36 ++++++++--------
 ...x-build-command-line-argument-with-gnutls.patch |   37 +++++++++++++++++
 .../{iputils_s20101006.bb => iputils_s20121221.bb} |   15 +++----
 12 files changed, 76 insertions(+), 170 deletions(-)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.2.bb => diffutils_3.3.bb} (59%)
 delete mode 100644 meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
 create mode 100644 meta/recipes-extended/iputils/files/fix-build-command-line-argument-with-gnutls.patch
 rename meta/recipes-extended/iputils/{iputils_s20101006.bb => iputils_s20121221.bb} (80%)

-- 
1.7.9.5


