Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QjSOE-0003zL-4a
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:44:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29757318"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:40:14 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 16:48:16 +0800
Message-Id: <cover.1311151283.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/2]multilib: Change hard coded /usr/lib path
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
X-List-Received-Date: Wed, 20 Jul 2011 08:44:22 -0000

This pull request fixes some hard coded /usr/lib path issues when building poky-lsb on qemux86-64, please review it.

Thanks,
Lei

The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
  Darren Hart (1):
        bb-matrix: correct BB and PM number canonicalization

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/multilib-lsb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/multilib-lsb

Mei Lei (2):
  lsbsetup_1.0.bb:  Change the hardcoded /usr/lib to support multilib
  perl-dynloader.patch: Fix libdir issue for multilib

 .../perl/perl-5.12.3/perl-dynloader.patch          |    2 +-
 meta/recipes-extended/lsb/lsbsetup_1.0.bb          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



