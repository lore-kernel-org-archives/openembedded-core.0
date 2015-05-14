Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD1C73DA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963871"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:03 +0100
Message-Id: <cover.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/9] devtool fixes
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
X-List-Received-Date: Thu, 14 May 2015 17:45:52 -0000

Some fixes and tidy-ups for devtool. This squashes together some of
Markus's code cleanup patches (minus the line wrapping ones), brings
in one of the patches from his local files series, and adds some new
fixes from me.


The following changes since commit 90861b8908d254154f4d1d613471070df8013da8:

  base: Avoid find race (2015-05-14 15:22:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes3

Markus Lehtonen (5):
  devtool: extract: remove patches when S=WORKDIR
  devtool: remove unused imports / re-imports
  devtool: rename unused variables
  devtool: add missing docstrings
  devtool: deploy plugin: fix bad indentation

Paul Eggleton (4):
  devtool: fix build env command execution error handling
  lib/oe/recipeutils: add a parse_recipe_simple() function
  devtool: deploy-target: use tinfoil instead of bitbake -e
  devtool: if workspace layer exists, still ensure it's in bblayers.conf

 meta/lib/oe/recipeutils.py      | 29 +++++++++++++++--
 scripts/devtool                 | 36 ++++++++++++---------
 scripts/lib/devtool/__init__.py | 15 ++++++---
 scripts/lib/devtool/deploy.py   | 25 ++++++++++-----
 scripts/lib/devtool/standard.py | 70 ++++++++++++++++++++++++++++++++++++-----
 5 files changed, 138 insertions(+), 37 deletions(-)

-- 
2.1.0


