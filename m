Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E863734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:31:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 09:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,553,1427785200"; d="scan'208";a="705387073"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2015 09:31:59 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 19:31:44 +0300
Message-Id: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 00/10] devtool refactoring
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
X-List-Received-Date: Thu, 04 Jun 2015 16:32:05 -0000

This patchset contains contains some refactoring of the devtool code, hopefully
making the code more maintainable and somewhat easier to read.

The following changes since commit c91ffdb8fff4a62ccb80196a3d735e4b9a3056a3:

  dosfstools: Add recipe for v3.0.28 (2015-06-03 16:38:14 +0100)

are available in the git repository at:

  ssh://oegit/openembedded-core-contrib marquiz/devtool/refactor
  http://git.openembedded.org/openembedded-core-contrib/commit/?h=marquiz/devtool/refactor

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
 scripts/lib/devtool/standard.py | 646 +++++++++++++++++++++-------------------
 4 files changed, 369 insertions(+), 323 deletions(-)

-- 
2.1.4


