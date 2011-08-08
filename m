Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QqKSZ-0003Hl-28
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 09:41:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2011 00:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,336,1309762800"; d="scan'208";a="36310021"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2011 00:36:45 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 15:35:36 +0800
Message-Id: <cover.1312788761.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2][PULL] Multilib: Fix bug 1340
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
X-List-Received-Date: Mon, 08 Aug 2011 07:41:15 -0000

Hi Richard,

The following two commits fix the issue that, some normal packages are
built out when building pure multilib image "lib32-core-image-sato".

Please help to review and pull.

[YOCTO #1340]

The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:

  bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64 (2011-08-05 17:48:23 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2

Dongxiao Xu (2):
  gnome-doc-utils: Avoid RDEPENDS on bash in native case.
  module-init-tools-cross: Clean the RDEPENDS value

 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    1 +
 .../module-init-tools-cross_3.16.bb                |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)



