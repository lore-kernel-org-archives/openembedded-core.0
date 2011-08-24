Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwFnW-0008Ki-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 17:55:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2011 08:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,275,1312182000"; d="scan'208";a="41953287"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 08:50:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 08:50:25 -0700
Message-Id: <cover.1314200868.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 0/6] Bugfixes for M4
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
X-List-Received-Date: Wed, 24 Aug 2011 15:55:22 -0000

Richard,

This is a set of bugfixes and cleanups for M4, please take a closer look
at Dongxiao's procps change, which you commented on in the past.

Thanks
	Sau!


The following changes since commit 13e14763f14b5b84051ecb158404dcef937cc4e0:

  image.bbclass, kernel.bbclass: remove non-standard -n option from cp command (2011-08-23 18:32:24 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dongxiao Xu (1):
  procps: Fix lib path to support multilib

Jingdong Lu (1):
  initrdscripts: fix init-live.sh for hddimg and livecd

Joshua Lock (1):
  libtasn1: update SRC_URI

Phil Blundell (1):
  mips32: add mips32el tuning

Wenzong Fan (2):
  cronie: Updates to cronie
  libpam: Setting suid bit for unix_chkpwd

 meta/conf/machine/include/tune-mips32.inc          |    5 ++-
 meta/recipes-core/initrdscripts/files/init-live.sh |   17 +++++++----
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 meta/recipes-extended/cronie/cronie/crond.init     |    2 -
 meta/recipes-extended/cronie/cronie_1.4.8.bb       |    8 ++++-
 meta/recipes-extended/pam/libpam_1.1.4.bb          |    8 ++++-
 .../procps/procps-3.2.8/install.patch              |   30 +++++++++++++------
 meta/recipes-extended/procps/procps_3.2.8.bb       |    8 ++--
 meta/recipes-support/gnutls/libtasn1_2.9.bb        |    2 +-
 9 files changed, 54 insertions(+), 28 deletions(-)

-- 
1.7.6



