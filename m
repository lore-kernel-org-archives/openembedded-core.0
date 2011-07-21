Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qjp2R-00035d-9Q
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:55:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2011 01:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="32906922"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2011 01:51:14 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 16:59:22 +0800
Message-Id: <cover.1311238455.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]dhcp: Fix hard coded libdir issue for multilib
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
X-List-Received-Date: Thu, 21 Jul 2011 08:55:23 -0000

This pull request fixes some hard coded /usr/lib path issues, please review it.

Thanks,
Lei

The following changes since commit 8af286885353d5740971f137f8c1ada2b43dd2a8:
  Paul Eggleton (1):
        README.hardware: update MPC8315E-RDB instructions

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/multilib-lsb-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/multilib-lsb-v2

Mei Lei (1):
  dhcp: Fix libdir issue for multilib

 .../dhcp/dhcp-4.2.0/fix-external-bind.patch        |   14 +++++++-------
 meta/recipes-connectivity/dhcp/dhcp4.inc           |    2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)



