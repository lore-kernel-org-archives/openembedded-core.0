Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QlAbc-0001GI-JD
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 04:09:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2011 19:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,258,1309762800"; d="scan'208";a="31446806"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2011 19:05:03 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 10:13:16 +0800
Message-Id: <cover.1311558123.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]perl-dynloader.patch: Fix libdir issue for multilib
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
X-List-Received-Date: Mon, 25 Jul 2011 02:09:16 -0000

Hi Richard,
	This patch fixes the libdir issue, relax the regular expression to match lib32, lib64 and libx32, etc. Please review it.

Thanks
Lei

The following changes since commit eea4bd731ef286516ee1fb934fe2222a09c06e70:
  Kumar Gala (1):
        mpc8315e-rdb: Set TARGET_FPU correct

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/ml-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/ml-perl

Mei Lei (1):
  perl-dynloader.patch: Fix multilib issue for perl

 .../perl/perl-5.12.3/perl-dynloader.patch          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



