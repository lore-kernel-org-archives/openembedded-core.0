Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15AE5771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:37:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 13 Sep 2016 01:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,327,1470726000"; d="scan'208";a="1029183320"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2016 01:37:38 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 11:37:27 +0300
Message-Id: <cover.1473755500.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Minor build fixes
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
X-List-Received-Date: Tue, 13 Sep 2016 08:37:39 -0000

Fix for floating dependency in libdrm and a better fix for link issue
in piglit.

Thanks,
  Jussi

The following changes since commit 2679a347c576f5411fbe802d2f6201c94036ecb2:

  maintainers.inc: rename gtk-doc-stub to gtk-doc, reassign to me (2016-09-09 12:12:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/after-m3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/after-m3

Jussi Kukkonen (2):
  piglit: Backport linker flag patch
  libdrm: Explicitly disable cunit tests

 ...ac-Allow-explicit-enabling-of-cunit-tests.patch | 56 ++++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.70.bb         |  2 +
 .../0001-cmake-Link-test-utils-with-ldl.patch      | 41 ++++++++++++++++
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |  3 +-
 5 files changed, 101 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch

-- 
2.1.4


