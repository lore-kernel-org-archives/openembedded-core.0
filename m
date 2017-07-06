Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9997D774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:54:29 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="123451528"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2017 00:54:30 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 60DC3580585;
	Thu,  6 Jul 2017 00:54:29 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:54:23 +0300
Message-Id: <cover.1499327365.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/6] Vulkan improvements
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
X-List-Received-Date: Thu, 06 Jul 2017 07:54:29 -0000

Changes since v1:
* Fixed type in vulkan-demos Upstream-Status
* Added ANY_OF_DISTRO_FEATURES to vulkan-demos

The branch has been force updated.

Thanks,
 Jussi


The following changes since commit 4b1d270602a0542eef1b497eaf15bad2b747686f:

  bitbake: bitbake-user-manual: Removed and replaced broken link (2017-07-04 16:05:22 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/vulkan
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/vulkan

Jussi Kukkonen (6):
  vulkan: Upgrade 1.0.39.1 -> 1.0.51.0
  assimp: Add as dependency of vulkan-demos
  vulkan-demos: Add recipe
  gstreamer1.0-plugins-bad: Add vulkan PACKAGECONFIG
  mesa, gstreamer: Add "vulkan" DISTRO_FEATURE
  vulkan: RRECOMMEND mesa drivers

 meta/recipes-graphics/mesa/mesa.inc                |  3 +-
 meta/recipes-graphics/vulkan/assimp_git.bb         | 14 ++++
 ...ild-demos-with-questionably-licensed-data.patch | 91 ++++++++++++++++++++++
 ...stalling-demos-support-out-of-tree-builds.patch | 85 ++++++++++++++++++++
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb   | 35 +++++++++
 ...se-getenv-if-secure_getenv-does-not-exist.patch | 34 --------
 .../{vulkan_1.0.39.1.bb => vulkan_1.0.51.0.bb}     |  6 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  6 +-
 ...y-Use-ifdef-for-platform-specific-defines.patch | 37 +++++++++
 ...n-Use-the-generated-version-of-vkconfig.h.patch | 64 +++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  2 +
 11 files changed, 336 insertions(+), 41 deletions(-)
 create mode 100644 meta/recipes-graphics/vulkan/assimp_git.bb
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-demos_git.bb
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan/0001-Use-getenv-if-secure_getenv-does-not-exist.patch
 rename meta/recipes-graphics/vulkan/{vulkan_1.0.39.1.bb => vulkan_1.0.51.0.bb} (90%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch

-- 
2.1.4


