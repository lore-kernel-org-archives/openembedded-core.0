Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E81B260053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 18:31:56 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,250,1477983600"; d="scan'208";a="54537363"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga005.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2017 10:31:49 -0800
Message-Id: <cover.1484764234.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/3] Add initial container IMAGE_FSTYPES support
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
X-List-Received-Date: Wed, 18 Jan 2017 18:31:57 -0000

The following changes since commit 63f899a950daf1018999455bafa7a2be8b22f164:

  bitbake: toaster: bin/toaster whitelist TOASTER_DIR (2017-01-17 13:18:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/contwip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/contwip

Randy Witt (3):
  image-container.bbclass: Add the "container" IMAGE_FSTYPES
  image-container.bbclass: Error if not using linux-dummy
  selftest/containerimage.py: Add container IMAGE_FSTYPES test

 .../container-image/container-image-testpkg.bb     |  8 +++
 .../container-image/container-test-image.bb        |  8 +++
 meta/classes/image-container.bbclass               | 21 ++++++++
 meta/classes/image.bbclass                         |  3 ++
 meta/classes/image_types.bbclass                   |  1 +
 meta/lib/oeqa/selftest/containerimage.py           | 57 ++++++++++++++++++++++
 6 files changed, 98 insertions(+)
 create mode 100644 meta-selftest/recipes-test/container-image/container-image-testpkg.bb
 create mode 100644 meta-selftest/recipes-test/container-image/container-test-image.bb
 create mode 100644 meta/classes/image-container.bbclass
 create mode 100644 meta/lib/oeqa/selftest/containerimage.py

-- 
2.9.3


