Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QpDPv-0002fQ-5P
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:57:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 22:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,321,1309762800"; d="scan'208";a="38109282"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2011 22:53:24 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 14:11:46 +0800
Message-Id: <cover.1312523858.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Add libSDL.so into Sato image
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
X-List-Received-Date: Fri, 05 Aug 2011 05:57:55 -0000

Fixing [YOCTO #883], Some graphics 3D game(urbanterror, openarena) tests need libSDL.so.
Change libsdl-nativesdk to libsdl and add it into Sato image.

The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:

  eglibc: Fix patch merge breakage (2011-08-04 15:41:08 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (1):
  libsdl: Add libSDL.so into Sato image

 ...libsdl-nativesdk_1.2.11.bb => libsdl_1.2.11.bb} |   24 ++++++++++++++-----
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |    3 +-
 2 files changed, 19 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/libsdl/{libsdl-nativesdk_1.2.11.bb => libsdl_1.2.11.bb} (67%)



