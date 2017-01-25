Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B25BC71D31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:24:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2017 12:24:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,285,1477983600"; d="scan'208";a="1087278613"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2017 12:24:05 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:20:03 +0000
Message-Id: <cover.1485346622.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/3] Fix bugs found within runtime testing
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
X-List-Received-Date: Wed, 25 Jan 2017 20:24:06 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This will fix some bugs found in testimage when executing tests
from images downloaded from the autobuilders.

The following changes since commit aa7e2717d33c2d754ec486e9148f446c1d6a3b14:

  ref-manual: remove core-image-directfb reference (2017-01-25 12:07:43 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug10964
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug10964

Mariano Lopez (3):
  runtime/cases/connman.py: Stop using oeRuntimeTest
  runtime/cases/smart.py: Check for IMAGE_PKGTYPE instead of
    PACKAGE_CLASSES
  testimage.bbclass: Allow to run tests on autobuilder's images

 meta/classes/testimage.bbclass         | 11 +++++++----
 meta/lib/oeqa/core/utils/misc.py       |  7 +++++++
 meta/lib/oeqa/runtime/cases/connman.py |  2 +-
 meta/lib/oeqa/runtime/cases/smart.py   |  2 +-
 4 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.6.6


