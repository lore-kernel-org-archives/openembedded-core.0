Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B875778213
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 12:46:24 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 05:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,441,1498546800"; d="scan'208";a="144657069"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2017 05:46:25 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D77535808E0;
	Mon, 28 Aug 2017 05:46:24 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 15:46:18 +0300
Message-Id: <cover.1503923683.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Mesa without OpenGL and related fixes
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
X-List-Received-Date: Mon, 28 Aug 2017 12:46:24 -0000

Sometimes this job leads to strange things. Today I've been building
mesa without any opengl.

The issue was that vulkan needs vulkan drivers (from mesa) to work,
making the vulkan recipe essentially require opengl distro feature.

Mesa can be instructed to build only the vulkan bits so that's what I
did. Also tried to make the dependencies between packageconfigs clearer
since the build system is quite complex.

I've tried my best to ensure no unintended PACKAGECONFIG changes happen.

Thanks,
  Jussi


The following changes since commit cd26fc143bbfd948795c2e65a577f89627a4f841:

  devtool: deploy-target: Support stripped libs and execs (2017-08-27 22:32:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/mesa-without-opengl
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/mesa-without-opengl

Jussi Kukkonen (3):
  mesa: Support building without opengl
  vulkan: rrecommended drivers unconditionally
  xserver-xorg: Enable xwayland only with opengl

 .../0001-configure.ac-Always-check-for-expat.patch | 51 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                | 23 +++++++---
 meta/recipes-graphics/mesa/mesa_17.1.7.bb          |  1 +
 meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb    |  3 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  2 +-
 5 files changed, 70 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch

-- 
2.1.4


