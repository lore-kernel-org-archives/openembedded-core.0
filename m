Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA0271A5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:35:15 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 12 Dec 2016 05:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,336,1477983600"; d="scan'208";a="41399839"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 12 Dec 2016 05:35:16 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7E29A6A4080;
	Mon, 12 Dec 2016 05:34:29 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 15:35:09 +0200
Message-Id: <cover.1481549486.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Upgrade piglit, compress generated tests
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
X-List-Received-Date: Mon, 12 Dec 2016 13:35:16 -0000

These patches were already on the list in another patchset, the only
change is that piglit-generated-tests now RDEPENDS on tar.

Original cover letter follows:


Piglit was removed because the current version was making sdk
images too large. This patchset reduces the installed size by 1.5GB
and adds piglit back to core-tools-testapps.

Running piglit still requires the same amount of space so in practice
this is useful for installed images only.

Thanks,
 Jussi


The following changes since commit 36e178a62f04e7f2611b26964efe46b9af97189a:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.8 (2016-12-09 08:54:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/piglit-compress-tests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/piglit-compress-tests

Jussi Kukkonen (3):
  piglit: Package tests in compressed form as well
  core-tools-testapps: Re-add piglit
  piglit: Upgrade to current master head

 .../packagegroup-core-tools-testapps.bb            |  2 +
 .../0001-cmake-Link-test-utils-with-ldl.patch      | 41 ----------------
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch | 54 ----------------------
 meta/recipes-graphics/piglit/piglit/piglit.sh      | 20 ++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         | 27 +++++++++--
 5 files changed, 44 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/piglit.sh

-- 
2.1.4


