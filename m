Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 94967607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:16:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,470,1427785200"; d="scan'208";a="733176204"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2015 09:16:08 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 09:15:34 +0000
Message-Id: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/5] python3: Several fixes, compilation of modules, runtime issues, and two new recipes
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
X-List-Received-Date: Thu, 21 May 2015 16:16:08 -0000

Adds python3-pip recipe, upgrades python3-distribute to python3-setuptools
to keep up to date with upstream, fixes runtime issues for these modules and
for python3 in general.

The following changes since commit 62f3e62e0a2145d32fd75530b6f2aeba00dc1bc4:

  python3: Upgrade from 3.4.2 to 3.4.3 (2015-05-12 10:44:53 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/py3-pip-recipe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/py3-pip-recipe

Alejandro Hernandez (5):
  python3: fix pyconfig.h installation on target
  python3: Fix distutils import error
  python3-io: Fixes compilation of python3 ssl module
  python3-distribute: Upgrade to python3-setuptools 15.2
  python3-pip: Adds recipe for python3-pip

 meta/classes/setuptools3.bbclass                   |  2 +-
 .../python/python-3.4-manifest.inc                 |  2 +-
 meta/recipes-devtools/python/python3-pip_6.1.1.bb  | 40 ++++++++++++++++++++++
 ...ribute_0.6.32.bb => python3-setuptools_15.2.bb} | 40 ++++++++++++----------
 .../python/python3/fix_ssl_include_dir.patch       | 29 ++++++++++++++++
 meta/recipes-devtools/python/python3_3.4.3.bb      |  2 +-
 scripts/contrib/python/generate-manifest-3.4.py    |  2 +-
 7 files changed, 95 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip_6.1.1.bb
 rename meta/recipes-devtools/python/{python3-distribute_0.6.32.bb => python3-setuptools_15.2.bb} (53%)
 create mode 100644 meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch

-- 
1.8.4.5


