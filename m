Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TvZBf-0004S5-IJ
	for Openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 21:02:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2013 11:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="244760150"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by azsmga001.ch.intel.com with ESMTP; 16 Jan 2013 11:46:51 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 11:46:50 -0800
Message-Id: <cover.1358365495.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] one commit to make kernel repo change easy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 20:02:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Here is a commit to make changing of the the linux-yocto v3.4 kernel repository
easy.

Thanks,
Nitin

The following changes since commit 9f263a60e3521b800121a6f527a7b30dc9b62432:

  oprofile: add AArch64 support (2013-01-16 16:10:39 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI

 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.3.4



