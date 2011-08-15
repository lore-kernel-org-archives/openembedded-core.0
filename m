Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QswcD-0007V3-C7
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:50:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2011 05:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37874112"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2011 05:45:24 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 21:04:00 +0800
Message-Id: <cover.1313413181.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Extend target version for libsdl and enable openGL for it
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
X-List-Received-Date: Mon, 15 Aug 2011 12:50:01 -0000

Some targets need to run 3D games, which requires libsdl. Enable libsdl for target
and add a flag to check in build time if openGL needed to be built.


The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:

  rt-tests: use an explicit commit ID (2011-08-12 17:51:18 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (2):
  libsdl: add target version
  libsdl: enable opengl for libsdl

 ...libsdl-nativesdk_1.2.11.bb => libsdl_1.2.11.bb} |   23 ++++++++++++++-----
 1 files changed, 17 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/libsdl/{libsdl-nativesdk_1.2.11.bb => libsdl_1.2.11.bb} (64%)



