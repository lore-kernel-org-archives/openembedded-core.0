Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB1260017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:43:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 05:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="982837445"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2016 05:43:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 15:42:53 +0300
Message-Id: <cover.1464004128.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] Misc. version upgrades
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
X-List-Received-Date: Mon, 23 May 2016 12:43:15 -0000

More version upgrades. The tricky one here is mesa-demos (lots of
patch changes there).

Thanks,
  Jussi

The following changes since commit 32bbf685709d2c6c0d8938e18ef21130d1ea8eef:

  meta-yocto-bsp: Enable xf86 modeset for beaglebone (2016-05-22 16:11:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/more-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/more-upgrades

Jussi Kukkonen (5):
  docbook-xsl-stylesheets: Upgrade 1.78.1 -> 1.79.1
  dropbear: Upgrade 2015.71 -> 2016.73
  fontconfig: Upgrade 2.11.94 -> 2.11.95
  mesa-demos: Upgrade 8.2.0 -> 8.3.0
  matchbox-keyboard: Upgrade

 .../dropbear/support-out-of-tree-builds.patch      |   43 +
 meta/recipes-core/dropbear/dropbear_2015.71.bb     |    5 -
 meta/recipes-core/dropbear/dropbear_2016.73.bb     |    7 +
 ...1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb} |   22 +-
 ...ges-made-to-FcConfigAppFontAddDir-recentl.patch |  132 --
 ...fontconfig_2.11.94.bb => fontconfig_2.11.95.bb} |    7 +-
 ...mplement-with-AC_WITH-glut-so-that-withou.patch |   57 -
 ...llow-to-disable-demos-which-require-GLEW-.patch |  119 +-
 ...hen-EGL_MESA_screen_surface-extension-isn.patch |  267 ----
 ...ay-for-EGL_MESA_screen_surface-extension-.patch |   41 -
 .../0007-Install-few-more-test-programs.patch      |   53 +-
 ...10-sharedtex_mt-fix-rendering-thread-hang.patch |   43 -
 ...dependant-on-obsolete-MESA_screen_surface.patch | 1592 --------------------
 .../{mesa-demos_8.2.0.bb => mesa-demos_8.3.0.bb}   |   27 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   12 +-
 15 files changed, 131 insertions(+), 2296 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2016.73.bb
 rename meta/recipes-devtools/docbook-xml/{docbook-xsl-stylesheets_1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb} (76%)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Revert-changes-made-to-FcConfigAppFontAddDir-recentl.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.94.bb => fontconfig_2.11.95.bb} (84%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0005-Fix-build-when-EGL_MESA_screen_surface-extension-isn.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0006-Query-display-for-EGL_MESA_screen_surface-extension-.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch
 rename meta/recipes-graphics/mesa/{mesa-demos_8.2.0.bb => mesa-demos_8.3.0.bb} (68%)

-- 
2.1.4


