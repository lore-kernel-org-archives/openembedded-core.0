Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C57F360167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 14:59:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 07:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1044,1389772800"; d="scan'208";a="431533192"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2014 07:59:30 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 17:59:08 +0300
Message-Id: <cover.1399993010.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Tue, 13 May 2014 14:59:34 -0000

mesa upgrade to 10.1.3

The following changes since commit 40551859671a1c9da26cfdcda34da952c66ac8c2:

  qemu/local.conf.sample: Add sdl PACKAGECONFIG (2014-05-13 08:02:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib vpopa/mesa
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/mesa

Valentin Popa (3):
  dri3proto: add it to oe-core
  libxshmfence: add it to oe-core
  mesa: upgrade to 10.1.3

 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc                | 35 +++++++++++++---------
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |  4 +--
 meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb | 17 +++++++++++
 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  | 14 +++++++++
 6 files changed, 56 insertions(+), 18 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
 create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb

-- 
1.9.1


