Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AECA971CAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:52:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 19 Jan 2017 14:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,256,1477983600"; d="scan'208";a="924551102"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga003.jf.intel.com with ESMTP; 19 Jan 2017 14:52:59 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 14:52:50 -0800
Message-Id: <cover.1484866303.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v2 0/3] Add initial container IMAGE_FSTYPES support
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:02 -0000

Updated with Ross' requests.

The following changes since commit a304b94eae99ade6d99800eeaf588c48d01506f6:

  oeqa/selftest/devtool: rewrite modify testcase (2017-01-19 22:47:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/contwip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/contwip

Randy Witt (3):
  image-container.bbclass: Add the "container" IMAGE_FSTYPES
  image-container.bbclass: Error if not using linux-dummy
  selftest/containerimage.py: Add container IMAGE_FSTYPES test

 .../container-image/container-image-testpkg.bb     |  8 +++
 .../container-image/container-test-image.bb        |  8 +++
 meta/classes/image-container.bbclass               | 21 ++++++
 meta/classes/image.bbclass                         |  3 +
 meta/classes/image_types.bbclass                   |  1 +
 meta/lib/oeqa/selftest/containerimage.py           | 82 ++++++++++++++++++++++
 6 files changed, 123 insertions(+)
 create mode 100644 meta-selftest/recipes-test/container-image/container-image-testpkg.bb
 create mode 100644 meta-selftest/recipes-test/container-image/container-test-image.bb
 create mode 100644 meta/classes/image-container.bbclass
 create mode 100644 meta/lib/oeqa/selftest/containerimage.py

-- 
2.9.3


