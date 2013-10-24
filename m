Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC5F6D3D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 10:31:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Oct 2013 03:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="397814502"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by orsmga001.jf.intel.com with ESMTP; 24 Oct 2013 03:30:55 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 13:32:08 +0300
Message-Id: <1382610728-7026-2-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382610728-7026-1-git-send-email-valentin.popa@intel.com>
References: <1382610728-7026-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Thu, 24 Oct 2013 10:31:06 -0000

Tested with core-image-sato core-image-weston core-image-clutter;
All cogl and weston examples run successfully.

Valentin Popa (1):
  Mesa: upgrade to 9.2.2

 ...ate-NativeDisplayType-depending-on-config.patch |   0
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
 .../mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb}    |   0
 meta/recipes-graphics/mesa/mesa.inc                |   2 +-
 ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ----
 ...ate-NativeDisplayType-depending-on-config.patch | 359 ---------------------
 ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ----
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 ---
 .../mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb}          |   9 +-
 9 files changed, 3 insertions(+), 528 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-9.1.6 => mesa-9.2.2}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-9.1.6 => mesa-9.2.2}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
 rename meta/recipes-graphics/mesa/{mesa_9.1.6.bb => mesa_9.2.2.bb} (34%)

-- 
1.8.3.2


