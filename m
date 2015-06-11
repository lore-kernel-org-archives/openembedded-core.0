Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEB075645
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 11:34:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 04:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709156434"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 04:34:18 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:34:06 +0300
Message-Id: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 00/10] devtool refactoring
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
X-List-Received-Date: Thu, 11 Jun 2015 11:34:23 -0000

Second iteration of my refactoring patchset. Fixed mistakes in
- "devtool: simplify few conditionals a bit"
- "devtool: slight simplification of path splitting logic"
which caused the unit tests to fail.

The following changes since commit 7f85e74d5c53b34e5f470967fdbdbd19fed1929a:

  sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/refactor
  http://git.openembedded.org/openembedded-core-contrib/commit/?h=marquiz/devtool/refactor

----------------------------------------------------------------
Markus Lehtonen (10):
  devtool: fix wrong indentation
  devtool: refactor bb task execution into a separate class
  devtool: update-recipe: do rev parsing in a separate function
  devtool: simplify the logic of determining patches to be removed
  devtool: simplify few conditionals a bit
  devtool: slight simplification of path splitting logic
  devtool: split out 'srcrev' update mode into a separate function
  devtool: split out 'patch' update mode into a separate function
  devtool: remove some unused return values
  devtool: use DevtoolError for error handling

 scripts/devtool                 |   9 +-
 scripts/lib/devtool/__init__.py |   6 +
 scripts/lib/devtool/deploy.py   |  31 +-
 scripts/lib/devtool/standard.py | 650 +++++++++++++++++++++-------------------
 4 files changed, 372 insertions(+), 324 deletions(-)

-- 
2.1.4


