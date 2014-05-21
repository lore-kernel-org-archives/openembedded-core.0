Return-Path: <valentin.popa@intel.com>
Received: from mga14.intel.com (unknown [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0F86AE7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 16:50:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 21 May 2014 09:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,880,1392192000"; d="scan'208";a="535553981"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2014 09:50:27 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 19:49:58 +0300
Message-Id: <cover.1400690725.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] [PATCH_V2]mesa: upgrade to 10.1.3
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
X-List-Received-Date: Wed, 21 May 2014 16:50:55 -0000

New in V2:
(*) eglinfo: patched to compile with mesa10+
(*) mesa: upgrade to 10.1.3 - multilib rootfs issue fixed

The following changes since commit 122079e9b0b513c46ca76993403db4cfa51e858f:

  bitbake: data_smart: Fix an unusual variable reference bug (2014-05-21 16:47:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib vpopa/mesa
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/mesa

Valentin Popa (4):
  dri3proto: add it to oe-core
  libxshmfence: add it to oe-core
  mesa: upgrade to 10.1.3
  eglinfo: patched to compile with mesa10+

 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb    |  2 ++
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb   |  2 ++
 meta/recipes-graphics/eglinfo/eglinfo.inc          |  4 ++-
 .../0001-eglinfo-x11-change-constant-name.patch    | 33 ++++++++++++++++++++
 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc                | 36 ++++++++++++++--------
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |  4 +--
 meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb | 17 ++++++++++
 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  | 14 +++++++++
 10 files changed, 99 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo/0001-eglinfo-x11-change-constant-name.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
 create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb

-- 
1.9.1


