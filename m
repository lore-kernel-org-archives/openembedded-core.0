Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 971496013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 15:39:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 07 Jul 2016 08:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,324,1464678000"; d="scan'208";a="730970497"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2016 08:39:27 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 18:39:07 +0300
Message-Id: <cover.1467905611.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] Upgrade piglit
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
X-List-Received-Date: Thu, 07 Jul 2016 15:39:30 -0000

This set upgrades piglit, adds python-six (new piglit dependency),
moves piglit to python3 and fixes all the python module issues that
popped up.

A word of warning to anyone else using piglit: it was big before and
has now tripled in size (30000 new tests!). The installed size is over
1.5GB and packaging takes a very long time.

For reference, the results with PIGLIT_NO_WINDOW=1 look like this on
a NUC (Haswell with HD5000 graphics) running current master:

       name:  quick
       ----  ------
       pass:  33717
       fail:    438
      crash:      5
       skip:  30887
       warn:      7
      total:  65054

Jussi


The following changes since commit 5c11e365e19357f721c49d076971567e7b64b61b:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:22:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/piglit
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/piglit

Jussi Kukkonen (5):
  python-six: Add to oe-core
  python3: Add compression to python3-shell dependencies
  python3: Add dependencies for python3-misc
  python3-native: Add "io" to rprovides
  piglit: Upgrade version, use python3

 .../python/python-3.5-manifest.inc                 |  2 +-
 meta/recipes-devtools/python/python-six.inc        | 23 ++++++++++++++++++
 meta/recipes-devtools/python/python-six_1.10.0.bb  |  4 ++++
 .../python/python3-native_3.5.1.bb                 |  2 +-
 meta/recipes-devtools/python/python3-six_1.10.0.bb |  4 ++++
 meta/recipes-devtools/python/python3_3.5.1.bb      |  2 +-
 ...0001-tests-Fix-missing-include-of-Xutil.h.patch | 28 ----------------------
 meta/recipes-graphics/piglit/piglit_git.bb         | 18 +++++++-------
 scripts/contrib/python/generate-manifest-3.5.py    |  2 +-
 9 files changed, 44 insertions(+), 41 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-six.inc
 create mode 100644 meta/recipes-devtools/python/python-six_1.10.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-six_1.10.0.bb
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Fix-missing-include-of-Xutil.h.patch

-- 
2.1.4


